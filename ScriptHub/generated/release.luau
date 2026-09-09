--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-09T08:12:57.727995300+00:00",
    cfg = "Release",
    vers = ""
}

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
GetActive()return af end function ac.SaveNow()if ac.IsSuspended()then return end
if not af then return end local ag,ah=aa:SaveConfig(af)if not ag and ah and ah~=
'Please select a config file.'then ab.Notify('AutoSave',
'Kh\u{f4}ng l\u{1b0}u \u{111}\u{1b0}\u{1ee3}c config: '..tostring(ah),3)end end
function ac.Save()if ac.IsSuspended()then return end if not af then return end
if ad then return end ad=true task.delay(0.5,function()ad=false if not ac.
IsSuspended()and ac.GetActive()then ac.SaveNow()end end)end function ac.Wrap(ag)
if type(ag)~='function'then return ag end return function(...)ag(...)ac.Save()
end end return ac end function a.e()local aa,ab,ac,ad=game:GetService'Players',
game:GetService'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local ae=aa.LocalPlayer if not ae then local af=os.clock()+
5 repeat ae=aa.LocalPlayer if ae then break end task.wait(0.1)until os.clock()>
af end return{Players=aa,UserInputService=ab,RunService=ac,VirtualInputManager=
ad,player=ae}end function a.f()local aa,ab=a.load'e',a.load'b'local ac,ad,ae,af,
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az=aa.player,0.05,
'enemyProjectiles',0.5,{},false,16,16,true,false,false,false,{},0,{},0,{},{},{},
{},{},{},0,{}local aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ=function()
for aA=#az,1,-1 do pcall(az[aA])end end,{},'unknown',true,{},{},{},0,4,false
local aR=function(aR)if aR then table.insert(aG,aR)end return aR end function ag
.OnRespawn(aS)table.insert(aF,aS)end function ag.GetLastRespawnTime()return aH
end function ag.GetRespawnProtectionDuration()return aI end function ag.
SetRespawnProtectionDuration(aS)if type(aS)=='number'and aS>=0 then aI=aS end
end function ag.GetRespawnProtectionRemaining()if aH==0 then return 0 end local
aS=os.clock()-aH local aT=aI-aS return math.max(0,aT)end function ag.
IsJustRespawned(aS)local aT=aS or aI if aH==0 then return false end return(os.
clock()-aH)<=aT end function ag.WasDead()return aJ end function ag.IsDead()local
aS=ac and ac.Character if not aS or not aS.Parent then return true end local aT=
aS:FindFirstChildOfClass'Humanoid'if not aT or aT.Health<=0 then return true end
return false end function ag.IsInvulnerable()local aS=ac and ac.Character if not
aS or not aS.Parent then return false,nil end local aT=aS:FindFirstChildOfClass
'Humanoid'if aT and aT.Health<=0 then return false,nil end local aU=aS:
FindFirstChildOfClass'ForceField'if aU and aU.Visible~=false then return true,
'ForceField'end local aV,aW,aX=aS:GetAttribute'Invulnerable',aS:GetAttribute
'Immune',aS:GetAttribute'Respawning'if aV==true or aW==true or aX==true then
return true,'Attribute'end local aY,aZ,a_=aS:FindFirstChild'Invulnerable',aS:
FindFirstChild'Immune',aS:FindFirstChild'Respawning'if(aY and aY:IsA'BoolValue'
and aY.Value==true)or(aZ and aZ:IsA'BoolValue'and aZ.Value==true)or(a_ and a_:
IsA'BoolValue'and a_.Value==true)then return true,'Value'end local a0=ag.
GetRespawnProtectionRemaining()if a0>0 then return true,(
'Respawn Shield (%.1fs)'):format(a0)end return false,nil end local aS=function(
aS)if not aS or not aS:IsA'Model'then return nil end local aT=aS:FindFirstChild
'HumanoidRootPart'if aT and aT:IsA'BasePart'then return aT end if aS.PrimaryPart
and aS.PrimaryPart:IsA'BasePart'then return aS.PrimaryPart end for aU,aV in
ipairs(aS:GetDescendants())do if aV:IsA'BasePart'then return aV end end return
nil end local aT,aU=function(aT)if not aT or not aT:IsA'Model'or not aT.Parent
or aT==ac.Character then return false end local aU=aT:FindFirstChildOfClass
'Humanoid'if not aU or aU.Health<=0 then return false end return aS(aT)~=nil end
,function(aT)local aU=aw[aT]if not aU then return end if aU.Died then aU.Died:
Disconnect()aU.Died=nil end aw[aT]=nil end local aV,aW=function(aV)if not aV or
not au[aV]then return end ax[aV]=nil au[aV]=nil ay-=1 aU(aV)aA()aO()end,function
(aV)if not dungeon or not aV then return nil end local aW=aV.Parent while aW do
if aW==dungeon then return nil end if aW.Parent==dungeon and(aW:IsA'Folder'or aW
:IsA'Model')then return aW end aW=aW.Parent end return nil end local aX=function
(aX)if not aT(aX)or au[aX]then return end local aY,aZ=aS(aX),aX:
FindFirstChildOfClass'Humanoid'if not aY or not aZ then return end au[aX]={Model
=aX,Root=aY,Humanoid=aZ,Room=aW(aX)}ay+=1 aw[aX]={Died=aZ.Died:Connect(function(
)aV(aX)end)}aA()aO()end local aY=function(aY)if not aY then return end if aT(aY)
then aX(aY)return end if ax[aY]then return end ax[aY]=true task.spawn(function()
local aZ=os.clock()+2 while aY.Parent and os.clock()<aZ do if aT(aY)then ax[aY]=
nil aX(aY)return end task.wait(0.03)end ax[aY]=nil if aY.Parent and aT(aY)then
aX(aY)end end)end local aZ=function(aZ)if not aZ or at[aZ]then return end at[aZ]
=true for a_,a0 in ipairs(aZ:GetDescendants())do if a0:IsA'Model'and aT(a0)then
aX(a0)end end av[aZ]={Added=aZ.DescendantAdded:Connect(function(a_)if a_:IsA
'Model'then aY(a_)elseif a_:IsA'Humanoid'then local a0=a_:
FindFirstAncestorOfClass'Model'if a0 then aY(a0)end end end),Removed=aZ.
DescendantRemoving:Connect(function(a_)if a_:IsA'Model'then aV(a_)end end)}end
aM=function()if not dungeon then dungeon=workspace:WaitForChild('dungeon',30)end
if not dungeon then return false end ap=0 for a_=#aq,1,-1 do pcall(aq[a_],ap)end
ar=0 for a_=#as,1,-1 do pcall(as[a_],ar)end for a_,a0 in ipairs(dungeon:
GetChildren())do if a0:IsA'Folder'or a0:IsA'Model'then aZ(a0)end end av[dungeon]
={Added=dungeon.DescendantAdded:Connect(function(a_)if a_:IsA'Model'then aY(a_)
elseif a_:IsA'Humanoid'then local a0=a_:FindFirstAncestorOfClass'Model'if a0
then aY(a0)end end end),Removed=dungeon.DescendantRemoving:Connect(function(a_)
if a_:IsA'Model'then aV(a_)end end)}return true end aN=function()if not dungeon
then return end for a_,a0 in pairs(av)do if a0.Added then pcall(function()a0.
Added:Disconnect()end)end if a0.Removed then pcall(function()a0.Removed:
Disconnect()end)end end av={}at={}for a_ in pairs(au)do aU(a_)end au={}ay=0 ax={
}dungeon=nil end aL=function()for a_,a0 in pairs(au)do if not a_ or not a_.
Parent then aV(a_)else local a1=a0.Humanoid or a_:FindFirstChildOfClass
'Humanoid'a0.Humanoid=a1 if not a1 or a1.Health<=0 then aV(a_)else local a2=a0.
Root if not a2 or not a2.Parent then a2=aS(a_)if a2 then a0.Root=a2 else aV(a_)
end end end end end end function ag.SetFastSpeed(a_)ai=a_ if ah and humanoid and
humanoid.Parent then if humanoid.WalkSpeed<ai then am=true humanoid.WalkSpeed=ai
am=false end end end function ag.SetSpeedEnabled(a_)ah=a_ if humanoid and
humanoid.Parent then am=true if ah then if humanoid.WalkSpeed<ai then humanoid.
WalkSpeed=ai end else humanoid.WalkSpeed=aj end am=false end end function ag.
IsSpeedEnabled()return ah end function ag.GetFastSpeed()return ai end function
ag.SetInstantAccelEnabled(a_)ak=a_ and true or false end function ag.
IsInstantAccelEnabled()return ak end function ag.SetInstantBrakeEnabled(a_)al=a_
and true or false end function ag.IsInstantBrakeEnabled()return al end local a_=
function()if aP then aP:Disconnect()aP=nil end if not humanoid or not humanoid.
Parent then return end aP=humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(
function()if am then return end if not humanoid or not humanoid.Parent then
return end local a_=humanoid.WalkSpeed if ah then if a_<ai then am=true humanoid
.WalkSpeed=ai am=false end else aj=a_ end end)end function ag.SetHumanoid(a0)if
not a0 then return end local a1=a0:WaitForChild('Humanoid',10)if not a1 then
return end humanoid=a1 rootPart=a0:WaitForChild('HumanoidRootPart',10)or a0.
PrimaryPart aj=humanoid.WalkSpeed if ah and humanoid.WalkSpeed<ai then am=true
humanoid.WalkSpeed=ai am=false end if aQ then aQ:Disconnect()aQ=nil end aQ=
humanoid.Died:Connect(function()aJ=true end)aR(humanoid.HealthChanged:Connect(
function(a2)if a2<=0 then aJ=true elseif aJ and a2>0 then aJ=false end end))end
local a0=function()if not ab.IsActive()then return end if not ak and not al then
return end if not humanoid or not humanoid.Parent or humanoid.Health<=0 or
humanoid.Sit then return end if not rootPart or not rootPart.Parent then local
a0=ac and ac.Character rootPart=a0 and(a0:FindFirstChild'HumanoidRootPart'or a0.
PrimaryPart)if not rootPart then return end end if rootPart.Anchored then return
end local a0,a1=humanoid.MoveDirection,rootPart.AssemblyLinearVelocity if a0.
Magnitude>0.05 then if ak then local a2=ah and math.max(ai,humanoid.WalkSpeed)or
humanoid.WalkSpeed rootPart.AssemblyLinearVelocity=Vector3.new(a0.X*a2,a1.Y,a0.Z
*a2)end elseif al then if math.abs(a1.X)>0.1 or math.abs(a1.Z)>0.1 then rootPart
.AssemblyLinearVelocity=Vector3.new(0,a1.Y,0)end end end if aa.RunService then
local a1=aa.RunService.PreSimulation or aa.RunService.Heartbeat if a1 then aR(a1
:Connect(a0))end end function ag.GetDungeonStartTime()return dungeonStartTime
end function ag.SetDungeonStartTime(a1)dungeonStartTime=a1 end function ag.
GetDungeonElapsed()if not dungeonStartTime then return nil end return os.clock()
-dungeonStartTime end function ag.ReadyDungeon()if not dungeon and not aM()then
return false end return true end function ag.GetHumanoid()return humanoid end
function ag.GetEnemyNames()local a1={}local a2=function(a2)if a2 and a2~=''and
a2~=ac.Name then a1[a2]=true end end if dungeon then for a3,a4 in ipairs(dungeon
:GetChildren())do if a4:IsA'Folder'or a4:IsA'Model'then for a5,a6 in ipairs(a4:
GetDescendants())do if a6:IsA'Model'and a6:FindFirstChildOfClass'Humanoid'then
a2(a6.Name)end end end end end for a3 in pairs(au)do a2(a3.Name)end local a3={}
for a4 in pairs(a1)do table.insert(a3,a4)end table.sort(a3)return a3 end
function ag.GetEnemyCount()return ay end function ag.GetTrackedEnemyData()local
a1={}for a2,a3 in pairs(au)do if a3 and a3.Root and a3.Root.Parent then a1[#a1+1
]=a3 end end return a1 end function ag.OnEnemyChanged(a1)if type(a1)~='function'
then return function()end end table.insert(az,a1)return function()for a2,a3 in
ipairs(az)do if a3==a1 then table.remove(az,a2)break end end end end function ag
.GetEnemyProjectileNames()local a1,a2={},game:GetService'ReplicatedStorage'local
a3=a2:FindFirstChild(ae)if not a3 then return a1 end for a4,a5 in ipairs(a3:
GetChildren())do local a6=a5.ClassName if a6=='Model'or a6=='MeshPart'or a6==
'Part'then a1[a5.Name]=true end end return a1 end function ag.GetKeyHoldTime()
return ad end if ac and ac.Character and ac.Character.Parent then ag.
SetHumanoid(ac.Character)a_()else local a1=ac and ac.CharacterAdded and task.
spawn(function()local a1=ac.CharacterAdded:Wait()if a1 and ab.IsActive()then ag.
SetHumanoid(a1)a_()end end)end if ac then aR(ac.CharacterAdded:Connect(function(
a1)local a2,a3=pcall(function()if not a1 then return end aH=os.clock()ag.
SetHumanoid(a1)a_()for a2,a3 in ipairs(aF)do pcall(a3)end end)if not a2 then
warn('[Shared] respawn handler error:',tostring(a3))end end))end task.spawn(
function()while ab.IsActive()do task.wait(af)local a1=workspace:FindFirstChild
'dungeon'if dungeon and a1~=dungeon then aN()elseif not dungeon and a1 then aM()
end aO()end end)local a1=function()local a1=game:GetService'Workspace'for a2,a3
in ipairs(a1:GetDescendants())do if a3.Name=='dungeonName'and a3:IsA'ValueBase'
then local a4=a3.Value if type(a4)=='string'then local a5=string.gsub(a4,'%s+',
'')if a5~=''and string.lower(a5)~=aC then return a4 end end end end return nil
end task.spawn(function()while ab.IsActive()do task.wait(af)local a2=a1()if a2~=
aK then aK=a2 if a2 then ag.ResetBossIndex()end for a3=#aB,1,-1 do pcall(aB[a3],
a2)end end end end)local a2=function()return not(aK and#aK>0)end task.spawn(
function()while ab.IsActive()do task.wait(af)local a3=a2()if a3~=aD then aD=a3
for a4=#aE,1,-1 do pcall(aE[a4],aD)end end end end)task.spawn(function()local a3
,a4=pcall(function()return aM()end)if not a3 then warn(
'[EnemyTracker] Initialization error:',a4)end end)local a3,a4=0,2 task.spawn(
function()while ab.IsActive()do task.wait(a4)local a5=os.clock()if a5-a3<a4 then
continue end a3=a5 if not dungeon then continue end local a6=pcall(function()for
a6,a7 in ipairs(dungeon:GetChildren())do if a7:IsA'Folder'or a7:IsA'Model'then
for a8,a9 in ipairs(a7:GetDescendants())do if a9:IsA'Model'then aY(a9)end end
end end aL()end)if not a6 then warn'[EnemyTracker] rescan error'end end end)
function ag.IsBossActive()return an end function ag.OnBossActiveChanged(a5)if
type(a5)~='function'then return function()end end table.insert(ao,a5)return
function()for a6,a7 in ipairs(ao)do if a7==a5 then table.remove(ao,a6)break end
end end end function ag.GetCurrentBossIndex()return ap end function ag.
GetCombatTargetKey()if not an then return'Mob'end local a5=math.clamp(ap,1,3)
return'Boss'..tostring(a5)end function ag.ResetBossIndex()ap=0 for a5=#aq,1,-1
do pcall(aq[a5],ap)end end function ag.OnBossIndexChanged(a5)if type(a5)~=
'function'then return function()end end table.insert(aq,a5)return function()for
a6,a7 in ipairs(aq)do if a7==a5 then table.remove(aq,a6)break end end end end
local a5=function(a5)if type(a5)~='string'then return 0 end local a6=string.
match(a5,'^room(%d+)$')if not a6 then return 0 end return tonumber(a6)or 0 end
local a6=function()if not dungeon then return 0 end for a6,a7 in pairs(au)do if
a7 and a7.Room then local a8=a5(a7.Room.Name)if a8>0 then return a8 end end end
return 0 end aO=function()local a7=a6()if a7==ar then return end ar=a7 for a8=#
as,1,-1 do pcall(as[a8],ar)end end function ag.GetCurrentRoomIndex()return ar
end function ag.OnRoomIndexChanged(a7)if type(a7)~='function'then return
function()end end table.insert(as,a7)return function()for a8,a9 in ipairs(as)do
if a9==a7 then table.remove(as,a8)break end end end end function ag.
GetCurrentDungeonName()return aK end function ag.OnDungeonNameChanged(a7)if
type(a7)~='function'then return function()end end table.insert(aB,a7)return
function()for a8,a9 in ipairs(aB)do if a9==a7 then table.remove(aB,a8)break end
end end end function ag.IsInLobby()return aD end function ag.OnLobbyChanged(a7)
if type(a7)~='function'then return function()end end table.insert(aE,a7)return
function()for a8,a9 in ipairs(aE)do if a9==a7 then table.remove(aE,a8)break end
end end end local a7,a8=function(a7)if an==a7 then return end an=a7 if a7 then
ap+=1 for a8=#aq,1,-1 do pcall(aq[a8],ap)end end for a8=#ao,1,-1 do pcall(ao[a8]
,an)end end local function a9()if not ac then return end local b=ac:
FindFirstChild'PlayerGui'if not b then a8=nil a7(false)return end local ba=b:
FindFirstChild('bossHealth',true)if ba then if ba~=a8 then a8=ba if a8:IsA
'ScreenGui'then aR(a8:GetPropertyChangedSignal'Enabled':Connect(a9))elseif a8:
IsA'GuiObject'then aR(a8:GetPropertyChangedSignal'Visible':Connect(a9))end end
local bb=if ba:IsA'ScreenGui'then ba.Enabled elseif ba:IsA'GuiObject'then ba.
Visible else true a7(bb)else a8=nil a7(false)end end task.spawn(function()if not
ac then return end local b=ac:WaitForChild('PlayerGui',30)if not b then return
end aR(b.DescendantAdded:Connect(a9))aR(b.DescendantRemoving:Connect(a9))a9()
while ab.IsActive()and task.wait(0.5)do a9()end end)ab.Register(function()if aP
then aP:Disconnect()aP=nil end for b,ba in ipairs(aG)do pcall(function()ba:
Disconnect()end)end table.clear(aG)aN()end)return ag end function a.g()local aa=
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
,DisplayMethod='Round',Precision=0,Callback=ac.Wrap(function(ah)aa.SetFastSpeed(
ah)end)},'Slider_FastSpeed'))ag:Toggle({Name=
'Instant Acceleration (Max Speed t\u{1ee9}c th\u{ec})',Default=aa.
IsInstantAccelEnabled(),Callback=ac.Wrap(function(ah)aa.SetInstantAccelEnabled(
ah)end)},'Toggle_InstantAcceleration')ag:Toggle({Name=
'Instant Brake (D\u{1eeb}ng t\u{1ee9}c th\u{ec} / Ch\u{1ed1}ng tr\u{1b0}\u{1ee3}t)'
,Default=aa.IsInstantBrakeEnabled(),Callback=ac.Wrap(function(ah)aa.
SetInstantBrakeEnabled(ah)end)},'Toggle_InstantBrake')ag:Header{Name='Shortcuts'
}ag:Toggle({Name='Right Click Combo (Q+E)',Default=ad.IsMouseComboEnabled(),
Callback=ac.Wrap(function(ah)ad.SetMouseComboEnabled(ah)end)},
'Toggle_MouseCombo')end end function a.j()local aa,ab={},{}function aa.Register(
ac,ad,ae)if type(ac)~='string'or type(ad)~='function'or type(ae)~='function'then
return end ab[ac]={setEnabled=ad,isEnabled=ae}end function aa.EnableExclusive(ac
)for ad,ae in pairs(ab)do if ad~=ac and ae.isEnabled()then pcall(ae.setEnabled,
false)end end end function aa.IsEnabled(ac)local ad=ab[ac]return ad~=nil and ad.
isEnabled()end return aa end function a.k()local aa,ab,ac,ad,ae,af,ag=game:
GetService'Players',game:GetService'Workspace',1.8,150,150,{}function af.
BindDetection(ah)ag=ah or nil end local ah=function()return ag end function af.
GetHitboxPadding()return ac end function af.SetHitboxPadding(ai)if type(ai)==
'number'and ai>=0 then ac=ai end end local ai=RaycastParams.new()ai.FilterType=
Enum.RaycastFilterType.Exclude ai.IgnoreWater=true local aj,ak={},0 local al,am=
function(al)local am=os.clock()if not al and(am-ak<0.25)then return end ak=am
table.clear(aj)for an,ao in ipairs(aa:GetPlayers())do if ao.Character then table
.insert(aj,ao.Character)end end if ab:FindFirstChild'RaycastIgnore'then table.
insert(aj,ab.RaycastIgnore)end for an in pairs(ah().GetActiveHazardsMap())do
table.insert(aj,an)end ai.FilterDescendantsInstances=aj end,aa.LocalPlayer
function af.GetFloorPosition(an)al(false)local ao,ap=Vector3.new(an.X,an.Y+10,an
.Z),Vector3.new(0,-ad,0)local aq=ab:Raycast(ao,ap,ai)if aq and aq.Position then
return Vector3.new(an.X,aq.Position.Y+3,an.Z),true end return an,false end
function af.GetRawFloorY(an)al(false)local ao,ap=Vector3.new(an.X,an.Y+12,an.Z),
Vector3.new(0,-ad,0)local aq=ab:Raycast(ao,ap,ai)if aq and aq.Position then
return aq.Position.Y,true end local ar=am and am.Character and am.Character:
FindFirstChild'HumanoidRootPart'if ar then local as=Vector3.new(an.X,ar.Position
.Y+8,an.Z)local at=ab:Raycast(as,ap,ai)if at and at.Position then return at.
Position.Y,true end return ar.Position.Y-2.8,false end return an.Y,false end
function af.IsPointInTrajectory(an,ao)local ap=ah()local aq=ap.
GetLockedProjectiles()[ao]if not aq then aq=ap.LockTrajectoryForPart and ap.
LockTrajectoryForPart(ao)end if not aq then return false end local ar,as,at,au=
ao.Position,aq.forward2D,aq.maxLookahead,aq.dangerRadius local av=an-ar local aw
=Vector3.new(av.X,0,av.Z)local ax=aw:Dot(as)if aq.config and aq.config.
isDynamicMoving then if ax<-4 or ax>(at+2)then return false end local ay=as*ax
local az=aw-ay local aA,aB=az.Magnitude,aq.lockedVisualY or(aq.rawFloorY and(aq.
rawFloorY+2.8))or ar.Y local aC=math.abs(an.Y-aB)if aC>ae then return false end
if aA<=(au+ac)then return true,aA,au,as,ar,at end return false end if ax<-au or
ax>at then return false end local ay=as*ax local az=aw-ay local aA,aB=az.
Magnitude,aq.rawFloorY and(aq.rawFloorY+2.8)or ar.Y local aC=math.abs(an.Y-aB)if
aC>ae then return false end if aA<=(au+ac)then return true,aA,au,as,ar,at end
return false end function af.IsPointInPart(an,ao)if not ao or not ao:IsA
'BasePart'or not ao.Parent or ah().IsIgnoredPart(ao)then return false end if ao:
IsA'Part'and(ao.Shape==Enum.PartType.Ball or ao.Shape==Enum.PartType.Cylinder)
then local ap,aq,ar=math.max(ao.Size.X,ao.Size.Z)/2+ac,an.X-ao.Position.X,an.Z-
ao.Position.Z local as,at=aq*aq+ar*ar,math.abs(an.Y-ao.Position.Y)return(as<=ap*
ap)and(at<=ae)end local ap=ao.Name:lower():find'movingbeam'or(ao.Parent and ao.
Parent.Name:lower():find'movingbeam')if ap then local aq,ar,as=ao.CFrame:
PointToObjectSpace(an),math.max(ao.Size.X,ao.Size.Z)/2+ac,math.max(ao.Size.Y,
math.min(ao.Size.X,ao.Size.Z))/2+ac if as<3.5 then as=3.5 end local at,au=aq.Y*
aq.Y+aq.Z*aq.Z,math.abs(an.Y-ao.Position.Y)return(math.abs(aq.X)<=ar)and(at<=(as
+1.5)*(as+1.5))and(au<=ae)end local aq,ar,as,at=ao.CFrame:PointToObjectSpace(an)
,ao.Size.X/2+ac,ao.Size.Z/2+ac,math.max(ae,ao.Size.Y/2+5)return math.abs(aq.X)<=
ar and math.abs(aq.Z)<=as and math.abs(aq.Y)<=at end function af.
IsPointInRingPart(an,ao)if not ao or not ao:IsA'BasePart'or not ao.Parent or ah(
).IsIgnoredPart(ao)then return false end local ap=ao.Parent:FindFirstChild
'center'or ao.Parent:FindFirstChild'Center'or ao.Parent.PrimaryPart local aq=ap
and ap.Position or ao.Position local ar=math.abs(an.Y-aq.Y)if ar>ae then return
false end local as,at=an.X-aq.X,an.Z-aq.Z local au,av=math.sqrt(as*as+at*at),ao.
Size.Z if av<1 then av=math.max(ao.Size.X,ao.Size.Z)/2 end local aw=(av>90)and
18 or 13 local ax=math.max(0,av-aw)if au<ax-ac then return false end if au>av+ac
then return false end local ay,az=ao.Position.X-aq.X,ao.Position.Z-aq.Z local aA
=math.sqrt(ay*ay+az*az)if aA>0.5 then local aB,aC=ay/aA,az/aA local aD=(as*aB)+(
at*aC)if aD<-ac then return false end end return true,au,ax,av,aq,ao.CFrame end
function af.IsPointInThirdBossMultiRings(an,ao)if not ao or not ao.Instance or
not ao.Instance.Parent then return false,nil end local ap=ah().GetFadeThreshold(
)if ao.ActiveParts then for aq in pairs(ao.ActiveParts)do if aq and aq.Parent
and aq:IsA'BasePart'and aq.Transparency<ap then local ar=af.IsPointInRingPart(an
,aq)if ar then return true,aq end end end end return false,nil end function af.
IsPointInSecondBossMovingBeam(an,ao)if not ao or not ao.Instance or not ao.
Instance.Parent then return false,nil,nil end local ap,aq=ao.Instance,ah()local
ar=aq.GetLockedProjectiles()[ap]if not ar then return false,nil,nil end local as
=ap:IsA'Model'and(ap.PrimaryPart or ap:FindFirstChildWhichIsA'BasePart')local at
,au,av,aw=(as and as.Position)or(ap:IsA'Model'and select(1,ap:GetBoundingBox()).
Position)or ap.Position,ar.forward2D or Vector3.new(0,0,-1),ar.dangerRadius or
25,ar.maxLookahead or 50 local ax=an-at local ay=Vector3.new(ax.X,0,ax.Z)local
az=ay:Dot(au)if az<-4 or az>(aw+2)then return false,nil,nil end local aA=au*az
local aB=ay-aA local aC,aD=aB.Magnitude,ar.lockedVisualY or at.Y local aE=math.
abs(an.Y-aD)if aE>ae then return false,nil,nil end if aC<=(av+ac)then local aF,
aG=as or ap:FindFirstChildWhichIsA'BasePart',{isTrajectory=true,isDynamicMoving=
true,perpDist=aC,dangerRadius=av,forward2D=au,originPos=at,maxLookahead=aw}
return true,aF,aG end return false,nil,nil end function af.IsPointInAnyHazard(an
,ao)local ap,aq,ar,as,at=ah(),(math.huge)for au,av in pairs(ap.
GetActiveHazardsMap())do if ao then if av.Instance==ao or(av.Instance and av.
Instance.Name==ao.Name)or(av.Name and av.Name==ao.Name)then continue end end
local aw,ax=av.Name and av.Name:lower():find'multiring'~=nil,av.Instance and av.
Instance:IsA'Model'and((av.Name and av.Name:lower():find'movingbeam'~=nil)or(av.
Instance.Name and av.Instance.Name:lower():find'movingbeam'~=nil))if aw then
local ay,az=af.IsPointInThirdBossMultiRings(an,av)if ay then local aA=(an-az.
Position).Magnitude if aA<aq then aq=aA ar=av as=az at=nil end end elseif ax
then local ay,az,aA=af.IsPointInSecondBossMovingBeam(an,av)if ay then local aB=(
an-(az and az.Position or av.Instance.Position)).Magnitude if aB<aq then aq=aB
ar=av as=az or av.Instance at=aA end end elseif av.ActiveParts then for ay in
pairs(av.ActiveParts)do if ao and(ay==ao or ay.Name==ao.Name)then continue end
local az=ap.GetTrajectoryConfigForPart(ay)if az then local aA,aB,aC,aD,aE,aF=af.
IsPointInTrajectory(an,ay)if aA then local aG=(an-ay.Position).Magnitude if aG<
aq then aq=aG ar=av as=ay at={isTrajectory=true,perpDist=aB,dangerRadius=aC,
forward2D=aD,originPos=aE,maxLookahead=aF}end end else if af.IsPointInPart(an,ay
)then local aA=(an-ay.Position).Magnitude if aA<aq then aq=aA ar=av as=ay at=nil
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
af end function a.l()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'a',(a.load
'b')local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az=
function()if not ae then ae=a.load'k'end return ae end,game:GetService'Players',
game:GetService'Workspace',game:GetService'ReplicatedStorage',game:GetService
'HttpService',aa.player,{},false,false,true,true,true,{},0,{},{},{},{},{
smallIceSpikes={hitDelay=0.8,totalLifetime=1.2},mediumIceSpikes={hitDelay=1.1,
totalLifetime=1.5},largeIceSpikes={hitDelay=1.4,totalLifetime=1.8},
thirdBossMultiRings={hitDelay=2,totalLifetime=2.8},firstBossCrissCross={hitDelay
=1.6,totalLifetime=2.2},firstBossSeekingSpikes={hitDelay=1.8,totalLifetime=2.5},
firstBossBigSpike={hitDelay=1.5,totalLifetime=2},firstBossBeamPart={hitDelay=1.5
,totalLifetime=2},secondBossMovingBeam={hitDelay=0,totalLifetime=3.5},
secondbossyelloworb={hitDelay=0,totalLifetime=4},secondbossredorb={hitDelay=0,
totalLifetime=4},secondbossgreenorb={hitDelay=0,totalLifetime=4}},(ac.Folder..
'/settings')local aA=ay..'/smartDodge_skills.json'local aB,aC,aD=function()if
not(isfile and isfile(aA))then return end local aB,aC=pcall(function()return aj:
JSONDecode(readfile(aA))end)if aB and type(aC)=='table'then for aD,aE in pairs(
aC)do if type(aE)=='table'and type(aE.avgLifetime)=='number'then aw[aD]={count=
tonumber(aE.count)or 1,avgLifetime=tonumber(aE.avgLifetime)or 2,avgHitDelay=
tonumber(aE.avgHitDelay)or(tonumber(aE.avgLifetime)*0.75),minLifetime=tonumber(
aE.minLifetime)or aE.avgLifetime,maxLifetime=tonumber(aE.maxLifetime)or aE.
avgLifetime}end end if an then print((
'[SmartDodge] \u{1f4c2} Loaded skill lifetime & hit profiles from %s'):format(aA
))end end end,false,function()if not(isfile and writefile)then return end pcall(
function()if makefolder and isfolder then if not isfolder(ac.Folder)then
makefolder(ac.Folder)end if not isfolder(ay)then makefolder(ay)end end
writefile(aA,aj:JSONEncode(aw))end)end local aE=function()if not(isfile and
writefile)then return end if aC then return end aC=true task.delay(1.5,function(
)aC=false aD()end)end aB()ad.Register(function()if aC then aC=false aD()end end)
local aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO={DodgeNode_ESP=true,['Enhanced Aura Ring']=
true,EnhancedAuraRing=true,['Enhanced Aura']=true,EnhancedAura=true,['Aura Ring'
]=true,AuraRing=true,AuraRingMesh=true,groundAura=true,GroundAura=true,[
'Ground Aura']=true,['ground aura']=true},{largeIceSpikes=true,mediumIceSpikes=
true,smallIceSpikes=true,thirdBossMultiRings=true,firstBossCrissCross=true,
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
maxLookahead=nil,visualColor=Color3.fromRGB(255,130,0),isDynamicMoving=true}},50
,2.5,{},{}al.SetTrajectoryLookahead=function(aP)if type(aP)=='number'and aP>=10
then aL=aP end end al.GetTrajectoryLookahead=function()return aL end al.
SetTrajectoryWidthPadding=function(aP)if type(aP)=='number'and aP>=0 then aM=aP
end end al.GetTrajectoryWidthPadding=function()return aM end al.
GetActiveHazardsMap=function()return ar end al.GetLockedProjectiles=function()
return aN end al.GetFadeThreshold=function()return aH end al.IsEnabled=function(
)return am end al.SetEnabled=function(aP)am=aP and true or false end al.
ClearTrajectoryVisuals=function()for aP,aQ in pairs(aO)do pcall(function()aQ:
Destroy()end)end table.clear(aO)table.clear(aN)end function al.AddCustomHazard(
aP)if type(aP)=='string'and#aP>0 then aG[aP]=true end end function al.
AddTrajectoryProjectile(aP,aQ,aR)if type(aP)=='string'and#aP>0 then local aS=aP:
lower():gsub('%s+','')aK[aS]={name=aP,dangerRadius=aQ or 4,maxLookahead=aR,
visualColor=Color3.fromRGB(255,130,0)}if an then print((
'[SmartDodge] \u{1f680} Registered Trajectory Projectile: %s'):format(aP))end
end end local aP=function(aP)if not aP then return nil end local aQ=aP.Name:
lower():gsub('%s+','')if aK[aQ]then return aK[aQ]end if aP.Parent and aP.Parent:
IsA'Model'then local aR=aP.Parent.Name:lower():gsub('%s+','')if aK[aR]then
return aK[aR]end end return nil end al.GetTrajectoryConfigForPart=function(aQ)
return aP(aQ)end local aQ=function(aQ)if not aQ or not aQ:IsA'BasePart'then
return 6,nil end local aR,aS,aT=aQ:FindFirstChildOfClass'Beam'or(aQ.Parent and
aQ.Parent:FindFirstChildOfClass'Beam')if aR then local aU,aV=aR.Width0 or 0,aR.
Width1 or 0 local aW=math.max(aU,aV)if aW>0.5 then aS=aW end end local aU=aQ:
FindFirstChild'Attachment2'or(aQ.Parent and aQ.Parent:FindFirstChild
'Attachment2')if aU and aU:IsA'Attachment'then local aV=aU.WorldPosition-aQ.
Position if aV.Magnitude>5 then aT=aV.Magnitude end end local aV=aQ:
FindFirstChildOfClass'SpecialMesh'local aW,aX,aY=(aV and aV.Scale.X)or 1,(aV and
aV.Scale.Y)or 1,(aV and aV.Scale.Z)or 1 local aZ=Vector3.new(aQ.Size.X*math.abs(
aW),aQ.Size.Y*math.abs(aX),aQ.Size.Z*math.abs(aY))if not aS then local a_,a0=aQ.
Name:lower():find'movingbeam'or(aQ.Parent and aQ.Parent.Name:lower():find
'movingbeam'),aQ.Name:lower():find'bigspike'or(aQ.Parent and aQ.Parent.Name:
lower():find'bigspike')if a_ then aS=math.max(aZ.X,aZ.Z)elseif a0 then aS=40 if
not aT then aT=140 end else local a1,a2=math.min(aZ.X,aZ.Z),math.max(aZ.X,aZ.Z)
if a1<1.2 and a2>=1.2 then aS=a2 else aS=a1 end end end local a_=math.clamp(aS
or 6,3,60)return a_,aT end local aR=function(aR)if not aR or not aR:IsA
'BasePart'then return nil end if aN[aR]then return aN[aR]end local aS=aP(aR)if
not aS then return nil end if aS.isDynamicMoving then local aT=aR.Name:lower():
find'movingbeam'or(aR.Parent and aR.Parent.Name:lower():find'movingbeam')if aT
then local aU=math.max(aR.Size.X,aR.Size.Z)if aU<8 then return nil end end end
local aT,aU=Vector3.new(0,0,-1),(aR.AssemblyLinearVelocity or(aR:IsA'BasePart'
and aR.Velocity))if aU and Vector3.new(aU.X,0,aU.Z).Magnitude>2 then aT=Vector3.
new(aU.X,0,aU.Z).Unit elseif aS.isDynamicMoving then local aV=aR.CFrame.
RightVector local aW=Vector3.new(aV.X,0,aV.Z)if aW.Magnitude>0.01 then aW=aW.
Unit else aW=Vector3.new(1,0,0)end local aX,aY=Vector3.new(-aW.Z,0,aW.X),Vector3
.new(aR.CFrame.LookVector.X,0,aR.CFrame.LookVector.Z)if aY.Magnitude>0.01 and aX
:Dot(aY.Unit)<0 then aX=-aX end aT=aX else local aV=aR:FindFirstChild
'Attachment2'or(aR.Parent and aR.Parent:FindFirstChild'Attachment2')if aV and aV
:IsA'Attachment'then local aW=aV.WorldPosition-aR.Position local aX=Vector3.new(
aW.X,0,aW.Z)if aX.Magnitude>0.1 then aT=aX.Unit end else local aW=aR.CFrame.
LookVector local aX=Vector3.new(aW.X,0,aW.Z)if aX.Magnitude>0.001 then aT=aX.
Unit end end end local aV,aW=aQ(aR)local aX=aV/2 if aS.dangerRadius and aS.
dangerRadius>aX then aX=aS.dangerRadius end local aY,aZ,a_,a0=aX+aM,aW or aS.
maxLookahead or aL,af().GetRawFloorY(aR.Position)local a1=0.8 local a2=a_+(a1/2)
+0.05 local a3={part=aR,originPos=aR.Position,forward2D=aT,dangerRadius=aY,
maxLookahead=aZ,config=aS,spawnTime=os.clock(),locked=true,rawFloorY=a_,
lockedVisualY=a2,boxThickness=a1}aN[aR]=a3 if an then print((
'[SmartDodge] \u{1f680} Locked Trajectory for %s | Dir: (%.2f, %.2f) | Lookahead: %.0fm | Auto Width: %.1fm (Radius: %.1fm) | Locked Floor Y: %.2f'
):format(aR.Name,aT.X,aT.Z,a3.maxLookahead,aV,a3.dangerRadius,a_))end return a3
end al.LockTrajectoryForPart=function(aS)return aR(aS)end function al.
RegisterPlayerSkill(aS)if type(aS)=='string'and#aS>0 then local aT=aS:gsub(
'^%s+',''):gsub('%s+$','')if not aF[aT]then aF[aT]=true local aU=aT:lower():
gsub('%s+','')aF[aU]=true if an then print((
'[SmartDodge] \u{1f6e1}\u{fe0f} Registered Player Skill (Ignored): %s'):format(
aT))end end end end local aS,aT=function()local aS=function(aS)if not aS then
return end local aT=function(aT)if not aT then return end for aU,aV in ipairs(aT
:GetChildren())do al.RegisterPlayerSkill(aV.Name)end end local aU,aV=function(aU
)if not aU then return end aT(aU)aU.ChildAdded:Connect(function(aV)al.
RegisterPlayerSkill(aV.Name)end)end,function(aU)if not aU then return end aT(aU)
aU.ChildAdded:Connect(function(aV)if aV:IsA'Tool'then al.RegisterPlayerSkill(aV.
Name)end end)end if aS:FindFirstChild'Backpack'then aU(aS.Backpack)end aS.
ChildAdded:Connect(function(aW)if aW.Name=='Backpack'or aW:IsA'Backpack'then aU(
aW)end end)if aS.Character then aV(aS.Character)end aS.CharacterAdded:Connect(aV
)end for aT,aU in ipairs(ag:GetPlayers())do aS(aU)end ag.PlayerAdded:Connect(aS)
task.spawn(function()while am or#ag:GetPlayers()>0 do for aT,aU in ipairs(ag:
GetPlayers())do if aU:FindFirstChild'Backpack'then for aV,aW in ipairs(aU.
Backpack:GetChildren())do al.RegisterPlayerSkill(aW.Name)end end if aU.Character
then for aV,aW in ipairs(aU.Character:GetChildren())do if aW:IsA'Tool'then al.
RegisterPlayerSkill(aW.Name)end end end end task.wait(1)end end)end,function(aS)
if not aS then return end al.RegisterPlayerSkill(aS.Name)local aT=aS:
FindFirstChild'name'if aT and aT:IsA'ValueBase'and tostring(aT.Value)~=''then al
.RegisterPlayerSkill(tostring(aT.Value))end local aU=aS:GetAttribute'name'or aS:
GetAttribute'Name'if type(aU)=='string'and aU~=''then al.RegisterPlayerSkill(aU)
end for aV,aW in ipairs(aS:GetDescendants())do if aW:IsA'BasePart'and aW.Name~=
'Handle'and aW.Name~='Part'and aW.Name~='Union'then al.RegisterPlayerSkill(aW.
Name)end end end local aU,aV=function()local aU,aV=function(aU)for aV,aW in
ipairs(aU:GetChildren())do aT(aW)end aU.ChildAdded:Connect(function(aV)aT(aV)end
)if an then print((
'[SmartDodge] \u{1f4da} Loaded %d player abilities from ReplicatedStorage.abilities'
):format(#aU:GetChildren()))end end,ai:FindFirstChild'abilities'if aV then aU(aV
)else task.spawn(function()local aW=ai:WaitForChild('abilities',10)if aW then
aU(aW)end end)end end,function(aU)if not aU then return end al.
RegisterPlayerSkill(aU.Name)for aV,aW in ipairs(aU:GetDescendants())do if aW:IsA
'BasePart'and aW.Name~='Handle'and aW.Name~='Part'and aW.Name~='Union'then al.
RegisterPlayerSkill(aW.Name)end end end local aW=function()local aW,aX=function(
aW)for aX,aY in ipairs(aW:GetChildren())do aV(aY)end aW.ChildAdded:Connect(
function(aX)aV(aX)end)if an then print((
'[SmartDodge] \u{1f386} Loaded %d player projectiles/effects from ReplicatedStorage.projectiles'
):format(#aW:GetChildren()))end end,ai:FindFirstChild'projectiles'if aX then aW(
aX)else task.spawn(function()local aY=ai:WaitForChild('projectiles',10)if aY
then aW(aY)end end)end end aS()aU()aW()local aX,aY,aZ=function(aX)if not aX then
return true end local aY=aX.Name:gsub('^%s+',''):gsub('%s+$','')local aZ=aY:
lower():gsub('%s+','')if aG[aX.Name]or aZ:find'boss'or aZ:find'enemy'or aZ:find
'mob'or aZ:find'multiring'or aZ:find'crisscross'or aZ:find'seekingspike'or aZ:
find'bigspike'or aZ:find'beampart'or aZ:find'movingbeam'or aZ:find'thirdboss'
then return false end for a_,a0 in ipairs(ag:GetPlayers())do if a0.Character and
(aX==a0.Character or aX:IsDescendantOf(a0.Character))then return true end end aY
=aX.Name:gsub('^%s+',''):gsub('%s+$','')aZ=aY:lower():gsub('%s+','')for a_,a0 in
ipairs(ag:GetPlayers())do local a1=a0:FindFirstChild'Backpack'if a1 then if a1:
FindFirstChild(aX.Name)or a1:FindFirstChild(aY)then al.RegisterPlayerSkill(aX.
Name)return true end for a2,a3 in ipairs(a1:GetChildren())do local a4=a3.Name:
lower():gsub('%s+','')if a3.Name==aX.Name or a4==aZ then al.RegisterPlayerSkill(
a3.Name)return true end end end if a0.Character then if a0.Character:
FindFirstChild(aX.Name)or a0.Character:FindFirstChild(aY)then al.
RegisterPlayerSkill(aX.Name)return true end for a2,a3 in ipairs(a0.Character:
GetChildren())do if a3:IsA'Tool'then local a4=a3.Name:lower():gsub('%s+','')if
a3.Name==aX.Name or a4==aZ then al.RegisterPlayerSkill(a3.Name)return true end
end end end end local a_=aX:FindFirstChild'creator'or aX:FindFirstChild'Creator'
or aX:FindFirstChild'owner'or aX:FindFirstChild'Owner'or aX:FindFirstChild
'player'or aX:FindFirstChild'Player'or aX:FindFirstChild'caster'or aX:
FindFirstChild'Caster'if a_ then if a_:IsA'ObjectValue'and a_.Value and a_.Value
:IsA'Player'then return true elseif a_:IsA'StringValue'and ag:FindFirstChild(a_.
Value)then return true end end local a0=aX:GetAttribute'Owner'or aX:GetAttribute
'Player'or aX:GetAttribute'creator'or aX:GetAttribute'Creator'if a0 then if
type(a0)=='string'and ag:FindFirstChild(a0)then return true end end for a1,a2 in
ipairs(ag:GetPlayers())do local a3=a2.Name:lower()if aZ:find(a3,1,true)or aX.
Name:find(tostring(a2.UserId),1,true)then return true end end if aF[aX.Name]or
aF[aY]or aF[aZ]then return true end local a1=ai:FindFirstChild'abilities'if a1
and(a1:FindFirstChild(aX.Name)or a1:FindFirstChild(aY))then al.
RegisterPlayerSkill(aX.Name)return true end local a2=ai:FindFirstChild
'projectiles'if a2 and(a2:FindFirstChild(aX.Name)or a2:FindFirstChild(aY))then
al.RegisterPlayerSkill(aX.Name)return true end if aZ:find('enhancedaura',1,true)
or aZ:find('auraring',1,true)or aZ:find('groundaura',1,true)then return true end
return false end,{primarypart=true,center=true,root=true,main=true,handle=true,
humanoidrootpart=true},function(aX)if not aX then return true end if aX.Name:
find'SmartDodge'then return true end local aY=aX.Name:gsub('^%s+',''):gsub(
'%s+$','')local aZ=aY:lower():gsub('%s+','')if aG[aX.Name]or(aX.Parent and aG[aX
.Parent.Name])or aX.Name:lower():find'multiring'or(aX.Parent and aX.Parent.Name:
lower():find'multiring')or aX.Name:lower():find'crisscross'or(aX.Parent and aX.
Parent.Name:lower():find'crisscross')or aX.Name:lower():find'seekingspike'or(aX.
Parent and aX.Parent.Name:lower():find'seekingspike')or aX.Name:lower():find
'bigspike'or(aX.Parent and aX.Parent.Name:lower():find'bigspike')or aX.Name:
lower():find'beampart'or(aX.Parent and aX.Parent.Name:lower():find'beampart')or
aX.Name:lower():find'movingbeam'or(aX.Parent and aX.Parent.Name:lower():find
'movingbeam')or aX.Name:lower():find'thirdboss'or(aX.Parent and aX.Parent.Name:
lower():find'thirdboss')then return false end if aF[aX.Name]or aF[aY]or aF[aZ]or
aI[aX.Name]then return true end if aZ:find('enhancedaura',1,true)or aZ:find(
'auraring',1,true)or aZ:find('groundaura',1,true)then return true end return
false end al.IsIgnoredPart=function(a_)return aZ(a_)end local a_,a0,a1,a2,a3,a4,
a5,a6=function(a_)local a0={}if not a_ or a_.Name:find'SmartDodge'or aZ(a_)then
return a0,false end local a1,a2=aG[a_.Name]or a_.Name:lower():find'multiring'or
a_.Name:lower():find'crisscross'or a_.Name:lower():find'seekingspike'or a_.Name:
lower():find'bigspike'or a_.Name:lower():find'beampart'or a_.Name:lower():find
'movingbeam'or a_.Name:lower():find'thirdboss',function(a1)if not a1 or not a1:
IsA'BasePart'or aZ(a1)then return false end local a2=a1.Name:lower():gsub('%s+',
'')if aY[a2]then return false end if a_.Name:lower():find'multiring'and not a2:
find'ring'then return false end if aP(a1)then return true end return a1.
Transparency<aH end if a1 then if a_:IsA'BasePart'then if a2(a_)then table.
insert(a0,a_)end elseif a_:IsA'Model'then local a3={}for a4,a5 in ipairs(a_:
GetDescendants())do if a2(a5)and a5.Name:lower():find'precast'then table.insert(
a3,a5)end end if#a3>0 then a0=a3 else for a4,a5 in ipairs(a_:GetDescendants())do
if a2(a5)then table.insert(a0,a5)end end if#a0==0 and a_.PrimaryPart and a_.
PrimaryPart:IsA'BasePart'then table.insert(a0,a_.PrimaryPart)end end end else if
a_:IsA'BasePart'then if a2(a_)and a_.Material==Enum.Material.Neon then table.
insert(a0,a_)end elseif a_:IsA'Model'then for a3,a4 in ipairs(a_:GetDescendants(
))do if a2(a4)and a4.Material==Enum.Material.Neon then table.insert(a0,a4)end
end end end return a0,a1 end,function(a_,a0)if a_:IsA'BasePart'then return a_.
Position elseif a_:IsA'Model'then if a_.PrimaryPart then return a_.PrimaryPart.
Position end local a1=a_:GetPivot()if a1 and a1.Position~=Vector3.zero then
return a1.Position end end if a0 and#a0>0 then return a0[1].Position end return
Vector3.zero end,function()for a_,a0 in ipairs(at)do pcall(a0,as,az)end end,
function(a_)local a0={}for a1,a2 in ipairs(a_)do if a2 and a2:IsA'BasePart'and
a2.Parent then local a3=Instance.new'SelectionBox'a3.Name=
'SmartDodge_SelectionBox'local a4=aJ[a2.Name:lower()]or(a2.Parent and aJ[a2.
Parent.Name:lower()])if a4 then a3.Color3=a4.color a3.SurfaceColor3=a4.
surfaceColor a3.SurfaceTransparency=0.5 a3.LineThickness=0.08 else a3.Color3=
Color3.fromRGB(255,45,45)a3.SurfaceColor3=Color3.fromRGB(255,30,30)a3.
SurfaceTransparency=0.6 a3.LineThickness=0.05 end a3.Adornee=a2 a3.Parent=a2
table.insert(a0,a3)end end return a0 end,function(a_)local a0=aw[a_]if a0 and a0
.avgLifetime then local a1=a0.avgHitDelay if not a1 then local a2=ax[a_]a1=(
type(a2)=='table'and a2.hitDelay)or(a0.avgLifetime*0.7)end return a0.avgLifetime
,a1 end local a1=ax[a_]if a1 then if type(a1)=='table'then return a1.
totalLifetime or 2,a1.hitDelay or 1.5 else return a1,a1*0.7 end end return 2.5,
1.8 end,function(a_,a0,a1)if not ap then return nil,nil end local a2=a0 and a0[1
]if not a2 or not a2:IsA'BasePart'then if a_:IsA'BasePart'then a2=a_ elseif a_:
IsA'Model'and a_.PrimaryPart then a2=a_.PrimaryPart else return nil,nil end end
local a3=Instance.new'BillboardGui'a3.Name='SmartDodge_TimerBillboard'a3.Adornee
=a2 a3.Size=UDim2.new(0,160,0,40)a3.StudsOffset=Vector3.new(0,4,0)a3.AlwaysOnTop
=true a3.ResetOnSpawn=false local a4=Instance.new'TextLabel'a4.Name='TimerLabel'
a4.Size=UDim2.new(1,0,1,0)a4.BackgroundTransparency=1 a4.Font=Enum.Font.
GothamBold a4.TextSize=13 a4.TextColor3=Color3.fromRGB(255,220,80)a4.Text=a1..
'\n\u{23f3} calculating...'local a5=Instance.new'UIStroke'a5.Color=Color3.
fromRGB(0,0,0)a5.Thickness=1.5 a5.Parent=a4 a4.Parent=a3 a3.Parent=a2 return a3,
a4 end,function(a_,a0)if not a_ then return nil,nil end local a1=a_:
FindFirstChild'creator'or a_:FindFirstChild'Creator'or a_:FindFirstChild'owner'
or a_:FindFirstChild'Owner'or a_:FindFirstChild'caster'or a_:FindFirstChild
'Caster'if a1 and a1:IsA'ObjectValue'and a1.Value and a1.Value:IsA'Model'then
local a2=a1.Value:FindFirstChildOfClass'Humanoid'if a2 and a2.Health>0 then
return a1.Value,a2 end end local a2=ab.GetTrackedEnemyData()if not a2 or#a2==0
then return nil,nil end if#a2==1 or ab.IsBossActive()then local a3=a2[1]if a3
and a3.Model and a3.Humanoid and a3.Humanoid.Health>0 then return a3.Model,a3.
Humanoid end end if a0 then local a3,a4,a5=1225 for a6,a7 in ipairs(a2)do if a7
and a7.Root and a7.Root.Parent then local a8=a7.Humanoid or(a7.Model and a7.
Model:FindFirstChildOfClass'Humanoid')if a8 and a8.Health>0 then local a9=(a7.
Root.Position-a0).Magnitude^2 if a9<a3 then a3=a9 a4=a7.Model a5=a8 end end end
end if a4 and a5 then return a4,a5 end end return nil,nil end local function a7(
a8)if not am or not a8 or ar[a8]then return end if a8:IsA'Folder'then return end
if a8:FindFirstChildOfClass'Humanoid'then return end if a8.Name:find'SmartDodge'
then return end if aI[a8.Name]or aF[a8.Name]then return end if ab.GetEnemyCount(
)==0 and not ab.IsBossActive()then return end local a9,b=a_(a8)if#a9==0 then if
a8:IsA'Model'then local ba ba=a8.DescendantAdded:Connect(function(bb)if bb:IsA
'BasePart'and bb.Transparency<aH then if b or bb.Material==Enum.Material.Neon
then if ba then ba:Disconnect()ba=nil end a7(a8)end end end)task.delay(1.5,
function()if ba then ba:Disconnect()ba=nil end end)elseif a8:IsA'BasePart'and a8
.Transparency<aH then local ba ba=a8:GetPropertyChangedSignal'Material':Connect(
function()if a8.Material==Enum.Material.Neon then if ba then ba:Disconnect()ba=
nil end a7(a8)end end)task.delay(1.5,function()if ba then ba:Disconnect()ba=nil
end end)end return end if aX(a8)then return end local ba=a0(a8,a9)local bb,bc=
a5(a8,ba)if bc and bc.Health<=0 then return end local bd=ak and ak.Character and
ak.Character:FindFirstChild'HumanoidRootPart'local be,bf,bg,bh,bi=bd and math.
floor((ba-bd.Position).Magnitude)or 0,{},{},{},{}for bj,bk in ipairs(a9)do bf[bk
]=true local bl=bk.Transparency bh[bk]=bl bi[bk]=(bl<=0.28)end local bj,bk,bl=ao
and a2(a9)or{}if ap then bk,bl=a4(a8,a9,a8.Name)end local bm={Instance=a8,Name=
a8.Name,Class=a8.ClassName,Position=ba,Distance=be,NeonCount=#a9,SpawnTime=os.
clock(),HitTime=nil,Connections=bg,ActiveParts=bf,VisualBoxes=bj,TimerBillboard=
bk,TimerLabel=bl,IsException=b,Caster=bb,CasterHumanoid=bc}ar[a8]=bm as=as+1 az=
bm if bb and bc then table.insert(bg,bc.Died:Connect(function()a6(a8,
'Caster Dead')end))table.insert(bg,bb.AncestryChanged:Connect(function(bn,bo)if
not bo then a6(a8,'Caster Removed')end end))end for bn,bo in ipairs(a8:
GetDescendants())do if bo:IsA'Sound'then table.insert(bg,bo.Played:Connect(
function()if not bm.HitTime then bm.HitTime=os.clock()end end))end end if a8:IsA
'Model'then table.insert(bg,a8.DescendantAdded:Connect(function(bn)if not bm.
HitTime and(bn:IsA'ParticleEmitter'or bn:IsA'Sound'or(bn:IsA'BasePart'and bn.
Name~='precast'))then bm.HitTime=os.clock()end end))end for bn,bo in ipairs(a9)
do if aP(bo)then aR(bo)end end local bn=function(bn)if not ar[a8]or not bf[bn]
then return end if bm.CasterHumanoid and(bm.CasterHumanoid.Health<=0 or not bm.
Caster or not bm.Caster.Parent)then a6(a8,'Caster Dead')return end local bo=bn.
Transparency local bp=bh[bn]or bo if bo<bp then bp=bo bh[bn]=bp end if bp<=0.28
then bi[bn]=true if not bm.HitTime then bm.HitTime=os.clock()end end local bq,br
,bs=bi[bn]and(bo>=(bp+0.18)or bo>=0.4),aP(bn)~=nil,false if not bn.Parent then
bs=true elseif br then if bo<aH then bi[bn]=true end if bi[bn]and(bo>=aH or bq)
then bs=true end else bs=bq or(bo>=aH)or(not b and bn.Material~=Enum.Material.
Neon)end if bs then bf[bn]=nil bh[bn]=nil bi[bn]=nil if aO[bn]then pcall(
function()aO[bn]:Destroy()end)aO[bn]=nil end if aN[bn]then aN[bn]=nil end local
bt=0 for bu in pairs(bf)do bt=bt+1 end if bt==0 then local bu=bq and
'Post-flash Decay (Early Hitbox Clearance)'or'Faded / Finished'a6(a8,bu)else bm.
NeonCount=bt end end end for bo,bp in ipairs(a9)do table.insert(bg,bp:
GetPropertyChangedSignal'Transparency':Connect(function()bn(bp)end))if not b
then table.insert(bg,bp:GetPropertyChangedSignal'Material':Connect(function()bn(
bp)end))end table.insert(bg,bp.AncestryChanged:Connect(function()bn(bp)end))end
if a8:IsA'Model'then table.insert(bg,a8.DescendantAdded:Connect(function(bo)if
not ar[a8]then return end local bp=bo:IsA'BasePart'and not aZ(bo)and bo.
Transparency<aH if bp then local bq=bo.Name:lower():gsub('%s+','')if not aY[bq]
then if b or bo.Material==Enum.Material.Neon then if not bf[bo]then bf[bo]=true
bm.NeonCount=bm.NeonCount+1 local br=bo.Transparency bh[bo]=br bi[bo]=(br<=0.28)
if aP(bo)then aR(bo)end if ao then local bs=a2{bo}if bs and#bs>0 then for bt,bu
in ipairs(bs)do table.insert(bm.VisualBoxes,bu)end end end table.insert(bg,bo:
GetPropertyChangedSignal'Transparency':Connect(function()bn(bo)end))table.
insert(bg,bo.AncestryChanged:Connect(function()bn(bo)end))end end end end end))
end if a8.Name:lower():find'multiring'then task.delay(0.3,function()if not a8 or
not a8.Parent then return end local bo=a8:FindFirstChild'center'or a8:
FindFirstChild'Center'or a8.PrimaryPart local bp=bo and bo.Position or Vector3.
zero print[[================ [MULTIRINGS INSPECTOR DUMP] ================]]
print(('[MultiRings] Model: %s | Center: (%.1f, %.1f, %.1f)'):format(a8.Name,bp.
X,bp.Y,bp.Z))local bq=0 for br,bs in ipairs(a8:GetDescendants())do if bs:IsA
'BasePart'then bq=bq+1 local bt,bu,bv=bs.Position-bp,bs.CFrame:ToOrientation()
print((
[[[%d] Name: '%s' | Class: %s | Size: (%.1f, %.1f, %.1f) | Offset: (%.1f, %.1f, %.1f) | RotY: %.1f deg]]
):format(bq,bs.Name,bs.ClassName,bs.Size.X,bs.Size.Y,bs.Size.Z,bt.X,bt.Y,bt.Z,
math.deg(bv)))end end print
[[=============================================================]]end)end if an
then print((
'[SmartDodge][Hazard] \u{1f6a8} Hazard Detected: %s | Class: %s | Parts: %d | Dist: %d studs%s'
):format(bm.Name,bm.Class,bm.NeonCount,bm.Distance,b and' (Exception)'or''))end
a1()end function a6(a8,a9)if not ar[a8]then return end local b=ar[a8]if b.
VisualBoxes then for ba,bb in ipairs(b.VisualBoxes)do pcall(function()bb:
Destroy()end)end table.clear(b.VisualBoxes)end if b.Connections then for ba,bb
in ipairs(b.Connections)do pcall(function()bb:Disconnect()end)end table.clear(b.
Connections)end if b.ActiveParts then for ba in pairs(b.ActiveParts)do if aO[ba]
then pcall(function()aO[ba]:Destroy()end)aO[ba]=nil end if aN[ba]then aN[ba]=nil
end end end if b.TimerBillboard then pcall(function()b.TimerBillboard:Destroy()
end)b.TimerBillboard=nil b.TimerLabel=nil end if aq and b.SpawnTime then local
ba,bb=os.clock()-b.SpawnTime,b.HitTime and(b.HitTime-b.SpawnTime)or nil if not
bb or bb<0.1 or bb>ba then local bc,bd=a3(b.Name)bb=math.min(bd,ba*0.75)end if
ba>=0.2 and ba<=25 then local bc=aw[b.Name]if not bc then bc={count=1,
avgLifetime=ba,avgHitDelay=bb,minLifetime=ba,maxLifetime=ba}aw[b.Name]=bc else
bc.count=bc.count+1 local bd=math.min(bc.count,8)bc.avgLifetime=bc.avgLifetime+(
ba-bc.avgLifetime)/bd bc.avgHitDelay=(bc.avgHitDelay or bb)+(bb-(bc.avgHitDelay
or bb))/bd bc.minLifetime=math.min(bc.minLifetime,ba)bc.maxLifetime=math.max(bc.
maxLifetime,ba)end aE()end end ar[a8]=nil as=math.max(0,as-1)if an and b then
local ba=a9 and(' ('..a9..')')or''print((
'[SmartDodge][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(b.Name,ba))end a1(
)end al.RegisterHazard=a7 al.UnregisterHazard=a6 function al.
UpdateTrajectoryVisuals()if not ao or not am then for a8,a9 in pairs(aO)do
pcall(function()a9:Destroy()end)end table.clear(aO)return end local a8={}for a9,
b in pairs(ar)do local ba=b.Instance if ba and ba.Parent then local bb=(ba.Name
or''):lower():gsub('%s+','')local bc=ba:IsA'Model'and(bb:find'movingbeam'~=nil
or(b.Name and b.Name:lower():find'movingbeam'~=nil))if bc then a8[ba]=true local
bd,be=ba:GetBoundingBox()local bf=ba.PrimaryPart or ba:FindFirstChildWhichIsA
'BasePart'local bg,bh=(bf and bf.Position)or bd.Position,aN[ba]if not bh then
local bi=(bf and bf.CFrame.RightVector)or bd.RightVector local bj=Vector3.new(bi
.X,0,bi.Z)if bj.Magnitude>0.01 then bj=bj.Unit else bj=Vector3.new(1,0,0)end
local bk,bl=Vector3.new(-bj.Z,0,bj.X),(bf and bf.CFrame.LookVector)or bd.
LookVector local bm=Vector3.new(bl.X,0,bl.Z)if bm.Magnitude>0.01 and bk:Dot(bm.
Unit)<0 then bk=-bk end bh={instance=ba,lastPos=bg,forward2D=bk,isDynamicMoving=
true,config=aK.secondbossmovingbeam}aN[ba]=bh end local bi=bg-bh.lastPos local
bj=Vector3.new(bi.X,0,bi.Z)if bj.Magnitude>0.08 then bh.forward2D=bj.Unit end bh
.lastPos=bg local bk=math.max(be.X,be.Y,be.Z)if bk<12 then bk=50 end local bl,bm
=bk+aM*2,(bh.config and bh.config.maxLookahead)or aL local bn,bo=bm,bh.forward2D
bh.dangerRadius=bl/2 bh.maxLookahead=bn local bp,bq=af().GetRawFloorY(bg)local
br=0.8 local bs=(bq and(bp+br/2+0.05))or(bg.Y-2.5)bh.lockedVisualY=bs local bt=
aO[ba]if not bt or not bt.Parent then bt=Instance.new'Part'bt.Name=
'SmartDodge_TrajectoryBox'bt.Material=Enum.Material.Neon bt.Color=Color3.
fromRGB(255,130,0)bt.Transparency=0.82 bt.Anchored=true bt.CanCollide=false bt.
CanQuery=false bt.CanTouch=false local bu=Instance.new'SelectionBox'bu.Name=
'TrajectoryBorder'bu.Color3=Color3.fromRGB(255,150,30)bu.SurfaceColor3=Color3.
fromRGB(255,130,0)bu.SurfaceTransparency=0.8 bu.LineThickness=0.04 bu.Adornee=bt
bu.Parent=bt local bv=Instance.new'BillboardGui'bv.Name='TrajGui'bv.Size=UDim2.
fromOffset(220,26)bv.StudsOffset=Vector3.new(0,2.5,0)bv.AlwaysOnTop=true bv.
Adornee=bt bv.Parent=bt local bw=Instance.new'TextLabel'bw.Name='Label'bw.Size=
UDim2.fromScale(1,1)bw.BackgroundTransparency=1 bw.TextColor3=Color3.fromRGB(255
,170,40)bw.TextStrokeTransparency=0 bw.TextStrokeColor3=Color3.fromRGB(0,0,0)bw.
Font=Enum.Font.GothamBold bw.TextSize=12 bw.Text=(
'\u{1f680} MOVING BEAM: %s (%.0fm | W:%.1fm)'):format(ba.Name,bn,bl)bw.Parent=bv
aO[ba]=bt else local bu=bt:FindFirstChild'TrajGui'local bv=bu and bu:
FindFirstChild'Label'if bv and bv:IsA'TextLabel'then bv.Text=(
'\u{1f680} MOVING BEAM: %s (%.0fm | W:%.1fm)'):format(ba.Name,bn,bl)end end bt.
Size=Vector3.new(bl,br,bn)local bu=Vector3.new(bg.X,bs,bg.Z)+bo*((bn/2)-1.5)bt.
CFrame=CFrame.lookAt(bu,bu+bo)bt.Parent=ah.Terrain else if b.ActiveParts then
for bd in pairs(b.ActiveParts)do if bd and bd.Parent and bd:IsA'BasePart'then
local be=aP(bd)if be then local bf,bg=bd.Name:lower():find'beampart'~=nil,false
if bf then for bh in pairs(a8)do if bh~=bd and bh:IsA'BasePart'and(bh.Position-
bd.Position).Magnitude<4 then bg=true break end end end if not bg then local bh=
aN[bd]or aR(bd)if bh and bh.forward2D then a8[bd]=true local bi,bj=aQ(bd)local
bk=bi/2 if bh.config.dangerRadius and bh.config.dangerRadius>bk then bk=bh.
config.dangerRadius end local bl,bm=bk+aM,bj or bh.config.maxLookahead or bh.
maxLookahead or aL bh.dangerRadius=bl bh.maxLookahead=bm local bn,bo=bh.
forward2D,bd.Position local bp,bq,br,bs,bt=bo+bn*(bm/2),bh.lockedVisualY or(bh.
rawFloorY and(bh.rawFloorY+0.45))or bo.Y,bh.boxThickness or 0.8,bm,bl*2 local bu
,bv=('\u{1f680} TRAJECTORY: %s (%.0fm | W:%.1fm)'):format(bd.Name,bm,bt),aO[bd]
if not bv or not bv.Parent then bv=Instance.new'Part'bv.Name=
'SmartDodge_TrajectoryBox'bv.Material=Enum.Material.Neon bv.Color=be.visualColor
or Color3.fromRGB(255,130,0)bv.Transparency=0.82 bv.Anchored=true bv.CanCollide=
false bv.CanQuery=false bv.CanTouch=false local bw=Instance.new'SelectionBox'bw.
Name='TrajectoryBorder'bw.Color3=Color3.fromRGB(255,150,30)bw.SurfaceColor3=be.
visualColor or Color3.fromRGB(255,130,0)bw.SurfaceTransparency=0.8 bw.
LineThickness=0.04 bw.Adornee=bv bw.Parent=bv local bx=Instance.new
'BillboardGui'bx.Name='TrajGui'bx.Size=UDim2.fromOffset(200,26)bx.StudsOffset=
Vector3.new(0,2.5,0)bx.AlwaysOnTop=true bx.Adornee=bv bx.Parent=bv local by=
Instance.new'TextLabel'by.Name='Label'by.Size=UDim2.fromScale(1,1)by.
BackgroundTransparency=1 by.TextColor3=Color3.fromRGB(255,170,40)by.
TextStrokeTransparency=0 by.TextStrokeColor3=Color3.fromRGB(0,0,0)by.Font=Enum.
Font.GothamBold by.TextSize=12 by.Text=bu by.Parent=bx aO[bd]=bv else local bw=
bv:FindFirstChild'TrajGui'local bx=bw and bw:FindFirstChild'Label'if bx and bx:
IsA'TextLabel'then bx.Text=bu end end bv.Size=Vector3.new(bt,br,bs)local bw=
Vector3.new(bp.X,bq,bp.Z)bv.CFrame=CFrame.lookAt(bw,bw+bn)bv.Parent=ah.Terrain
end end end end end end end end end for a9,b in pairs(aO)do if not a8[a9]then
pcall(function()b:Destroy()end)aO[a9]=nil aN[a9]=nil end end end function al.
ClearTrajectoryVisuals()for a8,a9 in pairs(aO)do pcall(function()a9:Destroy()end
)end table.clear(aO)end function al.ClearAllHazards(a8)local a9={}for b in
pairs(ar)do table.insert(a9,b)end for b,ba in ipairs(a9)do a6(ba,a8 or'Purged')
end table.clear(ar)as=0 al.ClearTrajectoryVisuals()a1()if an and a8 then print((
'[SmartDodge][Hazard] \u{1f9f9} All hazards cleared: %s'):format(a8))end end
function al.StartScan()for a8,a9 in ipairs(au)do a9:Disconnect()end table.clear(
au)for a8,a9 in ipairs(av)do pcall(a9)end table.clear(av)al.ClearAllHazards
'StartScan Reset'for a8,a9 in ipairs(ah:GetChildren())do a7(a9)end table.insert(
au,ah.ChildAdded:Connect(function(a8)a7(a8)end))table.insert(au,ah.ChildRemoved:
Connect(function(a8)a6(a8,'Destroyed')end))local a8=ab.OnBossActiveChanged(
function(a8)if not a8 then al.ClearAllHazards'Boss Defeated'end end)table.
insert(av,a8)local a9=ab.OnEnemyChanged(function()local a9=ab.GetEnemyCount()if
a9==0 and not ab.IsBossActive()then al.ClearAllHazards'Room Cleared'else for b,
ba in pairs(ar)do if ba.CasterHumanoid and(ba.CasterHumanoid.Health<=0 or not ba
.Caster or not ba.Caster.Parent)then task.spawn(function()a6(b,'Caster Dead')end
)end end end end)table.insert(av,a9)if an then print
'[SmartDodge] \u{1f4e1} Threat Detector & Safe Spot Engine started!'end end
function al.StopScan()for a8,a9 in ipairs(au)do a9:Disconnect()end table.clear(
au)for a8,a9 in ipairs(av)do pcall(a9)end table.clear(av)al.ClearAllHazards
'StopScan'if an then print'[SmartDodge] \u{1f6d1} Threat Detector stopped.'end
end function al.SetLogHazards(a8)an=a8 and true or false end function al.
IsLogHazardsEnabled()return an end function al.SetVisualEsp(a8)ao=a8 and true or
false al.UpdateTrajectoryVisuals()if ao then for a9,b in pairs(ar)do if(not b.
VisualBoxes or#b.VisualBoxes==0)and b.ActiveParts then local ba={}for bb in
pairs(b.ActiveParts)do table.insert(ba,bb)end b.VisualBoxes=a2(ba)end end else
for a9,b in pairs(ar)do if b.VisualBoxes then for ba,bb in ipairs(b.VisualBoxes)
do pcall(function()bb:Destroy()end)end table.clear(b.VisualBoxes)end end end end
function al.IsVisualEspEnabled()return ao end function al.GetHazardCount()return
as end function al.GetActiveHazards()local a8={}for a9,b in pairs(ar)do if b.
Instance and b.Instance.Parent==ah then table.insert(a8,b)end end return a8 end
function al.GetLastHazardInfo()return az end function al.OnHazardChanged(a8)if
type(a8)~='function'then return end table.insert(at,a8)end function al.
GetActiveBossOrb()for a8,a9 in pairs(ar)do if a8 and a8.Parent then local b=aJ[
a8.Name:lower()]if b then local ba=a8:IsA'BasePart'and a8 or nil if not ba and
a9.ActiveParts then for bb in pairs(a9.ActiveParts)do if bb and bb.Parent then
ba=bb break end end end if not ba then ba=a8:FindFirstChildWhichIsA'BasePart'end
if ba and ba.Parent then return ba,b.colorName,a8,b end end end end return nil,
nil,nil,nil end function al.GetHazardTimeRemaining(a8)local a9=ar[a8]if not a9
or not a9.SpawnTime then return nil,nil,0,nil,nil end local b,ba,bb=os.clock()-
a9.SpawnTime,a3(a9.Name)local bc,bd=math.max(0,ba-b),math.max(0,bb-b)return bc,
ba,b,bd,bb end function al.GetSkillProfile(a8)return aw[a8]end function al.
GetAllSkillProfiles()return aw end function al.UpdateHazardTimers()if not ap
then return end local a8=os.clock()for a9,b in pairs(ar)do if b.TimerLabel and b
.SpawnTime then local ba,bb,bc=a8-b.SpawnTime,a3(b.Name)local bd,be,bf,bg=math.
max(0,bb-ba),(math.max(0,bc-ba))if be>0 then if be<=0.4 then bf=Color3.fromRGB(
255,60,60)elseif be<=1 then bf=Color3.fromRGB(255,160,0)else bf=Color3.fromRGB(
255,230,80)end bg=string.format('%s\n\u{1f4a5} HIT IN: %.1fs (\u{23f3} %.1fs)',b
.Name,be,bd)else bf=Color3.fromRGB(80,255,120)bg=string.format(
'%s\n\u{2705} DETONATED! (\u{23f3} %.1fs)',b.Name,bd)end b.TimerLabel.TextColor3
=bf b.TimerLabel.Text=bg end end end function al.SetShowSkillTimers(a8)ap=a8 and
true or false if not ap then for a9,b in pairs(ar)do if b.TimerBillboard then
pcall(function()b.TimerBillboard:Destroy()end)b.TimerBillboard=nil b.TimerLabel=
nil end end else for a9,b in pairs(ar)do if not b.TimerBillboard and b.
ActiveParts then local ba={}for bb in pairs(b.ActiveParts)do table.insert(ba,bb)
end b.TimerBillboard,b.TimerLabel=a4(a9,ba,b.Name)end end end end function al.
IsShowSkillTimersEnabled()return ap end function al.SetAutoLearnSkillLifetimes(
a8)aq=a8 and true or false end function al.IsAutoLearnSkillLifetimesEnabled()
return aq end al.SaveSkillProfiles=aD al.LoadSkillProfiles=aB return al end
function a.m()local aa,ab,ac,ad=game:GetService'PathfindingService',{},{
AgentRadius=1,AgentHeight=5,AgentCanJump=true,AgentCanClimb=true,AgentMaxSlope=
75,WaypointSpacing=4,Costs={Water=20,Lava=20}},{AgentRadius=0.25,AgentHeight=4,
AgentCanJump=true,AgentCanClimb=true,AgentMaxSlope=90,WaypointSpacing=6,Costs={}
}function ab.ComputePathWithCost(ae,af)for ag,ah in ipairs{ac,ad}do local ai=aa:
CreatePath(ah)local aj=pcall(function()ai:ComputeAsync(ae,af)end)if aj and ai.
Status==Enum.PathStatus.Success then local ak=ai:GetWaypoints()if ak and#ak>0
then local al,am=0,ae for an=1,#ak do local ao=ak[an].Position al+=(ao-am).
Magnitude am=ao end return ai,ak,al end end pcall(function()ai:Destroy()end)end
return nil,nil,math.huge end function ab.SelectBestTarget(ae,af,ag)local ah,ai,
aj,ak,al=(math.huge)for am,an in ipairs(af)do if ag and ag()then if aj then
pcall(function()aj:Destroy()end)end return nil,nil,nil,nil,math.huge end local
ao=an.Root if ao and ao.Parent then local ap=ao.Position local aq,ar,as=ab.
ComputePathWithCost(ae,ap)if ag and ag()then if aq then pcall(function()aq:
Destroy()end)end if aj then pcall(function()aj:Destroy()end)end return nil,nil,
nil,nil,math.huge end if aq and as<ah then if aj then pcall(function()aj:
Destroy()end)end ah=as ai=an aj=aq ak=ar al=ap else if aq then pcall(function()
aq:Destroy()end)end end end end return ai,aj,ak,al,ah end return ab end function
a.n()local aa,ab=a.load'e',a.load'f'local ac,ad=aa.player,{}function ad.Validate
(ae)if not ae then return false end local af=ae.Model if not af or not af.Parent
or af==ac.Character then return false end local ag=ae.Humanoid if not ag or not
ag.Parent then ag=af:FindFirstChildOfClass'Humanoid'ae.Humanoid=ag end if not ag
or ag.Health<=0 then return false end local ah=ae.Root if not ah or not ah.
Parent then ah=af:FindFirstChild'HumanoidRootPart'or af.PrimaryPart if not ah
then for ai,aj in ipairs(af:GetDescendants())do if aj:IsA'BasePart'then ah=aj
break end end end if not ah then return false end ae.Root=ah end return true end
function ad.Scan()local ae,af={},ab.GetTrackedEnemyData()for ag,ah in ipairs(af)
do if ad.Validate(ah)then table.insert(ae,ah)end end return ae end return ad end
function a.o()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'm',a.load'n',{},{},1,6
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
true end return false end return ac end function a.p()local aa,ab,ac,ad=a.load
'e',a.load'f',a.load'b',a.load'o'local ae,af,ag,ah,ai=aa.player,false,false,{}
function ah.SetDodging(aj)ag=aj and true or false end local aj,ak=function()
local aj=ae and ae.Character local ak=aj and aj:FindFirstChild'HumanoidRootPart'
if ak and ak.Parent then return ak end return nil end,function()local aj=ae and
ae.Character local ak=aj and aj:FindFirstChildOfClass'Humanoid'if ak and ak.
Parent then return ak end return nil end local al=function()local al=ak()if al
then if af and ah.IsTargetActive()then al.AutoRotate=false else al.AutoRotate=
true end end end function ah.GetTargetPosition()local am=ad.GetTarget()if am and
am.Root and am.Root.Parent then local an=am.Humanoid or(am.Model and am.Model:
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
function()an()end)return ah end function a.q()local aa,ab,ac,ad,ae,af=a.load'e',
a.load'f',a.load'k',a.load'l',a.load'p',game:GetService'Workspace'local ag,ah,ai
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
,{}end local aQ=aP:FindFirstChild(aO)if aQ and not aQ:IsA'BasePart'then aQ=aQ:
FindFirstChildWhichIsA'BasePart'end local aR={}for aS,aT in ipairs(aP:
GetChildren())do if aT.Name:lower()~=aO:lower()then local aU=aT:IsA'BasePart'and
aT or aT:FindFirstChildWhichIsA'BasePart'if aU then table.insert(aR,aU)end end
end return aQ,aR end local aQ,aR,aS=function()if aP and aP.Parent then return aP
end local aQ=af:FindFirstChild'FirstPart'if not aQ then local aR=af:
FindFirstChild'dungeon'if aR then aQ=aR:FindFirstChild('FirstPart',true)end end
if not aQ then aQ=af:FindFirstChild('FirstPart',true)end if aQ and aQ:IsA
'BasePart'then aP=aQ return aQ end return nil end,function()if aA then pcall(
function()aA:Destroy()end)aA=nil end aP=nil aB=nil end,function(aQ,aR,aS)if aB
then return aB end local aT if aR then local aU,aV=ac.GetRawFloorY(aR)if aV and
aU then aT=aU+0.1 end end if not aT and aS then aT=aS.Position.Y-(aS.Size.Y/2)+
0.1 end if not aT and aQ then local aU,aV=ac.GetRawFloorY(aQ)if aV and aU then
aT=aU+0.1 end end if aT then aB=aT end return aB or(aR and(aR.Y-2.8))or(aQ and(
aQ.Y-2.8))or 0 end local aT,aU,aV=function(aT,aU,aV)if not aT then aR()return
end local aW,aX=aS(aT,aU,aV),aq or am local aY,aZ=(aV and aV.Size.X)or(aX*2),
CFrame.new(aT.X,aW,aT.Z)*CFrame.Angles(0,0,math.rad(90))if aA and aA.Parent then
if math.abs(aA.Size.Y-aY)>0.5 then aA.Size=Vector3.new(0.2,aY,aY)end return end
pcall(function()local a_=Instance.new'Part'a_.Name='SmartDodge_Boss1ArenaVisual'
a_.Shape=Enum.PartType.Cylinder a_.Size=Vector3.new(0.2,aY,aY)a_.Color=Color3.
fromRGB(0,220,255)a_.Material=Enum.Material.Neon a_.Transparency=0.88 a_.
Anchored=true a_.CanCollide=false a_.CanTouch=false a_.CanQuery=false local a0=
Instance.new'Highlight'a0.Name='ArenaOutline'a0.FillColor=Color3.fromRGB(0,180,
255)a0.FillTransparency=0.92 a0.OutlineColor=Color3.fromRGB(0,240,255)a0.
OutlineTransparency=0.1 a0.Adornee=a_ a0.Parent=a_ local a1=Instance.new
'BillboardGui'a1.Name='ArenaLabel'a1.Size=UDim2.fromOffset(180,26)a1.StudsOffset
=Vector3.new(0,3,0)a1.AlwaysOnTop=true a1.Adornee=a_ a1.Parent=a_ local a2=
Instance.new'TextLabel'a2.Name='Label'a2.Size=UDim2.fromScale(1,1)a2.
BackgroundTransparency=1 a2.TextColor3=Color3.fromRGB(0,230,255)a2.
TextStrokeTransparency=0.2 a2.TextStrokeColor3=Color3.fromRGB(0,0,0)a2.Font=Enum
.Font.GothamBold a2.TextSize=13 a2.Text='BOSS 1 ARENA (Safe Zone)'a2.Parent=a1
a_.CFrame=aZ a_.Parent=af.Terrain aA=a_ end)end,function(aT,aU)if not az then
return true end local aV,aW=Vector3.new(aT.X,0,aT.Z),Vector3.new(az.X,0,az.Z)
local aX,aY=(aV-aW).Magnitude,aq or am local aZ=aY if aU then local a_=Vector3.
new(aU.X,0,aU.Z)aZ=(a_-aW).Magnitude end local a_=math.max(aY,aZ-0.5)return aX<=
a_ end,function(aT,aU)if not az or not aU then return 0 end local aV=Vector3.
new(az.X,0,az.Z)local aW,aX,aY=(Vector3.new(aU.X,0,aU.Z)-aV).Magnitude,(Vector3.
new(aT.X,0,aT.Z)-aV).Magnitude,aq or am local aZ=aY*0.7 if aW>aZ then if aX<aW-
0.5 then return-2 elseif aX>aW+0.5 then return 3 end end return 0 end ab.
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
in pairs(ba)do local be if bd.Instance and bd.Instance.Parent then if bd.
Instance:IsA'Model'and bd.Instance.PrimaryPart then be=bd.Instance.PrimaryPart.
Position elseif bd.Instance:IsA'BasePart'then be=bd.Instance.Position end end if
not be and bd.ActiveParts then for bf in pairs(bd.ActiveParts)do if bf and bf.
Parent and bf:IsA'BasePart'then be=bf.Position break end end end be=be or bd.
Position if be then local bf,bg=a7.X-be.X,a7.Z-be.Z local bh=bf*bf+bg*bg if bh<
1600 and bh>0.01 then local bi=math.sqrt(bh)local bj=1/math.max(1,bi)a9=a9+(bf/
bi)*bj b=b+(bg/bi)*bj bb=bb+1 end end end local bc=a9*a9+b*b if bb>0 and bc>
0.001 then local bd=math.sqrt(bc)return Vector3.new(a9/bd,0,b/bd)end end if ae
then local bb=ae.GetTargetPosition()if bb then local bc,bd=a7.X-bb.X,a7.Z-bb.Z
local be=bc*bc+bd*bd if be>0.01 then local bf=math.sqrt(be)return Vector3.new(bc
/bf,0,bd/bf)end end end return nil end,function(a7,a8)local a9=0 if a8 then a9=
math.deg(math.atan2(a8.Z,a8.X))elseif a7 then a9=math.deg(math.atan2(a7.Z,a7.X))
end local b=table.create(12)for ba,bb in ipairs(as)do b[ba]=(a9+bb)%360 end
return b end,{Vector3.new(2.5,0,0),Vector3.new(-2.5,0,0),Vector3.new(0,0,2.5),
Vector3.new(0,0,-2.5)}local ba=function(ba)local bb=0 for bc,bd in ipairs(b)do
if not ac.IsPointInAnyHazard(ba+bd)then bb=bb+1 end end return bb*0.75 end local
bb=function(bb,bc,bd,be)if az and not aU(bc,bb)then return math.huge end local
bf,bg=(bc-bb).Magnitude,ba(bc)local bh=(bf*2)-(bg*0.35)if bf>12 then bh=bh+((bf-
12)*3.5)end local bi=ae and ae.GetTargetPosition and ae.GetTargetPosition()if bi
and bf>0.3 then local bj=Vector3.new(bi.X-bb.X,0,bi.Z-bb.Z)if bj.Magnitude>1
then local bk=bj.Unit local bl,bm=Vector3.new(-bk.Z,0,bk.X),Vector3.new(bc.X-bb.
X,0,bc.Z-bb.Z)local bn,bo=bm:Dot(bk),math.abs(bm.Unit:Dot(bl))if bo>=0.82 and
math.abs(bn)<=2.2 then bh=bh-6 end if bn<-2 then bh=bh+(math.abs(bn)*1.8)end if
bn>2.5 then bh=bh+(bn*1.2)end end end if bf>0.5 then local bj=(bc-bb).Unit if be
then local bk=bj:Dot(be)if bk>0 then bh=bh-(bk*3.5)else bh=bh+(math.abs(bk)*2)
end elseif bd and not bi then local bk=bj:Dot(bd)bh=bh-(bk*2)end end if az then
bh=bh+aV(bc,bb)end return bh end local bc=function(bc,bd,be,bf,bg)local bh,bi,bj
,bk,bl=a9(bd,bg),math.huge,(math.huge)for bm,bn in ipairs(ar)do local bo,bp=(
math.huge)for bq,br in ipairs(bh)do local bs=math.rad(br)local bt=Vector3.new(
math.cos(bs)*bn,0,math.sin(bs)*bn)local bu=bc+bt if ac.IsSpotFullySafe(bu,0.5)
then local bv=bb(bc,bu,bd,bg)if bv<bj then bj=bv bl=bu end if ac.IsPathSafe(bc,
bu,be,bf)then if bv<bo then bo=bv bp=bu end end end end if bp then bk=bp bi=bo
break end end local bm,bn=bk or bl,bk and bi or bj if bm then local bo,bp=ac.
GetFloorPosition(bm)local bq=bp and bo or bm return bq,bn end return nil,math.
huge end function ay.CalculateSafeSpot(bd)local be,bf=ag and ag.Character and ag
.Character:FindFirstChild'HumanoidRootPart',ag and ag.Character and ag.Character
:FindFirstChildOfClass'Humanoid'local bg=bd or(be and be.Position)if not bg then
an=nil aj=0 aL()return false,nil,nil,0 end local bh=ab.IsBossActive()and ab.
GetCurrentBossIndex()==1 if bh then local bi=aQ()if bi then local bj=bi.Position
local bk=aS(bj,bg,bi)az=Vector3.new(bj.X,bk,bj.Z)local bl=math.max(bi.Size.X,bi.
Size.Z)/2 aq=math.max(20,bl-2.5)aT(az,bg,bi)elseif not az then local bj=ae.
GetTargetPosition()if not bj then local bk=ab.GetTrackedEnemyData()if bk and#bk>
0 and bk[1].Root and bk[1].Root.Parent then bj=bk[1].Root.Position end end if bj
then local bk=aS(bj,bg,nil)az=Vector3.new(bj.X,bk,bj.Z)aq=am aT(az,bg,nil)end
elseif az then aT(az,bg,nil)end else if az then az=nil aq=am aR()end end if ab.
GetEnemyCount()==0 and not ab.IsBossActive()then an=nil aj=0 aL()return false,
nil,nil,0 end if not ab.IsBossActive()then local bi,bj=ab.GetTrackedEnemyData(),
false if bi and#bi>0 then for bk,bl in ipairs(bi)do if bl and bl.Root and bl.
Root.Parent then local bm=bl.Humanoid or(bl.Model and bl.Model:
FindFirstChildOfClass'Humanoid')if bm and bm.Health>0 then if(bl.Root.Position-
bg).Magnitude<=85 then bj=true break end end end end end if not bj then an=nil
aj=0 aL()return false,nil,nil,0 end end local bi,bj=ad.GetActiveBossOrb()if bi
and bj then local bk=aO(bj)if bk then aM(bk,bj)end else aL()end local bk,bl,bm,
bn=ac.IsPointInAnyHazard(bg,bi)if not bk or not bm then if bi and bj then local
bo,bp=aO(bj)if bo then local bq,br=false,ad.GetActiveHazards and ad.
GetActiveHazards()if br and#br>0 then for bs,bt in ipairs(br)do local bu=bt.
Instance if bu and bu~=bi and bu~=(bi and bi.Parent)then if not ac.
IsSpotFullySafe(bg,4.5,bi)then bq=true break end end end end if bq then an=bg aj
=1 return true,bg,('Waiting for nearby AoE to explode before leading %s'):
format(bj:upper()),0 end local bs,bt=bi.Position,bo.Position local bu=Vector3.
new(bt.X-bs.X,0,bt.Z-bs.Z)if bu.Magnitude>0.5 then bu=bu.Unit else bu=Vector3.
new(0,0,1)end local bv,bw=bt+bu*3.8,Vector3.new(bt.X-bg.X,0,bt.Z-bg.Z)local bx,
by=bw.Magnitude,Vector3.new(bs.X-bg.X,0,bs.Z-bg.Z)local bz,bA=by.Magnitude,bv if
bx>8 and bz<bx and bz<25 then local bB,bC=bw.Unit,by.Unit local bD=bB:Dot(bC)if
bD>0.75 then local bE=Vector3.new(-bB.Z,0,bB.X)local bF,bG=bg+(bB*0.6+bE*0.8).
Unit*12,bg+(bB*0.6-bE*0.8).Unit*12 if(bF-bs).Magnitude>(bG-bs).Magnitude then bA
=bF else bA=bG end end end for bB,bC in ipairs(bp)do local bD=bC.Position local
bE=Vector3.new(bA.X-bD.X,0,bA.Z-bD.Z)if bE.Magnitude<10 and bE.Magnitude>0.1
then bA=bA+bE.Unit*(10-bE.Magnitude)end end local bB,bC=ac.GetFloorPosition(bA)
local bD=bC and bB or bA if not ac.IsSpotFullySafe(bD,0.5,bi)then local bE={30,-
30,45,-45,60,-60,90,-90,120,-120}for bF,bG in ipairs(bE)do local bH=math.rad(bG)
local bI,bJ=math.cos(bH),math.sin(bH)local bK=Vector3.new(bu.X*bI-bu.Z*bJ,0,bu.X
*bJ+bu.Z*bI)local bL=bt+bK*4 if ac.IsSpotFullySafe(bL,0.5,bi)then local bM,bN=ac
.GetFloorPosition(bL)bD=bN and bM or bL break end end end local bE=ac.
IsPathSafe(bg,bD,nil,nil,bi)if not bE then local bF=Vector3.new(bD.X-bg.X,0,bD.Z
-bg.Z)local bG=bF.Magnitude local bH=bG>1 and bF.Unit or Vector3.new(0,0,1)local
bI,bJ,bK,bL=Vector3.new(-bH.Z,0,bH.X),{},{6,10,15,20},{8,-8,12,-12,16,-16,20,-20
}for bM,bN in ipairs(bK)do if bN<bG then for bO,bP in ipairs(bL)do local bQ=bg+
bH*bN+bI*bP table.insert(bJ,bQ)end end end local bM,bN=(math.huge)for bO,bP in
ipairs(bJ)do if ac.IsSpotFullySafe(bP,0.5,bi)then if ac.IsPathSafe(bg,bP,nil,nil
,bi)then local bQ=true for bR,bS in ipairs(bp)do if(bP-bS.Position).Magnitude<10
then bQ=false break end end if bQ then local bR=(bP-bD).Magnitude if bR<bM then
bM=bR bN=bP end end end end end if bN then local bO,bP=ac.GetFloorPosition(bN)
local bQ=bP and bO or bN an=bQ aj=1 return true,bQ,(
'Detour around skill -> %s Crystal'):format(bj:upper()),(bQ-bg).Magnitude else
an=bg aj=1 return true,bg,('Waiting for path to clear -> %s Crystal'):format(bj:
upper()),0 end end local bF=(bD-bg).Magnitude an=bD aj=1 return true,bD,(
'Lead %s -> %s Crystal'):format(bi.Name,bj:upper()),bF end end an=nil aj=0 aL()
return false,nil,nil,0 end local bo,bp=bl.Name or'Unknown'if bf and bf.
MoveDirection.Magnitude>0.1 then bp=Vector3.new(bf.MoveDirection.X,0,bf.
MoveDirection.Z).Unit elseif be then local bq=be.AssemblyLinearVelocity local br
=Vector3.new(bq.X,0,bq.Z)if br.Magnitude>1.5 then bp=br.Unit end end local bq,br
=ac.GetAllHazardsAtPoint(bg)aH=bm aI=bq local bs,bt=false,math.huge if an and ac
.IsSpotFullySafe(an,0.5)then local bu=not(az and not aU(an,bg))if bu then bt=(an
-bg).Magnitude if bt<=45 and ac.IsPathSafe(bg,an,bq,bm)then bs=true if bt<=3.5
then local bv=math.floor(bt*10)/10 return true,an,bo,bv end end end end if not
bs then an=nil aj=br end local bu,bv,bw=bo:lower():find'multiring'~=nil or(bl.
Instance and bl.Instance.Name:lower():find'multiring'~=nil),(a8(bg,bm))if bu
then local bx,by,bz,bA,bB,bC=ac.IsPointInRingPart(bg,bm)local bD={}if bx and bB
and by and by>0.1 then local bE,bF=bg.X-bB.X,bg.Z-bB.Z local bG,bH=bE/by,bF/by
if bz and bz>2 then local bI=Vector3.new(bB.X+bG*(bz-2.5),bg.Y,bB.Z+bH*(bz-2.5))
table.insert(bD,bI)end if bA then local bI=Vector3.new(bB.X+bG*(bA+2.5),bg.Y,bB.
Z+bH*(bA+2.5))table.insert(bD,bI)end local bI=Vector3.new(bB.X-bE,bg.Y,bB.Z-bF)
table.insert(bD,bI)end local bE,bF={3.5,7,12,18,26,35},{0,45,90,135,180,225,270,
315}for bG,bH in ipairs(bE)do for bI,bJ in ipairs(bF)do local bK=math.rad(bJ)
local bL=Vector3.new(math.cos(bK)*bH,0,math.sin(bK)*bH)table.insert(bD,bg+bL)end
end local bG,bH,bI,bJ=math.huge,(math.huge)for bK,bL in ipairs(bD)do if az and
not aU(bL,bg)then continue end if ac.IsSpotFullySafe(bL,0.5)then local bM=(bL-bg
).Magnitude local bN=bM-ba(bL)if bN<bH then bH=bN bJ=bL end if ac.IsPathSafe(bg,
bL,bq,bm)then if bN<bG then bG=bN bI=bL end end end end local bK=bI or bJ if bK
then local bL,bM=ac.GetFloorPosition(bK)if bM and ac.IsSpotFullySafe(bL,0.5)then
if not(az and not aU(bL,bg))then bw=bL else bw=bK end else bw=bK end end elseif
bn and bn.isTrajectory then local bx,by,bz=bn.forward2D,bn.perpDist,bn.
dangerRadius local bA,bB,bC,bD,bE=math.max(3.5,(bz-by)+al),Vector3.new(bx.Z,0,-
bx.X),Vector3.new(-bx.Z,0,bx.X),bo:lower():find'movingbeam'~=nil or(bm and bm.
Name:lower():find'movingbeam'~=nil),{}if bD then local bF={0,-3,-6,-10}for bG,bH
in ipairs(bF)do local bI=bx*bH table.insert(bE,bg+bB*bA+bI)table.insert(bE,bg+bC
*bA+bI)table.insert(bE,bg+bB*(bA+2.5)+bI)table.insert(bE,bg+bC*(bA+2.5)+bI)end
if bm and bm.Parent then local bG=Vector3.new(bm.Position.X,bg.Y,bm.Position.Z)
table.insert(bE,bG-bx*7)table.insert(bE,bG-bx*11)table.insert(bE,bG-bx*7+bB*5)
table.insert(bE,bG-bx*7+bC*5)end table.insert(bE,bg-bx*(al+4))table.insert(bE,bg
-bx*(al+8))table.insert(bE,bg-bx*(al+12))else local bF={bA,bA+2,bA+4}for bG,bH
in ipairs(bF)do table.insert(bE,bg+bB*bH)table.insert(bE,bg+bC*bH)end local bG={
-1.5,1.5,-3}for bH,bI in ipairs(bG)do local bJ=bx*bI table.insert(bE,bg+bB*bA+bJ
)table.insert(bE,bg+bC*bA+bJ)end end local bF,bG,bH,bI=math.huge,(math.huge)for
bJ,bK in ipairs(bE)do if az and not aU(bK,bg)then continue end local bL=bK-bg if
bL.Magnitude>0.5 then local bM=bL.Unit:Dot(bx)if bM>0.25 then continue end end
if ac.IsSpotFullySafe(bK,0.5)then local bM,bN=bL.Magnitude,ba(bK)local bO,bP=(bM
*1.6)-(bN*0.3),bL.Magnitude>0.5 and bL.Unit:Dot(bx)or 0 if bD and bP<-0.2 then
bO=bO-15 elseif not bD then local bQ=bL.Magnitude>0.5 and math.abs(bL.Unit:Dot(
bB))or 0 if bQ>=0.9 then bO=bO-12 elseif bQ<0.8 then bO=bO+4 end end if az then
bO=bO+aV(bK,bg)end if bO<bG then bG=bO bI=bK end if ac.IsPathSafe(bg,bK,bq,bm)
then if bO<bF then bF=bO bH=bK end end end end if not bH then local bJ,bK,bL=
math.deg(math.atan2(bx.Z,bx.X)),bD and{90,-90,120,-120,150,-150,180}or{90,-90,75
,-75,105,-105,60,-60,120,-120},{4,7,11,16,22}for bM,bN in ipairs(bL)do for bO,bP
in ipairs(bK)do local bQ=math.rad(bJ+bP)local bR=bg+Vector3.new(math.cos(bQ)*bN,
0,math.sin(bQ)*bN)if az and not aU(bR,bg)then continue end if ac.
IsSpotFullySafe(bR,0.5)then if ac.IsPathSafe(bg,bR,bq,bm)then bH=bR break end
end end if bH then break end end end local bJ=bH or bI if bJ then local bK,bL=ac
.GetFloorPosition(bJ)if bL and ac.IsSpotFullySafe(bK,0.5)then if not(az and not
aU(bK,bg))then bw=bK else bw=bJ end else bw=bJ end end else local bx,by,bz,bA=
math.huge,(math.huge)if bm and bm.Parent and bm:IsA'BasePart'then local bB={}if
bm:IsA'Part'and(bm.Shape==Enum.PartType.Ball or bm.Shape==Enum.PartType.Cylinder
)then local bC=math.max(bm.Size.X,bm.Size.Z)/2 local bD,bE=bC+al,Vector3.new(bg.
X-bm.Position.X,0,bg.Z-bm.Position.Z)local bF=bE.Magnitude local bG=bF>0.1 and(
bE/bF)or(bp or(bv or Vector3.new(0,0,1)))local bH=math.atan2(bG.Z,bG.X)table.
insert(bB,bm.Position+bG*bD)local bI={math.rad(20),-math.rad(20),math.rad(40),-
math.rad(40),math.rad(65),-math.rad(65)}for bJ,bK in ipairs(bI)do local bL=bH+bK
table.insert(bB,bm.Position+Vector3.new(math.cos(bL)*bD,0,math.sin(bL)*bD))end
elseif bm.Name:lower():find'movingbeam'or(bm.Parent and bm.Parent.Name:lower():
find'movingbeam')then local bC=bm.CFrame.RightVector local bD=Vector3.new(bC.X,0
,bC.Z)if bD.Magnitude>0.001 then bD=bD.Unit else bD=Vector3.new(1,0,0)end local
bE,bF,bG=Vector3.new(-bD.Z,0,bD.X),math.max(bm.Size.X,bm.Size.Z)/2,math.max(bm.
Size.Y,math.min(bm.Size.X,bm.Size.Z))/2 if bG<3.5 then bG=3.5 end table.insert(
bB,bm.Position+bD*(bF+al+1))table.insert(bB,bm.Position-bD*(bF+al+1))table.
insert(bB,bm.Position+bE*(bG+al+1.5))table.insert(bB,bm.Position-bE*(bG+al+1.5))
else local bC,bD,bE=bm.CFrame:PointToObjectSpace(bg),bm.Size.X/2,bm.Size.Z/2 if
bE>=bD*1.4 then table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bD+al,bC
.Y,bC.Z)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(-(bD+al),bC.Y,
bC.Z)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bD+al+2,bC.Y,bC.Z
)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(-(bD+al+2),bC.Y,bC.Z)
))elseif bD>=bE*1.4 then table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.
new(bC.X,bC.Y,bE+al)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bC
.X,bC.Y,-(bE+al))))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bC.X,
bC.Y,bE+al+2)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bC.X,bC.Y
,-(bE+al+2))))else table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bD+al
,bC.Y,bC.Z)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(-(bD+al),bC
.Y,bC.Z)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bC.X,bC.Y,bE+
al)))table.insert(bB,bm.CFrame:PointToWorldSpace(Vector3.new(bC.X,bC.Y,-(bE+al))
))end end for bC,bD in ipairs(bB)do if az and not aU(bD,bg)then continue end if
ac.IsSpotFullySafe(bD,0.5)then local bE=bb(bg,bD,bv,bp)if bE<by then by=bE bA=bD
end if ac.IsPathSafe(bg,bD,bq,bm)then if bE<bx then bx=bE bz=bD end end end end
end if not bz then local bB,bC=bc(bg,bv,bq,bm,bp)if bB and bC<bx then bz=bB bx=
bC end end local bB=bz or bA if bB then local bC,bD=ac.GetFloorPosition(bB)if bD
and ac.IsSpotFullySafe(bC,0.5)then if not(az and not aU(bC,bg))then bw=bC else
bw=bB end else bw=bB end end if not bw then local bC=(bv and bv.Magnitude>0.01)
and bv.Unit or(bp and bp.Magnitude>0.01 and bp.Unit)or Vector3.new(0,0,1)local
bD=bg+(bC*18)if az and not aU(bD,bg)then bD=bg+(az-bg).Unit*15 end local bE,bF=
ac.GetFloorPosition(bD)bw=bF and bE or bD end end if bw then if bs then local bx
=(bw-bg).Magnitude if(bt-bx)>=a7 then an=bw aj=br local by=math.floor(bx*10)/10
return true,bw,bo,by else local by=math.floor(bt*10)/10 return true,an,bo,by end
end an=bw aj=br local bx=math.floor((bw-bg).Magnitude*10)/10 return true,bw,bo,
bx elseif bs then local bx=math.floor(bt*10)/10 return true,an,bo,bx end an=nil
aj=0 return true,nil,bo,0 end return ay end function a.r()local aa,ab,ac=a.load
'e',a.load'f',a.load'p'local ad,ae,af,ag,ah,ai,aj,ak,al,am=aa.RunService,aa.
player,false,'HumanoidMove',1,1,true,false,{},(RaycastParams.new())am.FilterType
=Enum.RaycastFilterType.Exclude am.IgnoreWater=true local an,ao,ap=function()
local an={}for ao,ap in ipairs(game:GetService'Players':GetPlayers())do if ap.
Character then table.insert(an,ap.Character)end end if workspace:FindFirstChild
'RaycastIgnore'then table.insert(an,workspace.RaycastIgnore)end am.
FilterDescendantsInstances=an end,{}function ao.SetRuntime(aq)ap=aq or nil end
local aq,ar,as,at,au,av,aw=function()return ap and ap.getInDanger and ap.
getInDanger()or false end,function()return ap and ap.getLogInDanger and ap.
getLogInDanger()or false end,function(aq)for ar,as in ipairs(al)do pcall(as,aq)
end end,function()if faceTargetProvider then local aq,ar=pcall(
faceTargetProvider)if aq and type(ar)=='table'and ar.X and ar.Z then return ar
end end if ac then local aq=ac.GetTargetPosition()if aq then return aq end end
return nil end,function()local aq=ae and ae.Character if not aq then return nil,
nil,nil end local ar,as=aq:FindFirstChild'HumanoidRootPart',aq:FindFirstChild
'Humanoid'if not ar or not as then return aq,nil,nil end return aq,ar,as end,
function(aq,ar)if not aq or not ar then return math.huge end local as,at=aq.X-ar
.X,aq.Z-ar.Z return math.sqrt(as*as+at*at)end,function(aq,ar)if not aq or not ar
then return nil end return Vector3.new(ar.X,aq.Position.Y,ar.Z)end local ax=
function(ax,ay,az,aA)if not ax or not az then return end local aB=aA or az.Y if
not aj and ay and ay.HipHeight and ax then local aC,aD,aE=ay.HipHeight+(ax.Size.
Y/2),Vector3.new(az.X,(aA or ax.Position.Y)+6,az.Z),Vector3.new(0,-20,0)local aF
=workspace:Raycast(aD,aE,am)if aF and aF.Position then aB=aF.Position.Y+aC else
local aG=az.Y-3 aB=aG+aC end end local aC,aD=Vector3.new(az.X,aB,az.Z),at()if aD
then ax.CFrame=CFrame.lookAt(aC,Vector3.new(aD.X,aB,aD.Z))else local aE=ax.
CFrame.LookVector local aF=Vector3.new(aE.X,0,aE.Z)if aF.Magnitude>0.001 then aF
=aF.Unit ax.CFrame=CFrame.lookAt(aC,aC+aF)else ax.CFrame=CFrame.new(aC)end end
ax.AssemblyLinearVelocity=Vector3.zero ax.AssemblyAngularVelocity=Vector3.zero
end function ao.Perform(ay,az)if ab.IsInvulnerable and ab.IsInvulnerable()then
return end local aA,aB,aC=au()if not aB or not aC or aC.Health<=0 then return
end if not ay then return end currentTargetPos=ay if ak then return end
dodgeThread=task.spawn(function()ak=true ac.SetDodging(true)as'Dodging'local aD,
aE=(aB.Position.Y)local aF=function()if aE and aE.Parent then pcall(function()aE
:Destroy()end)aE=nil end if aC and aC.Parent then local aF=ac and ac.IsEnabled
and ac.IsEnabled()and ac.IsTargetActive and ac.IsTargetActive()if aF then aC.
AutoRotate=false else aC.AutoRotate=true end end end local aG=function()aF()if
activeMoveConn then pcall(function()activeMoveConn:Disconnect()end)
activeMoveConn=nil end if aB and aB.Parent then aB.AssemblyLinearVelocity=
Vector3.zero aB.AssemblyAngularVelocity=Vector3.zero end if aC and aC.Parent and
ag=='HumanoidMove'then pcall(function()aC:Move(Vector3.zero,false)local aG=ae
and ae.Character and ae.Character:FindFirstChild'HumanoidRootPart'if aG then aC:
MoveTo(aG.Position)end end)end ak=false ac.SetDodging(false)currentTargetPos=nil
as'Safe'end local aH,aI=pcall(function()local aH,aI=currentTargetPos or ay,aB.
Position local aJ,aK=(Vector3.new(aH.X,0,aH.Z)-Vector3.new(aI.X,0,aI.Z)).
Magnitude,(ag=='Blink')and math.min(ah,ai)or ah if aJ<=aK then ax(aB,aC,aH,aD)if
ar()then print((
'[SmartDodge][Dodge] \u{26a1} Instant Snap (%.1f studs) to Safe Spot!'):format(
aJ))end return end if ag=='HumanoidMove'then if ar()then print((
'[SmartDodge][Dodge] \u{1f3c3} Humanoid:Move (Pure Physics Walk) (%.1f studs)...'
):format(aJ))end local aL,aM,aN=os.clock(),4,at()if aN then aC.AutoRotate=false
else aC.AutoRotate=true end local aO=Vector3.new(aH.X,aB.Position.Y,aH.Z)aC:
MoveTo(aO)if activeMoveConn then pcall(function()activeMoveConn:Disconnect()end)
activeMoveConn=nil end activeMoveConn=ad.RenderStepped:Connect(function()if not
aB.Parent or not aC.Parent or aC.Health<=0 then if activeMoveConn then
activeMoveConn:Disconnect()activeMoveConn=nil end return end local aP=
currentTargetPos or ay if not aP then return end local aQ=Vector3.new(aP.X-aB.
Position.X,0,aP.Z-aB.Position.Z)if aQ.Magnitude>0.6 then aC:Move(aQ.Unit,false)
else aC:Move(Vector3.zero,false)end if ac and ac.IsEnabled and ac.IsEnabled()
then local aR=at()if aR then if aC.AutoRotate~=false then aC.AutoRotate=false
end local aS=aB.Position local aT=Vector3.new(aR.X-aS.X,0,aR.Z-aS.Z)if aT.
Magnitude>0.5 then local aU,aV=aB.CFrame.LookVector,aT.Unit if aU:Dot(aV)<0.999
then aB.CFrame=CFrame.lookAt(aS,Vector3.new(aR.X,aS.Y,aR.Z))end end else if aC.
AutoRotate~=true then aC.AutoRotate=true end end end end)while af and(os.clock()
-aL<aM)do if not aB.Parent or not aC.Parent or aC.Health<=0 then break end if
not aq()then break end aH=currentTargetPos or ay if not aH then break end aI=aB.
Position local aP=Vector3.new(aH.X-aI.X,0,aH.Z-aI.Z)local aQ=aP.Magnitude if aQ
<=ah then ax(aB,aC,aH,aD)if ar()then print((
'[SmartDodge][Dodge] \u{26a1} HumanoidMove Final Snap (%.1f studs) to Safe Spot!'
):format(aQ))end break end if not aq()then if aQ<=ah then ax(aB,aC,aH,aD)end
break end aC:MoveTo(Vector3.new(aH.X,aI.Y,aH.Z))local aR,aS=aI+Vector3.new(0,0.5
,0),aP.Unit*2 local aT=workspace:Raycast(aR,aS,am)if aT and aT.Instance and aT.
Instance.CanCollide and aT.Normal.Y<0.7 then aC.Jump=true end task.wait(0.03)end
if aB.Parent and aC.Parent and aC.Health>0 then aH=currentTargetPos or ay if aH
then local aP=Vector3.new(aH.X-aB.Position.X,0,aH.Z-aB.Position.Z)if aP.
Magnitude<=ah then ax(aB,aC,aH,aD)end end end aG()return end if ag=='Blink'then
local aL,aM,aN=ai or 1,os.clock(),2.5 an()while af and(os.clock()-aM<aN)do if
not aB.Parent or not aC.Parent or aC.Health<=0 then return end aH=
currentTargetPos or ay if not aH then break end aI=aB.Position local aO=Vector3.
new(aH.X-aI.X,0,aH.Z-aI.Z)local aP,aQ=aO.Magnitude,math.min(ah,aL)if aP<=aQ then
ax(aB,aC,aH,aD)if ar()then print((
'[SmartDodge][Dodge] \u{26a1} Rapid Blink reached Safe Spot (%.1f studs) -> SNAP!'
):format(aP))end return end if not aq()and aP<=aL then ax(aB,aC,aH,aD)return end
local aR,aS,aT=math.min(aL,aP),aO.Unit,aI+Vector3.new(0,1.5,0)local aU=aS*(aR+
0.4)local aV=workspace:Raycast(aT,aU,am)if aV and aV.Instance and aV.Instance.
CanCollide and aV.Normal.Y<=0.65 then local aW=(aV.Position-aT).Magnitude if aW
<=0.7 then break else aR=math.max(0,aW-0.4)end end local aW=aI+aS*aR ax(aB,aC,aW
,aD)task.wait(0.025)end if aB.Parent and aC.Parent and aC.Health>0 then aH=
currentTargetPos or ay if aH then local aO=Vector3.new(aH.X-aB.Position.X,0,aH.Z
-aB.Position.Z)if aO.Magnitude<=math.min(ah,aL)then ax(aB,aC,aH,aD)end end end
return end if ar()then print((
'[SmartDodge][Dodge] \u{1f6b6} MoveTo Walk (%.1f studs)...'):format(aJ))end
local aL=at()if aL then aC.AutoRotate=false pcall(function()local aM=Instance.
new'BodyGyro'aM.Name='SmartDodge_FacingGyro'aM.MaxTorque=Vector3.new(0,400000,0)
aM.P=25000 aM.D=500 local aN=aB.Position aM.CFrame=CFrame.lookAt(aN,Vector3.new(
aL.X,aN.Y,aL.Z))aM.Parent=aB aE=aM end)else aC.AutoRotate=true end local aM,aN=
os.clock(),10 while af and(os.clock()-aM<aN)do if not aB.Parent or not aC.Parent
or aC.Health<=0 then break end if not aq()then break end aH=currentTargetPos or
ay if not aH then break end aI=aB.Position local aO=av(aI,aH)if aO<=ah then ax(
aB,aC,aH,aD)if ar()then print((
'[SmartDodge][Dodge] \u{1f3af} Reached snap range (%.2f studs) -> SNAP'):format(
aO))end break end if aE and aE.Parent then local aP=at()if aP then aE.CFrame=
CFrame.lookAt(aI,Vector3.new(aP.X,aI.Y,aP.Z))end end local aP=aw(aB,aH)aC:
MoveTo(aP)task.wait(0.05)end aF()if not aB.Parent or not aC.Parent or aC.Health
<=0 then return end aH=currentTargetPos or ay if not aH then return end local aO
=av(aB.Position,aH)if aO<=ah then ax(aB,aC,aH,aD)if ar()then print((
'[SmartDodge][Dodge] \u{26a1} Final snap from %.2f studs.'):format(aO))end end
end)if not aH then warn('[SmartDodge][Dodge] Error during dodge execution: '..
tostring(aI))end aG()end)end function ao.Cancel()if dodgeThread then task.
cancel(dodgeThread)dodgeThread=nil end local ay,az,aA=au()if aA then pcall(
function()aA:Move(Vector3.zero,false)end)local aB=ac and ac.IsEnabled and ac.
IsEnabled()and ac.IsTargetActive and ac.IsTargetActive()if aB then aA.AutoRotate
=false else aA.AutoRotate=true end end if az and az.Parent and ag~=
'HumanoidMove'then az.AssemblyLinearVelocity=Vector3.zero az.
AssemblyAngularVelocity=Vector3.zero end ak=false ac.SetDodging(false)
currentTargetPos=nil end function ao.FireStatus(ay)as(ay)end function ao.
SetAutoDodge(ay)af=ay and true or false end function ao.IsAutoDodgeEnabled()
return af end function ao.SetDodgeMode(ay)if ay=='MoveTo'or ay=='Blink'or ay==
'HumanoidMove'then ag=ay end end function ao.GetDodgeMode()return ag end
function ao.SetMaxSnapDistance(ay)if type(ay)=='number'and ay>0 then ah=ay end
end function ao.GetMaxSnapDistance()return ah end ao.SetMaxTeleportStep=ao.
SetMaxSnapDistance ao.GetMaxTeleportStep=ao.GetMaxSnapDistance function ao.
SetBlinkStep(ay)if type(ay)=='number'and ay>0 then ai=ay end end function ao.
GetBlinkStep()return ai end function ao.SetMaintainSnapHeight(ay)aj=ay and true
or false end function ao.IsMaintainSnapHeightEnabled()return aj end function ao.
IsDodging()return ak end function ao.SetFaceTargetProvider(ay)faceTargetProvider
=type(ay)=='function'and ay or nil end function ao.GetStatus()if ak then return
'Dodging'elseif ab.IsInvulnerable and ab.IsInvulnerable()and aq()then return
'\u{1f6e1}\u{fe0f} Paused (Invulnerable)'elseif aq()then return
'Safe (Standing in Spot)'else return'Idle'end end function ao.
OnDodgeStatusChanged(ay)if type(ay)~='function'then return end table.insert(al,
ay)end return ao end function a.s()local aa,ab,ac,ad,ae,af,ag=a.load'e',a.load
'f',a.load'j',a.load'l',a.load'k',a.load'q',a.load'r'ae.BindDetection{
GetActiveHazardsMap=ad.GetActiveHazardsMap,GetLockedProjectiles=ad.
GetLockedProjectiles,GetTrajectoryConfigForPart=ad.GetTrajectoryConfigForPart,
LockTrajectoryForPart=ad.LockTrajectoryForPart,IsIgnoredPart=ad.IsIgnoredPart,
GetFadeThreshold=ad.GetFadeThreshold}local ah,ai,aj,ak,al,am,an,ao,ap=aa.player,
false,0,{},true,true ag.SetRuntime{getInDanger=function()return ai end,
getLogInDanger=function()return al end}local aq,ar,as,at,au={},false,false,0,
function(aq,ar,as,at,au,av,aw)for ax,ay in ipairs(ak)do pcall(ay,aq,ar,as,at,au,
av,aw)end end local av,aw=function()if ap then return end ap=task.spawn(function
()local av=0 while ad.IsEnabled()do if not ab.IsBossActive()and ab.
GetEnemyCount()==0 and ad.GetHazardCount()>0 then ad.ClearAllHazards
'Room Cleared'end local aw,ax,ay,az,aA=ab.IsDead and ab.IsDead()or false if aw
then ax=false ay=nil az='Dead'aA=0 else ax,ay,az,aA=af.CalculateSafeSpot()end
local aB,aC=ab.IsInvulnerable()ai=ax an=ay ao=az aj=aA or 0 af.UpdateMarker(ay,
ax,aA)local aD=ah and ah.Character and ah.Character:FindFirstChild
'HumanoidRootPart'local aE=aD and aD.Position af.UpdateHitbox(aE)af.
UpdatePlayerRadar(aE,ax)ad.UpdateTrajectoryVisuals()ad.UpdateHazardTimers()if ax
and ay and ag.IsAutoDodgeEnabled()then if aB and am then if ag.IsDodging()then
ag.Cancel()end else ag.Perform(ay,aA)end end local aF=os.clock()local aG=aB and(
aF-at>=0.25)local aH=(ax~=ai)or(ay~=an)or(aw~=ar)or(aB~=as)or aG if aH then at=
aF ar=aw as=aB au(ax,ay,az,aA,aB,aC,aw)if al and ax and ay and(os.clock()-av>0.5
)then av=os.clock()if aB and am then print((
'[SmartDodge][Invulnerable] \u{1f6e1}\u{fe0f} IN DANGER (%s) but INVULNERABLE (%s) -> Dodge Paused'
):format(az,aC or'Protection'))else print((
'[SmartDodge][InDanger] \u{26a0}\u{fe0f} IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)'
):format(az,aA,ay.X,ay.Y,ay.Z))end end end task.wait(0.05)end end)end,function()
if ap then task.cancel(ap)ap=nil end ag.Cancel()af.HideVisuals()ad.
ClearTrajectoryVisuals()af.ResetLock()ai=false an=nil ao=nil au(false,nil,nil,0)
ag.FireStatus'Idle'end local ax,ay=function()ad.StartScan()av()end,function()ad.
StopScan()aw()end function aq.StartEngine()if ad.IsEnabled()then return end ad.
SetEnabled(true)ax()end function aq.StopEngine()if not ad.IsEnabled()then return
end ad.SetEnabled(false)ay()end function aq.Toggle(az)if az then aq.StartEngine(
)ac.EnableExclusive'SmartDodge'else aq.StopEngine()end end function aq.IsEnabled
()return ad.IsEnabled()end function aq.Shutdown()ay()af.DestroyVisuals()ad.
ClearTrajectoryVisuals()ag.Cancel()end function aq.SetLogInDanger(az)al=az and
true or false end function aq.IsLogInDangerEnabled()return al end function aq.
SetIgnoreDodgeWhenInvulnerable(az)am=az and true or false end function aq.
IsIgnoreDodgeWhenInvulnerableEnabled()return am end function aq.IsDead()return
ab.IsDead and ab.IsDead()or false end function aq.IsInDanger()return ai end
function aq.GetCurrentSafeSpot()return an,ai,ao,aj end function aq.
OnSafeSpotChanged(az)if type(az)~='function'then return end table.insert(ak,az)
end return aq end function a.t()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.
load'j',a.load'l',a.load'k',a.load'q',a.load'r',a.load's',a.load'p',a.load'f',{}
aj.AddCustomHazard=ac.AddCustomHazard aj.AddTrajectoryProjectile=ac.
AddTrajectoryProjectile aj.SetTrajectoryLookahead=ac.SetTrajectoryLookahead aj.
GetTrajectoryLookahead=ac.GetTrajectoryLookahead aj.SetTrajectoryWidthPadding=ac
.SetTrajectoryWidthPadding aj.GetTrajectoryWidthPadding=ac.
GetTrajectoryWidthPadding aj.RegisterPlayerSkill=ac.RegisterPlayerSkill aj.
GetActiveBossOrb=ac.GetActiveBossOrb aj.SetLogHazards=ac.SetLogHazards aj.
IsLogHazardsEnabled=ac.IsLogHazardsEnabled aj.SetLogThreats=aj.SetLogHazards aj.
IsLogThreatsEnabled=aj.IsLogHazardsEnabled aj.SetVisualEsp=ac.SetVisualEsp aj.
IsVisualEspEnabled=ac.IsVisualEspEnabled aj.SetShowSkillTimers=ac.
SetShowSkillTimers aj.IsShowSkillTimersEnabled=ac.IsShowSkillTimersEnabled aj.
SetAutoLearnSkillLifetimes=ac.SetAutoLearnSkillLifetimes aj.
IsAutoLearnSkillLifetimesEnabled=ac.IsAutoLearnSkillLifetimesEnabled aj.
GetHazardTimeRemaining=ac.GetHazardTimeRemaining aj.GetSkillProfile=ac.
GetSkillProfile aj.GetAllSkillProfiles=ac.GetAllSkillProfiles aj.
SaveSkillProfiles=ac.SaveSkillProfiles aj.LoadSkillProfiles=ac.LoadSkillProfiles
aj.GetHazardCount=ac.GetHazardCount aj.GetActiveHazards=ac.GetActiveHazards aj.
GetLastHazardInfo=ac.GetLastHazardInfo aj.OnHazardChanged=ac.OnHazardChanged aj.
CalculateSafeSpot=ae.CalculateSafeSpot aj.SetShowSafeMarker=ae.SetShowSafeMarker
aj.IsShowSafeMarkerEnabled=ae.IsShowSafeMarkerEnabled aj.SetShowPlayerRadar=ae.
SetShowPlayerRadar aj.IsShowPlayerRadarEnabled=ae.IsShowPlayerRadarEnabled aj.
UpdatePlayerRadar=ae.UpdatePlayerRadar aj.ClearPlayerRadar=ae.ClearPlayerRadar
aj.SetShowHitboxVisual=ae.SetShowHitboxVisual aj.IsShowHitboxVisualEnabled=ae.
IsShowHitboxVisualEnabled aj.SetHitboxPadding=ae.SetHitboxPadding aj.
GetHitboxPadding=ad.GetHitboxPadding aj.GetBoss1ArenaCenter=ae.
GetBoss1ArenaCenter aj.GetBoss1ArenaRadius=ae.GetBoss1ArenaRadius aj.
SetAutoDodge=af.SetAutoDodge aj.IsAutoDodgeEnabled=af.IsAutoDodgeEnabled aj.
SetDodgeMode=af.SetDodgeMode aj.GetDodgeMode=af.GetDodgeMode aj.SetBlinkStep=af.
SetBlinkStep aj.GetBlinkStep=af.GetBlinkStep aj.SetMaxSnapDistance=af.
SetMaxSnapDistance aj.GetMaxSnapDistance=af.GetMaxSnapDistance aj.
SetMaxTeleportStep=af.SetMaxTeleportStep aj.GetMaxTeleportStep=af.
GetMaxTeleportStep aj.SetMaintainSnapHeight=af.SetMaintainSnapHeight aj.
IsMaintainSnapHeightEnabled=af.IsMaintainSnapHeightEnabled aj.IsDodging=af.
IsDodging aj.SetFaceTargetProvider=af.SetFaceTargetProvider aj.GetDodgeStatus=af
.GetStatus aj.OnDodgeStatusChanged=af.OnDodgeStatusChanged aj.SetAutoFaceTarget=
ah.SetEnabled aj.IsAutoFaceTargetEnabled=ah.IsEnabled aj.GetTargetPosition=ah.
GetTargetPosition aj.SetAutoFaceBoss=aj.SetAutoFaceTarget aj.
IsAutoFaceBossEnabled=aj.IsAutoFaceTargetEnabled aj.GetBossPosition=aj.
GetTargetPosition aj.IsTargetActive=ah.IsTargetActive aj.IsBossActive=ah.
IsTargetActive aj.StartEngine=ag.StartEngine aj.StopEngine=ag.StopEngine aj.
Toggle=ag.Toggle aj.IsEnabled=ag.IsEnabled aj.SetLogInDanger=ag.SetLogInDanger
aj.IsLogInDangerEnabled=ag.IsLogInDangerEnabled aj.IsInDanger=ag.IsInDanger aj.
GetCurrentSafeSpot=ag.GetCurrentSafeSpot aj.OnSafeSpotChanged=ag.
OnSafeSpotChanged aj.SetIgnoreDodgeWhenInvulnerable=ag.
SetIgnoreDodgeWhenInvulnerable aj.IsIgnoreDodgeWhenInvulnerableEnabled=ag.
IsIgnoreDodgeWhenInvulnerableEnabled aj.SetRespawnProtectionDuration=ai.
SetRespawnProtectionDuration aj.GetRespawnProtectionDuration=ai.
GetRespawnProtectionDuration aj.GetRespawnProtectionRemaining=ai.
GetRespawnProtectionRemaining aj.IsInvulnerable=ai.IsInvulnerable aj.IsDead=ai.
IsDead ab.Register('SmartDodge',aj.StopEngine,aj.IsEnabled)aa.Register(function(
)ag.Shutdown()end)return aj end function a.u()local aa,ab,ac=a.load'g',a.load'd'
,a.load't'return function(ad,ae)local af=ae:Section{Side='Left'}af:Header{Name=
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
'\u{1f6e1}\u{fe0f} Paused (Invulnerable)'end local aq='160, 160, 160'if an==
'Dodging'then aq='255, 200, 50'elseif an=='Returning'then aq='255, 140, 0'elseif
an:find'Safe'then aq='0, 255, 120'elseif an:find'Invulnerable'then aq=
'0, 220, 255'end pcall(function()al:UpdateName("Dodge Action: <font color='rgb("
..aq..")'>"..an..'</font>')end)end ac.OnHazardChanged(function(aq,ar)an(aq,ar)
end)ac.OnSafeSpotChanged(function(aq,ar,as,at,au,av,aw)ao(aq,ar,as,at,au,av,aw)
ap()end)ac.OnDodgeStatusChanged(function(aq)ap(aq)end)af:Toggle({Name=
'Enable Threat & Safe Spot Engine',Default=ac.IsEnabled(),Callback=ab.Wrap(
function(aq)ac.Toggle(aq)an()end)},'Toggle_SmartDodgeThreatDetection')af:Toggle(
{Name='Auto Dodge Execution',Default=ac.IsAutoDodgeEnabled(),Callback=ab.Wrap(
function(aq)ac.SetAutoDodge(aq)end)},'Toggle_SmartDodgeAutoExecution')local aq,
ar,as={'HumanoidMove','Blink','MoveTo'},ac.GetDodgeMode(),1 if ar=='Blink'then
as=2 elseif ar=='MoveTo'then as=3 end af:Dropdown({Name='Dodge Movement Mode',
Options=aq,Default=as,Required=true,Callback=ab.Wrap(function(at)ac.
SetDodgeMode(at)end)},'Dropdown_SmartDodgeMode')aa.PatchSliderLoadCallback(af:
Slider({Name='Blink Step Distance',Suffix=' std',Default=ac.GetBlinkStep(),
Minimum=0.2,Maximum=2,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(
function(at)ac.SetBlinkStep(at)end)},'Slider_SmartDodgeBlinkStep'))af:Toggle({
Name='Auto Face Target (Lu\u{f4}n nh\u{ec}n v\u{1ec1} m\u{1ee5}c ti\u{ea}u)',
Default=ac.IsAutoFaceTargetEnabled(),Callback=ab.Wrap(function(at)ac.
SetAutoFaceTarget(at)end)},'Toggle_SmartDodgeAutoFaceTarget')af:Toggle({Name=
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
SetMaintainSnapHeight(at)end)},'Toggle_SmartDodgeMaintainHeight')aa.
PatchSliderLoadCallback(af:Slider({Name='Hitbox Padding',Suffix=' std',Default=
ac.GetHitboxPadding(),Minimum=0,Maximum=5,DisplayMethod='Round',Precision=1,
Callback=ab.Wrap(function(at)ac.SetHitboxPadding(at)end)},
'Slider_SmartDodgeHitboxPadding'))aa.PatchSliderLoadCallback(af:Slider({Name=
'Trajectory Lookahead',Suffix=' std',Default=ac.GetTrajectoryLookahead(),Minimum
=20,Maximum=150,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(at)
ac.SetTrajectoryLookahead(at)end)},'Slider_SmartDodgeTrajLookahead'))aa.
PatchSliderLoadCallback(af:Slider({Name='Trajectory Width',Suffix=' std',Default
=ac.GetTrajectoryWidthPadding(),Minimum=0.5,Maximum=6,DisplayMethod='Round',
Precision=1,Callback=ab.Wrap(function(at)ac.SetTrajectoryWidthPadding(at)end)},
'Slider_SmartDodgeTrajPadding'))af:Toggle({Name=
'Show Hitbox Padding Visual (Cyan Circle)',Default=ac.IsShowHitboxVisualEnabled(
),Callback=ab.Wrap(function(at)ac.SetShowHitboxVisual(at)end)},
'Toggle_SmartDodgeHitboxVisual')af:Toggle({Name=
'Player Threat Radar (24-Ray Sonar)',Default=ac.IsShowPlayerRadarEnabled(),
Callback=ab.Wrap(function(at)ac.SetShowPlayerRadar(at)end)},
'Toggle_SmartDodgePlayerRadar')af:Toggle({Name=
'Threat Visual ESP (SelectionBox)',Default=ac.IsVisualEspEnabled(),Callback=ab.
Wrap(function(at)ac.SetVisualEsp(at)end)},'Toggle_SmartDodgeVisualEsp')af:
Toggle({Name='Show Skill Lifetime Timers (3D Countdown)',Default=ac.
IsShowSkillTimersEnabled(),Callback=ab.Wrap(function(at)ac.SetShowSkillTimers(at
)end)},'Toggle_SmartDodgeSkillTimers')af:Toggle({Name=
'Auto Learn Skill Lifetimes (Save JSON)',Default=ac.
IsAutoLearnSkillLifetimesEnabled(),Callback=ab.Wrap(function(at)ac.
SetAutoLearnSkillLifetimes(at)end)},'Toggle_SmartDodgeAutoLearnSkills')af:
Toggle({Name='Show Safe Spot Marker (Green ESP)',Default=ac.
IsShowSafeMarkerEnabled(),Callback=ab.Wrap(function(at)ac.SetShowSafeMarker(at)
end)},'Toggle_SmartDodgeShowSafeMarker')af:Toggle({Name=
'Log Hazards (Spawns / Despawns)',Default=ac.IsLogHazardsEnabled(),Callback=ab.
Wrap(function(at)ac.SetLogHazards(at)end)},'Toggle_SmartDodgeLogHazards')af:
Toggle({Name='Log In Danger & Safe Spot',Default=ac.IsLogInDangerEnabled(),
Callback=ab.Wrap(function(at)ac.SetLogInDanger(at)end)},
'Toggle_SmartDodgeLogInDanger')af:Button{Name='Clear Console',Callback=function(
)pcall(function()if rconsoleclear then rconsoleclear()end end)end}an()local at,
au,av,aw=ac.GetCurrentSafeSpot()ao(au,at,av,aw)ap()end end function a.v()local
aa=a.load'e'local ab,ac=aa.player,{}local ad=function(ad)local ae={}if ad then
for af,ag in ipairs(ad)do if ag and ag.Parent then table.insert(ae,ag)end end
end if ab and ab.Character and ab.Character.Parent then table.insert(ae,ab.
Character)end local af=workspace:FindFirstChild'RaycastIgnore'if af then table.
insert(ae,af)end return ae end function ac.CastRay(ae,af,ag)local ah=af-ae local
ai=ah.Magnitude if ai<0.3 then return false,nil,af end local aj=RaycastParams.
new()aj.FilterType=Enum.RaycastFilterType.Exclude aj.FilterDescendantsInstances=
ad(ag)aj.IgnoreWater=true local ak,al,am=ae,ah,8 for an=1,am do local ao=
workspace:Raycast(ak,al,aj)if not ao then return false,nil,af end local ap=ao.
Instance if ap and ap.CanCollide and ap.CanQuery~=false then if ao.Normal.Y>0.65
then local aq=(ao.Position-ak).Magnitude+0.15 if aq>=al.Magnitude then return
false,nil,af end ak=ao.Position+al.Unit*0.15 al=af-ak else return true,ap,ao.
Position end else local aq=(ao.Position-ak).Magnitude+0.15 if aq>=al.Magnitude
then return false,nil,af end ak=ao.Position+al.Unit*0.15 al=af-ak end end return
false,nil,af end function ac.CheckClearance(ae,af,ag)local ah,ai,aj=ac.CastRay(
ae,af,ag)if ah then return true,ai,aj end local ak=Vector3.new(af.X-ae.X,0,af.Z-
ae.Z)if ak.Magnitude>0.8 then local al=ak.Unit local am=Vector3.new(-al.Z,0,al.X
)*0.6 local an,ao=ae+am,af+am local ap=ac.CastRay(ae,an,ag)if not ap then local
aq,ar,as=ac.CastRay(an,ao,ag)if aq and(as-an).Magnitude>1 then return true,ar,as
end end local aq,ar=ae-am,af-am local as=ac.CastRay(ae,aq,ag)if not as then
local at,au,av=ac.CastRay(aq,ar,ag)if at and(av-aq).Magnitude>1 then return true
,au,av end end end return false,nil,af end function ac.ResolveDestination(ae,af,
ag,ah,ai)local aj,ak=ae,af local al,am,an,ao={origin=aj,targetPos=ak,
directBlocked=false,directHitPart=nil,directHitPos=nil,chosenDest=nil,mode=
'None',nodeIdx=nil},ac.CheckClearance(aj,ak,ai)al.directBlocked=am al.
directHitPart=an al.directHitPos=ao if not am then al.chosenDest=af al.mode=
'Direct'return af,'Direct',nil,al end local ap=math.clamp(ah or 1,1,ag and#ag or
1)if ag and#ag>0 then for aq=#ag,ap,-1 do local ar=ag[aq]local as=ar.Position
local at=as+Vector3.new(0,2,0)local au,av,aw=ac.CheckClearance(aj,at,ai)if not
au then al.chosenDest=as al.mode='Waypoint'al.nodeIdx=aq return as,'Waypoint',aq
,al end end end al.mode='Blocked'return nil,'Blocked',nil,al end function ac.
ExecuteMove(ae,af,ag,ah,ai)if not ae or not ag then return end ae:MoveTo(ag)
local aj,ak=ag.Y-af.Y,Vector3.new(ag.X-af.X,0,ag.Z-af.Z).Magnitude if aj>1.8 and
ak<=7 then ae.Jump=true return end if ah and#ah>0 then local al=math.clamp(ai or
1,1,#ah)for am=al,math.min(al+2,#ah)do local an=ah[am]if an then local ao=
Vector3.new(an.Position.X-af.X,0,an.Position.Z-af.Z).Magnitude if ao<=5 then if
an.Action==Enum.PathWaypointAction.Jump or(an.Position.Y-af.Y)>1.8 then ae.Jump=
true break end end end end end end return ac end function a.w()local aa,ab,ac,ad
,ae,af,ag,ah=a.load'e',a.load'f',a.load'b',a.load'j',a.load'n',a.load'm',a.load
'o',a.load'v'local ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=aa.RunService,aa.
player,{NO_TARGET='NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',
TRACKING_TARGET='TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',BLOCKED='BLOCKED',
REPATHING='REPATHING'},{},false,false,1.5,8,6,true,true,true,true local av,aw,ax
,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV=ak.
NO_TARGET,'None',0,0,false,false,0,0,{},function()local av=aj and aj.Character
local aw=av and av:FindFirstChild'HumanoidRootPart'if aw and aw.Parent then
return aw end return nil end,function(av)if not av or not av.Parent then return
nil end local aw,ax=pcall(function()return av.Position end)if not aw or not ax
then return nil end return ax end,function(av,aw)if av==aw then return true end
if av and aw and av.Model and aw.Model and av.Model==aw.Model then return true
end return false end local aW=function(aW,aX,aY,aZ)local a_=ag.GetTarget()if aG(
a_,aW)then if aX then ag.UpdatePath(aX,aY,aZ)end return end ag.SetTarget(aW,aX,
aY,aZ)aH=nil aw='None'aI=nil aJ=nil aB=0 if aW then if aX and aY and#aY>0 then
av=ak.TRACKING_TARGET else av=ak.REPATHING end else av=ak.NO_TARGET end end aV=
function()if az or not am or not an then return end ay+=1 local aX=ay az=true
task.spawn(function()local aY,aZ=pcall(function()local aY=aE()local aZ=aY and
aF(aY)if not aZ then az=false return end local a_=ae.Scan()if#a_==0 then if aX==
ay and am and an then aW(nil,nil,nil,nil)end az=false return end local a0,a1,a2,
a3=af.SelectBestTarget(aZ,a_,function()return aX~=ay or not am or not an end)if
aX==ay and am and an then aW(a0,a1,a2,a3)else if a1 then pcall(function()a1:
Destroy()end)end end end)az=false if not aY then warn((
'[AutoFarm] Error in evaluation: %s'):format(tostring(aZ)))end end)end local aX,
aY,aZ,a_,a0=function(aX)if ab.IsInLobby()or not aA then return end local aY,aZ=
aE(),ab.GetHumanoid()if not aY or not aZ or aZ.Health<=0 then return end local
a_=aF(aY)if not a_ then return end local a0=os.clock()if a0-ax>=ao then ax=a0 if
av~=ak.HOLD then aV()end end local a1=ag.GetTarget()if a1 then if not ag.
IsTargetValid()then ag.ClearTarget()av=ak.NO_TARGET aH=nil aw='None'aJ=nil aV()
pcall(function()aZ:MoveTo(a_)end)return end end if not a1 or av==ak.NO_TARGET
then aH=nil aw='None'aJ=nil if not az and a0-ax>=0.5 then ax=a0 aV()end return
end local a2=a1.Root and aF(a1.Root)if not a2 then ag.ClearTarget()av=ak.
NO_TARGET aJ=nil return end local a3=Vector3.new(a2.X-a_.X,0,a2.Z-a_.Z).
Magnitude if a3<=ap then av=ak.HOLD aH=nil aw='Hold'aB=0 pcall(function()aZ:
MoveTo(a_)end)return else if av==ak.HOLD then av=ak.CHASE end end local a4=false
if av==ak.REPATHING or av==ak.BLOCKED or not ag.GetPathInstance()then a4=true
elseif ag.NeedsRepath(a2)then a4=true end if a4 then local a5=ag.Repath(a_,a2)if
a5 then av=ak.CHASE else av=ak.BLOCKED aH=nil aw='Blocked'pcall(function()aZ:
MoveTo(a_)end)return end end ag.AdvanceWaypointIndex(a_)local a5,a6,a7=ag.
GetWaypoints(),ag.GetWaypointIndex(),{aj.Character}if a1.Model then table.
insert(a7,a1.Model)end local a8,a9,b,ba=ah.ResolveDestination(a_,a2,a5,a6,a7)aJ=
ba if a9=='Blocked'or not a8 then av=ak.BLOCKED aH=nil aw='Blocked'pcall(
function()aZ:MoveTo(a_)end)return end av=ak.CHASE aH=a8 aw=a9 aI=b ah.
ExecuteMove(aZ,a_,a8,a5,a6)local bb=(a8-a_).Magnitude if bb>=1.5 then local bc=
aY.AssemblyLinearVelocity or aY.Velocity local bd,be=bc and Vector3.new(bc.X,0,
bc.Z).Magnitude or 0,(type(aX)=='number'and aX>0)and aX or 0.016 if bd<10 then
aB+=be if(a0-aC)>=0.4 then aZ.Jump=true pcall(function()aZ:ChangeState(Enum.
HumanoidStateType.Jumping)end)aC=a0 end if aB>=1.5 then av=ak.REPATHING aB=0 end
else aB=0 end else aB=0 end end,function()if aN and aN.Parent then return aN end
aN=Instance.new'Part'aN.Name='TM_TargetPart_Debug'aN.Anchored=true aN.CanCollide
=false aN.CanQuery=false aN.CanTouch=false aN.Size=Vector3.new(2,2,2)aN.
Transparency=0.4 aN.Color=Color3.fromRGB(255,50,50)aN.Material=Enum.Material.
Neon aN.Parent=workspace return aN end,function()if aO and aO.Parent then return
aO end if aO then pcall(function()aO:Destroy()end)aO=nil end aO=Instance.new
'Highlight'aO.Name='TM_EnemyHighlight_Debug'aO.FillColor=Color3.fromRGB(255,200,
0)aO.FillTransparency=0.5 aO.OutlineColor=Color3.fromRGB(255,0,0)aO.
OutlineTransparency=0 aO.Parent=workspace return aO end,function()if aP and aP.
Parent then return aP end aP=Instance.new'Part'aP.Name='TM_PathAdornee_Debug'aP.
Anchored=true aP.CanCollide=false aP.CanQuery=false aP.CanTouch=false aP.
Transparency=1 aP.Size=Vector3.new(1,1,1)aP.CFrame=CFrame.new(0,0,0)aP.Parent=
workspace return aP end,function()for aX,aY in ipairs(aD)do pcall(function()aY:
Destroy()end)end table.clear(aD)aU=nil end local a1,a2=function()if ab.
IsInLobby()then return end local a1,a2=ag.GetTarget(),aE()local a3=a2 and aF(a2)
if not at or not a1 or not a1.Root then if aN and aN.Parent then aN.CFrame=
CFrame.new(0,-1E3,0)end if aO and aO.Parent then aO.Enabled=false end else local
a4=aF(a1.Root)if a4 then local a5=aY()a5.CFrame=CFrame.new(a4)end local a5=aZ()
if a1.Model and a1.Model.Parent then a5.Adornee=a1.Model a5.Enabled=true else a5
.Enabled=false end end local a4,a5=ag.GetWaypoints(),ag.GetPathInstance()if not
ar or not a4 or#a4==0 then a0()else local a6=tostring(a5)..'_'..tostring(#a4)if
aU~=a6 then a0()local a7=a_()for a8=2,#a4 do local a9,b=a4[a8-1].Position,a4[a8]
.Position local ba=(b-a9).Magnitude if ba>0.01 then local bb=Instance.new
'LineHandleAdornment'bb.Name='TM_PathLine_Debug'bb.Adornee=a7 bb.Length=ba bb.
Thickness=2 bb.Transparency=0.3 bb.Color3=Color3.fromRGB(0,255,120)bb.ZIndex=0
bb.CFrame=CFrame.lookAt(a9,b)bb.Parent=workspace aD[#aD+1]=bb end end aU=a6 end
end if not as or not aH or not a3 then if aQ then aQ.Visible=false end if aR and
aR.Parent then aR.CFrame=CFrame.new(0,-1E3,0)end else local a6,a7=a3+Vector3.
new(0,0.5,0),aH+Vector3.new(0,0.5,0)local a8=(a7-a6).Magnitude if a8>=0.3 then
if not aQ or not aQ.Parent then local a9=a_()aQ=Instance.new
'LineHandleAdornment'aQ.Name='TM_ActualPath_Debug'aQ.Adornee=a9 aQ.Thickness=3.5
aQ.Transparency=0.15 aQ.Color3=Color3.fromRGB(0,230,255)aQ.ZIndex=2 aQ.Parent=
workspace end aQ.Length=a8 aQ.CFrame=CFrame.lookAt(a6,a7)aQ.Visible=true if not
aR or not aR.Parent then aR=Instance.new'Part'aR.Name='TM_ActualMarker_Debug'aR.
Anchored=true aR.CanCollide=false aR.CanQuery=false aR.CanTouch=false aR.Shape=
Enum.PartType.Ball aR.Size=Vector3.new(1.3,1.3,1.3)aR.Transparency=0.2 aR.
Material=Enum.Material.Neon aR.Color=Color3.fromRGB(0,230,255)aR.Parent=
workspace end aR.CFrame=CFrame.new(a7)else if aQ then aQ.Visible=false end if aR
and aR.Parent then aR.CFrame=CFrame.new(0,-1E3,0)end end end if not au or not aJ
or not a3 or not a1 then if aS then aS.Visible=false end if aT and aT.Parent
then aT.CFrame=CFrame.new(0,-1E3,0)end else local a6,a7,a8=aJ.origin or(a3+
Vector3.new(0,1.5,0)),aJ.directHitPos or aJ.targetPos,aJ.directBlocked if a7
then local a9=(a7-a6).Magnitude if a9>=0.2 then if not aS or not aS.Parent then
local b=a_()aS=Instance.new'LineHandleAdornment'aS.Name='TM_BlockerRay_Debug'aS.
Adornee=b aS.Thickness=3 aS.Transparency=0.2 aS.ZIndex=3 aS.Parent=workspace end
aS.Length=a9 aS.Color3=a8 and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)aS.CFrame=CFrame.lookAt(a6,a7)aS.Visible=true if a8 and aJ.directHitPos then
if not aT or not aT.Parent then aT=Instance.new'Part'aT.Name=
'TM_BlockerHitMarker_Debug'aT.Anchored=true aT.CanCollide=false aT.CanQuery=
false aT.CanTouch=false aT.Shape=Enum.PartType.Ball aT.Size=Vector3.new(1,1,1)aT
.Material=Enum.Material.Neon aT.Color=Color3.fromRGB(255,30,30)aT.Parent=
workspace end aT.CFrame=CFrame.new(aJ.directHitPos)else if aT and aT.Parent then
aT.CFrame=CFrame.new(0,-1E3,0)end end else if aS then aS.Visible=false end if aT
and aT.Parent then aT.CFrame=CFrame.new(0,-1E3,0)end end end end end,function()
if aN then pcall(function()aN:Destroy()end)aN=nil end if aO then pcall(function(
)aO:Destroy()end)aO=nil end if aQ then pcall(function()aQ:Destroy()end)aQ=nil
end if aR then pcall(function()aR:Destroy()end)aR=nil end if aS then pcall(
function()aS:Destroy()end)aS=nil end if aT then pcall(function()aT:Destroy()end)
aT=nil end a0()if aP then pcall(function()aP:Destroy()end)aP=nil end end
function al.IsEnabled()return am end function al.IsRunning()return an end
function al.GetState()return av end function al.GetScanInterval()return ao end
function al.SetScanInterval(a3)if type(a3)=='number'and a3>0.1 then ao=a3 end
end function al.GetReachDistance()return ap end function al.SetReachDistance(a3)
if type(a3)=='number'and a3>=1 then ap=a3 end end function al.GetRepathDistance(
)return aq end function al.SetRepathDistance(a3)if type(a3)=='number'and a3>=1
then aq=a3 ag.SetRepathThreshold(a3)end end function al.
IsPlannedPathVisualEnabled()return ar end function al.SetPlannedPathVisual(a3)ar
=a3==true if not ar then a0()end end function al.IsActualPathVisualEnabled()
return as end function al.SetActualPathVisual(a3)as=a3==true if not as then if
aQ then aQ.Visible=false end if aR and aR.Parent then aR.CFrame=CFrame.new(0,-
1E3,0)end end end function al.IsBlockerRayVisualEnabled()return au end function
al.SetBlockerRayVisual(a3)au=a3==true if not au then if aS then aS.Visible=false
end if aT and aT.Parent then aT.CFrame=CFrame.new(0,-1E3,0)end end end function
al.IsTargetVisualEnabled()return at end function al.SetTargetVisual(a3)at=a3==
true if not at then if aN and aN.Parent then aN.CFrame=CFrame.new(0,-1E3,0)end
if aO and aO.Parent then aO.Enabled=false end end end function al.GetDebugInfo()
local a3=aE()local a4,a5,a6,a7,a8,a9=a3 and aF(a3),ag.GetTarget(),'-',0,0,ag.
GetWaypoints()if a5 and a5.Model then a6=a5.Model.Name or'-'local b=aF(a5.Root)
if b and a4 then a7=(b-a4).Magnitude a8=Vector3.new(b.X-a4.X,0,b.Z-a4.Z).
Magnitude end end local b={directBlocked=false,blockerName='None',blockerDist=0}
if aJ then b.directBlocked=aJ.directBlocked==true if aJ.directHitPart then b.
blockerName=aJ.directHitPart.Name or'Part'end if aJ.directHitPos and a4 then b.
blockerDist=(aJ.directHitPos-a4).Magnitude end end local ba,bb=0,0 if a3 then
local bc=a3.AssemblyLinearVelocity or a3.Velocity if bc then ba=Vector3.new(bc.X
,0,bc.Z).Magnitude bb=bc.Y end end return{state=av,enemyName=a6,enemyDist=a7,
enemyFlat=a8,hasTarget=a5~=nil,destMode=aw,nodeIndex=aI,waypointCount=a9 and#a9
or 0,hasDestination=aH~=nil,blocker=b,velocity=ba,verticalVelocity=bb,stuckTimer
=aB}end function al.Toggle(a3)if a3==am then return end am=a3 if am then ad.
EnableExclusive'AutoFarm'if aK then aK:Disconnect()aK=nil end an=true ay=0 az=
false ax=0 ag.SetRepathThreshold(aq)if not aL then aL=ab.OnEnemyChanged(function
()if am and an and av~=ak.HOLD then aV()end end)end if not aM then aM=ab.
OnRespawn(function()ag.ClearTarget()av=ak.NO_TARGET aJ=nil aV()end)end if not aA
then task.spawn(function()if ab.ReadyDungeon()then aA=true end end)end task.
defer(aV)aK=ai.Heartbeat:Connect(function(a4)local a5,a6=pcall(aX,a4)if not a5
then warn(('[AutoFarm] Error in stepMovementLoop: %s'):format(tostring(a6)))end
a1()end)else if aK then aK:Disconnect()aK=nil end an=false if aL then aL()aL=nil
end if aM then aM()aM=nil end local a4,a5=ab.GetHumanoid(),aE()if a4 and a4.
Parent and a5 and a5.Parent then pcall(function()a4:MoveTo(aF(a5))end)end ag.
ClearTarget()av=ak.NO_TARGET aH=nil aw='None'aJ=nil aB=0 ay+=1 az=false a2()end
end ad.Register('AutoFarm',al.Toggle,al.IsEnabled)ac.Register(function()al.
Toggle(false)a2()end)return al end function a.x()local aa,ab,ac,ad,ae,af,ag,ah={
'Easy','Medium','Hard','Insane','Nightmare'},{'Desert Temple','Winter Outpost',
'Pirate Island',"King's Castle",'The Underworld','Samurai Palace','The Canals',
'Ghastly Harbor','Steampunk Sewers','Orbital Outpost','Volcanic Chambers',
'Aquatic Temple','Enchanted Forest','Egg Island','Krampus','Tutorial Dungeon'},{
['Egg Island']={Difficulties={'Easy','Nightmare'},LevelReq=0},Krampus={
Difficulties={'Nightmare'},LevelReq=195},['Tutorial Dungeon']={Difficulties={
'Easy'},LevelReq=0}},{},{},game:GetService'HttpService',
'Maclib/DungeonQuest_MapList.json'local ai,aj,ak,al=function(ai)if not(isfile
and writefile and makefolder and isfolder)then return end pcall(function()if not
isfolder'Maclib'then makefolder'Maclib'end end)pcall(function()writefile(ag,af:
JSONEncode(ai))end)end,function()if not(isfile and readfile)or not isfile(ag)
then return nil end local ai,aj=pcall(function()return af:JSONDecode(readfile(ag
))end)if not ai or typeof(aj)~='table'then return nil end local ak={}for al,am
in ipairs(aj)do if type(am)=='string'and#am>0 then table.insert(ak,am)end end
return(#ak>0)and ak or nil end,function(ai)local aj,ak={},{}for al,am in ipairs(
ai or{})do if not aj[am]then aj[am]=true table.insert(ak,am)end end for al,am in
ipairs(ab)do if not aj[am]then aj[am]=true table.insert(ak,am)end end return ak
end,function()local ai=game:GetService'Players'.LocalPlayer if not ai then
return nil end local aj=ai:FindFirstChild'PlayerGui'if not aj then return nil
end local ak=aj:FindFirstChild'queueGui'if not ak then return nil end local al=
ak:FindFirstChild'chooseDungeon'if not al then return nil end local am=al:
FindFirstChild'backgroundFillLeft'if not am then return nil end return am:
FindFirstChild'ScrollingFrame'end local am=function()local am=al()if not am then
return nil end local an={}for ao,ap in ipairs(am:GetChildren())do if ap:IsA
'ImageLabel'and#ap.Name>0 then table.insert(an,ap.Name)end end return(#an>0)and
an or nil end function ad.GetDungeons()if ah then return ah end local an=am()if
an then local ao=ak(an)ah=ao ai(ao)return ao end local ao=aj()if ao then local
ap=ak(ao)ah=ap return ap end return ab end function ad.RefreshDungeons()ah=nil
return ad.GetDungeons()end function ad.GetDungeonStats(an)if type(an)~='string'
or#an==0 then return nil end if ae[an]~=nil then return ae[an]end local ao=game:
GetService'ReplicatedStorage':FindFirstChild'remotes'local ap=ao and ao:
FindFirstChild'getDungeonStats'if not ap then return nil end local aq,ar=pcall(
function()return ap:InvokeServer(an)end)if aq and typeof(ar)=='table'then ae[an]
=ar return ar end return nil end function ad.GetAllowedDifficulties(an)if type(
an)~='string'then return aa end local ao=ac[an]if ao then return ao.Difficulties
end local ap,aq=ad.GetDungeonStats(an),{}if ap then for ar,as in ipairs(aa)do if
ap[as]then table.insert(aq,as)end end end if#aq>0 then return aq end return aa
end function ad.IsDifficultyAllowed(an,ao)if type(ao)~='string'then return false
end for ap,aq in ipairs(ad.GetAllowedDifficulties(an))do if aq==ao then return
true end end return false end function ad.GetLevelReq(an,ao)if type(an)~=
'string'then return 0 end local ap=ac[an]if ap then return ap.LevelReq or 0 end
local aq=ad.GetDungeonStats(an)if aq and type(ao)=='string'and aq[ao]then return
tonumber(aq[ao].levelReq)or 0 end return 0 end ad.DUNGEONS=ab ad.DIFFICULTIES=aa
return ad end function a.y()local aa,ab,ac,ad,ae,af,ag,ah=a.load'a',a.load'd',a.
load'f',a.load'x',a.load'c',a.load'b',a.load'w',{}local ai,aj,ak,al={
TargetReachDistance={get=function()return ag.GetReachDistance()end,set=function(
ai)ag.SetReachDistance(ai)end}},{Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',
Boss3='Boss 3'},{},{}function ah.OnConfigChanged(am)if type(am)~='function'then
return end table.insert(al,am)end function ah.ReloadFromConfig()local am,an=aa.
contextData or{},ab.GetActive()local ao,ap=an~=activeConfig,am~=lastDataRef ak=
am lastDataRef=am activeConfig=an if(ao or ap)and#al>0 then for aq,ar in ipairs(
al)do pcall(ar,an)end end return ao or ap end local am=function()aa.contextData=
ak end local an,ao=function()am()ab.SaveNow()end,function(an,ao)if not(an and
type(an)=='string'and#an>0)then return end if not aj[ao]then return end ak[an]=
ak[an]or{}ak[an][ao]=ak[an][ao]or{}local ap,aq=ak[an][ao],false for ar in pairs(
ai)do if ap[ar]==nil then ap[ar]=ai[ar].get()aq=true end end return aq end
function ah.SeedAllDefaults()local ap,aq={'Mob','Boss1','Boss2','Boss3'},false
for ar,as in ipairs(ad.GetDungeons())do for at,au in ipairs(ap)do if ao(as,au)
then aq=true end end end if aq then an()end return aq end function ah.SetField(
ap,aq,ar,as)if not(ap and type(ap)=='string'and#ap>0)then return end if not aj[
aq]then return end if not ai[ar]then return end ao(ap,aq)ak[ap][aq][ar]=as an()
end function ah.ClearContext(ap,aq)if type(ap)~='string'or#ap==0 then return end
if ak[ap]and ak[ap][aq]then ak[ap][aq]=nil if next(ak[ap])==nil then ak[ap]=nil
end an()end end function ah.GetField(ap,aq,ar)local as=ai[ar]if not as then
return nil end if type(ap)=='string'and#ap>0 then local at=ak[ap]and ak[ap][aq]
if at and at[ar]~=nil then return at[ar]end end return as.get()end function ah.
GetContext(ap,aq)local ar={}for as in pairs(ai)do ar[as]=ah.GetField(ap,aq,as)
end return ar end function ah.ApplyContext(ap,aq)local ar=ah.GetContext(ap,aq)
for as,at in pairs(ai)do at.set(ar[as])end end function ah.ApplyCurrent()local
ap,aq=ac.GetCurrentDungeonName(),ac.GetCombatTargetKey()ah.ApplyContext(ap,aq)
return ap,aq end function ah.GetFields()local ap={}for aq in pairs(ai)do table.
insert(ap,aq)end return ap end function ah.GetTargets()local ap={}for aq,ar in
ipairs{'Mob','Boss1','Boss2','Boss3'}do table.insert(ap,{Key=ar,Display=aj[ar]})
end return ap end function ah.GetDisplayForTarget(ap)return aj[ap]or'Normal'end
local ap,aq local ar=function(ar)local as,at=ac.GetCurrentDungeonName(),ac.
GetCombatTargetKey()if not as then aq=nil ap=nil return end if not ar and as==aq
and at==ap then return end ah.ApplyContext(as,at)if at~='Mob'then ae.Notify(
'Auto Farm Context',as..' - '..(aj[at]or at),2)end ap=at aq=as end function ah.
Init()ah.ReloadFromConfig()ah.SeedAllDefaults()am()ac.OnDungeonNameChanged(
function()ar(false)end)ac.OnBossIndexChanged(function()ar(false)end)ac.
OnBossActiveChanged(function()ar(false)end)task.spawn(function()while af.
IsActive()do task.wait(1)if ah.ReloadFromConfig()then ar(true)end end end)end
return ah end function a.z()local aa,ab,ac,ad,ae,af,ag=a.load'd',a.load'w',a.
load'y',a.load'f',a.load'e',a.load'g',a.load'b'local ah=ae.RunService return
function(ai,aj)local ak=aj:Section{Side='Left'}ak:Header{Name='Auto Farm'}ak:
Toggle({Name='Enable Auto Farm',Default=ab.IsEnabled(),Callback=aa.Wrap(function
(al)ab.Toggle(al)end)},'Toggle_AutoFarm')ak:Slider({Name='Rescan Interval',
Suffix='s',Default=ab.GetScanInterval(),Minimum=0.5,Maximum=5,Precision=1,
Callback=aa.Wrap(function(al)ab.SetScanInterval(al)end)},
'Slider_AF_ScanInterval')ak:Slider({Name='Target Reach Distance',Suffix=' std',
Default=ab.GetReachDistance(),Minimum=2,Maximum=200,DisplayMethod='Round',
Precision=0,Callback=aa.Wrap(function(al)ab.SetReachDistance(al)end)},
'Slider_AF_ReachDistance')ak:Slider({Name='Repath Distance',Suffix=' std',
Default=ab.GetRepathDistance(),Minimum=2,Maximum=20,DisplayMethod='Round',
Precision=0,Callback=aa.Wrap(function(al)ab.SetRepathDistance(al)end)},
'Slider_AF_RepathDistance')ak:Header{Name='Visual Debug'}ak:Toggle({Name=
'Show Blocker Ray (Red/Green)',Default=ab.IsBlockerRayVisualEnabled(),Callback=
aa.Wrap(function(al)ab.SetBlockerRayVisual(al)end)},'Toggle_AF_BlockerRay')ak:
Toggle({Name='Show Planned Path (Green)',Default=ab.IsPlannedPathVisualEnabled()
,Callback=aa.Wrap(function(al)ab.SetPlannedPathVisual(al)end)},
'Toggle_AF_PlannedPath')ak:Toggle({Name='Show Actual Destination (Cyan)',Default
=ab.IsActualPathVisualEnabled(),Callback=aa.Wrap(function(al)ab.
SetActualPathVisual(al)end)},'Toggle_AF_ActualPath')ak:Toggle({Name=
'Show Target Indicator (Red/Glow)',Default=ab.IsTargetVisualEnabled(),Callback=
aa.Wrap(function(al)ab.SetTargetVisual(al)end)},'Toggle_AF_TargetVisual')local
al=aj:Section{Side='Right'}al:Header{Name='Auto Farm Monitor'}local am,an,ao,ap,
aq,ar,as,at=al:Label{Text=
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
function a.A()local aa,ab=a.load'e',a.load'b'local ac,ad,ae,af,ag,ah,ai,aj,ak,al
,am,an=aa.RunService,aa.player,{},false,15,36,0.35,Color3.fromRGB(0,225,255),{},
(RaycastParams.new())al.FilterType=Enum.RaycastFilterType.Exclude al.IgnoreWater
=true local ao,ap=function()local ao={}if ad and ad.Character then table.insert(
ao,ad.Character)end local ap=workspace:FindFirstChild'RaycastIgnore'if ap then
table.insert(ao,ap)end al.FilterDescendantsInstances=ao end,function()if am and
am.Parent then return am end local ao=workspace.CurrentCamera or workspace local
ap=ao:FindFirstChild'SmartAutoPlay_RadiusVisual'if not ap then ap=Instance.new
'Folder'ap.Name='SmartAutoPlay_RadiusVisual'ap.Parent=ao end am=ap return ap end
local aq,ar=function()local aq=ap()while#ak<ah do local ar,as=#ak+1,Instance.new
'Part'as.Name=('RadiusSphere_%02d'):format(ar)as.Shape=Enum.PartType.Ball as.
Size=Vector3.new(ai,ai,ai)as.Material=Enum.Material.Neon as.Color=aj as.
Transparency=0.2 as.Anchored=true as.CanCollide=false as.CanTouch=false as.
CanQuery=false as.CastShadow=false as.Parent=aq table.insert(ak,as)end return ak
end,function()for aq,ar in ipairs(ak)do ar.Transparency=1 end end local as=
function()if not af then ar()return end local as=ad and ad.Character local at=as
and as:FindFirstChild'HumanoidRootPart'if not at or not at.Parent then ar()
return end ao()local au,av,aw=aq(),at.Position,(2*math.pi)/ah local ax=workspace
:Raycast(av,Vector3.new(0,-12,0),al)local ay=ax and(ax.Position.Y+(ai/2))or(av.Y
-2.8)for az=1,ah do local aA=(az-1)*aw local aB,aC,aD=av.X+math.cos(aA)*ag,av.Z+
math.sin(aA)*ag,au[az]if aD and aD.Parent then aD.Position=Vector3.new(aB,ay,aC)
aD.Transparency=0.2 aD.Color=aj end end end local at,au=function()if an then
return end an=ac.RenderStepped:Connect(function()pcall(as)end)end,function()if
an then an:Disconnect()an=nil end ar()end function ae.SetShowRadiusCircle(av)af=
av and true or false if af then at()else au()end end function ae.
IsShowRadiusCircleEnabled()return af end function ae.SetRadius(av)if type(av)==
'number'and av>0 then ag=math.clamp(av,2,100)end end function ae.GetRadius()
return ag end function ae.SetSphereSize(av)if type(av)=='number'and av>0 then ai
=math.clamp(av,0.1,3)for aw,ax in ipairs(ak)do ax.Size=Vector3.new(ai,ai,ai)end
end end function ae.GetSphereSize()return ai end ab.Register(function()au()for
av,aw in ipairs(ak)do pcall(function()aw:Destroy()end)end table.clear(ak)if am
then pcall(function()am:Destroy()end)am=nil end end)return ae end function a.B()
local aa,ab,ac=a.load'g',a.load'd',a.load'A'return function(ad,ae)local af=ae:
Section{Side='Left'}af:Header{Name='Smart Auto Play - Visuals'}af:Toggle({Name=
'Show Radius Circle (Spheres)',Default=ac.IsShowRadiusCircleEnabled(),Callback=
ab.Wrap(function(ag)ac.SetShowRadiusCircle(ag)end)},'Toggle_SAP_RadiusCircle')aa
.PatchSliderLoadCallback(af:Slider({Name='Radius R',Suffix=' std',Default=ac.
GetRadius(),Minimum=4,Maximum=100,DisplayMethod='Round',Precision=0,Callback=ab.
Wrap(function(ag)ac.SetRadius(ag)end)},'Slider_SAP_Radius'))aa.
PatchSliderLoadCallback(af:Slider({Name='Sphere Size',Suffix=' std',Default=ac.
GetSphereSize(),Minimum=0.1,Maximum=2,DisplayMethod='Round',Precision=2,Callback
=ab.Wrap(function(ag)ac.SetSphereSize(ag)end)},'Slider_SAP_SphereSize'))end end
function a.C()return function(aa,ab)a.load'i'(aa,ab)a.load'u'(aa,ab)a.load'z'(aa
,ab)a.load'B'(aa,ab)end end function a.D()local aa,ab,ac,ad,ae=a.load'e',a.load
'c',a.load'x',a.load'f',a.load'b'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.
player.Name,false,false,false,'Desert Temple','Easy',false,true,false,3,{[
77649408247578]=true,[3220968688]=true,[2414851778]=true},{}local ar,as,at=
function()return ap[game.PlaceId]==true end,function()for ar,as in ipairs(aq)do
pcall(as,aj,ac.GetAllowedDifficulties(aj))end end,function()if ah then return
end ah=true ai=false task.spawn(function()local ar,as=pcall(function()local ar=
game:GetService'ReplicatedStorage':WaitForChild('remotes',15)if not ar then
error'remotes not found'end local as=ac.GetLevelReq(aj,ak)pcall(function()ar:
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
Register(function()av.Toggle(false)end)return av end function a.E()local aa,ab,
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
function a.F()local aa={[77649408247578]=true,[115445507767090]=true}local ab,ac
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
if ac then ah()end end return ai end function a.G()local aa,ab=a.load'e',a.load
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
H()local aa,ab,ac,ad,ae,af,ag=a.load'g',a.load'D',a.load'E',a.load'F',a.load'G',
a.load'd',a.load'x'return function(ah,ai)local aj,ak,al=ai:Section{Side='Left'},
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
GetSelectedDifficulty())end)ap()end)end end function a.I()local aa,ab,ac,ad,ae,
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
function a.J()local aa,ab,ac=a.load'd',a.load'I',a.load'c'return function(ad,ae)
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
end)end)end},{Name='Cancel'}}}end)end}ao()end end function a.K()local aa,ab,ac,
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
return aF end return ac end function a.L()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
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
'[EnemyESP] recolor error'end end return ac end function a.M()local aa,ab,ac,ad,
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
PrimaryPart and ar(as.PrimaryPart.Position)then return true end for av,aw in
ipairs(as:GetDescendants())do if aw:IsA'BasePart'and ar(aw.Position)then return
true end end return false end local at,au=function()if not ad then return end
local at=workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if not at then return end for au,av in ipairs(
at:GetDescendants())do if not av.Parent then continue end if av:IsA'Model'then
if as(av)then pcall(function()av:Destroy()end)end elseif av:IsA'BasePart'then if
ar(av.Position)then local aw=av:FindFirstAncestorOfClass'Model'if aw and aw~=
workspace and aw~=at then pcall(function()aw:Destroy()end)else pcall(function()
av:Destroy()end)end end end end end,function(at)if not ad or not at or not at:
IsA'BasePart'then return end if at.Name=='Meshes/Snow'or at.Name:lower():find
'meshes/snow'or at.Name:lower()=='snow'then if ag[at]==nil then ag[at]=at.
Transparency end pcall(function()at.Transparency=1 end)end end local av=function
()if not ad then return end local av=workspace:FindFirstChild'Map'if not av then
return end for aw,ax in ipairs(av:GetDescendants())do if ax:IsA'BasePart'and(ax.
Name=='Meshes/Snow'or ax.Name:lower():find'meshes/snow'or ax.Name:lower()==
'snow')then au(ax)end end end local aw=function()if not ad then return end ao()
am()an()at()av()end local ax,ay=function()for ax,ay in ipairs(ae)do pcall(
function()ay:Disconnect()end)end table.clear(ae)local ax,ay=function(ax)if not
ax then return end table.insert(ae,ax.ChildAdded:Connect(function(ay)if not ad
then return end if not al(ay)then pcall(function()ay:Destroy()end)end end))table
.insert(ae,ax.DescendantAdded:Connect(function(ay)if not ad then return end if
ay.Name:lower():find'wooden plank'then local az=ay.Parent while az and az~=ax
and az~=workspace do if az:IsA'Model'then pcall(function()az:Destroy()end)return
end az=az.Parent end end local az=ay.Parent while az and az~=ax and az~=
workspace do if(az:IsA'Model'or az:IsA'Folder')and az.Name:lower():find'border'
then pcall(function()ay:Destroy()end)break end az=az.Parent end if ay:IsA'Model'
and as(ay)then pcall(function()ay:Destroy()end)return elseif ay:IsA'BasePart'and
ar(ay.Position)then local aA=ay:FindFirstAncestorOfClass'Model'if aA and aA~=
workspace and aA~=ax then pcall(function()aA:Destroy()end)else pcall(function()
ay:Destroy()end)end return end if ay:IsA'BasePart'and(ay.Name=='Meshes/Snow'or
ay.Name:lower():find'meshes/snow'or ay.Name:lower()=='snow')then au(ay)end end))
end,workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if ay then ax(ay)end table.insert(ae,workspace.
ChildAdded:Connect(function(az)if not ad then return end local aA=az.Name:lower(
)if aA=='map'or aA=='dungeon'then ax(az)task.delay(0.2,aw)end end))end,function(
)for ax,ay in pairs(ag)do if ax and ax.Parent then pcall(function()ax.
Transparency=ay end)end end table.clear(ag)for ax,ay in pairs(af)do if ax and ax
.Parent then pcall(function()ax.CanCollide=ay.CanCollide ax.CanTouch=ay.CanTouch
end)end end table.clear(af)end function ac.Toggle(az)if az==ad then return end
ad=az and true or false if ad then aw()ax()if loopThread then task.cancel(
loopThread)loopThread=nil end loopThread=task.spawn(function()while ad do task.
wait(ah)pcall(aw)end end)else for aA,aB in ipairs(ae)do pcall(function()aB:
Disconnect()end)end table.clear(ae)if loopThread then task.cancel(loopThread)
loopThread=nil end ay()end end function ac.IsEnabled()return ad end ab.Register(
function()ac.Toggle(false)end)return ac end function a.N()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'K',a.load'L',a.load'M',a.load'g',{'Custom Hitbox',
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
function a.O()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'f',a.load'b',game:
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
tonumber(aT.gold)or 0,{}for aX,aY in ipairs(aT.items or{})do if aY.itemName and
aY.itemName~='gold'then table.insert(aW,aY)end end local aX,aY,aZ,a_,a0=ap,false
,function(aX,aY)if aX==nil then return aY end if aY==nil then return aX end
return(ao[aX]or 0)>=(ao[aY]or 0)and aX or aY end for a1,a2 in ipairs(aW)do local
a3=tostring(a2.rarity or''):lower()if aw(a2)then aY=true a_=aZ(a_,a3)end if an[
a3]~=nil then a0=aZ(a0,a3)end end if aY then aX=a_ and(an[a_]or ar)or ar elseif
a0 then aX=an[a0]end aU=aU or{}local a1,a2=tostring(aU.level or'?'),tonumber(aU.
expGained)local a3,a4,a5=a2 and string.format('+%s XP',tostring(a2))or'?',aN(aU.
duration),{}if a2 then table.insert(a5,a3)end if aV>0 then table.insert(a5,
string.format('+%s gold',tostring(aV)))end local a6,a7=#a5>0 and table.concat(a5
,'  ')or'',#aW>0 and aQ(aW)or'None'local a8=a7 if a6~=''then a8=a6..(a7~='None'
and('\n'..a7)or'')end local a9,b={{name='Player',value=string.format(
'%s (lv %s)',aD(),a1),inline=true},{name='Map',value=ac.GetCurrentDungeonName()
or'Unknown',inline=true},{name='Time',value=a4,inline=true},{name='Rewards',
value=a8,inline=false}},'You cleared the dungeon and received your rewards!'if
aS(aW)then b=b..'\n\n'..al end return{embeds={{title='Dungeon WIN',description=b
,color=aX,fields=a9,timestamp=DateTime.now():ToIsoDate()}}}end local aU=function
(aU,aV)if ah==''or string.find(ah,'^https://discord%.com/api/webhooks/')==nil
then return false,'Invalid webhook URL'end local aW=aT(aU,aV)local aX,aY=pcall(
function()return ae:JSONEncode(aW)end)if not aX then return false,
'Could not encode payload'end local aZ,a_=pcall(function()return request{Url=ah,
Method='POST',Headers={['Content-Type']='application/json',['User-Agent']=
'ScriptHub-DungeonQuest (https://www.roblox.com)'},Body=aY}end)if not aZ then
return false,'Request error: '..tostring(a_)end if a_ and a_.Success then return
true end local a0=a_ and a_.StatusCode or'?'return false,'HTTP '..tostring(a0)
end function ag.SetUrl(aV)ah=aV or''aP()end function ag.GetUrl()return ah end
function ag.SetEnabled(aV)ai=aV==true aP()end function ag.IsEnabled()return ai
end function ag.SetPingEnabled(aV)ak=aV==true aP()end function ag.IsPingEnabled(
)return ak end function ag.SetPingMention(aV)al=aV or''aP()end function ag.
GetPingMention()return al end function ag.SetPingTiers(aV)if type(aV)~='table'
then return end local aW,aX={},{}local aY=function(aY)if not aX[aY]and table.
find(ax,aY)then aX[aY]=true table.insert(aW,aY)end end for aZ,a_ in pairs(aV)do
if type(aZ)=='string'and a_==true then aY(aZ)elseif type(a_)=='string'then aY(a_
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
Connect(function(aY)if not ai then return end aJ()local aZ=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local a_,a0=(aE())if aF~=nil and a_~=nil then a0=math.max(0,a_-aF)end
local a1,a2=aU(aY,{level=aH(),expGained=a0,duration=aZ})if not a1 then ab.
Notify('Webhook WIN','Send failed: '..tostring(a2),4)end end)end)aj=true ab.
Notify('Webhook','Webhook notifications ready',2)aM()end aO()ad.Register(
function()if as then as:Disconnect()as=nil end if at then at()at=nil end aj=
false end)return ag end function a.P()local aa=a.load'O'return function(ab,ac)
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
}end end function a.Q()local aa={}function aa.Apply(ab,ac,ad)for ae,af in pairs(
ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=af end
)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af,{
__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local ai,
aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.R()local aa,ab,ac,ad,ae,af=a.load'Q',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.S()local aa
,ab,ac=a.load'd',a.load'g',a.load'R'return function(ad,ae)local af=ae:Section{
Side='Left'}af:Header{Name='Anti AFK'}af:Toggle({Name='Anti AFK',Default=ac.
IsEnabled(),Callback=aa.Wrap(function(ag)if ag then ac.Start()else ac.Stop()end
end)},'Toggle_AntiAFK')ab.PatchSliderLoadCallback(af:Slider({Name=
'Interval (gi\u{e2}y)',Default=ac.GetInterval(),Minimum=5,Maximum=300,
DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(ag)ac.SetInterval(ag
)end)},'Slider_AntiAFKInterval'))end end function a.T()return function(aa,ab)a.
load'N'(aa,ab)a.load'P'(aa,ab)a.load'S'(aa,ab)end end function a.U()local aa,ab,
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
Hide()end)end ah()return ae end function a.V()local aa,ab,ac=a.load'a',a.load'd'
,a.load'U'return function(ad,ae)local af=aa.Folder local ag=af..
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
'Press RightControl to show the window again.'}end end function a.W()local aa,ab
,ac,ad,ae,af=a.load'f',a.load'G','Boss Active','Boss','Dungeon','Time Left'
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
end end end}end end function a.X()return function(aa,ab)a.load'V'(aa,ab)a.load
'W'(aa,ab)end end function a.Y()return function(aa)local ab,ac=game:GetService
'Players',os.clock()+15 while not ab.LocalPlayer do if os.clock()>ac then break
end task.wait(0.1)end local ad=ab.LocalPlayer if not ad then return warn
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
'rbxassetid://10734950309'}}ae:SetFolder'EsclipseHub'local al,am,an,ao,ap=a.load
'C',a.load'H',a.load'J',a.load'T',a.load'X'al(ah,ak.Combat)am(ah,ak.Dungeon)an(
ah,ak.Inventory)ao(ah,ak.Utilities)ap(ah,ak.Configs)local aq=a.load'h'aq.Init()
local ar=a.load'O'ar.Init()a.load'L'local as=a.load'U'as.SetWindow(ah)as.
Execute()local at=a.load'y'at.Init()ak.Combat:Select()ae:LoadAutoLoadConfig()
task.delay(1.5,function()ag.Resume()end)end end function a.Z()local aa={}
function aa:Export()local ab={}for ac,ad in pairs(self)do if typeof(ad)==
'Instance'or type(ad)=='table'then local ae,af=pcall(function()end)if ae and af
~=nil then ab[ac]=af end end end return ab end function aa:Import(ab)for ac,ad
in pairs(ab)do local ae=self[ac]if ae and ae.Value~=nil then local af=pcall(
function()end)if not af then warn(`Failed to import value for flag "{ac}"`)end
end end end function aa:Reset()for ab in pairs(self)do self[ab]=nil end end
return aa end function a._()local aa,ab=a.load'Q',{}function ab:Window(ac)ac=ac
or{}print'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.aa()local aa,ab=a.load'Q',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.ab()local aa,ab,
ac=a.load'Z',a.load'_',a.load'aa'local ad=ab:Window{Visible=true}return{Flags=aa
,Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)
end,Settings=function(ae)end,Config=function(ae)end}}end function a.ac()local aa
={}function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.ad()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.ae()return function(aa)local ab,ac,
ad=a.load'ab',a.load'ac',a.load'ad'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab
.Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do
local al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end
do local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah
.Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'Y',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.
load'ae',Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and
game.PlaceId~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.
Places then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:
Load()end end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae
:Load()end end