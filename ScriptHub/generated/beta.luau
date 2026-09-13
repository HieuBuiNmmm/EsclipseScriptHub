--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-13T09:39:15.248749600+00:00",
    cfg = "Beta",
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
'/settings'}for bu=1,#bt do local bv=bt[bu]pcall(function()if not isfolder(bv)
then makefolder(bv)end end)end end function b:LoadAutoLoadConfig()if j or not(
isfile and readfile)then return'Config system unavailable.'end local bv,bw=b.
Folder..'/settings/autoload.txt',false pcall(function()bw=isfile(bv)end)if bw
then local bx,by=pcall(readfile,bv)if bx and by then local bz=string.match(by,
'^%s*(.-)%s*$')if bz and bz~=''then local bA,bB=b:LoadConfig(bz)if not bA then w
:Notify{Title='Interface',Description='Error loading autoload config: '..
tostring(bB)}else w:Notify{Title='Interface',Description=string.format(
'Autoloaded config: %q',bz)}end end end end end function b:SetFolder(bv)if j
then return'Config system unavailable.'end b.Folder=bv bu()end function b:
SaveConfig(bv)if j or not writefile then return false,
'Config system unavailable.'end if(not bv)then return false,
'Please select a config file.'end bu()local bw,bx=b.Folder..'/settings/'..bv..
'.json',{objects={},contextData=b.contextData or{}}for by,bz in next,b.Options
do if not bt[bz.Class]then continue end if bz.IgnoreConfig then continue end
table.insert(bx.objects,bt[bz.Class].Save(by,bz))end local by,bz=pcall(e.
JSONEncode,e,bx)if not by then return false,'Unable to encode into JSON data'end
local bA,bB=pcall(writefile,bw,bz)if not bA then return false,
'Unable to write file: '..tostring(bB)end return true end function b:LoadConfig(
bv)if j or not(isfile and readfile)then return false,
'Config system unavailable.'end if(not bv)then return false,
'Please select a config file.'end local bw,bx=b.Folder..'/settings/'..bv..
'.json',false pcall(function()bx=isfile(bw)end)if not bx then return false,
'Invalid file'end local by,bz=pcall(readfile,bw)if not by or not bz then return
false,'Unable to read file: '..tostring(bz)end local bA,bB=pcall(e.JSONDecode,e,
bz)if not bA then return false,'Unable to decode JSON data.'end b.LoadingConfig=
true b.contextData=bB.contextData or{}for bC,bD in next,bB.objects do if bt[bD.
type]then pcall(function()bt[bD.type].Load(bD.flag,bD)end)end end task.delay(1,
function()b.LoadingConfig=false end)return true end function b:RefreshConfigList
()if j or not(isfolder and listfiles)then return{}end bu()local bv,bw=pcall(
function()if isfolder(b.Folder)and isfolder(b.Folder..'/settings')then return
listfiles(b.Folder..'/settings')end return{}end)if not bv or type(bw)~='table'
then return{}end local bx={}for by=1,#bw do local bz=tostring(bw[by])if bz:sub(-
5)=='.json'then local bA=bz:match'([^/\\]+)%.json$'if bA and bA~='options'then
table.insert(bx,bA)end end end return bx end x.Enabled=false local bv={}for bw,
bx in pairs(o)do table.insert(bv,bx)end f:PreloadAsync(bv)x.Enabled=true p=true
return w end function b:Demo()local aa=b:Window{Title='Maclib Demo',Subtitle=
'This is a subtitle.',Size=UDim2.fromOffset(868,650),DragStyle=1,
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
end end return ac end function a.e()local aa={}function aa.
PatchSliderLoadCallback(ab,ac)if not ab or type(ab.UpdateValue)~='function'then
return ab end local ad=ab.UpdateValue ab.UpdateValue=function(ae,af)local ag=
tonumber(af)if ag and ac then ag=ac(ag)end local ah=ae.Settings if ah and ag
then local ai,aj=ah.Minimum or 0,ah.Maximum or 100 ag=math.clamp(ag,math.min(ai,
aj),math.max(ai,aj))end ad(ae,ag or af)if ah and ah.Callback then local ai=ae.
Value or ag or tonumber(af)task.spawn(function()pcall(ah.Callback,ai)end)end end
return ab end function aa.PatchDropdownRestore(ab,ac)if not ab or type(ab.
UpdateSelection)~='function'then return ab end local ad=ab.UpdateSelection ab.
UpdateSelection=function(ae,af)if type(af)=='string'and af~=''and not ae:
IsOption(af)then if ac then pcall(function()ae:InsertOptions{af}end)else local
ag=ae.Settings and ae.Settings.Options if type(ag)=='table'and#ag>0 then af=ag[1
]else local ah=next(ae:GetOptions())if ah then af=ah end end end end ad(ae,af)
end return ab end return aa end function a.f()return{}end function a.g()local aa
,ab,ac,ad,ae,af,ag,ah=game:GetService'Players',game:GetService'Workspace',game:
GetService'ReplicatedStorage',{},{dungeon=true,Dungeon=true,Terrain=true,Camera=
true,CurrentCamera=true,RaycastIgnore=true,Drops=true,Loot=true,DodgeNode_ESP=
true,secondBossCrystals=true,secondbosscrystals=true,thirdBossBeamPart=true,
thirdbossbeampart=true},{primarypart=true,center=true,root=true,main=true,handle
=true,humanoidrootpart=true,head=true,torso=true,uppertorso=true,lowertorso=true
},{DodgeNode_ESP=true,['Enhanced Aura Ring']=true,EnhancedAuraRing=true,[
'Enhanced Aura']=true,EnhancedAura=true,['Aura Ring']=true,AuraRing=true,
AuraRingMesh=true,groundAura=true,GroundAura=true,['Ground Aura']=true,[
'ground aura']=true},{}function ad.RegisterIgnoredSkill(ai)if type(ai)~='string'
or#ai==0 then return end local aj=ai:gsub('^%s+',''):gsub('%s+$','')if not ag[aj
]then ag[aj]=true local ak=aj:lower():gsub('%s+','')ag[ak]=true end end local ai
=function(ai)if not ai then return true end local aj=ai.Name local ak=aj:lower()
if ak:find('debug',1,true)then return true end if aj:sub(1,3)=='TM_'or ak:find(
'tm_',1,true)then return true end if ak:find('smartdodge',1,true)or ak:find(
'dodgenode',1,true)then return true end if ak:find('smartautoplay',1,true)or ak:
find('autoplay',1,true)then return true end if ak:find('radiussphere',1,true)or
ak:find('skillsphere',1,true)then return true end if ak:find('safemarker',1,true
)or ak:find('repositionmarker',1,true)then return true end if ak:find(
'beaconpillar',1,true)or ak:find('hitboxcircle',1,true)then return true end if
ak:find('areavisual',1,true)or ak:find('crystalguidebox',1,true)then return true
end if ak:find('movingtrajectory',1,true)or ak:find('telegraphcorridor',1,true)
then return true end if ai:IsA'SelectionBox'or ai:IsA'BillboardGui'or ai:IsA
'Highlight'or ai:IsA'HandleAdornment'then return true end if ai.Parent and ai.
Parent~=ab then local al=ai.Parent.Name local am=al:lower()if am:find('debug',1,
true)or al:sub(1,3)=='TM_'then return true end if am:find('smartdodge',1,true)or
am:find('smartautoplay',1,true)then return true end if am:find('safemarker',1,
true)or am:find('repositionmarker',1,true)then return true end if am:find(
'radiusvisual',1,true)then return true end end return false end function ad.
IsIgnoredInstance(aj)if not aj then return true end if aj:IsA'Folder'or aj:IsA
'Configuration'then return true end if ai(aj)then return true end if ae[aj.Name]
then return true end for ak,al in ipairs(aa:GetPlayers())do if al.Character==aj
then return true end end local ak=aj.Name:lower():gsub('%s+','')if ag[aj.Name]or
ag[ak]then return true end if ak:find('enhancedaura',1,true)or ak:find(
'auraring',1,true)or ak:find('groundaura',1,true)then return true end return
false end function ad.IsIgnoredPart(aj)if not aj or not aj:IsA'BasePart'then
return true end if aj:FindFirstAncestorOfClass'Model'and aa:
GetPlayerFromCharacter(aj:FindFirstAncestorOfClass'Model')then return true end
if ai(aj)then return true end local ak=aj.Name:lower():gsub('%s+','')if af[ak]
then return true end if ag[aj.Name]or ag[ak]then return true end if ak:find(
'enhancedaura',1,true)or ak:find('auraring',1,true)or ak:find('groundaura',1,
true)then return true end return false end function ad.Init()ad.Cleanup()local
aj=function(aj)if not aj then return end local ak=function(ak)if not ak then
return end for al,am in ipairs(ak:GetChildren())do ad.RegisterIgnoredSkill(am.
Name)end end local al,am,an=function(al)if not al then return end ak(al)table.
insert(ah,al.ChildAdded:Connect(function(am)ad.RegisterIgnoredSkill(am.Name)end)
)end,function(al)if not al then return end ak(al)table.insert(ah,al.ChildAdded:
Connect(function(am)if am:IsA'Tool'then ad.RegisterIgnoredSkill(am.Name)end end)
)end,aj:FindFirstChild'Backpack'if an then al(an)end table.insert(ah,aj.
ChildAdded:Connect(function(ao)if ao.Name=='Backpack'or ao:IsA'Backpack'then al(
ao)end end))if aj.Character then am(aj.Character)end table.insert(ah,aj.
CharacterAdded:Connect(am))end for ak,al in ipairs(aa:GetPlayers())do aj(al)end
table.insert(ah,aa.PlayerAdded:Connect(aj))local ak,al=function(ak)if not ak
then return end for al,am in ipairs(ak:GetChildren())do ad.RegisterIgnoredSkill(
am.Name)local an=am:FindFirstChild'name'or am:FindFirstChild'Name'if an and an:
IsA'ValueBase'and tostring(an.Value)~=''then ad.RegisterIgnoredSkill(tostring(an
.Value))end end table.insert(ah,ak.ChildAdded:Connect(function(al)ad.
RegisterIgnoredSkill(al.Name)end))end,ac:FindFirstChild'abilities'if al then ak(
al)end local am=ac:FindFirstChild'projectiles'if am then ak(am)end end function
ad.Cleanup()for aj,ak in ipairs(ah)do pcall(function()ak:Disconnect()end)end
table.clear(ah)end return ad end function a.h()local aa,ab,ac,ad,ae,af,ag,ah,ai,
aj,ak,al,am,an,ao,ap=game:GetService'Players',game:GetService'Workspace',game:
GetService'RunService',a.load'f',{},true,true,true,true,0.08,0.65,Color3.
fromRGB(255,225,30),Color3.fromRGB(255,230,80),Color3.fromRGB(255,120,20),Color3
.fromRGB(255,160,50),{}function ae.SetTelegraphColor(aq)an=aq ae.RebuildAll()end
function ae.GetTelegraphColor()return an end function ae.SetUnifiedModelBoxes(aq
)ai=aq ae.RebuildAll()end function ae.IsUnifiedModelBoxes()return ai end
function ae.SetLineThickness(aq)aj=math.clamp(aq,0.01,0.3)for ar,as in pairs(ap)
do if as.boxes then for at,au in ipairs(as.boxes)do au.LineThickness=aj end end
end end function ae.GetLineThickness()return aj end function ae.
GetHazardVisualData(aq)return ap[aq]end function ae.SetSurfaceTransparency(aq)ak
=math.clamp(aq,0,1)for ar,as in pairs(ap)do if as.boxes then for at,au in
ipairs(as.boxes)do au.SurfaceTransparency=ak end end end end function ae.
GetSurfaceTransparency()return ak end function ae.SetEspEnabled(aq)af=aq for ar,
as in pairs(ap)do if as.boxes then for at,au in ipairs(as.boxes)do au.Visible=af
end end end end function ae.IsEspEnabled()return af end function ae.
SetNameTagsEnabled(aq)ag=aq for ar,as in pairs(ap)do if as.nameTags then for at,
au in ipairs(as.nameTags)do au.Enabled=ag end end end end function ae.
IsNameTagsEnabled()return ag end function ae.SetShowTimersOnTags(aq)ah=(aq==true
)if not ah then for ar,as in pairs(ap)do if as.nameTags then for at,au in
ipairs(as.nameTags)do local av=au:FindFirstChildOfClass'TextLabel'if av then
local aw=av:GetAttribute'BaseText'if aw then av.Text=aw end end end end end end
end function ae.IsShowTimersOnTags()return ah end local aq={firstbosscrisscross=
{lifetime=2.2,hitDelay=0},firstbossseekingspikes={lifetime=2.5,hitDelay=0},
firstbossbigspike={lifetime=2,hitDelay=0},firstbossbeampart={lifetime=2,hitDelay
=0},secondbossmovingbeam={lifetime=3.5,hitDelay=0},secondbossyelloworb={lifetime
=4,hitDelay=0},secondbossredorb={lifetime=4,hitDelay=0},secondbossgreenorb={
lifetime=4,hitDelay=0},thirdbossmultirings={lifetime=2.8,hitDelay=2},
thirdbossmissile={lifetime=3.5,hitDelay=0}}local ar,as=function()if not ag or
not ah then return end local ar=os.clock()for as,at in pairs(ap)do if at.
nameTags and#at.nameTags>0 and as.spawnTime then local au,av=ar-as.spawnTime,(as
.cleanName or''):lower():gsub('%s+','')local aw=aq[av]local ax,ay=(aw and aw.
lifetime)or 2.2,aw and aw.hitDelay or nil local az,aA,aB,aC=math.max(0,ax-au),ay
and math.max(0,ay-au)or nil,''if aA and aA>0 then if aA<=0.4 then aC=Color3.
fromRGB(255,60,60)elseif aA<=1 then aC=Color3.fromRGB(255,160,0)else aC=Color3.
fromRGB(255,230,80)end aB=string.format('\u{1f4a5} %.1fs | \u{23f3} %.1fs',aA,az
)elseif aA and aA<=0 and az>0 then aC=Color3.fromRGB(80,255,120)aB=string.
format('\u{2705} N\u{1ed4}! \u{23f3} %.1fs',az)else if az<=0.4 then aC=Color3.
fromRGB(80,255,120)else aC=as.isTelegraph and ao or am end aB=string.format(
'\u{23f3} %.1fs',az)end for aD,aE in ipairs(at.nameTags)do if aE and aE.Parent
then if as.isTelegraph or aE.Name=='SmartDodge_NameTag_Telegraph'or aE==at.
corridorNameTag then local aF=aE:FindFirstChildOfClass'TextLabel'if aF then
local aG=aF:GetAttribute'BaseText'if aG then aF.Text=aG end end continue end
local aF=aE:FindFirstChildOfClass'TextLabel'if aF then local aG=aF:GetAttribute
'BaseText'if not aG then aG=aF.Text aF:SetAttribute('BaseText',aG)end aF.Text=
string.format('%s [%s]',aG,aB)if aC then aF.TextColor3=aC end end end end end
end end,0 ac.Heartbeat:Connect(function()local at=os.clock()if(at-as)<0.05 then
return end as=at pcall(ar)end)local at,au,av=function(at)local au=0 if at and at
.activeParts then for av in pairs(at.activeParts)do au=au+1 end end return au
end,function(at)local au=at.Adornee if not au then return nil end local av if au
:IsA'BasePart'then local aw=au:FindFirstChildOfClass'SpecialMesh'if aw then av=
Vector3.new(au.Size.X*math.abs(aw.Scale.X),au.Size.Y*math.abs(aw.Scale.Y),au.
Size.Z*math.abs(aw.Scale.Z))else av=au.Size end elseif au:IsA'Model'then local
aw,ax=au:GetBoundingBox()av=ax end if not av then return nil end local aw={av.X,
av.Y,av.Z}table.sort(aw)local ax=aw[2]if ax<1 then ax=aw[3]end return ax end,
function(at)local au,av,aw=25 for ax,ay in pairs(ap)do local az=(ax.
isCustomHazard and not ax.isTelegraph)or(ax.instance and(ax.instance.Name:lower(
):find'spike'or ax.instance.Name:lower():find'missile'))if az then local aA=ax.
position if not aA and ax.instance then if ax.instance:IsA'BasePart'then aA=ax.
instance.Position elseif ax.instance:IsA'Model'then aA=ax.instance:GetPivot().
Position end end if aA then local aB=(aA-at).Magnitude if aB<au then au=aB av=ax
local aC=next(ax.activeParts)if not aC and ax.instance and ax.instance:IsA
'BasePart'then aC=ax.instance end aw=aC end end end end if aw then return av,aw
end for ax,ay in ipairs(ab:GetChildren())do local az=ay.Name:lower():gsub('%s+',
'')if(az:find'spike'or az:find'missile')and not az:find'beam'then local aA=ay:
IsA'BasePart'and ay.Position or(ay:IsA'Model'and ay:GetPivot().Position)if aA
and(aA-at).Magnitude<au then local aB=ay:IsA'BasePart'and ay or ay:
FindFirstChildWhichIsA'BasePart'if aB then return nil,aB end end end end return
nil,nil end local aw,ax=function(aw)local ax,ay=av(aw)if ax and ap[ax]then local
az=ap[ax]if az.boxes then for aA,aB in ipairs(az.boxes)do local aC=au(aB)if aC
and aC>0 then return aC end end end end if ay then local az=ay:
FindFirstChildOfClass'SpecialMesh'local aA=az and Vector3.new(ay.Size.X*math.
abs(az.Scale.X),ay.Size.Y*math.abs(az.Scale.Y),ay.Size.Z*math.abs(az.Scale.Z))or
ay.Size return math.max(aA.X,aA.Z)end return nil end,function(aw,ax)local ay=aw.
position if not ay and aw.instance then if aw.instance:IsA'BasePart'then ay=aw.
instance.Position elseif aw.instance:IsA'Model'then ay=aw.instance:GetPivot().
Position end end if not ay then return end local az=(aw.name and aw.name:lower()
:find'bigspike'~=nil)or(aw.instance and aw.instance.Name:lower():find'bigspike'
~=nil)for aA,aB in pairs(ap)do if aA.isTelegraph and aB.corridorPart and aB.
telegraphStartPos then local aC=(aB.telegraphStartPos-ay).Magnitude if aC<25
then local aD,aE=aB.corridorPart,az and math.max(ax,40)or ax if aD.Parent and
math.abs(aD.Size.X-aE)>0.5 then aD.Size=Vector3.new(aE,aD.Size.Y,aD.Size.Z)if aB
.nameTags then for aF,aG in ipairs(aB.nameTags)do local aH=aG:
FindFirstChildOfClass'TextLabel'if aH then aH.Text=('%s [Beam W:%.1f]'):format(
aA.instance.Name,aE)end end end local aF=next(aA.activeParts)local aG=aF and(aF:
FindFirstChildOfClass'Beam'or(aF.Parent and aF.Parent:FindFirstChildOfClass
'Beam'))if aG and(az or(aG.Width0 and aG.Width0<20))then pcall(function()aG.
Width0=aE aG.Width1=aE end)end end end end end end function ae.AttachPartVisual(
ay,az)local aA=ap[ay]if not aA or not az or not az:IsA'BasePart'or not az.Parent
then return end if aA.isUnified then return end local aB,aC=ay.isTelegraph and
an or al,ay.isTelegraph and ao or am if aA.boxes then for aD,aE in ipairs(aA.
boxes)do if aE.Adornee==az then return end end end local aD=Instance.new
'SelectionBox'aD.Name='SmartDodge_SelectionBox'aD.Color3=aB aD.SurfaceColor3=aB
aD.SurfaceTransparency=ak aD.LineThickness=aj aD.Adornee=az aD.Visible=af aD.
Parent=az table.insert(aA.boxes,aD)if ay.isCustomHazard and not ay.isTelegraph
then local aE=au(aD)if aE and aE>0 then ax(ay,aE)end end local aE=ay.name:lower(
)local aF=aE:find('debug',1,true)or ay.name:sub(1,3)=='TM_'or aE:find(
'smartdodge',1,true)or aE:find('smartautoplay',1,true)or aE:find('marker',1,true
)if not aF and not ay.isTelegraph and#aA.nameTags==0 then local aG=''if ay.
instance and ay.instance~=az then aG=('%s(%s)'):format(ay.instance.Name,az.
ClassName)else aG=('%s(%s)'):format(az.Name,az.ClassName)end local aH=Instance.
new'BillboardGui'aH.Name='SmartDodge_NameTag'aH.Size=UDim2.fromOffset(180,24)aH.
StudsOffset=Vector3.new(0,2,0)aH.AlwaysOnTop=true aH.Enabled=ag aH.Adornee=az
local aI=Instance.new'TextLabel'aI.Size=UDim2.fromScale(1,1)aI.
BackgroundTransparency=1 aI.Font=Enum.Font.GothamBold aI.TextSize=12 aI.
TextColor3=aC aI.TextStrokeTransparency=0 aI.TextStrokeColor3=Color3.fromRGB(0,0
,0)aI.Text=aG aI.Parent=aH aH.Parent=az table.insert(aA.nameTags,aH)end end
function ae.AttachHazardVisuals(ay)if ap[ay]then return end local az=ay.name:
lower()if az:find('debug',1,true)or ay.name:sub(1,3)=='TM_'or az:find(
'smartdodge',1,true)or az:find('smartautoplay',1,true)then return end local aA={
boxes={},nameTags={},trajectoryPart=nil,corridorPart=nil,telegraphStartPos=nil,
isUnified=false}ap[ay]=aA local aB,aC,aD=ay.isTelegraph and an or al,ay.
isTelegraph and ao or am,at(ay)local aE=ai and ay.instance and ay.instance:IsA
'Model'and(aD>=2)and not ay.neverUnify aA.isUnified=aE local aF=next(ay.
activeParts)if ay.isTelegraph and aF and aF:IsA'BasePart'then local aG,aH=aF:
FindFirstChild'Attachment2'or(aF.Parent and aF.Parent:FindFirstChild
'Attachment2'),aF.Position local aI=(aG and aG:IsA'Attachment')and aG.
WorldPosition or(aH+aF.CFrame.LookVector*100)local aJ=aI-aH local aK,aL=math.
max(aJ.Magnitude,5),aF:FindFirstChildOfClass'Beam'or(aF.Parent and aF.Parent:
FindFirstChildOfClass'Beam')local aM=(aL and aL.Width0 and aL.Width0>=20)or(aF.
Name:lower():find'bigspike'~=nil)or(aF.Parent and aF.Parent.Name:lower():find
'bigspike'~=nil)if not aM then local aN,aO=av(aH)if(aN and aN.name and aN.name:
lower():find'bigspike')or(aO and aO.Name:lower():find'bigspike')then aM=true end
end local aN=(aF.Name:lower():find'seekingspike'~=nil)or(aF.Parent and aF.Parent
.Name:lower():find'seekingspike'~=nil)if not aN and not aM then local aO,aP=av(
aH)if(aO and aO.name and aO.name:lower():find'seekingspike')or(aP and aP.Name:
lower():find'seekingspike')then aN=true end end local aO=40 if aM then aO=40
elseif aN then aO=16 else aO=ay.width or 20 end aO=math.clamp(aO,4,50)ay.width=
aO ay.dangerRadius=aO/2 if ay.maxLookahead and ay.maxLookahead>aK then aK=ay.
maxLookahead local aP=aJ.Magnitude>0.001 and aJ.Unit or Vector3.new(0,0,-1)aI=aH
+aP*aK end local aP,aQ=av(aH)local aR=aP and ap[aP]and ap[aP].corridorPart if aR
and aR.Parent then local aS=ap[aP]aA.corridorPart=aS.corridorPart aA.corridorBox
=aS.corridorBox aA.corridorNameTag=aS.corridorNameTag aA.telegraphStartPos=aS.
telegraphStartPos aA.companionHazard=aP aA.companionPart=aQ else local aS,aT=
CFrame.lookAt(aH,aI)*CFrame.new(0,0,-aK/2),Instance.new'Part'aT.Name=
'SmartDodge_TelegraphCorridor'aT.Transparency=1 aT.Anchored=true aT.CanCollide=
false aT.CanQuery=false aT.CanTouch=false aT.Size=Vector3.new(aO,0.4,aK)aT.
CFrame=aS aT.Parent=ab aA.corridorPart=aT aA.telegraphStartPos=aH local aU=
Instance.new'SelectionBox'aU.Name='SmartDodge_SelectionBox_Telegraph'aU.Color3=
an aU.SurfaceColor3=an aU.SurfaceTransparency=ak aU.LineThickness=aj aU.Adornee=
aT aU.Visible=af aU.Parent=aT aA.corridorBox=aU table.insert(aA.boxes,aU)if aP
and ap[aP]then local aV=ap[aP]aV.corridorPart=aT aV.corridorBox=aU aV.
telegraphStartPos=aH aA.companionHazard=aP aA.companionPart=aQ end end local aS=
ay.instance.Name:lower():find'beam'~=nil or(aF and aF:FindFirstChildOfClass
'Beam'~=nil)if not aS then local aT=(aI-aH)local aU=aT.Magnitude local aV,aW,aX=
(aU>0.001)and(aT/aU)or Vector3.new(0,0,-1),av(aH)aA.companionPart=aX aA.
companionHazard=aW local aY,aZ,a_=os.clock(),false a_=ac.Heartbeat:Connect(
function()if not corridor or not corridor.Parent then if a_ then a_:Disconnect()
a_=nil end return end if(not aX or not aX.Parent)and(os.clock()-aY<0.8)then
local a0,a1=av(aH)if a1 then aX=a1 aW=a0 aA.companionPart=aX aA.companionHazard=
aW if not aM then local a2=aw(aH)if a2 and a2>=4 and math.abs(corridor.Size.X-a2
)>0.5 then aO=a2 corridor.Size=Vector3.new(aO,corridor.Size.Y,corridor.Size.Z)if
aA.nameTags then for a3,a4 in ipairs(aA.nameTags)do local a5=a4:
FindFirstChildOfClass'TextLabel'if a5 then a5.Text=('%s [Beam W:%.1f]'):format(
ay.instance.Name,aO)end end end end end end end if aX and aX.Parent then if aX.
Transparency<0.85 then aZ=true end if aZ and aX.Transparency>=0.85 then if a_
then a_:Disconnect()a_=nil end pcall(function()corridor:Destroy()end)return end
local a0=aX.Position local a1=(a0-aH):Dot(aV)local a2=math.clamp(a1-3,0,aU)local
a3=aU-a2 if a3<=2 then if a_ then a_:Disconnect()a_=nil end pcall(function()
corridor:Destroy()end)return end local a4=aH+aV*a2 local a5=a4+aV*(a3/2)corridor
.Size=Vector3.new(aO,0.4,a3)corridor.CFrame=CFrame.lookAt(a5,a5+aV)end end)aA.
heartbeatConn=a_ end elseif aE then local aG=Instance.new'SelectionBox'aG.Name=
'SmartDodge_SelectionBox_Model'aG.Color3=aB aG.SurfaceColor3=aB aG.
SurfaceTransparency=ak aG.LineThickness=aj aG.Adornee=ay.instance aG.Visible=af
aG.Parent=ay.instance table.insert(aA.boxes,aG)if ay.isCustomHazard and not ay.
isTelegraph then local aH=au(aG)if aH and aH>0 then ax(ay,aH)end end local aH=ay
.instance.PrimaryPart or next(ay.activeParts)if not aH then for aI,aJ in ipairs(
ay.instance:GetDescendants())do if aJ:IsA'BasePart'then aH=aJ break end end end
local aI=ay.name:lower()local aJ=aI:find('debug',1,true)or ay.name:sub(1,3)==
'TM_'or aI:find('smartdodge',1,true)or aI:find('smartautoplay',1,true)or aI:
find('marker',1,true)if aH and not aJ and not ay.isTelegraph and#aA.nameTags==0
then local aK=Instance.new'BillboardGui'aK.Name='SmartDodge_NameTag_Model'aK.
Size=UDim2.fromOffset(200,24)aK.StudsOffset=Vector3.new(0,2.5,0)aK.AlwaysOnTop=
true aK.Enabled=ag aK.Adornee=aH local aL=Instance.new'TextLabel'aL.Size=UDim2.
fromScale(1,1)aL.BackgroundTransparency=1 aL.Font=Enum.Font.GothamBold aL.
TextSize=12 aL.TextColor3=am aL.TextStrokeTransparency=0 aL.TextStrokeColor3=
Color3.fromRGB(0,0,0)aL.Text=('%s(Model)'):format(ay.instance.Name)aL.Parent=aK
aK.Parent=aH table.insert(aA.nameTags,aK)end else for aG in pairs(ay.activeParts
)do ae.AttachPartVisual(ay,aG)end end local aG=ay.name:lower():find
'seekingspike'~=nil or ay.name:lower():find'bigspike'~=nil if aG and not aA.
corridorPart then local aH,aI=ay.beamOrigin or ay.position,false for aJ,aK in
pairs(ap)do if aJ~=ay and(aJ.isTelegraph or aJ.name:lower():find'beam'~=nil)and
aK.corridorPart and aK.corridorPart.Parent then local aL=aK.telegraphStartPos or
(aJ.beamOrigin or aJ.position)if(Vector3.new(aL.X-aH.X,0,aL.Z-aH.Z)).Magnitude<
25 then aA.corridorPart=aK.corridorPart aA.corridorBox=aK.corridorBox aA.
corridorNameTag=aK.corridorNameTag aA.telegraphStartPos=aL aK.companionHazard=ay
aK.companionPart=(ay.instance and ay.instance:IsA'BasePart')and ay.instance or
next(ay.activeParts)aI=true break end end end if not aI then local aJ=ay.name:
lower():find'bigspike'~=nil local aK,aL,aM,aN=aJ and 40 or 16,ay.maxLookahead or
ay.telegraphLength or(aJ and 140 or 120),ay.forward2D or Vector3.new(0,0,-1),ay.
beamOrigin or ay.position local aO=aN+aM*aL local aP,aQ=CFrame.lookAt(aN,aO)*
CFrame.new(0,0,-aL/2),Instance.new'Part'aQ.Name='SmartDodge_TelegraphCorridor'aQ
.Transparency=1 aQ.Anchored=true aQ.CanCollide=false aQ.CanQuery=false aQ.
CanTouch=false aQ.Size=Vector3.new(aK,0.4,aL)aQ.CFrame=aP aQ.Parent=ab aA.
corridorPart=aQ aA.telegraphStartPos=aN local aR=Instance.new'SelectionBox'aR.
Name='SmartDodge_SelectionBox_Telegraph'aR.Color3=an aR.SurfaceColor3=an aR.
SurfaceTransparency=ak aR.LineThickness=aj aR.Adornee=aQ aR.Visible=af aR.Parent
=aQ aA.corridorBox=aR table.insert(aA.boxes,aR)end end if ay.
hasSyntheticTelegraph and not ay.isTelegraph then local aH=(ay.instance and ay.
instance:IsA'BasePart')and ay.instance or next(ay.activeParts)if aH and aH:IsA
'BasePart'then local aI,aJ=ay.telegraphLength or 40,6 if ay.instance and ay.
instance:IsA'Model'then local aK,aL=ay.instance:GetBoundingBox()aJ=math.max(aL.X
,aL.Y,aL.Z)elseif aA.boxes and#aA.boxes>0 then local aK=au(aA.boxes[1])if aK and
aK>0 then aJ=aK end else aJ=math.max(aH.Size.X,aH.Size.Z)end if aJ<3 then aJ=5
end local aK,aL=(ay.instance and ay.instance:IsA'Model'and ay.instance.
PrimaryPart)and ay.instance.PrimaryPart.Position or aH.Position,(ay.instance and
ay.instance:IsA'Model'and ay.instance.PrimaryPart)and ay.instance.PrimaryPart.
CFrame.LookVector or aH.CFrame.LookVector local aM=Vector3.new(aL.X,0,aL.Z)if ay
.isHomingToPlayer then local aN=aa.LocalPlayer local aO=aN and aN.Character
local aP=aO and(aO:FindFirstChild'HumanoidRootPart'or aO:FindFirstChild'Torso')
if aP and aP:IsA'BasePart'then local aQ=Vector3.new(aP.Position.X-aK.X,0,aP.
Position.Z-aK.Z)if aQ.Magnitude>0.3 then aM=aQ.Unit end end elseif aM.Magnitude>
0.001 then aM=aM.Unit else aM=Vector3.new(0,0,-1)end local aN,aO,aP=aK,aK+aM*((
aI/2)-1),Instance.new'Part'aP.Name='SmartDodge_MovingTrajectory'aP.Transparency=
1 aP.Anchored=true aP.CanCollide=false aP.CanQuery=false aP.CanTouch=false aP.
Size=Vector3.new(aJ,0.4,aI)aP.CFrame=CFrame.lookAt(aO,aO+aM)aP.Parent=ab aA.
corridorPart=aP local aQ=Instance.new'SelectionBox'aQ.Name=
'SmartDodge_SelectionBox_Trajectory'aQ.Color3=an aQ.SurfaceColor3=an aQ.
SurfaceTransparency=ak aQ.LineThickness=aj aQ.Adornee=aP aQ.Visible=af aQ.Parent
=aP table.insert(aA.boxes,aQ)local aR aR=ac.Heartbeat:Connect(function()if not
aP or not aP.Parent then if aR then aR:Disconnect()aR=nil end return end if not
aH or not aH.Parent or aH.Transparency>=0.85 then if aR then aR:Disconnect()aR=
nil end pcall(function()aP:Destroy()end)return end local aS,aT=(ay.instance and
ay.instance:IsA'Model'and ay.instance.PrimaryPart)and ay.instance.PrimaryPart.
Position or aH.Position,ay.telegraphLength or aI if ay.isHomingToPlayer then
local aU=aa.LocalPlayer local aV=aU and aU.Character local aW=aV and(aV:
FindFirstChild'HumanoidRootPart'or aV:FindFirstChild'Torso')if aW and aW:IsA
'BasePart'then local aX=Vector3.new(aW.Position.X-aS.X,0,aW.Position.Z-aS.Z)
local aY=aX.Magnitude if aY>0.3 then aM=aX.Unit end aT=ay.telegraphLength or aI
else local aX=aS-aN local aY=Vector3.new(aX.X,0,aX.Z)if aY.Magnitude>0.05 then
aM=aY.Unit end end else local aU=aS-aN local aV=Vector3.new(aU.X,0,aU.Z)if aV.
Magnitude>0.05 then aM=aV.Unit end end aN=aS local aU=aS+aM*((aT/2)-1)aP.Size=
Vector3.new(aJ,0.4,aT)aP.CFrame=CFrame.lookAt(aU,aU+aM)end)aA.heartbeatConn=aR
end end end function ae.OnHazardPartAdded(ay,az)local aA=ap[ay]if not aA then
return end local aB=at(ay)if ai and ay.instance and ay.instance:IsA'Model'and
not ay.neverUnify then if aA.isUnified then return elseif aB>=2 then ae.
RebuildHazardVisuals(ay)return end end ae.AttachPartVisual(ay,az)end function ae
.RemoveHazardPart(ay,az)local aA=ap[ay]if not aA then return end if aA.isUnified
then local aB=at(ay)if aB==1 then ae.RebuildHazardVisuals(ay)end return end if
aA.boxes then for aB=#aA.boxes,1,-1 do local aC=aA.boxes[aB]if aC.Adornee==az or
aC.Parent==az then pcall(function()aC:Destroy()end)table.remove(aA.boxes,aB)end
end end if aA.nameTags then for aB=#aA.nameTags,1,-1 do local aC=aA.nameTags[aB]
if aC.Adornee==az or aC.Parent==az then pcall(function()aC:Destroy()end)table.
remove(aA.nameTags,aB)end end end end function ae.RemoveHazardVisuals(ay)local
az=ap[ay]if not az then return end if ay.isTelegraph and az.corridorPart and az.
corridorPart.Parent then local aA=az.companionHazard if not aA or not ap[aA]then
local aB=az.telegraphStartPos or(ay.beamOrigin or ay.position)for aC in pairs(ap
)do if aC~=ay and(aC.name:lower():find'spike'or(aC.instance and aC.instance.Name
:lower():find'spike'))then local aD=aC.beamOrigin or aC.position if(Vector3.new(
aD.X-aB.X,0,aD.Z-aB.Z)).Magnitude<30 then aA=aC break end end end end if aA and
ap[aA]then local aB=ap[aA]aB.corridorPart=az.corridorPart aB.corridorBox=az.
corridorBox aB.corridorNameTag=az.corridorNameTag aB.telegraphStartPos=az.
telegraphStartPos if az.corridorBox and not table.find(aB.boxes,az.corridorBox)
then table.insert(aB.boxes,az.corridorBox)end if az.corridorNameTag and not
table.find(aB.nameTags,az.corridorNameTag)then table.insert(aB.nameTags,az.
corridorNameTag)end if az.corridorBox then local aC=table.find(az.boxes,az.
corridorBox)if aC then table.remove(az.boxes,aC)end end if az.corridorNameTag
then local aC=table.find(az.nameTags,az.corridorNameTag)if aC then table.remove(
az.nameTags,aC)end end az.corridorPart=nil az.corridorBox=nil az.corridorNameTag
=nil az.heartbeatConn=nil end end local aA=ay.name:lower():find'spike'~=nil or(
ay.instance and ay.instance.Name:lower():find'spike'~=nil)if aA and az.
corridorPart and az.corridorPart.Parent then for aB,aC in pairs(ap)do if aB~=ay
and aB.isTelegraph and aC.corridorPart==az.corridorPart then if az.corridorBox
then local aD=table.find(az.boxes,az.corridorBox)if aD then table.remove(az.
boxes,aD)end end if az.corridorNameTag then local aD=table.find(az.nameTags,az.
corridorNameTag)if aD then table.remove(az.nameTags,aD)end end az.corridorPart=
nil az.corridorBox=nil az.corridorNameTag=nil break end end end if az.
heartbeatConn then pcall(function()az.heartbeatConn:Disconnect()end)az.
heartbeatConn=nil end if az.boxes then for aB,aC in ipairs(az.boxes)do pcall(
function()aC:Destroy()end)end end if az.nameTags then for aB,aC in ipairs(az.
nameTags)do pcall(function()aC:Destroy()end)end end if az.corridorPart then
pcall(function()az.corridorPart:Destroy()end)az.corridorPart=nil end ap[ay]=nil
end function ae.UpdateCorridorLength(ay,az)local aA=ap[ay]if not aA or not aA.
corridorPart or not aA.corridorPart.Parent then return end local aB,aC,aD=aA.
corridorPart,aA.telegraphStartPos or(ay.beamOrigin or ay.position),ay.forward2D
or Vector3.new(0,0,-1)local aE=aC+aD*az local aF=CFrame.lookAt(aC,aE)*CFrame.
new(0,0,-az/2)aB.Size=Vector3.new(aB.Size.X,aB.Size.Y,az)aB.CFrame=aF end
function ae.ClearAll()for ay,az in pairs(ap)do if az.heartbeatConn then pcall(
function()az.heartbeatConn:Disconnect()end)az.heartbeatConn=nil end if az.boxes
then for aA,aB in ipairs(az.boxes)do pcall(function()aB:Destroy()end)end end if
az.nameTags then for aA,aB in ipairs(az.nameTags)do pcall(function()aB:Destroy()
end)end end if az.corridorPart then pcall(function()az.corridorPart:Destroy()end
)end end table.clear(ap)end function ae.RebuildHazardVisuals(ay)ae.
RemoveHazardVisuals(ay)ae.AttachHazardVisuals(ay)end function ae.RebuildAll()
local ay={}for az in pairs(ap)do table.insert(ay,az)end for az,aA in ipairs(ay)
do ae.RemoveHazardVisuals(aA)ae.AttachHazardVisuals(aA)end end local ay,az,aA,aB
=true,Color3.fromRGB(0,240,255),(Color3.fromRGB(255,50,50))function ae.
SetHitboxVisualEnabled(aC)ay=(aC==true)if not ay and aB then aB.Parent=nil end
end function ae.IsHitboxVisualEnabled()return ay end local aC=function()if aB
and aB.Parent then return aB end local aC=Instance.new'Part'aC.Name=
'SmartDodge_PlayerHitboxCircle'aC.Shape=Enum.PartType.Cylinder aC.Material=Enum.
Material.Neon aC.Transparency=0.55 aC.Anchored=true aC.CanCollide=false aC.
CanQuery=false aC.CanTouch=false aC.CastShadow=false aC.Color=az aB=aC return aC
end function ae.UpdatePlayerHitboxVisual(aD,aE,aF,aG)if not ay or not aD then if
aB then aB.Parent=nil end return end local aH,aI=aC(),aF or 1.8 local aJ=math.
max(0.4,aI*2)aH.Size=Vector3.new(0.12,aJ,aJ)aH.Color=(aE==true)and aA or az
local aK=(aG~=nil)and aG or(aD.Y-2.85)aH.CFrame=CFrame.new(aD.X,aK,aD.Z)*CFrame.
Angles(0,0,math.rad(90))aH.Parent=ab end local aD,aE,aF,aG,aH,aI,aJ,aK,aL=true,
Color3.fromRGB(255,50,50),Color3.fromRGB(0,255,100),Color3.fromRGB(0,180,255),
Color3.fromRGB(255,140,40),{}function ae.SetRayVisualsEnabled(aM)aD=(aM==true)if
not aD then ae.ClearRayVisuals()end end function ae.IsRayVisualsEnabled()return
aD end local aM,aN=function(aM)if aI[aM]then return aI[aM]end local aN=Instance.
new'Part'aN.Name='SmartDodge_RayBeam_'..aM aN.Shape=Enum.PartType.Cylinder aN.
Material=Enum.Material.Neon aN.Transparency=0.35 aN.Anchored=true aN.CanCollide=
false aN.CanTouch=false aN.CanQuery=false aN.CastShadow=false local aO=Instance.
new'Part'aO.Name='SmartDodge_RayTip_'..aM aO.Shape=Enum.PartType.Ball aO.
Material=Enum.Material.Neon aO.Size=Vector3.new(0.85,0.85,0.85)aO.Transparency=
0.2 aO.Anchored=true aO.CanCollide=false aO.CanTouch=false aO.CanQuery=false aO.
CastShadow=false local aP={cylinder=aN,arrowTip=aO}aI[aM]=aP return aP end,
function()if aJ and aK and aL then return aJ,aK,aL end local aM=Instance.new
'Part'aM.Name='SmartDodge_SafeMarkerBall'aM.Shape=Enum.PartType.Ball aM.Size=
Vector3.new(2.4,2.4,2.4)aM.Color=aF aM.Material=Enum.Material.Neon aM.
Transparency=0.15 aM.Anchored=true aM.CanCollide=false aM.CanTouch=false aM.
CanQuery=false aM.CastShadow=false local aN=Instance.new'SelectionBox'aN.Name=
'SafeBox'aN.Color3=Color3.fromRGB(255,255,255)aN.SurfaceColor3=aF aN.
SurfaceTransparency=0.65 aN.LineThickness=0.09 aN.Adornee=aM aN.Parent=aM local
aO=Instance.new'Part'aO.Name='SmartDodge_SafeBeaconPillar'aO.Shape=Enum.PartType
.Cylinder aO.Size=Vector3.new(18,0.6,0.6)aO.Color=aF aO.Material=Enum.Material.
Neon aO.Transparency=0.45 aO.Anchored=true aO.CanCollide=false aO.CanTouch=false
aO.CanQuery=false aO.CastShadow=false aJ=aM aK=aO aL=aN return aM,aO,aN end
function ae.UpdateRayVisuals(aO,aP)if not aD or not aO or#aO==0 then ae.
ClearRayVisuals()return end for aQ,aR in ipairs(aO)do local aS,aT,aU,aV=aM(aQ),
aR.startPos,aR.endPos,aR.status or'Blocked'local aW=(aU-aT).Magnitude if aW<0.5
then aW=0.5 end local aX,aY,aZ,a_=aE,0.22,0.75,0.45 if aV=='Safe'then aX=aF aY=
0.42 aZ=1.4 a_=0.15 elseif aV=='Candidate'then aX=aG aY=0.28 aZ=0.9 a_=0.35
elseif aV=='Dead'then aX=aH aY=0.18 aZ=0.6 a_=0.6 end local a0=(aT+aU)/2 aS.
cylinder.Size=Vector3.new(aW,aY,aY)aS.cylinder.Color=aX aS.cylinder.Transparency
=a_ aS.cylinder.CFrame=CFrame.lookAt(a0,aU)*CFrame.Angles(0,math.rad(90),0)aS.
cylinder.Parent=ab aS.arrowTip.Size=Vector3.new(aZ,aZ,aZ)aS.arrowTip.Color=aX aS
.arrowTip.CFrame=CFrame.new(aU)aS.arrowTip.Parent=ab end for aQ=#aO+1,#aI do
local aR=aI[aQ]if aR.cylinder.Parent then aR.cylinder.Parent=nil end if aR.
arrowTip.Parent then aR.arrowTip.Parent=nil end end if aP then local aQ,aR=aN()
aQ.CFrame=CFrame.new(aP.X,aP.Y+1.2,aP.Z)aQ.Parent=ab aR.CFrame=CFrame.new(aP.X,
aP.Y+9,aP.Z)*CFrame.Angles(0,0,math.rad(90))aR.Parent=ab else if aJ and aJ.
Parent then aJ.Parent=nil end if aK and aK.Parent then aK.Parent=nil end end end
function ae.ClearRayVisuals()for aO,aP in ipairs(aI)do if aP.cylinder.Parent
then aP.cylinder.Parent=nil end if aP.arrowTip.Parent then aP.arrowTip.Parent=
nil end end if aJ and aJ.Parent then aJ.Parent=nil end if aK and aK.Parent then
aK.Parent=nil end end return ae end function a.i()local aa,ab,ac,ad=game:
GetService'Players',game:GetService'UserInputService',game:GetService
'RunService',game:GetService'VirtualInputManager'local ae=aa.LocalPlayer if not
ae then local af=os.clock()+5 repeat ae=aa.LocalPlayer if ae then break end task
.wait(0.1)until os.clock()>af end return{Workspace=workspace,Players=aa,
UserInputService=ab,RunService=ac,VirtualInputManager=ad,player=ae}end function
a.j()local aa,ab=a.load'i',a.load'b'local ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao
,ap,aq,ar,as,at,au,av,aw,ax,ay=aa.player,0.05,'enemyProjectiles',0.5,{},false,16
,16,true,false,false,{},0,{},0,{},{},{},{},{},{},0,{}local az,aA,aB,aC,aD,aE,aF,
aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP=function()for az=#ay,1,-1 do pcall(ay[az])end end,
{},'unknown',true,{},{},{},0,2,false local aQ=function(aQ)if aQ then table.
insert(aF,aQ)end return aQ end function ag.OnRespawn(aR)table.insert(aE,aR)end
function ag.GetLastRespawnTime()return aG end function ag.
GetRespawnProtectionDuration()return aH end function ag.
SetRespawnProtectionDuration(aR)if type(aR)=='number'and aR>=0 then aH=aR end
end function ag.GetRespawnProtectionRemaining()if aG==0 then return 0 end local
aR=os.clock()-aG local aS=aH-aR return math.max(0,aS)end function ag.
IsJustRespawned(aR)local aS=aR or aH if aG==0 then return false end return(os.
clock()-aG)<=aS end function ag.WasDead()return aI end function ag.IsDead()local
aR=ac and ac.Character if not aR or not aR.Parent then return true end local aS=
aR:FindFirstChildOfClass'Humanoid'if not aS or aS.Health<=0 then return true end
return false end function ag.IsInvulnerable()local aR=ag.
GetRespawnProtectionRemaining()if aR<=0 then return false,nil end local aS=(ac
and ac.Character)or(humanoid and humanoid.Parent)local aT=humanoid or(aS and aS:
FindFirstChildOfClass'Humanoid')if aT and aT.Health<=0 then return false,nil end
return true,('Respawn (%.1fs)'):format(aR)end local aR=function(aR)if not aR or
not aR:IsA'Model'then return nil end local aS=aR:FindFirstChild
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
Connect(function(a3)if a3<=0 then aI=true elseif aI and a3>0 then aI=false aG=os
.clock()for a4,a5 in ipairs(aE)do pcall(a5)end end end))end local a1=function()
if not ab.IsActive()then return end if not ak then return end if not humanoid or
not humanoid.Parent or humanoid.Health<=0 or humanoid.Sit then return end if not
rootPart or not rootPart.Parent then local a1=ac and ac.Character rootPart=a1
and a1:FindFirstChild'HumanoidRootPart'if not rootPart then return end end if
rootPart.Anchored then return end local a1,a2=humanoid.MoveDirection,rootPart.
AssemblyLinearVelocity if a1.Magnitude>0.05 then local a3=ah and math.max(ai,
humanoid.WalkSpeed)or humanoid.WalkSpeed rootPart.AssemblyLinearVelocity=Vector3
.new(a1.X*a3,a2.Y,a1.Z*a3)end end if aa.RunService then local a2=aa.RunService.
PreSimulation or aa.RunService.Heartbeat if a2 then aQ(a2:Connect(a1))end end
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
SetHumanoid(a2)a0()end end)end if ac then aQ(ac.CharacterAdded:Connect(function(
a2)local a3,a4=pcall(function()if not a2 then return end aI=false aG=os.clock()
ag.SetHumanoid(a2)a0()for a3,a4 in ipairs(aE)do pcall(a4)end end)if not a3 then
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
for a9,b in ipairs(a8:GetDescendants())do if b:IsA'Model'then aX(b)end end end
end aK()end)if not a7 then warn'[EnemyTracker] rescan error'end end end)function
ag.IsBossActive()return am end function ag.OnBossActiveChanged(a6)if type(a6)~=
'function'then return function()end end table.insert(an,a6)return function()for
a7,a8 in ipairs(an)do if a8==a6 then table.remove(an,a7)break end end end end
function ag.GetCurrentBossIndex()return ao end function ag.GetCombatTargetKey()
if not am then return'Mob'end local a6=math.clamp(ao,1,3)return'Boss'..tostring(
a6)end function ag.ResetBossIndex()ao=0 for a6=#ap,1,-1 do pcall(ap[a6],ao)end
end function ag.OnBossIndexChanged(a6)if type(a6)~='function'then return
function()end end table.insert(ap,a6)return function()for a7,a8 in ipairs(ap)do
if a8==a6 then table.remove(ap,a7)break end end end end local a6=function(a6)if
type(a6)~='string'then return 0 end local a7=string.match(a6,'^room(%d+)$')if
not a7 then return 0 end return tonumber(a7)or 0 end local a7=function()if not
dungeon then return 0 end for a7,a8 in pairs(at)do if a8 and a8.Room then local
a9=a6(a8.Room.Name)if a9>0 then return a9 end end end return 0 end aN=function()
local a8=a7()if a8==aq then return end aq=a8 for a9=#ar,1,-1 do pcall(ar[a9],aq)
end end function ag.GetCurrentRoomIndex()return aq end function ag.
OnRoomIndexChanged(a8)if type(a8)~='function'then return function()end end table
.insert(ar,a8)return function()for a9,b in ipairs(ar)do if b==a8 then table.
remove(ar,a9)break end end end end function ag.GetCurrentDungeonName()return aJ
end function ag.OnDungeonNameChanged(a8)if type(a8)~='function'then return
function()end end table.insert(aA,a8)return function()for a9,b in ipairs(aA)do
if b==a8 then table.remove(aA,a9)break end end end end function ag.IsInLobby()
return aC end function ag.OnLobbyChanged(a8)if type(a8)~='function'then return
function()end end table.insert(aD,a8)return function()for a9,b in ipairs(aD)do
if b==a8 then table.remove(aD,a9)break end end end end local a8,a9=function(a8)
if am==a8 then return end am=a8 if a8 then ao+=1 for a9=#ap,1,-1 do pcall(ap[a9]
,ao)end end for a9=#an,1,-1 do pcall(an[a9],am)end end local function b()if not
ac then return end local ba=ac:FindFirstChild'PlayerGui'if not ba then a9=nil
a8(false)return end local bb=ba:FindFirstChild('bossHealth',true)if bb then if
bb~=a9 then a9=bb if a9:IsA'ScreenGui'then aQ(a9:GetPropertyChangedSignal
'Enabled':Connect(b))elseif a9:IsA'GuiObject'then aQ(a9:GetPropertyChangedSignal
'Visible':Connect(b))end end local bc=if bb:IsA'ScreenGui'then bb.Enabled elseif
bb:IsA'GuiObject'then bb.Visible else true a8(bc)else a9=nil a8(false)end end
task.spawn(function()if not ac then return end local ba=ac:WaitForChild(
'PlayerGui',30)if not ba then return end aQ(ba.DescendantAdded:Connect(b))aQ(ba.
DescendantRemoving:Connect(b))b()while ab.IsActive()and task.wait(0.5)do b()end
end)ab.Register(function()if aO then aO:Disconnect()aO=nil end for ba,bb in
ipairs(aF)do pcall(function()bb:Disconnect()end)end table.clear(aF)aM()end)
return ag end function a.k()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,
ap,aq,ar,as=game:GetService'Workspace',game:GetService'Players',game:GetService
'RunService',game:GetService'ReplicatedStorage',a.load'b',a.load'f',a.load'g',a.
load'h',a.load'j',{},false,false,{},0,{},{},{},{},0.85 local at,au=(ai.
IsBossActive and ai.IsBossActive())and os.clock()or 0,{firstbossseekingspikes={
name='firstBossSeekingSpikes',isTelegraph=false,hasSyntheticTelegraph=false,
telegraphLength=120,width=16},firstbossbigspike={name='firstBossBigSpike',
isTelegraph=false,hasSyntheticTelegraph=false,telegraphLength=140,width=40},
firstbossbeampart={name='firstBossBeamPart',isTelegraph=true,telegraphLength=140
},firstbosslaserprecast={name='firstBossLaserPrecast',isTelegraph=true,
targetChildName='precast',telegraphLength=140,width=24},firstbossattachpart={
name='firstBossAttachPart',isTelegraph=true,telegraphLength=140,width=24},
firstbosssundiskbeampart={name='firstBossSunDiskBeamPart',isTelegraph=true,
telegraphLength=140,width=20},firstbossblindingblastbeam={name=
'firstBossBlindingBlastBeam',isTelegraph=true,telegraphLength=140,width=40},
firstbossskyshot={name='firstBossSkyShot',isTelegraph=false,
hasSyntheticTelegraph=true,telegraphLength=60,width=20},firstbosscrisscross={
name='firstBossCrissCross',isTelegraph=false,hasSyntheticTelegraph=true,
telegraphLength=28,width=8},smallicespikes={name='smallIceSpikes',isTelegraph=
false,targetChildName='precast'},mediumicespikes={name='mediumIceSpikes',
isTelegraph=false,targetChildName='precast'},largeicespikes={name=
'largeIceSpikes',isTelegraph=false,targetChildName='precast'},icespikes={name=
'iceSpikes',isTelegraph=false,targetChildName='precast'},thirdbossmissile={name=
'thirdBossMissile',isTelegraph=false,hasSyntheticTelegraph=true,telegraphLength=
40},thirdbossmultirings={name='thirdBossMultiRings',isTelegraph=false,
targetChildContains='ring',neverUnify=true,isMultiWave=true},
secondbossmovingbeam={name='secondBossMovingBeam',isTelegraph=false,
hasSyntheticTelegraph=true,telegraphLength=40},thirdbossbouncingorb={name=
'thirdBossBouncingOrb',isTelegraph=false,hasSyntheticTelegraph=true,
telegraphLength=28},secondbossyelloworb={name='secondBossYellowOrb',isTelegraph=
false,hasSyntheticTelegraph=false},secondbossredorb={name='secondBossRedOrb',
isTelegraph=false,hasSyntheticTelegraph=false},secondbossgreenorb={name=
'secondBossGreenOrb',isTelegraph=false,hasSyntheticTelegraph=false},
secondbosscriclehitbox={name='secondBossCricleHitbox',isTelegraph=false,
hasSyntheticTelegraph=true,telegraphLength=95,dangerRadius=8,isExpandingCone=
true,expansionRate=0.25},secondbosscirclehitbox={name='secondBossCircleHitbox',
isTelegraph=false,hasSyntheticTelegraph=true,telegraphLength=95,dangerRadius=8,
isExpandingCone=true,expansionRate=0.25}}local av,aw,ax,ay=function(av)if not av
then return nil end local aw=av.Name:lower():gsub('%s+','')local ax=au[aw]if ax
then return ax end if aw:find'seekingspike'then return au.firstbossseekingspikes
end if aw:find'bigspike'then return au.firstbossbigspike end if aw:find
'beampart'or aw:find'firstbossbeam'then return au.firstbossbeampart end if aw:
find'laserprecast'or(aw=='model'and av:FindFirstChild'precast')then return au.
firstbosslaserprecast end if aw:find'attachpart'then return au.
firstbossattachpart end if aw:find'sundisk'then return au.
firstbosssundiskbeampart end if aw:find'blindingblast'then return au.
firstbossblindingblastbeam end if aw:find'skyshot'then return au.
firstbossskyshot end if aw:find'multiring'then return au.thirdbossmultirings end
if aw:find'crisscross'then return au.firstbosscrisscross end if aw:find
'movingbeam'then return au.secondbossmovingbeam end if aw:find'bouncingorb'and
not aw:find'beam'then return au.thirdbossbouncingorb end if aw:find'yelloworb'
then return au.secondbossyelloworb end if aw:find'redorb'then return au.
secondbossredorb end if aw:find'greenorb'then return au.secondbossgreenorb end
if aw:find'secondboss'and aw:find'orb'and not aw:find'explosion'then return au.
secondbossyelloworb end if aw:find'cricle'or aw:find'circlehitbox'then return au
.secondbosscriclehitbox end if av.Parent and av.Parent~=aa then local ay=av.
Parent.Name:lower():gsub('%s+','')local az=au[ay]if az then return az end if ay:
find'seekingspike'then return au.firstbossseekingspikes end if ay:find'bigspike'
then return au.firstbossbigspike end if ay:find'beampart'or ay:find
'firstbossbeam'then return au.firstbossbeampart end if ay:find'laserprecast'then
return au.firstbosslaserprecast end if ay:find'attachpart'then return au.
firstbossattachpart end if ay:find'sundisk'then return au.
firstbosssundiskbeampart end if ay:find'blindingblast'then return au.
firstbossblindingblastbeam end if ay:find'skyshot'then return au.
firstbossskyshot end if ay:find'multiring'then return au.thirdbossmultirings end
if ay:find'crisscross'then return au.firstbosscrisscross end if ay:find
'movingbeam'then return au.secondbossmovingbeam end if ay:find'bouncingorb'and
not ay:find'beam'then return au.thirdbossbouncingorb end if ay:find'yelloworb'
then return au.secondbossyelloworb end if ay:find'redorb'then return au.
secondbossredorb end if ay:find'greenorb'then return au.secondbossgreenorb end
if ay:find'secondboss'and ay:find'orb'and not ay:find'explosion'then return au.
secondbossyelloworb end if ay:find'cricle'or ay:find'circlehitbox'then return au
.secondbosscriclehitbox end end return nil end,function(av,aw)local ax,ay={},
function(ax)if not ax or not ax:IsA'BasePart'or ag.IsIgnoredPart(ax)then return
false end local ay=ax.Name:lower()if ay:find('debug',1,true)or ax.Name:sub(1,3)
=='TM_'or ay:find('smartdodge',1,true)or ay:find('smartautoplay',1,true)then
return false end if aw then return ax.Parent~=nil end return ax.Material==Enum.
Material.Neon and ax.Transparency<as end if av:IsA'BasePart'then if ay(av)then
ax[av]=true end elseif av:IsA'Model'then if aw and(aw.targetChildName or aw.
targetChildContains)then local az,aA=aw.targetChildName and aw.targetChildName:
lower(),aw.targetChildContains and aw.targetChildContains:lower()for aB,aC in
ipairs(av:GetDescendants())do if aC:IsA'BasePart'and aC.Parent and not ag.
IsIgnoredPart(aC)then local aD,aE=aC.Name:lower(),false if az and aD==az then aE
=true elseif aA and aD:find(aA)then aE=true end if aE then ax[aC]=true end end
end return ax end for az,aA in ipairs(av:GetDescendants())do if ay(aA)then ax[aA
]=true end end end return ax end,function(av,aw)local ax=av.Name:lower():gsub(
'%s+','')local ay=(aw and(aw.isTelegraph or aw.hasSyntheticTelegraph))or ax:find
'beampart'~=nil or ax:find'bigspike'~=nil or ax:find'seekingspike'~=nil if not
ay then return nil,nil,nil,nil end local az=Vector3.zero if av:IsA'BasePart'then
az=av.Position elseif av:IsA'Model'then local aA=av.PrimaryPart or av:
FindFirstChildWhichIsA'BasePart'az=aA and aA.Position or av:GetPivot().Position
end local aA,aB,aC=(av:FindFirstChild('Attachment2',true))if aA and aA:IsA
'Attachment'then local aD=aA.WorldPosition-az local aE=Vector3.new(aD.X,0,aD.Z)
if aE.Magnitude>0.5 then aB=aE.Unit aC=aE.Magnitude end end if not aB then local
aD=av:FindFirstChildWhichIsA('Beam',true)if aD and aD.Attachment0 and aD.
Attachment1 then local aE=aD.Attachment1.WorldPosition-aD.Attachment0.
WorldPosition local aF=Vector3.new(aE.X,0,aE.Z)if aF.Magnitude>0.5 then aB=aF.
Unit aC=aF.Magnitude end end end if not aB and not ax:find'crisscross'then for
aD,aE in pairs(am)do if aE and aE.forward2D and aE.instance~=av then local aF=aE
.isTelegraph or(aE.name and aE.name:lower():find'beam'~=nil)if aF then local aG=
aE.beamOrigin or aE.position local aH=(Vector3.new(aG.X-az.X,0,aG.Z-az.Z)).
Magnitude if aH<=25 then aB=aE.forward2D aC=aE.maxLookahead az=aG break end end
end end end if not aB and not ax:find'crisscross'then for aD,aE in ipairs(aa:
GetChildren())do if aE~=av and aE:IsA'BasePart'and aE.Name:lower():find
'beampart'then local aF=(Vector3.new(aE.Position.X-az.X,0,aE.Position.Z-az.Z)).
Magnitude if aF<=25 then local aG=aE:FindFirstChild('Attachment2',true)if aG and
aG:IsA'Attachment'then local aH=aG.WorldPosition-aE.Position local aI=Vector3.
new(aH.X,0,aH.Z)if aI.Magnitude>0.5 then aB=aI.Unit aC=aI.Magnitude az=aE.
Position break end end end end end end if aw and aw.isExpandingCone then local
aD=ab.LocalPlayer local aE=aD and aD.Character and aD.Character:FindFirstChild
'HumanoidRootPart'local aF=aE and aE.Position if aF then local aG=Vector3.new(aF
.X-az.X,0,aF.Z-az.Z)local aH=aG.Magnitude if aH>0.3 then aB=aG.Unit aC=math.
clamp(aH+35,85,160)end end end if not aB then if not ax:find'crisscross'then
local aD=(av:IsA'BasePart'and av.CFrame.LookVector)or(av:IsA'Model'and av:
GetPivot().LookVector)if aD then local aE=Vector3.new(aD.X,0,aD.Z)if aE.
Magnitude>0.001 then aB=aE.Unit end end end end if not aB and not ax:find
'crisscross'then aB=Vector3.new(0,0,-1)end local aD,aE=ax:find'seekingspike'~=
nil,ax:find'bigspike'~=nil if not aD and not aE and ax:find'beampart'then local
aF=av:FindFirstChildWhichIsA('Beam',true)if aF and aF.Width0 and aF.Width0>=20
then aE=true else for aG,aH in pairs(am)do local aI,aJ=aH.cleanName:lower(),aH.
beamOrigin or aH.position if(Vector3.new(aJ.X-az.X,0,aJ.Z-az.Z)).Magnitude<25
then if aI:find'bigspike'then aE=true break elseif aI:find'seekingspike'then aD=
true break end end end if not aE and not aD then for aG,aH in ipairs(aa:
GetChildren())do if aH~=av and aH:IsA'BasePart'then local aI=aH.Name:lower()if
aI:find'bigspike'and(aH.Position-az).Magnitude<25 then aE=true break elseif aI:
find'seekingspike'and(aH.Position-az).Magnitude<25 then aD=true break end end
end end end end local aF,aG=20,140 if aD then aF=8 aG=(SKILL_CORRIDOR_MAP and
SKILL_CORRIDOR_MAP.boss1_seekingspikes and SKILL_CORRIDOR_MAP.
boss1_seekingspikes.currentLength)or 120 elseif aE then aF=20 aG=(
SKILL_CORRIDOR_MAP and SKILL_CORRIDOR_MAP.boss1_bigspike and SKILL_CORRIDOR_MAP.
boss1_bigspike.currentLength)or 140 elseif aw and aw.isExpandingCone then aF=aw.
dangerRadius or 8 aG=aw.telegraphLength or 95 else local aH=av:
FindFirstChildWhichIsA('Beam',true)if aH then local aI=math.max(aH.Width0 or 0,
aH.Width1 or 0)if aI>=20 then aF=aI/2 elseif aI>0 then aF=math.max(aI/2,8)end
elseif aw and aw.width then aF=aw.width/2 end end local aH=math.clamp(aC or(aw
and aw.telegraphLength)or aG,40,250)return az,aB,aF,aH end,function(av,aw)local
ax=am[av]if not ax then return end for ay,az in ipairs(ax.connections)do pcall(
function()az:Disconnect()end)end table.clear(ax.connections)ah.
RemoveHazardVisuals(ax)am[av]=nil an=math.max(0,an-1)if al then print((
'[SmartDodgeV2] \u{1f7e2} Threat Cleared: %s (%s)'):format(ax.name,aw or'Ended')
)end for ay,az in ipairs(ap)do pcall(az,ax)end for ay,az in ipairs(aq)do pcall(
az,an,ax)end end local function az(aA)if not ak or am[aA]or aA:IsA'Folder'or ag.
IsIgnoredInstance(aA)then return end local aB=aA.Name:lower()if aB:find('debug',
1,true)or aA.Name:sub(1,3)=='TM_'or aB:find('smartdodge',1,true)or aB:find(
'smartautoplay',1,true)then return end local aC=av(aA)local aD=aw(aA,aC)if next(
aD)==nil then if aA:IsA'Model'then local aE aE=aA.DescendantAdded:Connect(
function(aF)if aF:IsA'BasePart'and not ag.IsIgnoredPart(aF)then local aG=false
if aC then if aC.targetChildName then aG=(aF.Name:lower()==aC.targetChildName:
lower())elseif aC.targetChildContains then aG=(aF.Name:lower():find(aC.
targetChildContains:lower())~=nil)else aG=(aF.Parent~=nil)end else aG=(aF.
Material==Enum.Material.Neon and aF.Transparency<as)end if aG then if aE then aE
:Disconnect()aE=nil end az(aA)end end end)task.delay(1.5,function()if aE then aE
:Disconnect()aE=nil end end)end return end local aE,aF=(aC and aC.isMultiWave)==
true,Vector3.zero if aA:IsA'BasePart'then aF=aA.Position elseif aA:IsA'Model'
then local aG=aA:FindFirstChild'center'or aA:FindFirstChild'Center'or aA.
PrimaryPart aF=(aG and aG:IsA'BasePart')and aG.Position or aA:GetPivot().
Position else local aG=next(aD)aF=aG and aG.Position or Vector3.zero end local
aG=ab.LocalPlayer local aH=aG and aG.Character and aG.Character:FindFirstChild
'HumanoidRootPart'local aI,aJ=aH and(aH.Position-aF).Magnitude or 0,{}for aK in
pairs(aD)do aJ[aK]=true end if aE then for aK in pairs(aJ)do if aK.Transparency
>=as then aD[aK]=nil end end end local aK=0 for aL in pairs(aD)do aK=aK+1 end
local aL,aM=false,(ai.IsBossActive and ai.IsBossActive())or(at>0)if aM then if
aC~=nil then aL=true else local aN=aA.Name:lower()if aN:find'boss'~=nil then aL=
true elseif aA.Parent and aA.Parent~=aa and aA.Parent.Name:lower():find'boss'~=
nil then aL=true else aL=true end end end local aN={instance=aA,name=aA.Name,
cleanName=aA.Name:gsub('^%s+',''):gsub('%s+$',''),spawnTime=os.clock(),
activeParts=aD,neonCount=aK,position=aF,lastPos=aF,distanceToPlayer=aI,
connections={},isTelegraph=aC and aC.isTelegraph or false,isCustomHazard=aC~=nil
,neverUnify=aC and aC.neverUnify or false,hasSyntheticTelegraph=aC and aC.
hasSyntheticTelegraph or false,telegraphLength=aC and aC.telegraphLength or nil,
isHomingToPlayer=aC and aC.isHomingToPlayer or false,isMultiWave=aE,isBossHazard
=aL,isExpandingCone=(aC and aC.isExpandingCone)or false,expansionRate=(aC and aC
.expansionRate)or 0.25,hasLaunched=(aA:IsA'BasePart'and aA.Transparency<0.5)or
false,launchTime=(aA:IsA'BasePart'and aA.Transparency<0.5)and os.clock()or nil}
am[aA]=aN an=an+1 local aO,aP,aQ,aR=ax(aA,aC)if aP and aQ then aN.beamOrigin=aO
aN.forward2D=aP aN.dangerRadius=aQ aN.maxLookahead=aR aN.width=aQ*2 for aS,aT in
pairs(am)do if aT~=aN and(aT.name:lower():find'spike'or aT.name:lower():find
'beam')then local aU=aT.beamOrigin or aT.position if(Vector3.new(aU.X-aO.X,0,aU.
Z-aO.Z)).Magnitude<25 then if not aT.forward2D or aT.isCustomHazard then aT.
forward2D=aP aT.beamOrigin=aO aT.maxLookahead=aR end end end end end local aS=aA
:FindFirstChild('Attachment2',true)if aS and aS:IsA'Attachment'then table.
insert(aN.connections,aS:GetPropertyChangedSignal'WorldPosition':Connect(
function()local aT=aN.beamOrigin or aN.position local aU=aS.WorldPosition-aT
local aV=Vector3.new(aU.X,0,aU.Z)if aV.Magnitude>0.5 then aN.forward2D=aV.Unit
aN.maxLookahead=aV.Magnitude end end))end local aT,aU={},{}for aV in pairs(aJ)do
local aW=aV.Transparency aT[aV]=aW if aW<=0.35 then aU[aV]=true end end local aV
=function(aV)local aW=(aV.Parent~=nil)if not aW then aJ[aV]=nil aD[aV]=nil ah.
RemoveHazardPart(aN,aV)local aX=0 for aY in pairs(aJ)do aX=aX+1 end if aX==0
then ay(aA,'All parts destroyed')end return end if aE then local aX=aV.
Transparency if aX<as then if not aD[aV]then aD[aV]=true aN.neonCount=aN.
neonCount+1 ah.AttachPartVisual(aN,aV)end else if aD[aV]then aD[aV]=nil aN.
neonCount=math.max(0,aN.neonCount-1)ah.RemoveHazardPart(aN,aV)end end return end
local aX=aV.Transparency local aY=aT[aV]or aX if aX<aY then aY=aX aT[aV]=aY end
if aY<=0.35 or aX<0.5 then aU[aV]=true if not aN.hasLaunched then aN.hasLaunched
=true aN.launchTime=os.clock()end end local aZ=(aU[aV]==true)and(aX>=(aY+0.15)or
aX>=0.4)if not aN.isCustomHazard then if aX>=as or aV.Material~=Enum.Material.
Neon or aZ then aW=false end elseif aN.isTelegraph then aW=(aV.Parent~=nil)else
if(not aU[aV])and(not aN.hasLaunched)and((os.clock()-aN.spawnTime)<5)then aW=(aV
.Parent~=nil)else aW=(aV.Parent~=nil)and(aX<as)end end if not aW then aJ[aV]=nil
aD[aV]=nil ah.RemoveHazardPart(aN,aV)local a_=0 for a0 in pairs(aD)do a_=a_+1
end aN.neonCount=a_ if a_==0 then ay(aA,'Faded / Destroyed')end end end for aW
in pairs(aJ)do table.insert(aN.connections,aW:GetPropertyChangedSignal
'Transparency':Connect(function()aV(aW)end))if not aN.isCustomHazard then table.
insert(aN.connections,aW:GetPropertyChangedSignal'Material':Connect(function()
aV(aW)end))end table.insert(aN.connections,aW.AncestryChanged:Connect(function()
aV(aW)end))end if aA:IsA'Model'then table.insert(aN.connections,aA.
DescendantAdded:Connect(function(aW)if not am[aA]then return end if aW:IsA
'BasePart'and not ag.IsIgnoredPart(aW)then local aX=false if aC then if aC.
targetChildName then aX=(aW.Name:lower()==aC.targetChildName:lower())elseif aC.
targetChildContains then aX=(aW.Name:lower():find(aC.targetChildContains:lower()
)~=nil)else aX=aN.isTelegraph or(aW.Transparency<as)end else aX=(aW.Transparency
<as and aW.Material==Enum.Material.Neon)end if aX and not aJ[aW]then aJ[aW]=true
table.insert(aN.connections,aW:GetPropertyChangedSignal'Transparency':Connect(
function()aV(aW)end))if not aN.isCustomHazard then table.insert(aN.connections,
aW:GetPropertyChangedSignal'Material':Connect(function()aV(aW)end))end table.
insert(aN.connections,aW.AncestryChanged:Connect(function()aV(aW)end))aV(aW)end
end end))end table.insert(aN.connections,aA.AncestryChanged:Connect(function()if
not aA.Parent then ay(aA,'Removed from Workspace')end end))ah.
AttachHazardVisuals(aN)if al then print((
'[SmartDodgeV2] \u{1f6a8} Neon Threat Detected: %s | Neon Parts: %d | Dist: %.1f studs'
):format(aN.name,aN.neonCount,aN.distanceToPlayer))end for aW,aX in ipairs(ao)do
pcall(aX,aN)end for aW,aX in ipairs(aq)do pcall(aX,an,aN)end end local aA=
function()table.insert(ar,ac.Heartbeat:Connect(function()if not ak then return
end local aA=ab.LocalPlayer local aB=aA and aA.Character and aA.Character:
FindFirstChild'HumanoidRootPart'local aC=aB and aB.Position for aD,aE in pairs(
am)do if not aD.Parent then ay(aD,'Parent Nil')continue end if aD:IsA'BasePart'
and not aE.isTelegraph and not aE.isMultiWave then if aD.Transparency<0.5 then
aE.hasLaunched=true end local aF=aE.isCustomHazard and(not aE.hasLaunched)and((
os.clock()-aE.spawnTime)<5)if not aF and aD.Transparency>=as then if(not aE.
isCustomHazard)or aE.hasLaunched or((os.clock()-aE.spawnTime)>=5)then ay(aD,
'Faded Projectile')continue end end end local aF=(aD:IsA'BasePart'and aD.
Position)or(aD:IsA'Model'and(aD.PrimaryPart and aD.PrimaryPart.Position or aD:
GetPivot().Position))or aE.position if aE.lastPos then local aG=aF-aE.lastPos
local aH=Vector3.new(aG.X,0,aG.Z)if aH.Magnitude>0.08 then aE.forward2D=aH.Unit
end end aE.lastPos=aF aE.position=aF if aC then aE.distanceToPlayer=(aE.position
-aC).Magnitude end end end))end function aj.SetEnabled(aB)ak=aB if ak then ag.
Init()aA()for aC,aD in ipairs(aa:GetChildren())do task.spawn(az,aD)end table.
insert(ar,aa.ChildAdded:Connect(function(aC)task.spawn(az,aC)end))if al then
print'[SmartDodgeV2] Threat Detection Engine Started (Pure Neon).'end else for
aC,aD in ipairs(ar)do pcall(function()aD:Disconnect()end)end table.clear(ar)for
aC in pairs(am)do ay(aC,'Detector Disabled')end ah.ClearAll()ag.Cleanup()if al
then print'[SmartDodgeV2] Threat Detection Engine Stopped.'end end end function
aj.IsEnabled()return ak end function aj.SetLogHazards(aB)al=aB end function aj.
IsLogHazards()return al end function aj.GetActiveHazards()return am end function
aj.GetActiveBossOrb()for aB,aC in pairs(am)do if aB and aB.Parent then local aD,
aE=((aB.Name or''):lower():gsub('%s+',''))if aD:find'yelloworb'then aE='yellow'
elseif aD:find'redorb'then aE='red'elseif aD:find'greenorb'then aE='green'elseif
aD:find'secondboss'and aD:find'orb'and not aD:find'explosion'then aE='yellow'end
if aE then local aF=aB:IsA'BasePart'and aB or nil if not aF and aC.activeParts
then for aG in pairs(aC.activeParts)do if aG and aG.Parent and aG:IsA'BasePart'
then aF=aG break end end end if not aF then aF=aB:FindFirstChildWhichIsA
'BasePart'end if aF and aF.Parent then return aF,aE,aB,aC end end end end return
nil,nil,nil,nil end function aj.GetHazardCount()return an end function aj.
OnHazardAdded(aB)table.insert(ao,aB)end function aj.OnHazardRemoved(aB)table.
insert(ap,aB)end function aj.OnHazardsChanged(aB)table.insert(aq,aB)end local aB
={boss2_orbs={keys={'secondbossyelloworb','secondbossredorb',
'secondbossgreenorb'},currentLength=90,defaultLength=90},boss1_beam={keys={
'firstbossbeampart','firstbosslaserprecast','firstbossattachpart',
'firstbosssundiskbeampart','firstbossblindingblastbeam'},currentLength=140,
defaultLength=140},boss1_seekingspikes={keys={'firstbossseekingspikes'},
currentLength=120,defaultLength=120},boss1_bigspike={keys={'firstbossbigspike'},
currentLength=140,defaultLength=140},boss1_skyshot={keys={'firstbossskyshot'},
currentLength=60,defaultLength=60},boss1_crisscross={keys={'firstbosscrisscross'
},currentLength=28,defaultLength=28},boss2_movingbeam={keys={
'secondbossmovingbeam'},currentLength=40,defaultLength=40},boss3_missile={keys={
'thirdbossmissile'},currentLength=40,defaultLength=40},boss3_bouncingorb={keys={
'thirdbossbouncingorb'},currentLength=28,defaultLength=28}}function aj.
SetSkillCorridorLength(aC,aD)if type(aD)~='number'or aD<10 then return end local
aE=aB[aC]if not aE then return end aE.currentLength=aD for aF,aG in ipairs(aE.
keys)do if au[aG]then au[aG].telegraphLength=aD end end for aF,aG in pairs(am)do
local aH=aG.name:lower():gsub('%s+','')for aI,aJ in ipairs(aE.keys)do if aH:
find(aJ)or aJ:find(aH)then aG.telegraphLength=aD aG.maxLookahead=aD for aK,aL in
pairs(am)do if aL~=aG and(aL.name:lower():find'spike'or aL.name:lower():find
'beam')then local aM,aN=aL.beamOrigin or aL.position,aG.beamOrigin or aG.
position if(Vector3.new(aM.X-aN.X,0,aM.Z-aN.Z)).Magnitude<25 then aL.
telegraphLength=aD aL.maxLookahead=aD pcall(function()ah.UpdateCorridorLength(aL
,aD)end)end end end pcall(function()ah.UpdateCorridorLength(aG,aD)end)break end
end end end function aj.GetSkillCorridorLength(aC)local aD=aB[aC]return aD and
aD.currentLength or 40 end function aj.SetOrbCorridorLength(aC)aj.
SetSkillCorridorLength('boss2_orbs',aC)end function aj.GetOrbCorridorLength()
return aj.GetSkillCorridorLength'boss2_orbs'end function aj.
SetBeamCorridorLength(aC)aj.SetSkillCorridorLength('boss1_beam',aC)end function
aj.GetBeamCorridorLength()return aj.GetSkillCorridorLength'boss1_beam'end
function aj.GetLastBossSpawnTime()return at end function aj.RemoveHazard(aC,aD)
ay(aC,aD)end if ai.OnBossActiveChanged then ai.OnBossActiveChanged(function(aC)
if aC then at=os.clock()for aD,aE in pairs(am)do if aE then if aE.spawnTime and
aE.spawnTime<at then aE.isBossHazard=false end if not aE.isBossHazard then ay(aD
,'Pre-boss enemy hazard purged')end end end else at=0 end end)end ae.Register(
function()aj.SetEnabled(false)end)return aj end function a.l()local aa,ab,ac,ad,
ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as=game:GetService'Players',game:
GetService'Workspace',game:GetService'RunService',a.load'f',a.load'k',a.load'h',
a.load'j',{},true,'All',true,true,1.8,2.85,150,150,false,{},(RaycastParams.new()
)as.FilterType=Enum.RaycastFilterType.Exclude as.IgnoreWater=true local at,au={}
,0 local av=function(av)local aw=os.clock()if not av and(aw-au<0.3)then return
end au=aw table.clear(at)for ax,ay in ipairs(aa:GetPlayers())do if ay.Character
then table.insert(at,ay.Character)end end if ab:FindFirstChild'RaycastIgnore'
then table.insert(at,ab.RaycastIgnore)end for ax in pairs(ae.GetActiveHazards())
do table.insert(at,ax)end as.FilterDescendantsInstances=at end function ah.
GetFloorPosition(aw)av(false)local ax,ay=Vector3.new(aw.X,aw.Y+10,aw.Z),Vector3.
new(0,-ap,0)local az=ab:Raycast(ax,ay,as)if az and az.Position then return
Vector3.new(aw.X,az.Position.Y+3,aw.Z),true end return aw,false end function ah.
GetRawFloorY(aw)av(false)local ax,ay=Vector3.new(aw.X,aw.Y+12,aw.Z),Vector3.new(
0,-ap,0)local az=ab:Raycast(ax,ay,as)if az and az.Position then return az.
Position.Y,true end local aA=aa.LocalPlayer local aB=aA and aA.Character and aA.
Character:FindFirstChild'HumanoidRootPart'if aB and aB:IsA'BasePart'then return
aB.Position.Y-2.8,false end return aw.Y,false end local aw=function(aw)local ax=
aw:FindFirstChildOfClass'SpecialMesh'if ax then local ay=ax.Scale return Vector3
.new(aw.Size.X*math.abs(ay.X),aw.Size.Y*math.abs(ay.Y),aw.Size.Z*math.abs(ay.Z))
end return aw.Size end function ah.IsPointInPartOBB(ax,ay,az)if not ay or not ay
:IsA'BasePart'or not ay.Parent then return false end local aA,aB,aC=az or am,ay.
Position,aw(ay)local aD,aE,aF=ax.X-aB.X,ax.Z-aB.Z,math.max(aC.X,aC.Z)local aG=(
aF*0.7072)+aA+3 if(aD*aD+aE*aE)>(aG*aG)then return false end local aH=math.abs(
ax.Y-aB.Y)if aH>ao then return false end local aI,aJ,aK,aL=ay.CFrame:
PointToObjectSpace(ax),(aC.X/2)+aA,(aC.Z/2)+aA,math.max(ao,(aC.Y/2)+5)return
math.abs(aI.X)<=aJ and math.abs(aI.Z)<=aK and math.abs(aI.Y)<=aL end function ah
.IsPointInSphere(ax,ay,az)if not ay or not ay:IsA'BasePart'or not ay.Parent then
return false end local aA,aB,aC=az or am,ay.Position,aw(ay)local aD=math.abs(ax.
Y-aB.Y)if aD>ao then return false end local aE,aF,aG=ax.X-aB.X,ax.Z-aB.Z,(math.
max(aC.X,aC.Z)/2)+aA return(aE*aE+aF*aF)<=(aG*aG)end function ah.IsPointInRing(
ax,ay,az)if not ay or not ay:IsA'BasePart'or not ay.Parent then return false end
if ay.Transparency>=0.85 then return false end local aA,aB=az or am,ay:
FindFirstAncestorOfClass'Model'or ay.Parent local aC=aB and(aB:FindFirstChild
'center'or aB:FindFirstChild'Center'or(aB:IsA'Model'and aB.PrimaryPart))local aD
=(aC and aC:IsA'BasePart')and aC.Position or(aB and aB:IsA'Model'and aB:
GetPivot().Position)or ay.Position local aE=math.abs(ax.Y-aD.Y)if aE>ao then
return false end local aF,aG=ax.X-aD.X,ax.Z-aD.Z local aH,aI=math.sqrt(aF*aF+aG*
aG),ay.Size.Z if aI<1 then aI=math.max(ay.Size.X,ay.Size.Z)/2 end local aJ=(aI>
90)and 18 or 13 local aK=math.max(0,aI-aJ)if aH<(aK-aA)then return false end if
aH>(aI+aA)then return false end local aL,aM=ay.Position.X-aD.X,ay.Position.Z-aD.
Z local aN=math.sqrt(aL*aL+aM*aM)if aN>0.5 then local aO,aP=aL/aN,aM/aN local aQ
=(aF*aO)+(aG*aP)if aQ<-aA then return false end end return true end function ah.
IsPointInMovingBeam(ax,ay,az)if not ay or not ay:IsA'BasePart'or not ay.Parent
then return false end local aA,aB,aC=az or am,ay.CFrame:PointToObjectSpace(ax),
ay.Size local aD,aE=(math.max(aC.X,aC.Z)/2)+aA,(math.max(aC.Y,math.min(aC.X,aC.Z
))/2)+aA if aE<3.5 then aE=3.5 end local aF=aB.Y*aB.Y+aB.Z*aB.Z return(math.abs(
aB.X)<=aD)and(aF<=(aE+1.5)*(aE+1.5))end function ah.IsPointInBeamCorridor(ax,ay,
az,aA,aB,aC)local aD=aC or am local aE,aF=aA+aD,math.abs(ax.Y-ay.Y)if aF>ao then
return false,0,0 end local aG=Vector3.new(ax.X-ay.X,0,ax.Z-ay.Z)local aH=aG:Dot(
az)if aH<-aE or aH>(aB+aD)then return false,0,0 end local aI=az*aH local aJ=(aG-
aI).Magnitude if aJ<=aE then return true,aJ,aH end return false,aJ,aH end
function ah.IsPointInExpandingCone(ax,ay,az,aA,aB,aC,aD)local aE,aF,aG=aD or am,
aC or 0.25,math.abs(ax.Y-ay.Y)if aG>ao then return false,0,0,aA end local aH=
Vector3.new(ax.X-ay.X,0,ax.Z-ay.Z)local aI=aH:Dot(az)local aJ=aA+math.max(0,aI*
aF)if aI<-aJ or aI>(aB+aE)then return false,0,aI,aJ end local aK=az*aI local aL=
(aH-aK).Magnitude if aL<=(aJ+aE)then return true,aL,aI,aJ end return false,aL,aI
,aJ end function ah.IsBoss2OrbHazard(ax)if not ax then return false end local ay
=(ax.cleanName or ax.name or''):lower():gsub('%s+','')return(ay:find'secondboss'
~=nil and ay:find'orb'~=nil and ay:find'explosion'==nil)or ay:find'yelloworb'~=
nil or ay:find'redorb'~=nil or ay:find'greenorb'~=nil end function ah.
IsPointInHazard(ax,ay,az)if not ay or not ay.instance or not ay.instance.Parent
then return false end local aA=ay.cleanName:lower():find'seekingspike'~=nil or
ay.cleanName:lower():find'bigspike'~=nil if not ay.isTelegraph and not aA and ay
.instance:IsA'BasePart'and ay.instance.Transparency>=0.85 and not ay.isMultiWave
then return false end if not ay.isTelegraph and not aA and not ay.isMultiWave
and ay.activeParts then local aB=false for aC in pairs(ay.activeParts)do if aC
and aC.Parent and aC:IsA'BasePart'and aC.Transparency<0.85 then aB=true break
end end if not aB and next(ay.activeParts)~=nil then return false end end local
aB,aC=az or am,ah.IsBoss2OrbHazard(ay)if not aC and ay.forward2D and ay.
dangerRadius then local aD,aE,aF=ay.isExpandingCone or ay.cleanName:lower():find
'cricle'~=nil or ay.cleanName:lower():find'circle'~=nil if aD then aE=ay.
beamOrigin or ay.position aF=ay.maxLookahead or ay.telegraphLength or 95 local
aG=ah.IsPointInExpandingCone(ax,aE,ay.forward2D,ay.dangerRadius,aF,ay.
expansionRate or 0.25,aB)if aG then return true end elseif ay.isTelegraph or aA
then aE=ay.beamOrigin or ay.position aF=ay.maxLookahead or ay.telegraphLength or
140 local aG=ah.IsPointInBeamCorridor(ax,aE,ay.forward2D,ay.dangerRadius,aF,aB)
if aG then return true end else aE=ay.position aF=ay.telegraphLength or ay.
maxLookahead or 40 local aG=ah.IsPointInBeamCorridor(ax,aE,ay.forward2D,ay.
dangerRadius,aF,aB)if aG then return true end end end if not aC then local aD=af
.GetHazardVisualData(ay)if aD and aD.corridorPart and aD.corridorPart.Parent
then local aE=ah.IsPointInPartOBB(ax,aD.corridorPart,aB)if aE then return true
end end end local aD=ay.instance.Name:lower():gsub('%s+','')local aE,aF=aD:find
'multiring'~=nil,aD:find'movingbeam'~=nil for aG in pairs(ay.activeParts)do if
aG and aG.Parent and aG:IsA'BasePart'then if aE or aG.Name:lower():find'ring'
then if ah.IsPointInRing(ax,aG,aB)then return true end elseif aF then if ah.
IsPointInMovingBeam(ax,aG,aB)then return true end elseif aG:IsA'Part'and(aG.
Shape==Enum.PartType.Ball or aG.Shape==Enum.PartType.Cylinder)then if ah.
IsPointInSphere(ax,aG,aB)then return true end else if ah.IsPointInPartOBB(ax,aG,
aB)then return true end end end end return false end function ah.IsBossHazard(ax
)if not ax then return false end local ay=ae.GetLastBossSpawnTime and ae.
GetLastBossSpawnTime()or 0 if ay>0 and ax.spawnTime and ax.spawnTime<ay then
return false end if ag.IsBossActive and not ag.IsBossActive()then return false
end if ax.isBossHazard~=nil then return ax.isBossHazard end local az=ax.name:
lower()if az:find'boss'~=nil then return true end if ax.instance and ax.instance
.Parent and ax.instance.Parent.Name:lower():find'boss'~=nil then return true end
return false end function ah.IsHazardIgnored(ax)if not ax then return true end
local ay=ah.IsBossHazard(ax)if aj=='Boss'and not ay then return true elseif aj==
'Mobs'and ay then return true end if ay then return not ak else return not al
end end function ah.IsPointInAnyHazard(ax,ay,az)if not ai or not ae.IsEnabled()
then return false,nil end local aA,aB=ae.GetActiveHazards(),{}for aC,aD in
pairs(aA)do if ay then local aE=(aD.instance==ay)or(aD.instance and aD.instance.
Name==ay.Name)or(aD.instance and aD.instance:IsDescendantOf(ay))or(ay:
IsDescendantOf(aD.instance))if not aE and ah.IsBoss2OrbHazard(aD)then local aF=
ay.Name:lower():gsub('%s+','')if aF:find'orb'or aF:find'secondboss'then aE=true
end end if aE then continue end end if ah.IsHazardIgnored(aD)then continue end
table.insert(aB,aD)end if#aB>1 then table.sort(aB,function(aC,aD)local aE,aF=(
Vector3.new(aC.position.X-ax.X,0,aC.position.Z-ax.Z)).Magnitude,(Vector3.new(aD.
position.X-ax.X,0,aD.position.Z-ax.Z)).Magnitude if math.abs(aE-aF)>0.5 then
return aE<aF end return(aC.name or'')<(aD.name or'')end)end for aC,aD in ipairs(
aB)do if ah.IsPointInHazard(ax,aD,az)then return true,aD end end return false,
nil end function ah.IsPathSafe(ax,ay,az)local aA=(ay-ax).Magnitude if aA<=1.2
then return true end local aB=math.clamp(math.ceil(aA/2.8),2,14)for aC=1,aB-1 do
local aD=aC/aB local aE=ax:Lerp(ay,aD)if ah.IsPointInAnyHazard(aE,az)then return
false end end return true end function ah.IsPlayerInDanger()local ax=aa.
LocalPlayer local ay=ax and ax.Character if not ay then return false,nil end
local az=ay:FindFirstChild'HumanoidRootPart'or ay:FindFirstChild'Torso'if not az
or not az:IsA'BasePart'then return false,nil end local aA,aB=ah.
IsPointInAnyHazard(az.Position)if aA then return true,aB end local aC=az.
Position-Vector3.new(0,an,0)return ah.IsPointInAnyHazard(aC)end function ah.
OnDangerStateChanged(ax)if type(ax)=='function'then table.insert(ar,ax)end end
function ah.GetHitboxPadding()return am end function ah.SetHitboxPadding(ax)if
type(ax)=='number'and ax>=0 then am=ax end end function ah.
GetHitboxDownwardOffset()return an end function ah.SetHitboxDownwardOffset(ax)if
type(ax)=='number'and ax>=0 then an=ax end end function ah.IsEnabled()return ai
end function ah.SetEnabled(ax)ai=(ax==true)if not ai then aq=false
currentDangerHazard=nil end end function ah.GetCurrentDangerHazard()return
currentDangerHazard end function ah.SetDodgeBossEnabled(ax)ak=(ax==true)if ak
and not al then aj='Boss'elseif not ak and al then aj='Mobs'elseif ak and al
then aj='All'end end function ah.IsDodgeBossEnabled()return ak end function ah.
SetDodgeEnemyEnabled(ax)al=(ax==true)if ak and not al then aj='Boss'elseif not
ak and al then aj='Mobs'elseif ak and al then aj='All'end end function ah.
IsDodgeEnemyEnabled()return al end function ah.SetTargetScope(ax)if ax=='Boss'
then aj='Boss'ak=true al=false elseif ax=='Mobs'then aj='Mobs'ak=false al=true
else aj='All'ak=true al=true end end function ah.GetTargetScope()return aj end
ac.Heartbeat:Connect(function()if not ai or not ae.IsEnabled()then if aq then aq
=false currentDangerHazard=nil for ax,ay in ipairs(ar)do pcall(ay,false,nil)end
end af.UpdatePlayerHitboxVisual(nil)return end local ax,ay=ah.IsPlayerInDanger()
if ax~=aq or ay~=currentDangerHazard then aq=ax currentDangerHazard=ay for az,aA
in ipairs(ar)do pcall(aA,ax,ay)end end local az=aa.LocalPlayer local aA=az and
az.Character local aB=aA and(aA:FindFirstChild'HumanoidRootPart'or aA:
FindFirstChild'Torso')if aB and aB:IsA'BasePart'then local aC=aB.Position local
aD=aC.Y-an af.UpdatePlayerHitboxVisual(aC,ax,am,aD)else af.
UpdatePlayerHitboxVisual(nil)end end)ah.IsPointInDanger=ah.IsPointInAnyHazard
return ah end function a.m()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,
ap=game:GetService'Workspace',game:GetService'Players',a.load'l',{},24,2.8,42,
4.5,2,2.2,1.8,0,{},(RaycastParams.new())an.FilterType=Enum.RaycastFilterType.
Exclude an.IgnoreWater=true local aq=function()local aq={}for ar,as in ipairs(ab
:GetPlayers())do if as.Character then table.insert(aq,as.Character)end end if aa
:FindFirstChild'RaycastIgnore'then table.insert(aq,aa.RaycastIgnore)end an.
FilterDescendantsInstances=aq end local ar=function(ar,as)aq()local at=as-ar
local au=at.Magnitude if au<0.5 then return false,au end local av=Vector3.new(ar
.X,ar.Y+1.5,ar.Z)local aw=aa:Raycast(av,at,an)if aw and aw.Position then local
ax=(aw.Position-av).Magnitude if ax<au-0.8 then return true,ax end end return
false,au end function ad.ResetLock()ao=nil al=0 end function ad.
GetLockedSafeSpot()return ao end function ad.SetTargetPosition(as)ap=as end
function ad.GetTargetPosition()return ap end function ad.FindSafeSpot(as,at)
local au,av=os.clock(),at or ap if ao and(au-al<aj)then local aw=(Vector3.new(ao
.X-as.X,0,ao.Z-as.Z)).Magnitude if aw<=ak then ad.ResetLock()else local ax=not
ac.IsPointInAnyHazard(ao)if ax then return true,ao,am else ad.ResetLock()end end
else ad.ResetLock()end local aw,ax,ay=math.clamp(math.floor(ag/af),5,20),{},{}
for az=0,ae-1 do local aA=(math.pi*2/ae)*az local aB,aC,aD=Vector3.new(math.cos(
aA),0,math.sin(aA)),0 local aE,aF=as+aB*ag,false for aG=1,aw do local aH=as+aB*(
aG*af)local aI=ac.IsPointInAnyHazard(aH)if not aI then aC+=1 if aC==1 then aD=aG
end if aC>=ai then local aJ=(aD*af)local aK=as+aB*(aJ+ah)aE=aK aF=true table.
insert(ay,{rayIndex=az+1,dir=aB,escapeDist=aJ,candidatePt=aK})break end else aC=
0 aD=nil end end ax[az+1]={startPos=as,endPos=aE,dir=aB,status=aF and'Candidate'
or'Blocked',escapeDist=aF and(aD and aD*af)or ag}end local az={}if#ay>0 then
table.sort(ay,function(aA,aB)return aA.escapeDist<aB.escapeDist end)local aA=
math.min(6,#ay)for aB=1,aA do local aC=ay[aB]local aD=aC.candidatePt local aE,aF
=ac.GetFloorPosition(aD)if not aF then ax[aC.rayIndex].status='Dead'continue end
aD=aE local aG,aH=ar(as,aD)if aG then ax[aC.rayIndex].status='Dead'continue end
local aI,aJ=ac.IsPathSafe(as,aD),(ag/math.max(3,aC.escapeDist))*0.45 local aK,aL
=(aI and 1 or-0.5)*0.3,0 if av then local aM=Vector3.new(av.X-as.X,0,av.Z-as.Z)
if aM.Magnitude>1 then local aN=aM.Unit:Dot(aC.dir)aL=aN*0.25 end end local aM=
aJ+aK+aL aC.finalPos=aD aC.score=aM table.insert(az,aC)end end local aA if#az>0
then table.sort(az,function(aB,aC)return aB.score>aC.score end)aA=az[1]else
local aB,aC=(math.huge)for aD,aE in ipairs(ax)do if aE.status~='Dead'and aE.
escapeDist<aB then local aF,aG=ac.GetFloorPosition(aE.endPos)if aG then aB=aE.
escapeDist aC={rayIndex=aD,finalPos=aF}end end end aA=aC end if aA and aA.
finalPos then for aB,aC in ipairs(ax)do if aB==aA.rayIndex then aC.status='Safe'
aC.endPos=aA.finalPos elseif aC.status=='Candidate'then aC.status='Candidate'end
end ao=aA.finalPos al=au am=ax return true,aA.finalPos,ax end am=ax return false
,nil,ax end function ad.GetRayCount()return ae end function ad.SetRayCount(as)if
type(as)=='number'then ae=math.clamp(math.floor(as),8,36)end end function ad.
GetMaxRange()return ag end function ad.SetMaxRange(as)if type(as)=='number'and
as>=10 then ag=math.clamp(as,15,80)end end function ad.GetEscapeMargin()return
ah end function ad.SetEscapeMargin(as)if type(as)=='number'and as>=0 then ah=
math.clamp(as,1,15)end end return ad end function a.n()local aa,ab,ac,ad,ae,af,
ag,ah,ai,aj,ak,al,am=game:GetService'Players',game:GetService'RunService',a.load
'l',a.load'm',a.load'h',{},false,1.2,true,4,'Idle',os.clock(),{}local an=aa.
LocalPlayer if an then an.CharacterAdded:Connect(function()al=os.clock()ad.
ResetLock()ae.ClearRayVisuals()end)end local ao=function(ao,ap)if ak~=ao then ak
=ao for aq,ar in ipairs(am)do pcall(ar,ao,ap)end end end function af.
IsInvulnerable()local ap=an and an.Character if not ap then return false,nil end
local aq=os.clock()-al if aq<aj then return true,string.format(
'Respawn Protection (%.1fs)',aj-aq)end if ap:FindFirstChildOfClass'ForceField'
then return true,'ForceField'end for ar,as in ipairs(ap:GetChildren())do local
at=as.Name:lower()if at:find'shield'or at:find'invuln'or at:find'immune'then
return true,as.Name end end return false,nil end ab.Heartbeat:Connect(function()
if not ag or not ac.IsEnabled()then if ak~='Idle'then ad.ResetLock()ae.
ClearRayVisuals()ao('Idle',nil)end return end local ap,aq=ac.IsPlayerInDanger()
if not ap then if ak~='Safe'and ak~='Idle'then ad.ResetLock()ae.ClearRayVisuals(
)ao('Safe',nil)end return end if ai then local ar,as=af.IsInvulnerable()if ar
then ad.ResetLock()ae.ClearRayVisuals()ao('Invulnerable',nil)return end end
local ar=an and an.Character local as,at=ar and ar:FindFirstChildOfClass
'Humanoid',ar and(ar:FindFirstChild'HumanoidRootPart'or ar:FindFirstChild'Torso'
)if not as or not at or as.Health<=0 then return end local au=at.Position local
av,aw,ax=ad.FindSafeSpot(au)if ae.IsRayVisualsEnabled()then ae.UpdateRayVisuals(
ax,aw)end if av and aw then local ay=aw-au local az=Vector3.new(ay.X,0,ay.Z).
Magnitude if az>1.2 then local aA=Vector3.new(ay.X,0,ay.Z).Unit as:Move(aA,false
)if ah>0 and az<=ah then pcall(function()at.CFrame=CFrame.new(aw.X,at.CFrame.
Position.Y,aw.Z)*(at.CFrame-at.CFrame.Position)end)end ao('Dodging',aw)else as:
Move(Vector3.zero,false)ao('Arrived',aw)end else ao('Scanning',nil)end end)
function af.OnDodgeStateChanged(ap)if type(ap)=='function'then table.insert(am,
ap)end end function af.SetEnabled(ap)ag=(ap==true)if not ag then ad.ResetLock()
ae.ClearRayVisuals()ao('Idle',nil)end end function af.IsEnabled()return ag end
function af.GetDodgeStatus()return ak end function af.SetSnapDistance(ap)if
type(ap)=='number'and ap>=0 then ah=math.clamp(ap,0,4)end end function af.
GetSnapDistance()return ah end function af.SetIgnoreDodgeWhenInvulnerable(ap)ai=
(ap==true)end function af.IsIgnoreDodgeWhenInvulnerableEnabled()return ai end
function af.SetRespawnProtectionDuration(ap)if type(ap)=='number'and ap>=0 then
aj=math.clamp(ap,0,10)end end function af.GetRespawnProtectionDuration()return
aj end return af end function a.o()local aa,ab,ac,ad,ae,af,ag=a.load'f',a.load
'g',a.load'h',a.load'k',a.load'l',a.load'm',a.load'n'local ah={types=aa,filter=
ab,visuals=ac,detection=ad,danger=ae,geometry=ae,safeSpot=af,dodge=ag,
SetTargetPosition=af.SetTargetPosition,GetTargetPosition=af.GetTargetPosition,
SetSkillCorridorLength=ad.SetSkillCorridorLength,GetSkillCorridorLength=ad.
GetSkillCorridorLength,SetOrbCorridorLength=ad.SetOrbCorridorLength,
GetOrbCorridorLength=ad.GetOrbCorridorLength,SetBeamCorridorLength=ad.
SetBeamCorridorLength,GetBeamCorridorLength=ad.GetBeamCorridorLength,
SetTargetScope=ae.SetTargetScope,GetTargetScope=ae.GetTargetScope}return ah end
function a.p()local aa,ab,ac=a.load'e',a.load'd',a.load'o'local ad,ae,af,ag,ah=
ac.detection,ac.visuals,ac.danger,ac.safeSpot,ac.dodge return function(ai,aj)
local ak=aj:Section{Side='Left'}ak:Header{Name='Threat Detection V2'}local al=aj
:Section{Side='Right'}al:Header{Name='Live Threat Inspector'}local am,an,ao,ap,
aq,ar=al:Label{Text="Detector V2: <font color='rgb(255,80,80)'>Disabled</font>"}
,al:Label{Text="Danger State: <font color='rgb(50,255,50)'>SAFE</font>"},al:
Label{Text="Auto Dodge: <font color='rgb(160,160,160)'>Disabled</font>"},al:
Label{Text=[[Safe Spot: <font color='rgb(160,160,160)'>None (Safe)</font>]]},al:
Label{Text="Active Hazards: <font color='rgb(160,160,160)'>0</font>"},al:Label{
Text="Last Threat: <font color='rgb(160,160,160)'>None</font>"}local as=function
(as,at)as=as or ad.GetHazardCount()local au=ad.IsEnabled()local av,aw=au and
'0, 255, 0'or'255, 80, 80',au and'Active (Real-time V2)'or'Disabled'pcall(
function()am:UpdateName("Detector V2: <font color='rgb("..av..")'>"..aw..
'</font>')end)local ax=as>0 and'255, 60, 60'or'0, 255, 0'pcall(function()aq:
UpdateName("Active Hazards: <font color='rgb("..ax..")'>"..tostring(as)..
'</font>')end)if at then pcall(function()ar:UpdateName((
[[Last Threat: <font color='rgb(255,200,60)'>%s</font> (%d parts, %.1fm)]]):
format(at.name,at.neonCount,at.distanceToPlayer))end)end end ad.
OnHazardsChanged(function(at,au)as(at,au)end)af.OnDangerStateChanged(function(at
,au)pcall(function()if at and au then an:UpdateName((
[[Danger State: <font color='rgb(255,40,40)'><b>IN DANGER</b></font> (<font color='rgb(255,200,50)'>%s</font>)]]
):format(au.name))else an:UpdateName
"Danger State: <font color='rgb(50,255,50)'>SAFE</font>"ap:UpdateName
[[Safe Spot: <font color='rgb(160,160,160)'>None (Safe)</font>]]end end)end)ah.
OnDodgeStateChanged(function(at,au)pcall(function()if at=='Dodging'and au then
ao:UpdateName
"Auto Dodge: <font color='rgb(0,255,140)'>\u{1f3c3} <b>DODGING (Walk)</b></font>"
ap:UpdateName(string.format(
"Safe Spot: <font color='rgb(0,255,100)'>\u{1f7e2} Found</font> (%.1f, %.1f)",au
.X,au.Z))elseif at=='Arrived'and au then ao:UpdateName
"Auto Dodge: <font color='rgb(80,255,160)'>\u{1f6e1}\u{fe0f} <b>IN POSITION (Safe)</b></font>"
elseif at=='Invulnerable'then local av,aw=ah.IsInvulnerable()ao:UpdateName(
string.format(
"Auto Dodge: <font color='rgb(255,215,0)'>\u{1f6e1}\u{fe0f} <b>PAUSED (%s)</b></font>"
,aw or'Protected'))elseif at=='Scanning'then ao:UpdateName
"Auto Dodge: <font color='rgb(255,180,50)'>\u{23f3} <b>SCANNING 360\u{b0}...</b></font>"
else local av=ah.IsEnabled()local aw=av and
"<font color='rgb(80,255,160)'>Ready (Watching)</font>"or
"<font color='rgb(160,160,160)'>Disabled</font>"ao:UpdateName('Auto Dodge: '..aw
)if not af.IsPlayerInDanger()then ap:UpdateName
[[Safe Spot: <font color='rgb(160,160,160)'>None (Safe)</font>]]end end end)end)
al:Header{Name=
'Orange Corridor Lengths (\u{110}\u{1ed9} d\u{e0}i V\u{f9}ng Cam t\u{1eeb}ng Skill)'
}aa.PatchSliderLoadCallback(al:Slider({Name='Boss 2: Homing Orbs',Suffix=
' studs',Default=ad.GetSkillCorridorLength'boss2_orbs',Minimum=15,Maximum=200,
DisplayMethod='Round',Precision=0,Callback=ab.Wrap(function(at)ad.
SetSkillCorridorLength('boss2_orbs',at)end)},'Slider_SDV2_Len_Boss2Orbs'))aa.
PatchSliderLoadCallback(al:Slider({Name='Boss 1: Laser & Telegraph Beams',Suffix
=' studs',Default=ad.GetSkillCorridorLength'boss1_beam',Minimum=40,Maximum=250,
DisplayMethod='Round',Precision=0,Callback=ab.Wrap(function(at)ad.
SetSkillCorridorLength('boss1_beam',at)end)},'Slider_SDV2_Len_Boss1Beam'))aa.
PatchSliderLoadCallback(al:Slider({Name='Boss 1: Seeking Spikes',Suffix=' studs'
,Default=ad.GetSkillCorridorLength'boss1_seekingspikes',Minimum=15,Maximum=120,
DisplayMethod='Round',Precision=0,Callback=ab.Wrap(function(at)ad.
SetSkillCorridorLength('boss1_seekingspikes',at)end)},
'Slider_SDV2_Len_Boss1SeekSpikes'))aa.PatchSliderLoadCallback(al:Slider({Name=
'Boss 1: Big Spike',Suffix=' studs',Default=ad.GetSkillCorridorLength
'boss1_bigspike',Minimum=15,Maximum=150,DisplayMethod='Round',Precision=0,
Callback=ab.Wrap(function(at)ad.SetSkillCorridorLength('boss1_bigspike',at)end)}
,'Slider_SDV2_Len_Boss1BigSpike'))aa.PatchSliderLoadCallback(al:Slider({Name=
'Boss 1: Sky Shot',Suffix=' studs',Default=ad.GetSkillCorridorLength
'boss1_skyshot',Minimum=20,Maximum=150,DisplayMethod='Round',Precision=0,
Callback=ab.Wrap(function(at)ad.SetSkillCorridorLength('boss1_skyshot',at)end)},
'Slider_SDV2_Len_Boss1SkyShot'))aa.PatchSliderLoadCallback(al:Slider({Name=
'Boss 1: Criss Cross',Suffix=' studs',Default=ad.GetSkillCorridorLength
'boss1_crisscross',Minimum=15,Maximum=120,DisplayMethod='Round',Precision=0,
Callback=ab.Wrap(function(at)ad.SetSkillCorridorLength('boss1_crisscross',at)end
)},'Slider_SDV2_Len_Boss1CrissCross'))aa.PatchSliderLoadCallback(al:Slider({Name
='Boss 2: Moving Beam',Suffix=' studs',Default=ad.GetSkillCorridorLength
'boss2_movingbeam',Minimum=15,Maximum=150,DisplayMethod='Round',Precision=0,
Callback=ab.Wrap(function(at)ad.SetSkillCorridorLength('boss2_movingbeam',at)end
)},'Slider_SDV2_Len_Boss2MovingBeam'))aa.PatchSliderLoadCallback(al:Slider({Name
='Boss 3: Homing Missile',Suffix=' studs',Default=ad.GetSkillCorridorLength
'boss3_missile',Minimum=15,Maximum=150,DisplayMethod='Round',Precision=0,
Callback=ab.Wrap(function(at)ad.SetSkillCorridorLength('boss3_missile',at)end)},
'Slider_SDV2_Len_Boss3Missile'))aa.PatchSliderLoadCallback(al:Slider({Name=
'Boss 3: Bouncing Orb',Suffix=' studs',Default=ad.GetSkillCorridorLength
'boss3_bouncingorb',Minimum=10,Maximum=100,DisplayMethod='Round',Precision=0,
Callback=ab.Wrap(function(at)ad.SetSkillCorridorLength('boss3_bouncingorb',at)
end)},'Slider_SDV2_Len_Boss3BouncingOrb'))ak:Toggle({Name=
'Enable Threat Detection V2',Default=false,Callback=ab.Wrap(function(at)ad.
SetEnabled(at)as()end)},'Toggle_SDV2_Enabled')ak:Toggle({Name=
'3D ESP Highlighting',Default=true,Callback=ab.Wrap(function(at)ae.
SetEspEnabled(at)end)},'Toggle_SDV2_VisualESP')ak:Toggle({Name=
'Unified Model Box (G\u{1ed9}p khung Model >= 2 Parts)',Default=true,Callback=ab
.Wrap(function(at)ae.SetUnifiedModelBoxes(at)end)},'Toggle_SDV2_UnifiedModel')ak
:Toggle({Name='Show Part Name Tags [Parent(ClassName)]',Default=true,Callback=ab
.Wrap(function(at)ae.SetNameTagsEnabled(at)end)},'Toggle_SDV2_NameTags')ak:
Toggle({Name='Show Player Hitbox Radius (V\u{f2}ng ch\u{e2}n)',Default=true,
Callback=ab.Wrap(function(at)ae.SetHitboxVisualEnabled(at)end)},
'Toggle_SDV2_HitboxCircle')ak:Toggle({Name='Console Threat Logging',Default=
false,Callback=ab.Wrap(function(at)ad.SetLogHazards(at)end)},
'Toggle_SDV2_LogHazards')aa.PatchSliderLoadCallback(ak:Slider({Name=
'Box Outline Thickness',Default=8,Minimum=2,Maximum=25,DisplayMethod='Round',
Precision=0,Callback=ab.Wrap(function(at)ae.SetLineThickness(at/100)end)},
'Slider_SDV2_Thickness'))aa.PatchSliderLoadCallback(ak:Slider({Name=
'Box Surface Opacity',Default=35,Minimum=0,Maximum=100,DisplayMethod='Percent',
Precision=0,Callback=ab.Wrap(function(at)ae.SetSurfaceTransparency(1-(at/100))
end)},'Slider_SDV2_Opacity'))aa.PatchSliderLoadCallback(ak:Slider({Name=
'Player Hitbox Padding (studs)',Default=af.GetHitboxPadding(),Minimum=0.5,
Maximum=5,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(at)local
au=tonumber(at)or 1.8 if au>5 then au=au/10 end af.SetHitboxPadding(au)end)},
'Slider_SDV2_Padding'),function(at)if at>5 then return at/10 end return at end)
aa.PatchSliderLoadCallback(ak:Slider({Name='Hitbox Height Offset (studs)',
Default=af.GetHitboxDownwardOffset(),Minimum=1,Maximum=5,DisplayMethod='Round',
Precision=1,Callback=ab.Wrap(function(at)local au=tonumber(at)or 2.85 if au>5
then au=au/10 end af.SetHitboxDownwardOffset(au)end)},'Slider_SDV2_HeightOffset'
),function(at)if at>5 then return at/10 end return at end)ak:Header{Name=
'Auto Dodge (360\u{b0} Radial Ray-Cast)'}ak:Toggle({Name=
'Enable Auto Dodge (HumanoidMove)',Default=false,Callback=ab.Wrap(function(at)ah
.SetEnabled(at)local au=at and
"<font color='rgb(80,255,160)'>Ready (Watching)</font>"or
"<font color='rgb(160,160,160)'>Disabled</font>"ao:UpdateName('Auto Dodge: '..au
)end)},'Toggle_SDV2_RadialDodgeEnabled')ak:Toggle({Name=
'Show 360\u{b0} Ray Visuals (Hi\u{1ec7}n ch\u{f9}m tia qu\u{e9}t)',Default=true,
Callback=ab.Wrap(function(at)ae.SetRayVisualsEnabled(at)end)},
'Toggle_SDV2_ShowRayVisuals')aa.PatchSliderLoadCallback(ak:Slider({Name=
'Ray Count (S\u{1ed1} l\u{1b0}\u{1ee3}ng tia)',Suffix=' rays',Default=ag.
GetRayCount(),Minimum=12,Maximum=36,DisplayMethod='Round',Precision=0,Callback=
ab.Wrap(function(at)ag.SetRayCount(at)end)},'Slider_SDV2_RayCount'))aa.
PatchSliderLoadCallback(ak:Slider({Name=
'Max Scan Range (T\u{1ea7}m qu\u{e9}t t\u{1ed1}i \u{111}a)',Suffix=' studs',
Default=ag.GetMaxRange(),Minimum=15,Maximum=60,DisplayMethod='Round',Precision=0
,Callback=ab.Wrap(function(at)ag.SetMaxRange(at)end)},'Slider_SDV2_MaxRange'))aa
.PatchSliderLoadCallback(ak:Slider({Name=
'Escape Margin (C\u{1ef1} ly \u{111}\u{1ec7}m an to\u{e0}n)',Suffix=' studs',
Default=ag.GetEscapeMargin(),Minimum=1,Maximum=10,DisplayMethod='Round',
Precision=1,Callback=ab.Wrap(function(at)ag.SetEscapeMargin(at)end)},
'Slider_SDV2_EscapeMargin'))aa.PatchSliderLoadCallback(ak:Slider({Name=
'Snap Distance (C\u{1ef1} ly snap \u{111}\u{ed}ch)',Suffix=' studs',Default=ah.
GetSnapDistance(),Minimum=0,Maximum=3,DisplayMethod='Round',Precision=1,Callback
=ab.Wrap(function(at)ah.SetSnapDistance(at)end)},'Slider_SDV2_SnapDistance'))ak:
Toggle({Name=
'Ignore Dodge When Invulnerable (B\u{1ecf} qua khi B\u{1ea5}t t\u{1eed})',
Default=ah.IsIgnoreDodgeWhenInvulnerableEnabled(),Callback=ab.Wrap(function(at)
ah.SetIgnoreDodgeWhenInvulnerable(at)end)},'Toggle_SDV2_IgnoreWhenInvuln')aa.
PatchSliderLoadCallback(ak:Slider({Name='Respawn Protection Duration',Suffix='s'
,Default=ah.GetRespawnProtectionDuration(),Minimum=0.5,Maximum=10,DisplayMethod=
'Round',Precision=1,Callback=ab.Wrap(function(at)ah.
SetRespawnProtectionDuration(at)end)},'Slider_SDV2_RespawnProtectionDuration'))
as()end end function a.q()return function(aa,ab)a.load'p'(aa,ab)end end function
a.r()local aa,ab,ac,ad,ae,af,ag,ah={'Easy','Medium','Hard','Insane','Nightmare'}
,{'Desert Temple','Winter Outpost','Pirate Island',"King's Castle",
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
end function a.s()local aa,ab,ac,ad,ae=a.load'i',a.load'c',a.load'r',a.load'j',a
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
Register(function()av.Toggle(false)end)return av end function a.t()local aa,ab,
ac,ad,ae,af,ag,ah=a.load'j',a.load'c',{[77649408247578]=true,[115445507767090]=
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
function a.u()local aa={[77649408247578]=true,[115445507767090]=true}local ab,ac
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
if ac then ah()end end return ai end function a.v()local aa,ab=a.load'i',a.load
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
w()local aa,ab,ac,ad,ae,af,ag=a.load'e',a.load's',a.load't',a.load'u',a.load'v',
a.load'd',a.load'r'return function(ah,ai)local aj,ak,al=ai:Section{Side='Left'},
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
GetSelectedDifficulty())end)ap()end)end end function a.x()local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as=a.load'b',a.load'c',a.load'j',{[
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
function a.y()local aa,ab,ac=a.load'd',a.load'x',a.load'c'return function(ad,ae)
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
end)end)end},{Name='Cancel'}}}end)end}ao()end end function a.z()local aa,ab,ac,
ad,ae,af,ag,ah,ai,aj,ak,al,am,an=a.load'i',a.load'j',{},0.05,0.8,Color3.fromRGB(
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
return aF end return ac end function a.A()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
=a.load'i',a.load'j',{},Color3.fromRGB(255,170,0),0.55,'Enemy_ESP',0.5,{Orange=
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
'[EnemyESP] recolor error'end end return ac end function a.B()local aa,ab,ac,ad,
ae,af,ag,ah=a.load'i',a.load'b',{},false,{},{},{},2 local ai={['meshes/ice3']=
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
function()ac.Toggle(false)end)return ac end function a.C()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'z',a.load'A',a.load'B',a.load'e',{'Custom Hitbox',
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
function a.D()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'j',a.load'b',game:
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
false end)return ag end function a.E()local aa=a.load'D'return function(ab,ac)
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
}end end function a.F()local aa={}function aa.Apply(ab,ac,ad)for ae,af in pairs(
ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=af end
)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af,{
__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local ai,
aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.G()local aa,ab,ac,ad,ae,af=a.load'F',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.H()local aa
,ab,ac=a.load'd',a.load'e',a.load'G'return function(ad,ae)local af=ae:Section{
Side='Left'}af:Header{Name='Anti AFK'}af:Toggle({Name='Anti AFK',Default=ac.
IsEnabled(),Callback=aa.Wrap(function(ag)if ag then ac.Start()else ac.Stop()end
end)},'Toggle_AntiAFK')ab.PatchSliderLoadCallback(af:Slider({Name=
'Interval (gi\u{e2}y)',Default=ac.GetInterval(),Minimum=5,Maximum=300,
DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(ag)ac.SetInterval(ag
)end)},'Slider_AntiAFKInterval'))end end function a.I()return function(aa,ab)a.
load'C'(aa,ab)a.load'E'(aa,ab)a.load'H'(aa,ab)end end function a.J()local aa,ab,
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
Hide()end)end ah()return ae end function a.K()local aa,ab,ac=a.load'a',a.load'd'
,a.load'J'return function(ad,ae)local af=aa.Folder local ag=af..
'/settings/autoload.txt'local ah,ai,aj=function()if isfile and isfile(ag)then
local ah,ai=pcall(readfile,ag)if ah and ai then local aj=string.match(ai,
'^%s*(.-)%s*$')return(aj and#aj>0)and aj or nil end end return nil end,function(
ah)ab.SetActive(ah)end,ae:Section{Side='Left'}aj:Header{Name='Configs'}local ak,
al,am local an=function(an)local ao=aa:RefreshConfigList()al:ClearOptions()al:
InsertOptions(ao)if an then if not al:IsOption(an)then al:InsertOptions{an}end
al:UpdateSelection(an)end end aj:Input{Name='Config Name',Placeholder='Name',
AcceptedCharacters='All',Callback=function(ao)ak=ao end}al=aj:Dropdown{Name=
'Select Config',Multi=false,Required=false,Options=aa:RefreshConfigList(),
Callback=function(ao)ai(ao)end}local ao=ah()if ao and ao~=''then if not al:
IsOption(ao)then al:InsertOptions{ao}end al:UpdateSelection(ao)ai(ao)end aj:
Button{Name='Create Config',Callback=function()if not ak or string.gsub(ak,' ',
'')==''then ad:Notify{Title='Interface',Description=
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
Description='Please select a config first.'}return end local aq,ar=pcall(
writefile,ag,ap)if not aq then ad:Notify{Title='Interface',Description=
'Unable to set autoload: '..tostring(ar)}return end am:UpdateName(
'Autoload config: '..ap)ad:Notify{Title='Interface',Description=string.format(
'Set %q as autoload',ap)}ai(ap)end}aj:Button{Name='Refresh Config List',Callback
=function()an(al.Value)end}am=aj:Label{Text='Autoload config: None'}local ap=ah(
)if ap and ap~=''then am:UpdateName('Autoload config: '..ap)end aj:Header{Name=
'Auto Hide UI'}aj:Toggle({Name='Hide window after execute',Default=ac.IsEnabled(
),Callback=function(aq)ac.SetEnabled(aq)end},'Toggle_AutoHide')aj:Label{Text=
'Press RightControl to show the window again.'}end end function a.L()local aa,ab
,ac,ad,ae,af=a.load'j',a.load'v','Boss Active','Boss','Dungeon','Time Left'
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
end end end}end end function a.M()return function(aa,ab)a.load'K'(aa,ab)a.load
'L'(aa,ab)end end function a.N()local aa,ab,ac=a.load'i',a.load'j',a.load'b'
local ad,ae,af,ag,ah=aa.UserInputService,aa.VirtualInputManager,{},false
function af.IsMouseComboEnabled()return ag end function af.SetMouseComboEnabled(
ai)ag=ai==true end local ai=function()task.spawn(function()ae:SendKeyEvent(true,
Enum.KeyCode.Q,false,game)ae:SendKeyEvent(true,Enum.KeyCode.E,false,game)task.
wait(ab.GetKeyHoldTime())ae:SendKeyEvent(false,Enum.KeyCode.Q,false,game)ae:
SendKeyEvent(false,Enum.KeyCode.E,false,game)end)end function af.Init()if af.
inited then return end af.inited=true ah=ad.InputBegan:Connect(function(aj,ak)if
aj.UserInputType==Enum.UserInputType.MouseButton2 then if ad:GetFocusedTextBox()
then return end if ag then ai()end end end)end ac.Register(function()if ah then
ah:Disconnect()ah=nil end af.inited=false end)return af end function a.O()local
aa,ab,ac={},{},false function aa.SetLocked(ad)ac=ad and true or false end
function aa.IsLocked()return ac end function aa.Register(ad,ae,af)if type(ad)~=
'string'or type(ae)~='function'or type(af)~='function'then return end ab[ad]={
setEnabled=ae,isEnabled=af}end function aa.EnableExclusive(ad)if ac then return
end for ae,af in pairs(ab)do if ae~=ad and af.isEnabled()then pcall(af.
setEnabled,false)end end end function aa.IsEnabled(ad)local ae=ab[ad]return ae~=
nil and ae.isEnabled()end return aa end function a.P()local aa,ab=a.load'i',a.
load'j'local ac,ad,ae=aa.player,{},'All'function ad.SetTargetScope(af)if af==
'Boss'or af=='Mobs'or af=='All'then ae=af end end function ad.GetTargetScope()
return ae end function ad.Validate(af)if not af then return false end local ag=
af.Model if not ag or not ag.Parent or ag==ac.Character then return false end if
ae~='All'then local ah,ai=ab.IsBossActive and ab.IsBossActive(),(ag and ag.Name)
or''local aj=tostring(ai):lower():find'boss'~=nil local ak=ah or aj if ae==
'Boss'and not ak then return false elseif ae=='Mobs'and ak then return false end
end local ah=af.Humanoid if not ah or not ah.Parent then ah=ag:
FindFirstChildOfClass'Humanoid'af.Humanoid=ah end if not ah or ah.Health<=0 then
return false end local ai=af.Root if not ai or not ai.Parent then ai=ag:
FindFirstChild'HumanoidRootPart'or ag.PrimaryPart if not ai then for aj,ak in
ipairs(ag:GetDescendants())do if ak:IsA'BasePart'then ai=ak break end end end if
not ai then return false end af.Root=ai end return true end function ad.Scan()
local af,ag={},ab.GetTrackedEnemyData()for ah,ai in ipairs(ag)do if ad.Validate(
ai)then table.insert(af,ai)end end return af end return ad end function a.Q()
local aa,ab,ac,ad=game:GetService'PathfindingService',{},{AgentRadius=1,
AgentHeight=5,AgentCanJump=true,AgentCanClimb=true,AgentMaxSlope=75,
WaypointSpacing=4,Costs={Water=20,Lava=20}},{AgentRadius=0.25,AgentHeight=4,
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
a.R()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'Q',a.load'P',{},{},1,6 function ac.
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
return false end return ac end function a.S()local aa=a.load'i'local ab,ac=aa.
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
end function a.T()local aa,ab,ac,ad,ae,af,ag,ah=a.load'i',a.load'j',a.load'b',a.
load'O',a.load'P',a.load'Q',a.load'R',a.load'S'local ai,aj,ak,al,am,an,ao,ap,aq,
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
fromRGB(255,50,50)aQ.Material=Enum.Material.SmoothPlastic aQ.Parent=workspace
return aQ end,function()if aR and aR.Parent then return aR end if aR then pcall(
function()aR:Destroy()end)aR=nil end aR=Instance.new'Highlight'aR.Name=
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
SmoothPlastic aU.Color=Color3.fromRGB(0,230,255)aU.Parent=workspace end aU.
CFrame=CFrame.new(b)else if aT then aT.Visible=false end if aU and aU.Parent
then aU.CFrame=CFrame.new(0,-1E3,0)end end end if not au or not aM or not a6 or
not a4 then if aV then aV.Visible=false end if aW and aW.Parent then aW.CFrame=
CFrame.new(0,-1E3,0)end else local a9,b,ba=aM.origin or(a6+Vector3.new(0,1.5,0))
,aM.directHitPos or aM.targetPos,aM.directBlocked if b then local bb=(b-a9).
Magnitude if bb>=0.2 then if not aV or not aV.Parent then local bc=a2()aV=
Instance.new'LineHandleAdornment'aV.Name='TM_BlockerRay_Debug'aV.Adornee=bc aV.
Thickness=3 aV.Transparency=0.2 aV.ZIndex=3 aV.Parent=workspace end aV.Length=bb
aV.Color3=ba and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,50)aV.CFrame=
CFrame.lookAt(a9,b)aV.Visible=true if ba and aM.directHitPos then if not aW or
not aW.Parent then aW=Instance.new'Part'aW.Name='TM_BlockerHitMarker_Debug'aW.
Anchored=true aW.CanCollide=false aW.CanQuery=false aW.CanTouch=false aW.Shape=
Enum.PartType.Ball aW.Size=Vector3.new(1,1,1)aW.Material=Enum.Material.
SmoothPlastic aW.Color=Color3.fromRGB(255,30,30)aW.Parent=workspace end aW.
CFrame=CFrame.new(aM.directHitPos)else if aW and aW.Parent then aW.CFrame=CFrame
.new(0,-1E3,0)end end else if aV then aV.Visible=false end if aW and aW.Parent
then aW.CFrame=CFrame.new(0,-1E3,0)end end end end end,function()if aQ then
pcall(function()aQ:Destroy()end)aQ=nil end if aR then pcall(function()aR:
Destroy()end)aR=nil end if aT then pcall(function()aT:Destroy()end)aT=nil end if
aU then pcall(function()aU:Destroy()end)aU=nil end if aV then pcall(function()aV
:Destroy()end)aV=nil end if aW then pcall(function()aW:Destroy()end)aW=nil end
a3()if aS then pcall(function()aS:Destroy()end)aS=nil end end function al.
IsEnabled()return am end function al.IsRunning()return an end function al.
GetState()return av end function al.GetScanInterval()return ao end function al.
SetScanInterval(a6)if type(a6)=='number'and a6>0.1 then ao=a6 end end function
al.GetReachDistance()return ap end function al.SetReachDistance(a6)if type(a6)==
'number'and a6>=1 then ap=a6 end end function al.GetRepathDistance()return aq
end function al.SetRepathDistance(a6)if type(a6)=='number'and a6>=1 then aq=a6
ag.SetRepathThreshold(a6)end end function al.SetAutoJumpOnStuck(a6)aD=a6 and
true or false end function al.IsAutoJumpOnStuckEnabled()return aD end function
al.SetStuckVelocityThreshold(a6)if type(a6)=='number'and a6>=1 then aE=a6 end
end function al.GetStuckVelocityThreshold()return aE end function al.SetPaused(
a6)local a7=a6 and true or false if a7==aF then return end aF=a7 if aF then
local a8,a9=ab.GetHumanoid(),aH()if a8 and a8.Parent and a9 then local b=aI(a9)
if b then pcall(function()a8:MoveTo(b)end)end end end end function al.IsPaused()
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
verticalVelocity=be,stuckTimer=aB}end function al.SetTargetScope(a6)ae.
SetTargetScope(a6)if am and an then task.defer(aY)end end function al.
GetTargetScope()return ae.GetTargetScope()end function al.Toggle(a6,a7)if a6==am
then return end am=a6 if am then if not a7 then ad.EnableExclusive'AutoFarm'end
if aN then aN:Disconnect()aN=nil end an=true ay=0 az=false ax=0 ag.
SetRepathThreshold(aq)if not aO then aO=ab.OnEnemyChanged(function()if am and an
and av~=ak.HOLD then aY()end end)end if not aP then aP=ab.OnRespawn(function()ag
.ClearTarget()av=ak.NO_TARGET aM=nil aY()end)end if not aA then task.spawn(
function()if ab.ReadyDungeon()then aA=true end end)end task.defer(aY)aN=ai.
Heartbeat:Connect(function(a8)local a9,b=pcall(a_,a8)if not a9 then warn((
'[AutoFarm] Error in stepMovementLoop: %s'):format(tostring(b)))end a4()end)else
if aN then aN:Disconnect()aN=nil end an=false if aO then aO()aO=nil end if aP
then aP()aP=nil end local a8,a9=ab.GetHumanoid(),aH()if a8 and a8.Parent and a9
then local b=aI(a9)if b then pcall(function()a8:MoveTo(b)end)end end ag.
ClearTarget()av=ak.NO_TARGET aK=nil aw='None'aM=nil aB=0 ay+=1 az=false a5()end
end ad.Register('AutoFarm',al.Toggle,al.IsEnabled)ac.Register(function()al.
Toggle(false)a5()end)return al end function a.U()local aa,ab,ac,ad,ae,af,ag,ah=a
.load'a',a.load'd',a.load'j',a.load'r',a.load'c',a.load'b',a.load'T',{}local ai,
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
ReloadFromConfig()then ar(true)end end end)end return ah end function a.V()local
aa,ab,ac,ad,ae,af,ag,ah=a.load'i',a.load'j',a.load'r',a.load'c',a.load'a',game:
GetService'HttpService',{},{mediumIceSpikes={hitDelay=1.1,totalLifetime=1.5,
isProjectile=false,skillType='AoE'},largeIceSpikes={hitDelay=1.4,totalLifetime=
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
end function a.W()local aa,ab,ac,ad,ae,af,ag=game:GetService'Players',game:
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
:Raycast(ao,ap,ai)if aq and aq.Position then return aq.Position.Y,true,aq.Normal
end local ar=am and am.Character and am.Character:FindFirstChild
'HumanoidRootPart'if ar then local as=Vector3.new(an.X,ar.Position.Y+8,an.Z)
local at=ab:Raycast(as,ap,ai)if at and at.Position then return at.Position.Y,
true,at.Normal end return ar.Position.Y-2.8,false,Vector3.new(0,1,0)end return
an.Y,false,Vector3.new(0,1,0)end function af.IsPointInTrajectory(an,ao)local ap=
ah()local aq=ap.GetLockedProjectiles()[ao]if not aq then aq=ap.
LockTrajectoryForPart and ap.LockTrajectoryForPart(ao)end if not aq then return
false end local ar,as,at,au=ao.Position,aq.forward2D,aq.maxLookahead,aq.
dangerRadius local av=an-ar local aw=Vector3.new(av.X,0,av.Z)local ax=aw:Dot(as)
if aq.config and aq.config.isDynamicMoving then if ax<-4 or ax>(at+2)then return
false end local ay=as*ax local az=aw-ay local aA,aB=az.Magnitude,aq.
lockedVisualY or(aq.rawFloorY and(aq.rawFloorY+2.8))or ar.Y local aC=math.abs(an
.Y-aB)if aC>ae then return false end if aA<=(au+ac)then return true,aA,au,as,ar,
at end return false end local ay,az=au,(aq.config and aq.config.isExpandingCone)
if az then local aA=(aq.config and aq.config.expansionRate)or 0.25 ay=au+math.
max(0,ax*aA)end if ax<-ay or ax>at then return false end local aA=as*ax local aB
=aw-aA local aC,aD=aB.Magnitude,aq.rawFloorY and(aq.rawFloorY+2.8)or ar.Y local
aE=math.abs(an.Y-aD)if aE>ae then return false end if aC<=(ay+ac)then return
true,aC,ay,as,ar,at end return false end function af.IsPointInPart(an,ao)if not
ao or not ao:IsA'BasePart'or not ao.Parent or ah().IsIgnoredPart(ao)then return
false end local ap=ao.Position local aq,ar,as=an.X-ap.X,an.Z-ap.Z,ao.Size local
at=(as.X>as.Z and as.X or as.Z)local au=(at*0.7072)+ac+2 if(aq*aq+ar*ar)>(au*au)
then return false end local av=math.abs(an.Y-ap.Y)if av>ae then return false end
if ao:IsA'Part'and(ao.Shape==Enum.PartType.Ball or ao.Shape==Enum.PartType.
Cylinder)then local aw,ax=math.max(as.X,as.Z)/2+ac,aq*aq+ar*ar return ax<=aw*aw
end local aw=ao.Name:lower():find'movingbeam'or(ao.Parent and ao.Parent.Name:
lower():find'movingbeam')if aw then local ax,ay,az=ao.CFrame:PointToObjectSpace(
an),math.max(as.X,as.Z)/2+ac,math.max(as.Y,math.min(as.X,as.Z))/2+ac if az<3.5
then az=3.5 end local aA=ax.Y*ax.Y+ax.Z*ax.Z return(math.abs(ax.X)<=ay)and(aA<=(
az+1.5)*(az+1.5))end local ax,ay,az,aA=ao.CFrame:PointToObjectSpace(an),as.X/2+
ac,as.Z/2+ac,math.max(ae,as.Y/2+5)return math.abs(ax.X)<=ay and math.abs(ax.Z)<=
az and math.abs(ax.Y)<=aA end function af.IsPointInRingPart(an,ao)if not ao or
not ao:IsA'BasePart'or not ao.Parent or ah().IsIgnoredPart(ao)then return false
end local ap=ao.Parent:FindFirstChild'center'or ao.Parent:FindFirstChild'Center'
local aq=ap and ap.Position or ao.Position local ar=math.abs(an.Y-aq.Y)if ar>ae
then return false end local as,at=an.X-aq.X,an.Z-aq.Z local au,av=math.sqrt(as*
as+at*at),ao.Size.Z if av<1 then av=math.max(ao.Size.X,ao.Size.Z)/2 end local aw
=(av>90)and 18 or 13 local ax=math.max(0,av-aw)if au<ax-ac then return false end
if au>av+ac then return false end local ay,az=ao.Position.X-aq.X,ao.Position.Z-
aq.Z local aA=math.sqrt(ay*ay+az*az)if aA>0.5 then local aB,aC=ay/aA,az/aA local
aD=(as*aB)+(at*aC)if aD<-ac then return false end end return true,au,ax,av,aq,ao
.CFrame end function af.IsPointInThirdBossMultiRings(an,ao)if not ao or not ao.
Instance or not ao.Instance.Parent then return false,nil end local ap=ah().
GetFadeThreshold()if ao.ActiveParts then for aq in pairs(ao.ActiveParts)do if aq
and aq.Parent and aq:IsA'BasePart'and aq.Transparency<ap then local ar=af.
IsPointInRingPart(an,aq)if ar then return true,aq end end end end return false,
nil end function af.IsPointInSecondBossMovingBeam(an,ao)if not ao or not ao.
Instance or not ao.Instance.Parent then return false,nil,nil end local ap,aq=ao.
Instance,ah()local ar=aq.GetLockedProjectiles()[ap]if not ar and aq.
LockSecondBossMovingBeam then ar=aq.LockSecondBossMovingBeam(ap)end if not ar
and aq.LockBossOrb then ar=aq.LockBossOrb(ap)end if not ar then return false,nil
,nil end local as=ap:IsA'Model'and ap:FindFirstChildWhichIsA'BasePart'or(ap:IsA
'BasePart'and ap)local at=(as and as.Position)or(ap:IsA'Model'and select(1,ap:
GetBoundingBox()).Position)or ap.Position if ar.isBossOrb then local au=an-at
local av=Vector3.new(au.X,0,au.Z)local aw,ax=av.Magnitude,(ar.dangerRadius or 5)
+ac if aw<=ax then local ay=ar.lockedVisualY or at.Y local az=math.abs(an.Y-ay)
if az<=ae then local aA,aB=as or(ap:IsA'Model'and ap:FindFirstChildWhichIsA
'BasePart')or ap,{isTrajectory=true,isDynamicMoving=true,isBossOrb=true,perpDist
=aw,dangerRadius=ar.dangerRadius or 5,forward2D=ar.forward2D or Vector3.new(0,0,
-1),originPos=at,maxLookahead=ax}return true,aA,aB end end return false,nil,nil
end local au,av,aw,ax=ar.forward2D or Vector3.new(0,0,-1),ar.dangerRadius or 25,
ar.maxLookahead or 50,an-at local ay=Vector3.new(ax.X,0,ax.Z)local az=ay:Dot(au)
if az<-4 or az>(aw+2)then return false,nil,nil end local aA=au*az local aB=ay-aA
local aC,aD=aB.Magnitude,ar.lockedVisualY or at.Y local aE=math.abs(an.Y-aD)if
aE>ae then return false,nil,nil end if aC<=(av+ac)then local aF,aG=as or(ap:IsA
'Model'and ap:FindFirstChildWhichIsA'BasePart')or ap,{isTrajectory=true,
isDynamicMoving=true,perpDist=aC,dangerRadius=av,forward2D=au,originPos=at,
maxLookahead=aw}return true,aF,aG end return false,nil,nil end function af.
IsPointInAnyHazard(an,ao)local ap,aq,ar,as,at=ah(),(math.huge)for au,av in
pairs(ap.GetActiveHazardsMap())do if ao then if av.Instance==ao or(av.Instance
and av.Instance.Name==ao.Name)or(av.Name and av.Name==ao.Name)then continue end
end local aw,ax=av.Name and av.Name:lower():find'multiring'~=nil,av.Instance and
av.Instance:IsA'Model'and((av.Name and av.Name:lower():find'movingbeam'~=nil)or(
av.Instance.Name and av.Instance.Name:lower():find'movingbeam'~=nil))local ay=ax
or(av.Instance and ap.GetLockedProjectiles()[av.Instance]~=nil)if aw then local
az,aA=af.IsPointInThirdBossMultiRings(an,av)if az then local aB=(an-aA.Position)
.Magnitude if aB<aq then aq=aB ar=av as=aA at=nil end end elseif ay then local
az,aA,aB=af.IsPointInSecondBossMovingBeam(an,av)if az then local aC=(an-(aA and
aA.Position or av.Instance.Position)).Magnitude if aC<aq then aq=aC ar=av as=aA
or av.Instance at=aB end end elseif av.ActiveParts then for az in pairs(av.
ActiveParts)do if ao and(az==ao or az.Name==ao.Name)then continue end local aA=
ap.GetTrajectoryConfigForPart(az)if aA then local aB,aC,aD,aE,aF,aG=af.
IsPointInTrajectory(an,az)if aB then local aH=(an-az.Position).Magnitude if aH<
aq then aq=aH ar=av as=az at={isTrajectory=true,perpDist=aC,dangerRadius=aD,
forward2D=aE,originPos=aF,maxLookahead=aG,isExpandingCone=(aA and aA.
isExpandingCone)or false,expansionRate=(aA and aA.expansionRate)or 0.25}end end
else if af.IsPointInPart(an,az)then local aB=(an-az.Position).Magnitude if aB<aq
then aq=aB ar=av as=az at=nil end end end end end end if as then return true,ar,
as,at end return false,nil,nil,nil end local an={Vector3.new(1,0,0),Vector3.new(
-1,0,0),Vector3.new(0,0,1),Vector3.new(0,0,-1)}function af.IsSpotFullySafe(ao,ap
,aq)if not ao then return false end ap=ap or 0.5 if af.IsPointInAnyHazard(ao,aq)
then return false end if ap>0.6 then for ar,as in ipairs(an)do local at=ao+(as*
ap)if af.IsPointInAnyHazard(at,aq)then return false end end end return true end
function af.GetAllHazardsAtPoint(ao)local ap,aq,ar=ah(),{},0 for as,at in pairs(
ap.GetActiveHazardsMap())do local au=at.Name and at.Name:lower():find'multiring'
~=nil if au then local av,aw=af.IsPointInThirdBossMultiRings(ao,at)if av then aq
[aw]=true if at.Instance then aq[at.Instance]=true end ar=ar+1 end elseif at.
Instance and at.Instance:IsA'Model'and((at.Name and at.Name:lower():find
'movingbeam'~=nil)or(at.Instance.Name and at.Instance.Name:lower():find
'movingbeam'~=nil))then local av,aw=af.IsPointInSecondBossMovingBeam(ao,at)if av
then aq[aw or at.Instance]=true if at.Instance then aq[at.Instance]=true end ar=
ar+1 end elseif at.ActiveParts then for av in pairs(at.ActiveParts)do local aw=
ap.GetTrajectoryConfigForPart(av)if aw then local ax=af.IsPointInTrajectory(ao,
av)if ax then aq[av]=true if at.Instance then aq[at.Instance]=true end if av.
Parent and av.Parent~=ab then aq[av.Parent]=true end ar=ar+1 end else if af.
IsPointInPart(ao,av)then aq[av]=true if at.Instance then aq[at.Instance]=true
end if av.Parent and av.Parent~=ab then aq[av.Parent]=true end ar=ar+1 end end
end end end return aq,ar end function af.IsPathSafe(ao,ap,aq,ar,as)local at=(ap-
ao).Magnitude if at<=1.2 then return true end local au=math.clamp(math.ceil(at/
2.8),2,14)for av=1,au-1 do local aw=av/au local ax=ao:Lerp(ap,aw)local ay,az,aA,
aB=af.IsPointInAnyHazard(ax,as)if ay then local aC,aD,aE=(az and az.Instance),aA
and aA.Parent,false if aq and next(aq)~=nil then aE=(aA and aq[aA])or(aC and aq[
aC])or(aD and aq[aD])elseif ar then local aF=ar:IsA'Model'and ar or ar.Parent aE
=(aA and aA==ar)or(aF and aC and aF==aC)or(aF and aD and aF==aD)end if aB and aB
.isTrajectory and not aE then return false end if not aE then return false end
end end return true end return af end function a.X()local aa,ab,ac,ad,ae=a.load
'i',a.load'j',a.load'a',a.load'b',(a.load'V')local af,ag,ah,ai,aj,ak,al,am,an,ao
,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH=function()if not
geometryRef then geometryRef=a.load'W'end return geometryRef end,game:GetService
'Players',game:GetService'Workspace',game:GetService'ReplicatedStorage',game:
GetService'HttpService',aa.player,{},false,false,false,false,true,{},0,{},{},{},
{},{smallIceSpikes={hitDelay=0.8,totalLifetime=1.2},mediumIceSpikes={hitDelay=
1.1,totalLifetime=1.5},largeIceSpikes={hitDelay=1.4,totalLifetime=1.8},
thirdBossMultiRings={hitDelay=2,totalLifetime=2.8},firstBossCrissCross={hitDelay
=1.6,totalLifetime=2.2},firstBossSeekingSpikes={hitDelay=1.8,totalLifetime=2.5},
firstBossBigSpike={hitDelay=1.5,totalLifetime=2},firstBossBeamPart={hitDelay=1.5
,totalLifetime=2},secondBossMovingBeam={hitDelay=0,totalLifetime=3.5},
secondbossyelloworb={hitDelay=0,totalLifetime=4},secondbossredorb={hitDelay=0,
totalLifetime=4},secondbossgreenorb={hitDelay=0,totalLifetime=4},
secondbosscriclehitbox={hitDelay=0.4,totalLifetime=2.5},secondbosscirclehitbox={
hitDelay=0.4,totalLifetime=2.5},secondBossCricleHitbox={hitDelay=0.4,
totalLifetime=2.5},secondBossCircleHitbox={hitDelay=0.4,totalLifetime=2.5}},{
DodgeNode_ESP=true,['Enhanced Aura Ring']=true,EnhancedAuraRing=true,[
'Enhanced Aura']=true,EnhancedAura=true,['Aura Ring']=true,AuraRing=true,
AuraRingMesh=true,groundAura=true,GroundAura=true,['Ground Aura']=true,[
'ground aura']=true},{largeIceSpikes=true,mediumIceSpikes=true,smallIceSpikes=
true,thirdBossMultiRings=true,thirdBossMissile=true,thirdBossBeamPart=true,
firstBossCrissCross=true,firstBossSeekingSpikes=true,firstBossBigSpike=true,
firstBossBeamPart=true,secondBossMovingBeam=true,secondbossyelloworb=true,
secondbossredorb=true,secondbossgreenorb=true,secondBossCricleHitbox=true,
secondbosscriclehitbox=true,secondBossCircleHitbox=true,secondbosscirclehitbox=
true},0.85,{dungeon=true,Dungeon=true,Terrain=true,Camera=true,CurrentCamera=
true,RaycastIgnore=true,Drops=true,Loot=true,DodgeNode_ESP=true,
SmartDodge_SafeMarker=true,SmartDodge_SelectionBox=true,SmartDodge_TrajectoryBox
=true,SmartDodge_CrystalGuideBox=true,secondBossCrystals=true,secondbosscrystals
=true,['Enhanced Aura Ring']=true,EnhancedAuraRing=true,['Enhanced Aura']=true,
EnhancedAura=true,['Aura Ring']=true,AuraRing=true,groundAura=true,GroundAura=
true,['Ground Aura']=true,['ground aura']=true},{secondbossyelloworb={colorName=
'yellow',color=Color3.fromRGB(255,230,0),surfaceColor=Color3.fromRGB(255,215,0)}
,secondbossredorb={colorName='red',color=Color3.fromRGB(255,45,45),surfaceColor=
Color3.fromRGB(255,30,30)},secondbossgreenorb={colorName='green',color=Color3.
fromRGB(50,255,50),surfaceColor=Color3.fromRGB(40,220,40)}},{firstbosscrisscross
={name='firstBossCrissCross',dangerRadius=4,maxLookahead=nil,visualColor=Color3.
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
maxLookahead=140,visualColor=Color3.fromRGB(255,130,0)},secondbosscriclehitbox={
name='secondBossCricleHitbox',dangerRadius=8,maxLookahead=95,visualColor=Color3.
fromRGB(255,90,0),isExpandingCone=true,expansionRate=0.25},
secondbosscirclehitbox={name='secondBossCircleHitbox',dangerRadius=8,
maxLookahead=95,visualColor=Color3.fromRGB(255,90,0),isExpandingCone=true,
expansionRate=0.25}},50,2.5,{},{}al.SetTrajectoryLookahead=function(aI)if type(
aI)=='number'and aI>=10 then aE=aI end end al.GetTrajectoryLookahead=function()
return aE end al.SetTrajectoryWidthPadding=function(aI)if type(aI)=='number'and
aI>=0 then aF=aI end end al.GetTrajectoryWidthPadding=function()return aF end al
.GetActiveHazardsMap=function()return ar end al.GetLockedProjectiles=function()
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
return aD[aK]end end if aJ:find'cricle'or aJ:find'circle'then return aD.
secondbosscriclehitbox end if aI.Parent and aI.Parent:IsA'Model'then local aK=aI
.Parent.Name:lower():gsub('%s+','')if aK:find'cricle'or aK:find'circle'then
return aD.secondbosscriclehitbox end end return nil end al.
GetTrajectoryConfigForPart=function(aJ)return aI(aJ)end local aJ=function(aJ)if
not aJ or not aJ:IsA'BasePart'then return 6,nil end local aK,aL,aM=aJ:
FindFirstChildOfClass'Beam'or(aJ.Parent and aJ.Parent:FindFirstChildOfClass
'Beam')if aK then local aN,aO=aK.Width0 or 0,aK.Width1 or 0 local aP=math.max(aN
,aO)if aP>0.5 then aL=aP end end local aN=aJ:FindFirstChild'Attachment2'or(aJ.
Parent and aJ.Parent:FindFirstChild'Attachment2')if aN and aN:IsA'Attachment'
then local aO=aN.WorldPosition-aJ.Position if aO.Magnitude>5 then aM=aO.
Magnitude end end local aO=aJ:FindFirstChildOfClass'SpecialMesh'local aP,aQ,aR=(
aO and aO.Scale.X)or 1,(aO and aO.Scale.Y)or 1,(aO and aO.Scale.Z)or 1 local aS=
Vector3.new(aJ.Size.X*math.abs(aP),aJ.Size.Y*math.abs(aQ),aJ.Size.Z*math.abs(aR)
)if not aL then local aT,aU=aJ.Name:lower():find'movingbeam'or(aJ.Parent and aJ.
Parent.Name:lower():find'movingbeam'),aJ.Name:lower():find'bigspike'or(aJ.Parent
and aJ.Parent.Name:lower():find'bigspike')if aT then aL=math.max(aS.X,aS.Z)
elseif aU then aL=40 if not aM then aM=140 end else local aV,aW=math.min(aS.X,aS
.Z),math.max(aS.X,aS.Z)if aV<1.2 and aW>=1.2 then aL=aW else aL=aV end end end
local aT=math.clamp(aL or 6,3,60)return aT,aM end local aK=function(aK)if not aK
or not aK:IsA'BasePart'then return nil end if aG[aK]then return aG[aK]end local
aL=aI(aK)if not aL then return nil end if aL.isDynamicMoving then local aM=aK.
Name:lower():find'movingbeam'or(aK.Parent and aK.Parent.Name:lower():find
'movingbeam')if aM then local aN=math.max(aK.Size.X,aK.Size.Z)if aN<8 then
return nil end end end local aM,aN,aO=Vector3.new(0,0,-1),(aK.
AssemblyLinearVelocity or(aK:IsA'BasePart'and aK.Velocity))if aN and Vector3.
new(aN.X,0,aN.Z).Magnitude>2 then aM=Vector3.new(aN.X,0,aN.Z).Unit elseif aL.
isDynamicMoving then local aP=aK.CFrame.RightVector local aQ=Vector3.new(aP.X,0,
aP.Z)if aQ.Magnitude>0.01 then aQ=aQ.Unit else aQ=Vector3.new(1,0,0)end local aR
,aS=Vector3.new(-aQ.Z,0,aQ.X),Vector3.new(aK.CFrame.LookVector.X,0,aK.CFrame.
LookVector.Z)if aS.Magnitude>0.01 and aR:Dot(aS.Unit)<0 then aR=-aR end aM=aR
elseif aL.isExpandingCone then local aP=ak and ak.Character and ak.Character:
FindFirstChild'HumanoidRootPart'local aQ=aP and aP.Position if aQ then local aR=
Vector3.new(aQ.X-aK.Position.X,0,aQ.Z-aK.Position.Z)local aS=aR.Magnitude if aS>
0.3 then aM=aR.Unit aO=math.clamp(aS+35,85,160)end end else local aP=aK:
FindFirstChild'Attachment2'or(aK.Parent and aK.Parent:FindFirstChild
'Attachment2')if aP and aP:IsA'Attachment'then local aQ=aP.WorldPosition-aK.
Position local aR=Vector3.new(aQ.X,0,aQ.Z)if aR.Magnitude>0.1 then aM=aR.Unit
end else local aQ=aK.CFrame.LookVector local aR=Vector3.new(aQ.X,0,aQ.Z)if aR.
Magnitude>0.001 then aM=aR.Unit end end if aK.Name:lower():find'missile'then for
aQ,aR in pairs(aG)do if aQ and aQ.Parent and aQ.Name:lower():find'beampart'and
aR and aR.forward2D then if(aQ.Position-aK.Position).Magnitude<10 then aM=aR.
forward2D if aR.maxLookahead then aO=aR.maxLookahead end break end end end end
end local aP,aQ=aJ(aK)local aR=aP/2 aO=aO or aQ if aL.dangerRadius and aL.
dangerRadius>aR then aR=aL.dangerRadius end local aS,aT,aU,aV=aR+aF,aO or aL.
maxLookahead or aE,af().GetRawFloorY(aK.Position)local aW=0.8 local aX=aU+(aW/2)
+0.05 local aY={part=aK,originPos=aK.Position,forward2D=aM,dangerRadius=aS,
maxLookahead=aT,config=aL,spawnTime=os.clock(),locked=true,rawFloorY=aU,
lockedVisualY=aX,boxThickness=aW}aG[aK]=aY if an then print((
'[SmartDodge] \u{1f680} Locked Trajectory for %s | Dir: (%.2f, %.2f) | Lookahead: %.0fm | Auto Width: %.1fm (Radius: %.1fm) | Locked Floor Y: %.2f'
):format(aK.Name,aM.X,aM.Z,aY.maxLookahead,aP,aY.dangerRadius,aU))end return aY
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
'movingbeam')or aS.Name:lower():find'cricle'or(aS.Parent and aS.Parent.Name:
lower():find'cricle')or aS.Name:lower():find'circle'or(aS.Parent and aS.Parent.
Name:lower():find'circle')or aS.Name:lower():find'thirdboss'or(aS.Parent and aS.
Parent.Name:lower():find'thirdboss')or aS.Name:lower():find'missile'or(aS.Parent
and aS.Parent.Name:lower():find'missile')then return false end if ay[aS.Name]or
ay[aT]or ay[aU]or aB[aS.Name]then return true end if aU:find('enhancedaura',1,
true)or aU:find('auraring',1,true)or aU:find('groundaura',1,true)then return
true end return false end al.IsIgnoredPart=function(aV)return aU(aV)end local aV
,aW,aX,aY,aZ,a_,a0,a1=function(aV)local aW={}if not aV or aV.Name:find
'SmartDodge'or aU(aV)then return aW,false end local aX,aY=az[aV.Name]or aV.Name:
lower():find'multiring'or aV.Name:lower():find'crisscross'or aV.Name:lower():
find'seekingspike'or aV.Name:lower():find'bigspike'or aV.Name:lower():find
'beampart'or aV.Name:lower():find'movingbeam'or aV.Name:lower():find'cricle'or
aV.Name:lower():find'circle'or aV.Name:lower():find'thirdboss'or aV.Name:lower()
:find'missile',function(aX)if not aX or not aX:IsA'BasePart'or aU(aX)then return
false end local aY=aX.Name:lower():gsub('%s+','')if aT[aY]then return false end
if aV.Name:lower():find'multiring'and not aY:find'ring'then return false end if
aI(aX)then return true end return aX.Transparency<aA end if aX then if aV:IsA
'BasePart'then if aY(aV)then table.insert(aW,aV)end elseif aV:IsA'Model'then
local aZ={}for a_,a0 in ipairs(aV:GetDescendants())do if aY(a0)and(a0.Name:
lower():find'precast'or a0.Name:lower():find'ring'or a0.Name:lower():find
'cricle'or a0.Name:lower():find'circle'or a0.Name:lower():find'hitbox')then
table.insert(aZ,a0)end end if#aZ>0 then aW=aZ else for a_,a0 in ipairs(aV:
GetDescendants())do if aY(a0)and a0.Material==Enum.Material.Neon then table.
insert(aW,a0)end end if#aW==0 then for a_,a0 in ipairs(aV:GetDescendants())do if
aY(a0)then table.insert(aW,a0)end end end end end else if aV:IsA'BasePart'then
if aY(aV)and aV.Material==Enum.Material.Neon then table.insert(aW,aV)end elseif
aV:IsA'Model'then for aZ,a_ in ipairs(aV:GetDescendants())do if aY(a_)and a_.
Material==Enum.Material.Neon then table.insert(aW,a_)end end end end return aW,
aX end,function(aV,aW)if aW and#aW>0 then return aW[1].Position end if aV:IsA
'BasePart'then return aV.Position elseif aV:IsA'Model'then local aX=aV:GetPivot(
)if aX and aX.Position~=Vector3.zero then return aX.Position end end return
Vector3.zero end,function()for aV,aW in ipairs(at)do pcall(aW,as,lastHazardInfo)
end end,function(aV)local aW={}for aX,aY in ipairs(aV)do if aY and aY:IsA
'BasePart'and aY.Parent then local aZ,a_,a0,a1,a2=(aY.Material==Enum.Material.
Neon),aC[aY.Name:lower()]or(aY.Parent and aC[aY.Parent.Name:lower()]),aY.Name:
lower():find'precast'~=nil,aY.Name:lower():find'ring'~=nil,aI(aY)~=nil if aZ or
a_ or a0 or a1 or a2 then local a3=Instance.new'SelectionBox'a3.Name=
'SmartDodge_SelectionBox'if a_ then a3.Color3=a_.color a3.SurfaceColor3=a_.
surfaceColor a3.SurfaceTransparency=0.5 a3.LineThickness=0.08 else a3.Color3=
Color3.fromRGB(255,45,45)a3.SurfaceColor3=Color3.fromRGB(255,30,30)a3.
SurfaceTransparency=0.6 a3.LineThickness=0.05 end a3.Adornee=aY a3.Parent=aY
table.insert(aW,a3)end end end return aW end,function(aV)if ae then return ae.
GetSkillTiming(aV)end local aW=ax[aV]if aW then if type(aW)=='table'then return
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
aE,bf.dangerRadius or 4,bf.forward2D,ba.Position local bk,bl,bm,bn,bo,bp=bj+bi*(
bg/2),bf.lockedVisualY or(bf.rawFloorY and(bf.rawFloorY+0.45))or(af().
GetRawFloorY(bj)+0.45),bf.boxThickness or 0.8,bg,(bf.config and bf.config.
isExpandingCone),bh*2 if bo then local bq=(bf.config and bf.config.expansionRate
)or 0.25 bp=math.floor((bh+(bg*bq/2))*2)end local bq,br=bo and(
'\u{26a1} CONE CORRIDOR: %s (%.0fm | W:%.1fm)'):format(ba.Name,bg,bp)or(
'\u{1f680} TRAJECTORY: %s (%.0fm | W:%.1fm)'):format(ba.Name,bg,bp),aH[ba]if not
br or not br.Parent then br=Instance.new'Part'br.Name='SmartDodge_TrajectoryBox'
br.Material=Enum.Material.Neon br.Color=bb.visualColor or Color3.fromRGB(255,130
,0)br.Transparency=0.82 br.Anchored=true br.CanCollide=false br.CanQuery=false
br.CanTouch=false local bs=Instance.new'SelectionBox'bs.Name='TrajectoryBorder'
bs.Color3=Color3.fromRGB(255,150,30)bs.SurfaceColor3=bb.visualColor or Color3.
fromRGB(255,130,0)bs.SurfaceTransparency=0.8 bs.LineThickness=0.04 bs.Adornee=br
bs.Parent=br local bt=Instance.new'BillboardGui'bt.Name='TrajGui'bt.Size=UDim2.
fromOffset(200,26)bt.StudsOffset=Vector3.new(0,2.5,0)bt.AlwaysOnTop=true bt.
Adornee=br bt.Parent=br local bu=Instance.new'TextLabel'bu.Name='Label'bu.Size=
UDim2.fromScale(1,1)bu.BackgroundTransparency=1 bu.TextColor3=Color3.fromRGB(255
,170,40)bu.TextStrokeTransparency=0 bu.TextStrokeColor3=Color3.fromRGB(0,0,0)bu.
Font=Enum.Font.GothamBold bu.TextSize=12 bu.Text=bq bu.Parent=bt aH[ba]=br else
local bs=br:FindFirstChild'TrajGui'local bt=bs and bs:FindFirstChild'Label'if bt
and bt:IsA'TextLabel'then bt.Text=bq end end br.Size=Vector3.new(bp,bm,bn)local
bs=Vector3.new(bk.X,bl,bk.Z)br.CFrame=CFrame.lookAt(bs,bs+bi)br.Parent=ah.
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
return al end function a.Y()local aa,ab,ac,ad=a.load'i',a.load'j',a.load'b',a.
load'R'local ae,af,ag,ah,ai,aj=aa.player,false,false,{}function ah.SetDodging(ak
)ag=ak and true or false end function ah.SetTargetOverride(ak)aj=ak end function
ah.GetTargetOverride()return aj end local ak,al=function()local ak=ae and ae.
Character local al=ak and ak:FindFirstChild'HumanoidRootPart'if al and al.Parent
then return al end return nil end,function()local ak=ae and ae.Character local
al=ak and ak:FindFirstChildOfClass'Humanoid'if al and al.Parent then return al
end return nil end local am=function()local am=al()if am then if af and ah.
IsTargetActive()then am.AutoRotate=false else am.AutoRotate=true end end end
function ah.GetTargetPosition()if aj then return aj end local an=ad.GetTarget()
if an and an.Root and an.Root.Parent then local ao=an.Humanoid or(an.Model and
an.Model:FindFirstChildOfClass'Humanoid')if ao and ao.Health>0 then return an.
Root.Position end end local ao=ak()local ap,aq=ao and ao.Position,ab.
GetTrackedEnemyData()if aq and#aq>0 and ap then local ar,as=(math.huge)for at,au
in ipairs(aq)do if au and au.Root and au.Root.Parent then local av=au.Humanoid
or(au.Model and au.Model:FindFirstChildOfClass'Humanoid')if av and av.Health>0
then local aw=(au.Root.Position-ap).Magnitude if aw<ar then ar=aw as=au.Root.
Position end end end end return as end return nil end function ah.IsTargetActive
()return ah.GetTargetPosition()~=nil end local an,ao=function()if ai then return
end am()ai=task.spawn(function()while af and ac.IsActive()do if not ag then
local an,ao,ap=ah.GetTargetPosition(),ak(),al()if an then if ao and ap and ap.
Health>0 then if ap.AutoRotate~=false then ap.AutoRotate=false end local aq=ao.
Position local ar=Vector3.new(an.X,aq.Y,an.Z)local as=ar-aq if as.Magnitude>0.5
then local at,au=ao.CFrame.LookVector,Vector3.new(as.X,0,as.Z).Unit if at:Dot(au
)<0.999 then ao.CFrame=CFrame.lookAt(aq,ar)end end end else if ap and ap.Health>
0 and ap.AutoRotate~=true then ap.AutoRotate=true end end end task.wait(0.03)end
ai=nil end)end,function()if ai then task.cancel(ai)ai=nil end local an=al()if an
then an.AutoRotate=true end end function ah.SetEnabled(ap)af=ap and true or
false if af then an()else ao()end end function ah.IsEnabled()return af end ab.
OnRespawn(function()if af then task.defer(function()am()end)end end)ac.Register(
function()aj=nil ao()end)return ah end function a.Z()local aa,ab,ac,ad,ae,af=a.
load'i',a.load'j',a.load'W',a.load'X',a.load'Y',game:GetService'Workspace'local
ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.player,false,false,0,false,2.6,50 local aq,ar,
as,at,au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI=am,{2.5,4.5,7,10.5,15,20,26,
33,42,52},{0,30,-30,60,-60,90,-90,120,-120,150,-150,180},false,0,false,{},false,
{}function ay.IsShowSafeMarkerEnabled()return ah end function ay.
SetShowSafeMarker(aJ)ah=aJ and true or false ay.UpdateMarker(aC,at,au)end
function ay.IsShowPlayerRadarEnabled()return ai end function ay.
SetShowPlayerRadar(aJ)ai=aJ and true or false if not ai then ay.
ClearPlayerRadar()else ay.UpdatePlayerRadar(aE,av)end end function ay.
IsShowHitboxVisualEnabled()return ak end function ay.SetShowHitboxVisual(aJ)ak=
aJ and true or false ay.UpdateHitbox(aD)end function ay.SetHitboxPadding(aJ)ac.
SetHitboxPadding(aJ)if ap and ap.Parent then local aK=math.max(0.4,ac.
GetHitboxPadding()*2)ap.Size=Vector3.new(0.15,aK,aK)end end function ay.
GetBoss1ArenaCenter()return az end function ay.GetBoss1ArenaRadius()return aq or
am end local aJ='All'function ay.SetTargetScope(aK)if aK=='Boss'or aK=='Mobs'or
aK=='All'then aJ=aK end end function ay.GetTargetScope()return aJ end local aK,
aL local aM=function()if aK then pcall(function()aK:Destroy()end)aK=nil end aL=
nil end local aN,aO=function(aN,aO)if not aN or not aN.Parent then aM()return
end if aL==aN and aK and aK.Parent then return end aM()aL=aN pcall(function()
local aP=Instance.new'SelectionBox'aP.Name='SmartDodge_CrystalGuideBox'local aQ=
(aO=='green'and Color3.fromRGB(50,255,50))or(aO=='yellow'and Color3.fromRGB(255,
230,0))or Color3.fromRGB(255,45,45)aP.Color3=aQ aP.SurfaceColor3=aQ aP.
SurfaceTransparency=0.5 aP.LineThickness=0.08 aP.Adornee=aN aP.Parent=aN aK=aP
end)end local aP,aQ,aR=function(aP)local aQ=aO if not aQ or not aQ.Parent then
aQ=af:FindFirstChild'secondBossCrystals'if not aQ then local aR=af:
FindFirstChild'dungeon'if aR then aQ=aR:FindFirstChild('secondBossCrystals',true
)end end if not aQ then aQ=af:FindFirstChild('secondBossCrystals',true)end if aQ
then aO=aQ end end if not aQ then return nil,{}end local aR,aS,aT={},aP and aP:
lower()or''for aU,aV in ipairs(aQ:GetChildren())do local aW,aX=aV.Name:lower(),
aV:IsA'BasePart'and aV or aV:FindFirstChildWhichIsA'BasePart'if aX then if#aS>0
and(aW==aS or aW:find(aS))then aT=aX else table.insert(aR,aX)end end end return
aT,aR end,0 local aS,aT,aU=function()if aR and aR.Parent then return aR end
local aS=os.clock()if aS-aQ<5 then return nil end aQ=aS local aT=af:
FindFirstChild'FirstPart'if not aT then local aU=af:FindFirstChild'dungeon'if aU
then aT=aU:FindFirstChild('FirstPart',true)end end if not aT then aT=af:
FindFirstChild('FirstPart',true)end if aT and aT:IsA'BasePart'then aR=aT return
aT end return nil end,function()if aA then pcall(function()aA:Destroy()end)aA=
nil end aR=nil aB=nil end,function(aS,aT,aU)if aB then return aB end local aV if
aT then local aW,aX=ac.GetRawFloorY(aT)if aX and aW then aV=aW+0.1 end end if
not aV and aU then aV=aU.Position.Y-(aU.Size.Y/2)+0.1 end if not aV and aS then
local aW,aX=ac.GetRawFloorY(aS)if aX and aW then aV=aW+0.1 end end if aV then aB
=aV end return aB or(aT and(aT.Y-2.8))or(aS and(aS.Y-2.8))or 0 end local aV,aW,
aX=function(aV,aW,aX)if not aV then aT()return end local aY,aZ=aU(aV,aW,aX),aq
or am local a_,a0=(aX and aX.Size.X)or(aZ*2),CFrame.new(aV.X,aY,aV.Z)*CFrame.
Angles(0,0,math.rad(90))if aA and aA.Parent then if math.abs(aA.Size.Y-a_)>0.5
then aA.Size=Vector3.new(0.2,a_,a_)end return end pcall(function()local a1=
Instance.new'Part'a1.Name='SmartDodge_Boss1ArenaVisual'a1.Shape=Enum.PartType.
Cylinder a1.Size=Vector3.new(0.2,a_,a_)a1.Color=Color3.fromRGB(0,220,255)a1.
Material=Enum.Material.Neon a1.Transparency=0.88 a1.Anchored=true a1.CanCollide=
false a1.CanTouch=false a1.CanQuery=false local a2=Instance.new'Highlight'a2.
Name='ArenaOutline'a2.FillColor=Color3.fromRGB(0,180,255)a2.FillTransparency=
0.92 a2.OutlineColor=Color3.fromRGB(0,240,255)a2.OutlineTransparency=0.1 a2.
Adornee=a1 a2.Parent=a1 local a3=Instance.new'BillboardGui'a3.Name='ArenaLabel'
a3.Size=UDim2.fromOffset(180,26)a3.StudsOffset=Vector3.new(0,3,0)a3.AlwaysOnTop=
true a3.Adornee=a1 a3.Parent=a1 local a4=Instance.new'TextLabel'a4.Name='Label'
a4.Size=UDim2.fromScale(1,1)a4.BackgroundTransparency=1 a4.TextColor3=Color3.
fromRGB(0,230,255)a4.TextStrokeTransparency=0.2 a4.TextStrokeColor3=Color3.
fromRGB(0,0,0)a4.Font=Enum.Font.GothamBold a4.TextSize=13 a4.Text=
'BOSS 1 ARENA (Safe Zone)'a4.Parent=a3 a1.CFrame=a0 a1.Parent=af.Terrain aA=a1
end)end,function(aV,aW)if not az then return true end local aX,aY=Vector3.new(aV
.X,0,aV.Z),Vector3.new(az.X,0,az.Z)local aZ,a_=(aX-aY).Magnitude,aq or am local
a0=a_ if aW then local a1=Vector3.new(aW.X,0,aW.Z)a0=(a1-aY).Magnitude end local
a1=math.max(a_,a0-0.5)return aZ<=a1 end,function(aV,aW)if not az or not aW then
return 0 end local aX=Vector3.new(az.X,0,az.Z)local aY,aZ,a_=(Vector3.new(aW.X,0
,aW.Z)-aX).Magnitude,(Vector3.new(aV.X,0,aV.Z)-aX).Magnitude,aq or am local a0=
a_*0.7 if aY>a0 then if aZ<aY-0.5 then return-2 elseif aZ>aY+0.5 then return 3
end end return 0 end ab.OnBossActiveChanged(function(aY)if not aY then az=nil aq
=am aR=nil aO=nil aT()end end)ab.OnBossIndexChanged(function(aY)aR=nil aO=nil if
aY~=1 then az=nil aq=am aT()end end)function ay.HideVisuals()if ao and ao.Parent
then ao.Parent=nil end if ap and ap.Parent then ap.Parent=nil end ay.
ClearPlayerRadar()aT()aM()aC=nil at=false au=0 aD=nil end function ay.
DestroyVisuals()if ao then pcall(function()ao:Destroy()end)ao=nil end if ap then
pcall(function()ap:Destroy()end)ap=nil end ay.ClearPlayerRadar()for aY,aZ in
ipairs(aw)do if aZ.shaft then pcall(function()aZ.shaft:Destroy()end)end if aZ.
head then pcall(function()aZ.head:Destroy()end)end end table.clear(aw)aT()aM()
end function ay.ResetLock()an=nil aj=0 aM()end local aY=function()if ap and ap.
Parent then return ap end local aY=Instance.new'Part'aY.Name=
'SmartDodge_HitboxVisual'aY.Shape=Enum.PartType.Cylinder local aZ=math.max(0.4,
ac.GetHitboxPadding()*2)aY.Size=Vector3.new(0.15,aZ,aZ)aY.Color=Color3.fromRGB(0
,220,255)aY.Material=Enum.Material.Neon aY.Transparency=0.75 aY.Anchored=true aY
.CanCollide=false aY.CanQuery=false aY.CanTouch=false local a_=Instance.new
'SelectionBox'a_.Name='HitboxBorder'a_.Color3=Color3.fromRGB(120,240,255)a_.
SurfaceColor3=Color3.fromRGB(0,220,255)a_.SurfaceTransparency=0.8 a_.
LineThickness=0.04 a_.Adornee=aY a_.Parent=aY ap=aY return aY end function ay.
UpdateHitbox(aZ)aD=aZ if not ak or not ad.IsEnabled()or not aZ then if ap then
ap.Parent=nil end return end local a_,a0=aY(),math.max(0.4,ac.GetHitboxPadding()
*2)a_.Size=Vector3.new(0.15,a0,a0)local a1,a2=ac.GetFloorPosition(aZ)local a3=a2
and(a1.Y-2.8)or(aZ.Y-2.8)local a4=Vector3.new(aZ.X,a3,aZ.Z)a_.CFrame=CFrame.new(
a4)*CFrame.Angles(0,0,math.rad(90))a_.Parent=af.Terrain end local aZ,a_,a0,a1,a2
,a3,a4,a5=24,0.8,15,{2.5,4.5,7,10.5,15,20,26,33,42,52},Color3.fromRGB(0,255,120)
,Color3.fromRGB(0,220,255),Color3.fromRGB(255,200,50),function(aZ)local a_=aw[aZ
]if a_ then return a_ end local a0=Instance.new'Part'a0.Name=
'SmartDodge_PlayerShaft_'..aZ a0.Material=Enum.Material.Neon a0.Anchored=true a0
.CanCollide=false a0.CanQuery=false a0.CanTouch=false a0.CastShadow=false a0.
Transparency=0.15 local a1=Instance.new'Part'a1.Name='SmartDodge_PlayerHead_'..
aZ a1.Material=Enum.Material.Neon a1.Anchored=true a1.CanCollide=false a1.
CanQuery=false a1.CanTouch=false a1.CastShadow=false a1.Transparency=0.15 a1.
Size=Vector3.new(0.32,0.04,0.32)a_={shaft=a0,head=a1}aw[aZ]=a_ return a_ end
function ay.ClearPlayerRadar()for a6,a7 in ipairs(aw)do if a7.shaft and a7.shaft
.Parent then a7.shaft.Parent=nil end if a7.head and a7.head.Parent then a7.head.
Parent=nil end end aF=nil ax=false aG=nil end function ay.UpdatePlayerRadar(a6,
a7)aE,av=a6,a7 or false if not ai or not ad.IsEnabled()or not a6 then ay.
ClearPlayerRadar()return end if not a7 then ax=false aG=nil return end local a8=
not ax or(aH and aH~=aG)if not a8 then return end ax=true aG=aH aF=a6 for a9,b
in ipairs(aw)do if b.shaft and b.shaft.Parent then b.shaft.Parent=nil end if b.
head and b.head.Parent then b.head.Parent=nil end end local a9=aF.Y-2.8 local b,
ba=a9+0.12,360/aZ for bb=1,aZ do local bc=(bb-1)*ba local bd=math.rad(bc)local
be,bf=math.cos(bd),math.sin(bd)local bg,bh=(Vector3.new(be,0,bf))for bi,bj in
ipairs(a1)do local bk=Vector3.new(aF.X+be*bj,aF.Y,aF.Z+bf*bj)if not ac.
IsPointInAnyHazard(bk)then if not(az and not aW(bk,aF))then bh=bj break end end
end local bi=a5(bb)if not bh then if bi.shaft.Parent then bi.shaft.Parent=nil
end if bi.head.Parent then bi.head.Parent=nil end continue end local bj,bk=bh,(
bh>a0)local bl=math.max(0.4,bj-a_)local bm,bn,bo,bp,bq=a_+(bl/2),a_+bl+0.16,bk
and a3 or a2,(bh<=3.5)and a2 or a4,bk and Vector3.new(0.42,0.05,0.42)or Vector3.
new(0.32,0.04,0.32)bi.shaft.Size=Vector3.new(bk and 0.15 or 0.12,0.04,bl)local
br=Vector3.new(aF.X+be*bm,b,aF.Z+bf*bm)bi.shaft.CFrame=CFrame.lookAt(br,br+bg)bi
.shaft.Color=bp bi.shaft.Parent=af.Terrain bi.head.Size=bq local bs=Vector3.new(
aF.X+be*bn,b,aF.Z+bf*bn)bi.head.CFrame=CFrame.lookAt(bs,bs+bg)*CFrame.Angles(0,
math.rad(45),0)bi.head.Color=bo bi.head.Parent=af.Terrain end end local a6,a7,a8
=function()if ao and ao.Parent then return ao end local a6=Instance.new'Part'a6.
Name='SmartDodge_SafeMarker'a6.Shape=Enum.PartType.Ball a6.Size=Vector3.new(1.5,
1.5,1.5)a6.Color=Color3.fromRGB(0,255,120)a6.Material=Enum.Material.Neon a6.
Transparency=0.2 a6.Anchored=true a6.CanCollide=false a6.CanQuery=false a6.
CanTouch=false local a7=Instance.new'BillboardGui'a7.Name='MarkerGui'a7.Size=
UDim2.fromOffset(130,24)a7.StudsOffset=Vector3.new(0,1.5,0)a7.AlwaysOnTop=true
a7.Adornee=a6 a7.Parent=a6 local a8=Instance.new'TextLabel'a8.Name='Label'a8.
Size=UDim2.fromScale(1,1)a8.BackgroundTransparency=1 a8.TextColor3=Color3.
fromRGB(80,255,160)a8.TextStrokeTransparency=0 a8.TextStrokeColor3=Color3.
fromRGB(0,0,0)a8.Font=Enum.Font.GothamBold a8.TextSize=12 a8.Text=
'\u{1f7e2} SAFE SPOT'a8.Parent=a7 ao=a6 return a6 end,(-1)function ay.
UpdateMarker(a9,b,ba)aC,at,au=a9,b or false,ba or 0 if not ah or not b or not a9
then if ao then ao.Parent=nil end a8=nil a7=-1 return end local bb,bc=a6(),a9.Y-
2.2 local bd=Vector3.new(a9.X,bc,a9.Z)if not a8 or(bd-a8).Magnitude>0.1 then a8=
bd bb.CFrame=CFrame.new(bd)end if not bb.Parent then bb.Parent=af.Terrain end
local be=ba or 0 if math.abs(be-a7)>=0.2 then a7=be local bf=bb:FindFirstChild
'MarkerGui'local bg=bf and bf:FindFirstChild'Label'if bg then bg.Text=(
'\u{1f7e2} SAFE SPOT (%.1fm)'):format(be)end end end local a9,b,ba,bb=3,function
(a9,b)if b and b.Parent and b:IsA'BasePart'then local ba,bb=a9.X-b.Position.X,a9
.Z-b.Position.Z local bc=ba*ba+bb*bb if bc>0.04 then local bd=math.sqrt(bc)
return Vector3.new(ba/bd,0,bb/bd)end end local ba,bb,bc=0,0,ad.
GetActiveHazardsMap and ad.GetActiveHazardsMap()if bc then local bd=0 for be,bf
in pairs(bc)do local bg if bf.ActiveParts then for bh in pairs(bf.ActiveParts)do
if bh and bh.Parent and bh:IsA'BasePart'then bg=bh.Position break end end end if
not bg and bf.Instance and bf.Instance.Parent then if bf.Instance:IsA'BasePart'
then bg=bf.Instance.Position end end bg=bg or bf.Position if bg then local bh,bi
=a9.X-bg.X,a9.Z-bg.Z local bj=bh*bh+bi*bi if bj<1600 and bj>0.01 then local bk=
math.sqrt(bj)local bl=1/math.max(1,bk)ba=ba+(bh/bk)*bl bb=bb+(bi/bk)*bl bd=bd+1
end end end local be=ba*ba+bb*bb if bd>0 and be>0.001 then local bf=math.sqrt(be
)return Vector3.new(ba/bf,0,bb/bf)end end if ae then local bd=ae.
GetTargetPosition()if bd then local be,bf=a9.X-bd.X,a9.Z-bd.Z local bg=be*be+bf*
bf if bg>0.01 then local bh=math.sqrt(bg)return Vector3.new(be/bh,0,bf/bh)end
end end return nil end,function(a9,b)local ba=0 if b then ba=math.deg(math.
atan2(b.Z,b.X))elseif a9 then ba=math.deg(math.atan2(a9.Z,a9.X))end local bb=
table.create(12)for bc,bd in ipairs(as)do bb[bc]=(ba+bd)%360 end return bb end,{
Vector3.new(2.5,0,0),Vector3.new(-2.5,0,0),Vector3.new(0,0,2.5),Vector3.new(0,0,
-2.5)}local bc=function(bc)local bd=0 for be,bf in ipairs(bb)do if not ac.
IsPointInAnyHazard(bc+bf)then bd=bd+1 end end return bd*0.75 end local bd=
function(bd,be,bf,bg)if az and not aW(be,bd)then return math.huge end local bh=
ad.GetActiveBossOrb and ad.GetActiveBossOrb()if bh and bh.Position then local bi
=(Vector3.new(be.X-bh.Position.X,0,be.Z-bh.Position.Z)).Magnitude if bi<12 then
return math.huge end end local bi,bj=(be-bd).Magnitude,bc(be)local bk=(bi*2)-(bj
*0.35)if bi>12 then bk=bk+((bi-12)*3.5)end local bl=ae and ae.GetTargetPosition
and ae.GetTargetPosition()if bl and bi>0.3 then local bm=Vector3.new(bl.X-bd.X,0
,bl.Z-bd.Z)if bm.Magnitude>1 then local bn=bm.Unit local bo,bp=Vector3.new(-bn.Z
,0,bn.X),Vector3.new(be.X-bd.X,0,be.Z-bd.Z)local bq,br=bp:Dot(bn),math.abs(bp.
Unit:Dot(bo))if br>=0.82 and math.abs(bq)<=2.2 then bk=bk-6 end if bq<-2 then bk
=bk+(math.abs(bq)*1.8)end if bq>2.5 then bk=bk+(bq*1.2)end end end if bi>0.5
then local bm=(be-bd).Unit if bg then local bn=bm:Dot(bg)if bn>0 then bk=bk-(bn*
3.5)else bk=bk+(math.abs(bn)*2)end elseif bf and not bl then local bn=bm:Dot(bf)
bk=bk-(bn*2)end end if az then bk=bk+aX(be,bd)end return bk end local be=
function(be,bf,bg,bh,bi)local bj,bk,bl,bm,bn=ba(bf,bi),math.huge,(math.huge)for
bo,bp in ipairs(ar)do local bq,br=(math.huge)for bs,bt in ipairs(bj)do local bu=
math.rad(bt)local bv=Vector3.new(math.cos(bu)*bp,0,math.sin(bu)*bp)local bw=be+
bv if ac.IsSpotFullySafe(bw,0.5)then local bx=bd(be,bw,bf,bi)if bx<bl then bl=bx
bn=bw end if ac.IsPathSafe(be,bw,bg,bh)then if bx<bq then bq=bx br=bw end end
end end if br then bm=br bk=bq break end end local bo,bp=bm or bn,bm and bk or
bl if bo then local bq,br=ac.GetFloorPosition(bo)local bs=br and bq or bo return
bs,bp end return nil,math.huge end function ay.CalculateSafeSpot(bf)local bg,bh=
ag and ag.Character and ag.Character:FindFirstChild'HumanoidRootPart',ag and ag.
Character and ag.Character:FindFirstChildOfClass'Humanoid'local bi=bf or(bg and
bg.Position)if not bi then an=nil aj=0 aM()return false,nil,nil,0 end local bj=
ab.IsBossActive()and ab.GetCurrentBossIndex()==1 if not bj then if az then az=
nil aq=am aT()end elseif not az or not(aA and aA.Parent)then local bk=aS()if bk
then local bl=bk.Position local bm=aU(bl,bi,bk)az=Vector3.new(bl.X,bm,bl.Z)local
bn=math.max(bk.Size.X,bk.Size.Z)/2 aq=math.max(20,bn-2.5)aV(az,bi,bk)elseif not
az then local bl=ae.GetTargetPosition()if not bl then local bm=ab.
GetTrackedEnemyData()if bm and#bm>0 and bm[1].Root and bm[1].Root.Parent then bl
=bm[1].Root.Position end end if bl then local bm=aU(bl,bi,nil)az=Vector3.new(bl.
X,bm,bl.Z)aq=am aV(az,bi,nil)end end end local bk=ad.GetHazardCount and ad.
GetHazardCount()or 0 if bk==0 then if an then an=nil aj=0 end aM()return false,
nil,nil,0 end if ab.GetEnemyCount()==0 and not ab.IsBossActive()then an=nil aj=0
aM()return false,nil,nil,0 end if aJ=='Boss'and not ab.IsBossActive()then an=nil
aj=0 aM()return false,nil,nil,0 elseif aJ=='Mobs'and ab.IsBossActive()then an=
nil aj=0 aM()return false,nil,nil,0 end if not ab.IsBossActive()then local bl,bm
=ab.GetTrackedEnemyData(),false if bl and#bl>0 then for bn,bo in ipairs(bl)do if
bo and bo.Root and bo.Root.Parent then local bp=bo.Humanoid or(bo.Model and bo.
Model:FindFirstChildOfClass'Humanoid')if bp and bp.Health>0 then if(bo.Root.
Position-bi).Magnitude<=85 then bm=true break end end end end end if not bm then
an=nil aj=0 aM()return false,nil,nil,0 end end local bl,bm=ad.GetActiveBossOrb()
if bl and bm then local bn=aP(bm)if bn then aN(bn,bm)end else aM()end local bn,
bo=math.huge,false if bl and bl.Position then bn=(Vector3.new(bl.Position.X-bi.X
,0,bl.Position.Z-bi.Z)).Magnitude if bn<16 then bo=true end end local bp=(not bo
)and bl or nil local bq,br,bs,bt=ac.IsPointInAnyHazard(bi,bp)if not bq and bo
then bq=true bs=bl br={Name=('%s Orb (Maintain Safe Distance)'):format(bm and bm
:upper()or'BOSS')}local bu=(bi-bl.Position)local bv=(bu.Magnitude>0.1)and
Vector3.new(bu.X,0,bu.Z).Unit or Vector3.new(0,0,1)bt={isTrajectory=true,
isDynamicMoving=true,isBossOrb=true,perpDist=0,dangerRadius=6,forward2D=bv,
originPos=bl.Position,maxLookahead=25}end if not bq or not bs then if bl and bm
then local bu,bv=aP(bm)if bu then local bw,bx=false,ad.GetActiveHazards and ad.
GetActiveHazards()if bx and#bx>0 then local by=false for bz,bA in ipairs(bx)do
local bB=bA.Instance if bB and bB~=bl and bB~=(bl and bl.Parent)then by=true
break end end if by and not ac.IsSpotFullySafe(bi,4.5,bl)then bw=true end end if
bw then if bn<28 and bl and bl.Position then local by=(bi-bl.Position)local bz=(
by.Magnitude>0.1)and Vector3.new(by.X,0,by.Z).Unit or Vector3.new(0,0,1)local bA
,bB,bC,bD,bE=Vector3.new(-bz.Z,0,bz.X),{6,10,15,20,26,32},{0,2,-2,4,-4},(-math.
huge)for bF,bG in ipairs(bB)do for bH,bI in ipairs(bC)do local bJ=bi+bz*bG+bA*bI
if ac.IsSpotFullySafe(bJ,0.5,bl)then if ac.IsPathSafe(bi,bJ,nil,nil,bl)then
local bK=(Vector3.new(bJ.X-bl.Position.X,0,bJ.Z-bl.Position.Z)).Magnitude if bK>
bD then bD=bK bE=bJ end end end end end if bE then local bF,bG=ac.
GetFloorPosition(bE)local bH=bG and bF or bE an=bH aj=1 return true,bH,(
'Kiting along corridor away from %s'):format(bm:upper()),(bH-bi).Magnitude end
end if bn>=28 then an=bi aj=1 return true,bi,(
'Waiting for nearby AoE to explode before leading %s'):format(bm:upper()),0 end
end local by,bz=bl.Position,bu.Position local bA=Vector3.new(bz.X-by.X,0,bz.Z-by
.Z)if bA.Magnitude>0.5 then bA=bA.Unit else bA=Vector3.new(0,0,1)end local bB,bC
=bz+bA*3.8,Vector3.new(bz.X-bi.X,0,bz.Z-bi.Z)local bD,bE=bC.Magnitude,Vector3.
new(by.X-bi.X,0,by.Z-bi.Z)local bF,bG=bE.Magnitude,bB if bD>8 and bF<bD and bF<
25 then local bH,bI=bC.Unit,bE.Unit local bJ=bH:Dot(bI)if bJ>0.75 then local bK=
Vector3.new(-bH.Z,0,bH.X)local bL,bM=bi+(bH*0.6+bK*0.8).Unit*12,bi+(bH*0.6-bK*
0.8).Unit*12 if(bL-by).Magnitude>(bM-by).Magnitude then bG=bL else bG=bM end end
end for bH,bI in ipairs(bv)do local bJ=bI.Position local bK=Vector3.new(bG.X-bJ.
X,0,bG.Z-bJ.Z)if bK.Magnitude<10 and bK.Magnitude>0.1 then bG=bG+bK.Unit*(10-bK.
Magnitude)end end local bH,bI=ac.GetFloorPosition(bG)local bJ=bI and bH or bG if
not ac.IsSpotFullySafe(bJ,0.5,bl)then local bK={30,-30,45,-45,60,-60,90,-90,120,
-120}for bL,bM in ipairs(bK)do local bN=math.rad(bM)local bO,bP=math.cos(bN),
math.sin(bN)local bQ=Vector3.new(bA.X*bO-bA.Z*bP,0,bA.X*bP+bA.Z*bO)local bR=bz+
bQ*4 if ac.IsSpotFullySafe(bR,0.5,bl)then local bS,bT=ac.GetFloorPosition(bR)bJ=
bT and bS or bR break end end end local bK=ac.IsPathSafe(bi,bJ,nil,nil,bl)if not
bK then local bL=Vector3.new(bJ.X-bi.X,0,bJ.Z-bi.Z)local bM=bL.Magnitude local
bN=bM>1 and bL.Unit or Vector3.new(0,0,1)local bO,bP,bQ,bR=Vector3.new(-bN.Z,0,
bN.X),{},{6,10,15,20},{8,-8,12,-12,16,-16,20,-20}for bS,bT in ipairs(bQ)do if bT
<bM then for bU,bV in ipairs(bR)do local bW=bi+bN*bT+bO*bV table.insert(bP,bW)
end end end local bS,bT=(math.huge)for bU,bV in ipairs(bP)do if ac.
IsSpotFullySafe(bV,0.5,bl)then if ac.IsPathSafe(bi,bV,nil,nil,bl)then local bW=
true for bX,bY in ipairs(bv)do if(bV-bY.Position).Magnitude<10 then bW=false
break end end if bW then local bX=(bV-bJ).Magnitude if bX<bS then bS=bX bT=bV
end end end end end if bT then local bU,bV=ac.GetFloorPosition(bT)local bW=bV
and bU or bT an=bW aj=1 return true,bW,('Detour around skill -> %s Crystal'):
format(bm:upper()),(bW-bi).Magnitude else if bl and bl.Position and bF<28 then
local bU=(bi-bl.Position)local bV=(bU.Magnitude>0.1)and Vector3.new(bU.X,0,bU.Z)
.Unit or Vector3.new(0,0,1)local bW,bX,bY,bZ,b_=Vector3.new(-bV.Z,0,bV.X),{6,10,
15,20,26,32},{0,2,-2,4,-4},(-math.huge)for b1,b3 in ipairs(bX)do for b5,b6 in
ipairs(bY)do local b7=bi+bV*b3+bW*b6 if ac.IsSpotFullySafe(b7,0.5,bl)then if ac.
IsPathSafe(bi,b7,nil,nil,bl)then local b8=(Vector3.new(b7.X-bl.Position.X,0,b7.Z
-bl.Position.Z)).Magnitude if b8>bZ then bZ=b8 b_=b7 end end end end end if b_
then local b1,b3=ac.GetFloorPosition(b_)local b5=b3 and b1 or b_ an=b5 aj=1
return true,b5,('Kiting along corridor away from %s'):format(bm:upper()),(b5-bi)
.Magnitude end end an=bi aj=1 return true,bi,(
'Waiting for path to clear -> %s Crystal'):format(bm:upper()),0 end end local bL
=(bJ-bi).Magnitude an=bJ aj=1 return true,bJ,('Lead %s -> %s Crystal'):format(bl
.Name,bm:upper()),bL end end an=nil aj=0 aM()return false,nil,nil,0 end local bu
,bv=br.Name or'Unknown'if bh and bh.MoveDirection.Magnitude>0.1 then bv=Vector3.
new(bh.MoveDirection.X,0,bh.MoveDirection.Z).Unit elseif bg then local bw=bg.
AssemblyLinearVelocity local bx=Vector3.new(bw.X,0,bw.Z)if bx.Magnitude>1.5 then
bv=bx.Unit end end local bw,bx=ac.GetAllHazardsAtPoint(bi)aH=bs aI=bw local by,
bz=false,math.huge if an and ac.IsSpotFullySafe(an,0.5)then local bA=not(az and
not aW(an,bi))if bA then bz=(an-bi).Magnitude if bz<=45 and ac.IsPathSafe(bi,an,
bw,bs)then by=true if bl and bl.Position then local bB=(Vector3.new(an.X-bl.
Position.X,0,an.Z-bl.Position.Z)).Magnitude if bB<18 and bn<24 then by=false
elseif bz<=1.5 and bn<24 then by=false end end if by and bz<=6.5 then local bB=
math.floor(bz*10)/10 return true,an,bu,bB end end end end if not by then an=nil
aj=bx end local bA,bB,bC=bu:lower():find'multiring'~=nil or(br.Instance and br.
Instance.Name:lower():find'multiring'~=nil),(b(bi,bs))if bA then local bD,bE,bF,
bG,bH,bI=ac.IsPointInRingPart(bi,bs)local bJ={}if bD and bH and bE and bE>0.1
then local bK,bL=bi.X-bH.X,bi.Z-bH.Z local bM,bN=bK/bE,bL/bE if bF and bF>2 then
local bO=Vector3.new(bH.X+bM*(bF-2.5),bi.Y,bH.Z+bN*(bF-2.5))table.insert(bJ,bO)
end if bG then local bO=Vector3.new(bH.X+bM*(bG+2.5),bi.Y,bH.Z+bN*(bG+2.5))table
.insert(bJ,bO)end local bO=Vector3.new(bH.X-bK,bi.Y,bH.Z-bL)table.insert(bJ,bO)
end local bK,bL={3.5,7,12,18,26,35},{0,45,90,135,180,225,270,315}for bM,bN in
ipairs(bK)do for bO,bP in ipairs(bL)do local bQ=math.rad(bP)local bR=Vector3.
new(math.cos(bQ)*bN,0,math.sin(bQ)*bN)table.insert(bJ,bi+bR)end end local bM,bN,
bO,bP=math.huge,(math.huge)for bQ,bR in ipairs(bJ)do if az and not aW(bR,bi)then
continue end if bl and bl.Position then local bS=(Vector3.new(bR.X-bl.Position.X
,0,bR.Z-bl.Position.Z)).Magnitude if bS<12 then continue end end if ac.
IsSpotFullySafe(bR,0.5)then local bS=(bR-bi).Magnitude local bT=bS-bc(bR)if bT<
bN then bN=bT bP=bR end if ac.IsPathSafe(bi,bR,bw,bs)then if bT<bM then bM=bT bO
=bR end end end end local bQ=bO or bP if bQ then local bR,bS=ac.
GetFloorPosition(bQ)if bS and ac.IsSpotFullySafe(bR,0.5)then if not(az and not
aW(bR,bi))then bC=bR else bC=bQ end else bC=bQ end end elseif bt and bt.
isTrajectory then local bD,bE,bF=bt.forward2D,bt.perpDist,bt.dangerRadius local
bG,bH,bI,bJ,bK,bL,bM=math.max(3.5,(bF-bE)+al),Vector3.new(bD.Z,0,-bD.X),Vector3.
new(-bD.Z,0,bD.X),bu:lower():find'movingbeam'~=nil or(bs and bs.Name:lower():
find'movingbeam'~=nil),(bt and bt.isBossOrb)or(bu:lower():find'orb'~=nil)or(bs
and bs.Name:lower():find'orb'~=nil),(bt and bt.isExpandingCone)or bu:lower():
find'cricle'~=nil or bu:lower():find'circle'~=nil or(bs and(bs.Name:lower():find
'cricle'~=nil or bs.Name:lower():find'circle'~=nil)),{}if bK then local bN,bO={6
,10,15,20,26,32},{0,2,-2,4.5,-4.5,7,-7}for bP,bQ in ipairs(bN)do for bR,bS in
ipairs(bO)do local bT=bi+bD*bQ+bH*bS table.insert(bM,bT)end end elseif bJ then
local bN={0,-3,-6,-10}for bO,bP in ipairs(bN)do local bQ=bD*bP table.insert(bM,
bi+bH*bG+bQ)table.insert(bM,bi+bI*bG+bQ)table.insert(bM,bi+bH*(bG+2.5)+bQ)table.
insert(bM,bi+bI*(bG+2.5)+bQ)end if bs and bs.Parent then local bO=Vector3.new(bs
.Position.X,bi.Y,bs.Position.Z)table.insert(bM,bO-bD*7)table.insert(bM,bO-bD*11)
table.insert(bM,bO-bD*7+bH*5)table.insert(bM,bO-bD*7+bI*5)end table.insert(bM,bi
-bD*(al+4))table.insert(bM,bi-bD*(al+8))table.insert(bM,bi-bD*(al+12))elseif bL
then local bN={bG,bG+3,bG+6,bG+10}for bO,bP in ipairs(bN)do table.insert(bM,bi+
bH*bP)table.insert(bM,bi+bI*bP)end local bO={4,8,12}for bP,bQ in ipairs(bO)do
local bR=-bD*bQ for bS,bT in ipairs{bG,bG+3,bG+6}do table.insert(bM,bi+bH*bT+bR)
table.insert(bM,bi+bI*bT+bR)end end else local bN={bG,bG+2,bG+4}for bO,bP in
ipairs(bN)do table.insert(bM,bi+bH*bP)table.insert(bM,bi+bI*bP)end local bO={-
1.5,1.5,-3}for bP,bQ in ipairs(bO)do local bR=bD*bQ table.insert(bM,bi+bH*bG+bR)
table.insert(bM,bi+bI*bG+bR)end end local bN,bO,bP,bQ=math.huge,(math.huge)for
bR,bS in ipairs(bM)do if az and not aW(bS,bi)then continue end if not bK and bl
and bl.Position then local bT=(Vector3.new(bS.X-bl.Position.X,0,bS.Z-bl.Position
.Z)).Magnitude if bT<12 then continue end end local bT=bS-bi if bT.Magnitude>0.5
then local bU=bT.Unit:Dot(bD)if bK then if bU<-0.25 then continue end elseif bL
then if bU>0.15 then continue end else if bU>0.25 then continue end end end if
ac.IsSpotFullySafe(bS,0.5)then local bU,bV=bT.Magnitude,bc(bS)local bW,bX=(bU*
1.6)-(bV*0.3),bT.Magnitude>0.5 and bT.Unit:Dot(bD)or 0 if bK then if bl and bl.
Position then local bY=(Vector3.new(bS.X-bl.Position.X,0,bS.Z-bl.Position.Z)).
Magnitude if bY<15 then bW=bW+(15-bY)*10 else bW=bW-math.min(25,(bY-15)*2)end
end local bY=bT.Magnitude>0.5 and math.abs(bT.Unit:Dot(bH))or 0 if bY>=0.65 then
bW=bW-8 end elseif bL then local bY=bT.Magnitude>0.5 and math.abs(bT.Unit:Dot(bH
))or 0 if bY>=0.85 then bW=bW-15 elseif bY<0.65 then bW=bW+6 end if bX<-0.2 then
bW=bW-8 elseif bX>0 then bW=bW+20 end elseif bJ and bX<-0.2 then bW=bW-15 elseif
not bJ then local bY=bT.Magnitude>0.5 and math.abs(bT.Unit:Dot(bH))or 0 if bY>=
0.9 then bW=bW-12 elseif bY<0.8 then bW=bW+4 end end if az then bW=bW+aX(bS,bi)
end if bv and bU>0.5 then local bY=bT.Unit:Dot(bv)if bY>0.15 then bW=bW-(bY*5)
elseif bY<-0.15 then bW=bW+(math.abs(bY)*6)end end if an then local bY=(bS-an).
Magnitude if bY<3 then bW=bW-8 end end if bW<bO then bO=bW bQ=bS end if ac.
IsPathSafe(bi,bS,bw,bs)then if bW<bN then bN=bW bP=bS end end end end if not bP
then local bR,bS,bT=math.deg(math.atan2(bD.Z,bD.X)),bJ and{90,-90,120,-120,150,-
150,180}or bK and{0,15,-15,30,-30,45,-45,60,-60}or bL and{90,-90,105,-105,120,-
120,135,-135}or{90,-90,75,-75,105,-105,60,-60,120,-120},{4,7,11,16,22}for bU,bV
in ipairs(bT)do for bW,bX in ipairs(bS)do local bY=math.rad(bR+bX)local bZ=bi+
Vector3.new(math.cos(bY)*bV,0,math.sin(bY)*bV)if az and not aW(bZ,bi)then
continue end if ac.IsSpotFullySafe(bZ,0.5)then if ac.IsPathSafe(bi,bZ,bw,bs)then
bP=bZ break end end end if bP then break end end end local bR=bP or bQ if bR
then local bS,bT=ac.GetFloorPosition(bR)if bT and ac.IsSpotFullySafe(bS,0.5)then
if not(az and not aW(bS,bi))then bC=bS else bC=bR end else bC=bR end end else
local bD,bE,bF,bG=math.huge,(math.huge)if bs and bs.Parent and bs:IsA'BasePart'
then local bH={}if bs:IsA'Part'and(bs.Shape==Enum.PartType.Ball or bs.Shape==
Enum.PartType.Cylinder)then local bI=math.max(bs.Size.X,bs.Size.Z)/2 local bJ,bK
=bI+al,Vector3.new(bi.X-bs.Position.X,0,bi.Z-bs.Position.Z)local bL=bK.Magnitude
local bM=bL>0.1 and(bK/bL)or(bv or(bB or Vector3.new(0,0,1)))local bN=math.
atan2(bM.Z,bM.X)table.insert(bH,bs.Position+bM*bJ)local bO={math.rad(20),-math.
rad(20),math.rad(40),-math.rad(40),math.rad(65),-math.rad(65)}for bP,bQ in
ipairs(bO)do local bR=bN+bQ table.insert(bH,bs.Position+Vector3.new(math.cos(bR)
*bJ,0,math.sin(bR)*bJ))end elseif bs.Name:lower():find'movingbeam'or(bs.Parent
and bs.Parent.Name:lower():find'movingbeam')then local bI=bs.CFrame.RightVector
local bJ=Vector3.new(bI.X,0,bI.Z)if bJ.Magnitude>0.001 then bJ=bJ.Unit else bJ=
Vector3.new(1,0,0)end local bK,bL,bM=Vector3.new(-bJ.Z,0,bJ.X),math.max(bs.Size.
X,bs.Size.Z)/2,math.max(bs.Size.Y,math.min(bs.Size.X,bs.Size.Z))/2 if bM<3.5
then bM=3.5 end table.insert(bH,bs.Position+bJ*(bL+al+1))table.insert(bH,bs.
Position-bJ*(bL+al+1))table.insert(bH,bs.Position+bK*(bM+al+1.5))table.insert(bH
,bs.Position-bK*(bM+al+1.5))else local bI,bJ,bK=bs.CFrame:PointToObjectSpace(bi)
,bs.Size.X/2,bs.Size.Z/2 if bK>=bJ*1.4 then table.insert(bH,bs.CFrame:
PointToWorldSpace(Vector3.new(bJ+al,bI.Y,bI.Z)))table.insert(bH,bs.CFrame:
PointToWorldSpace(Vector3.new(-(bJ+al),bI.Y,bI.Z)))table.insert(bH,bs.CFrame:
PointToWorldSpace(Vector3.new(bJ+al+2,bI.Y,bI.Z)))table.insert(bH,bs.CFrame:
PointToWorldSpace(Vector3.new(-(bJ+al+2),bI.Y,bI.Z)))elseif bJ>=bK*1.4 then
table.insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(bI.X,bI.Y,bK+al)))table.
insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(bI.X,bI.Y,-(bK+al))))table.
insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(bI.X,bI.Y,bK+al+2)))table.
insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(bI.X,bI.Y,-(bK+al+2))))else
table.insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(bJ+al,bI.Y,bI.Z)))table.
insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(-(bJ+al),bI.Y,bI.Z)))table.
insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(bI.X,bI.Y,bK+al)))table.
insert(bH,bs.CFrame:PointToWorldSpace(Vector3.new(bI.X,bI.Y,-(bK+al))))end end
for bI,bJ in ipairs(bH)do if az and not aW(bJ,bi)then continue end if ac.
IsSpotFullySafe(bJ,0.5)then local bK=bd(bi,bJ,bB,bv)if bK<bE then bE=bK bG=bJ
end if ac.IsPathSafe(bi,bJ,bw,bs)then if bK<bD then bD=bK bF=bJ end end end end
end if not bF then local bH,bI=be(bi,bB,bw,bs,bv)if bH and bI<bD then bF=bH bD=
bI end end local bH=bF or bG if bH then local bI,bJ=ac.GetFloorPosition(bH)if bJ
and ac.IsSpotFullySafe(bI,0.5)then if not(az and not aW(bI,bi))then bC=bI else
bC=bH end else bC=bH end end if not bC then local bI=(bB and bB.Magnitude>0.01)
and bB.Unit or(bv and bv.Magnitude>0.01 and bv.Unit)or Vector3.new(0,0,1)local
bJ=bi+(bI*18)if az and not aW(bJ,bi)then bJ=bi+(az-bi).Unit*15 end local bK,bL=
ac.GetFloorPosition(bJ)bC=bL and bK or bJ end end if bC then if by then local bD
=(bC-bi).Magnitude if(bz-bD)>=a9 then an=bC aj=bx local bE=math.floor(bD*10)/10
return true,bC,bu,bE else local bE=math.floor(bz*10)/10 return true,an,bu,bE end
end an=bC aj=bx local bD=math.floor((bC-bi).Magnitude*10)/10 return true,bC,bu,
bD elseif by then local bD=math.floor(bz*10)/10 return true,an,bu,bD end an=nil
aj=0 return true,nil,bu,0 end return ay end function a._()local aa,ab,ac=a.load
'i',a.load'j',a.load'Y'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.
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
):format(am,an,aO or'Emergency'))end end end function at.Perform(aF,aG,aH)local
aI,aJ,aK=aA()if not aJ or not aK or aK.Health<=0 then return end if not aF then
return end currentTargetPos=aF aE(aF,aG,aH,aJ,aK)if ak then return end
dodgeThread=task.spawn(function()ak=true ac.SetDodging(true)ay'Dodging'local aL,
aM=(aJ.Position.Y)local aN=function()if aM and aM.Parent then pcall(function()aM
:Destroy()end)aM=nil end if aK and aK.Parent then local aN=ac and ac.IsEnabled
and ac.IsEnabled()and ac.IsTargetActive and ac.IsTargetActive()if aN then aK.
AutoRotate=false else aK.AutoRotate=true end end end local aO=function()aN()if
activeMoveConn then pcall(function()activeMoveConn:Disconnect()end)
activeMoveConn=nil end if aJ and aJ.Parent then aJ.AssemblyLinearVelocity=
Vector3.zero aJ.AssemblyAngularVelocity=Vector3.zero end if aK and aK.Parent and
ag=='HumanoidMove'then pcall(function()aK:Move(Vector3.zero,false)local aO=ae
and ae.Character and ae.Character:FindFirstChild'HumanoidRootPart'if aO then aK:
MoveTo(aO.Position)end end)end if ab.CancelPanicSpeed then ab.CancelPanicSpeed()
end ak=false ac.SetDodging(false)currentTargetPos=nil ay'Safe'end local aP,aQ=
pcall(function()local aP,aQ=currentTargetPos or aF,aJ.Position local aR,aS=(
Vector3.new(aP.X,0,aP.Z)-Vector3.new(aQ.X,0,aQ.Z)).Magnitude,(ag=='Blink')and
math.min(ah,ai)or ah if aR<=aS then aD(aJ,aK,aP,aL)if aw()then print((
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
function a.aa()local aa,ab,ac,ad,ae,af,ag=a.load'i',a.load'j',a.load'O',a.load
'X',a.load'W',a.load'Z',a.load'_'ae.BindDetection{GetActiveHazardsMap=ad.
GetActiveHazardsMap,GetLockedProjectiles=ad.GetLockedProjectiles,
GetTrajectoryConfigForPart=ad.GetTrajectoryConfigForPart,LockTrajectoryForPart=
ad.LockTrajectoryForPart,IsIgnoredPart=ad.IsIgnoredPart,GetFadeThreshold=ad.
GetFadeThreshold}local ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.player,false,false,0,{},
true,false ag.SetRuntime{getInDanger=function()return aj end,getLogInDanger=
function()return am end,getActiveBossOrb=ad.GetActiveBossOrb}local ar,as,at,au,
av={},false,false,0,function(ar,as,at,au,av,aw,ax)for ay,az in ipairs(al)do
pcall(az,ar,as,at,au,av,aw,ax)end end local aw,ax=function()if aq then return
end aq=task.spawn(function()local aw=0 while ai do if not ab.IsBossActive()and
ab.GetEnemyCount()==0 and ad.GetHazardCount()>0 then ad.ClearAllHazards
'Room Cleared'end ad.UpdateTrajectories()local ax,ay,az,aA,aB=ab.IsDead and ab.
IsDead()or false if ax then ay=false az=nil aA='Dead'aB=0 else ay,az,aA,aB=af.
CalculateSafeSpot()end local aC,aD=ab.IsInvulnerable()local aE,aF=aj,ao aj=ay ao
=az ap=aA ak=aB or 0 af.UpdateMarker(az,ay,aB)local aG=ah and ah.Character and
ah.Character:FindFirstChild'HumanoidRootPart'local aH=aG and aG.Position af.
UpdateHitbox(aH)af.UpdatePlayerRadar(aH,ay)ad.UpdateTrajectoryVisuals()ad.
UpdateHazardTimers()if ay and az and ag.IsAutoDodgeEnabled()then ag.Perform(az,
aB,aA)end local aI=os.clock()local aJ=aC and(aI-au>=0.25)local aK=(ay~=aE)or(az
~=aF)or(ax~=as)or(aC~=at)or aJ if aK then au=aI as=ax at=aC av(ay,az,aA,aB,aC,aD
,ax)if am and ay and az and(os.clock()-aw>0.5)then aw=os.clock()if aC and an
then print((
'[SmartDodge][Invulnerable] \u{1f6e1}\u{fe0f} IN DANGER (%s) but INVULNERABLE (%s) -> Dodge Paused'
):format(aA,aD or'Protection'))else print((
'[SmartDodge][InDanger] \u{26a0}\u{fe0f} IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)'
):format(aA,aB,az.X,az.Y,az.Z))end end end local aL=ay or(ad.GetHazardCount and
ad.GetHazardCount()>0)local aM=aL and 0.04 or 0.1 task.wait(aM)end end)end,
function()if aq then task.cancel(aq)aq=nil end ag.Cancel()af.HideVisuals()ad.
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
insert(al,aA)end function ar.SetTargetScope(aA)af.SetTargetScope(aA)end function
ar.GetTargetScope()return af.GetTargetScope()end return ar end function a.ab()
local aa,ab,ac=a.load'i',a.load'j',a.load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,
an=aa.RunService,aa.UserInputService,aa.player,{},false,Color3.fromRGB(255,255,
255),Color3.fromRGB(255,65,65),Color3.fromRGB(50,255,120),Color3.fromRGB(60,60,
70),Color3.fromRGB(220,50,50),(Color3.fromRGB(40,200,90))local ao=function()
local ao,ap=pcall(function()if typeof(gethui)=='function'then local ao=gethui()
if ao then return ao end end local ao=game:GetService'CoreGui'if ao then return
ao end return nil end)if ao and ap then return ap end local aq=af or aa.player
return aq and aq:FindFirstChild'PlayerGui'end local ap,aq=function()if screenGui
and screenGui.Parent then return end local ap=ao()if not ap then return end
local aq=ap:FindFirstChild'DQ_SpeedDebugHud'if aq then pcall(function()aq:
Destroy()end)end screenGui=Instance.new'ScreenGui'screenGui.Name=
'DQ_SpeedDebugHud'screenGui.ResetOnSpawn=false screenGui.ZIndexBehavior=Enum.
ZIndexBehavior.Sibling mainFrame=Instance.new'Frame'mainFrame.Name='SpeedBadge'
mainFrame.Size=UDim2.new(0,168,0,34)mainFrame.Position=UDim2.new(0.5,-84,0,50)
mainFrame.BackgroundColor3=Color3.fromRGB(15,15,22)mainFrame.
BackgroundTransparency=0.25 mainFrame.BorderSizePixel=0 mainFrame.Active=true
mainFrame.Parent=screenGui local ar=Instance.new'UICorner'ar.CornerRadius=UDim.
new(0,8)ar.Parent=mainFrame uiStroke=Instance.new'UIStroke'uiStroke.Thickness=
1.4 uiStroke.Color=al uiStroke.Transparency=0.2 uiStroke.Parent=mainFrame
speedLabel=Instance.new'TextLabel'speedLabel.Name='SpeedText'speedLabel.Size=
UDim2.new(1,-10,1,0)speedLabel.Position=UDim2.new(0,5,0,0)speedLabel.
BackgroundTransparency=1 speedLabel.Font=Enum.Font.GothamBold speedLabel.
TextSize=13 speedLabel.TextColor3=ai speedLabel.Text='SPEED: 16.0'speedLabel.
TextXAlignment=Enum.TextXAlignment.Center speedLabel.TextYAlignment=Enum.
TextYAlignment.Center speedLabel.Parent=mainFrame local as,at,au=false mainFrame
.InputBegan:Connect(function(av)if av.UserInputType==Enum.UserInputType.
MouseButton1 or av.UserInputType==Enum.UserInputType.Touch then as=true at=av.
Position au=mainFrame.Position av.Changed:Connect(function()if av.UserInputState
==Enum.UserInputState.End then as=false end end)end end)mainFrame.InputChanged:
Connect(function(av)if av.UserInputType==Enum.UserInputType.MouseMovement or av.
UserInputType==Enum.UserInputType.Touch then if as and at and au then local aw=
av.Position-at mainFrame.Position=UDim2.new(au.X.Scale,au.X.Offset+aw.X,au.Y.
Scale,au.Y.Offset+aw.Y)end end end)screenGui.Parent=ap end,function()if
updateConn then updateConn:Disconnect()updateConn=nil end if screenGui and
screenGui.Parent then pcall(function()screenGui:Destroy()end)screenGui=nil
mainFrame=nil speedLabel=nil uiStroke=nil end end local ar=function()if
updateConn then return end local ar=0 updateConn=ad.RenderStepped:Connect(
function()local as=os.clock()if(as-ar)<0.04 then return end ar=as if not
screenGui or not screenGui.Parent or not speedLabel or not speedLabel.Parent
then ap()return end local at=af and af.Character local au,av=at and at:
FindFirstChild'Humanoid',at and at:FindFirstChild'HumanoidRootPart'if not au or
au.Health<=0 then speedLabel.Text='SPEED: \u{1f480} DEAD'speedLabel.TextColor3=
Color3.fromRGB(160,160,160)if uiStroke then uiStroke.Color=al end return end
local aw,ax=au.WalkSpeed or 0,av and av.AssemblyLinearVelocity local ay,az=ax
and Vector3.new(ax.X,0,ax.Z).Magnitude or 0,ab.IsPanicSpeedActive and ab.
IsPanicSpeedActive()local aA=(not az)and(aw>=23.5 or ay>=23)if az then
speedLabel.TextColor3=aj speedLabel.Text=('SPD: %.1f [PANIC \u{1f4a8}]'):format(
aw)if uiStroke then uiStroke.Color=am end elseif aA then speedLabel.TextColor3=
ak speedLabel.Text=('SPD: %.1f [SKILL \u{26a1}]'):format(aw)if uiStroke then
uiStroke.Color=an end else speedLabel.TextColor3=ai speedLabel.Text=('SPD: %.1f'
):format(aw)if uiStroke then uiStroke.Color=al end end end)end function ag.
SetEnabled(as)ah=as and true or false if ah then ap()ar()else aq()end end
function ag.IsEnabled()return ah end ac.Register(function()ag.SetEnabled(false)
end)ag.SetEnabled(true)return ag end function a.ac()local aa,ab,ac,ad,ae,af,ag,
ah,ai,aj,ak,al=a.load'b',a.load'O',a.load'X',a.load'W',a.load'Z',a.load'_',a.
load'aa',a.load'Y',a.load'ab',a.load'V',a.load'j',{}al.skillTiming=aj al.
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
al.Perform=af.Perform al.SetPanicSprintEnabled=af.SetPanicSprintEnabled al.
IsPanicSprintEnabled=af.IsPanicSprintEnabled al.SetPanicSpeed=af.SetPanicSpeed
al.GetPanicSpeed=af.GetPanicSpeed al.SetPanicDuration=af.SetPanicDuration al.
GetPanicDuration=af.GetPanicDuration al.SetPanicCooldown=af.SetPanicCooldown al.
GetPanicCooldown=af.GetPanicCooldown al.IsPanicActive=af.IsPanicActive al.
SetSpeedDebugHudEnabled=ai.SetEnabled al.IsSpeedDebugHudEnabled=ai.IsEnabled al.
SetAutoFaceTarget=ah.SetEnabled al.IsAutoFaceTargetEnabled=ah.IsEnabled al.
GetTargetPosition=ah.GetTargetPosition al.SetAutoFaceBoss=al.SetAutoFaceTarget
al.IsAutoFaceBossEnabled=al.IsAutoFaceTargetEnabled al.GetBossPosition=al.
GetTargetPosition al.IsTargetActive=ah.IsTargetActive al.IsBossActive=ah.
IsTargetActive al.StartEngine=ag.StartEngine al.StopEngine=ag.StopEngine al.
Toggle=ag.Toggle al.IsEnabled=ag.IsEnabled al.SetLogInDanger=ag.SetLogInDanger
al.IsLogInDangerEnabled=ag.IsLogInDangerEnabled al.IsInDanger=ag.IsInDanger al.
GetCurrentSafeSpot=ag.GetCurrentSafeSpot al.OnSafeSpotChanged=ag.
OnSafeSpotChanged al.SetTargetScope=ag.SetTargetScope al.GetTargetScope=ag.
GetTargetScope al.SetIgnoreDodgeWhenInvulnerable=ag.
SetIgnoreDodgeWhenInvulnerable al.IsIgnoreDodgeWhenInvulnerableEnabled=ag.
IsIgnoreDodgeWhenInvulnerableEnabled al.SetRespawnProtectionDuration=ak.
SetRespawnProtectionDuration al.GetRespawnProtectionDuration=ak.
GetRespawnProtectionDuration al.GetRespawnProtectionRemaining=ak.
GetRespawnProtectionRemaining al.IsInvulnerable=ak.IsInvulnerable al.IsDead=ak.
IsDead ab.Register('SmartDodge',al.StopEngine,al.IsEnabled)aa.Register(function(
)ag.Shutdown()end)return al end function a.ad()return function(aa)local ab,ac=
game:GetService'Players',os.clock()+15 while not ab.LocalPlayer do if os.clock()
>ac then break end task.wait(0.1)end local ad=ab.LocalPlayer if not ad then
return warn
'[DungeonQuest] Kh\u{f4}ng l\u{1ea5}y \u{111}\u{1b0}\u{1ee3}c LocalPlayer, h\u{1ee7}y kh\u{1edf}i t\u{1ea1}o script.'
end local ae,af,ag=a.load'a',a.load'b',a.load'd'ag.Suspend()local ah,ai=ae:
Window{Title='DungeonQuest',Subtitle='EsclipseHub',Size=UDim2.fromOffset(1000,
600),SidebarWidth=300,DragStyle=1,DisabledWindowControls={},ShowUserInfo=true,
Keybind=Enum.KeyCode.RightControl,AcrylicBlur=true},a.load'c'ai:SetWindow(ah)_G.
ScriptHub_UI=ah _G.ScriptHub_Cleanup=function()af.Cleanup()end ah.onUnloaded(
function()af.Cleanup()if _G.ScriptHub_UI==ah then _G.ScriptHub_UI=nil end end)
local aj=ah:TabGroup()local ak={SmartDodgeV2=aj:Tab{Name='Smart Dodge V2',Image=
'rbxassetid://10723346959'},Dungeon=aj:Tab{Name='Dungeon Joiner',Image=
'rbxassetid://10734886202'},Inventory=aj:Tab{Name='Inventory',Image=
'rbxassetid://10709769841'},Utilities=aj:Tab{Name='Utilities',Image=
'rbxassetid://10747383470'},Configs=aj:Tab{Name='Configs',Image=
'rbxassetid://10734950309'}}ae:SetFolder'EsclipseHub'local al,am,an,ao,ap=a.load
'q',a.load'w',a.load'y',a.load'I',a.load'M'al(ah,ak.SmartDodgeV2)am(ah,ak.
Dungeon)an(ah,ak.Inventory)ao(ah,ak.Utilities)ap(ah,ak.Configs)local aq=a.load
'N'aq.Init()local ar=a.load'D'ar.Init()a.load'A'local as=a.load'J'as.SetWindow(
ah)as.Execute()local at=a.load'U'at.Init()if ak.Combat then ak.Combat:Select()
elseif ak.SmartDodgeV2 then ak.SmartDodgeV2:Select()end pcall(function()local au
=a.load'ac'if au and au.StopEngine then au.StopEngine()end if au and au.
ClearTrajectoryVisuals then au.ClearTrajectoryVisuals()end if au and au.
SetShowPlayerRadar then au.SetShowPlayerRadar(false)end if au and au.
ClearPlayerRadar then au.ClearPlayerRadar()end end)pcall(function()local au=
workspace:FindFirstChildOfClass'Terrain'or workspace.Terrain if au then for av,
aw in ipairs(au:GetChildren())do if aw.Name:find'SmartDodge_TrajectoryBox'or aw.
Name:find'SmartDodge_SafeMarker'or aw.Name:find'SmartDodge_PlayerShaft'or aw.
Name:find'SmartDodge_PlayerHead'then pcall(function()aw:Destroy()end)end end end
end)pcall(function()for au,av in ipairs(workspace:GetChildren())do if av.Name:
find'SmartDodge_TrajectoryBox'or av.Name:find'SmartDodge_SafeMarker'or av.Name:
find'SmartDodge_PlayerShaft'or av.Name:find'SmartDodge_PlayerHead'then pcall(
function()av:Destroy()end)end end end)ae:LoadAutoLoadConfig()task.delay(1.5,
function()ag.Resume()end)end end function a.ae()local aa={}function aa:Export()
local ab={}for ac,ad in pairs(self)do if typeof(ad)=='Instance'or type(ad)==
'table'then local ae,af=pcall(function()end)if ae and af~=nil then ab[ac]=af end
end end return ab end function aa:Import(ab)for ac,ad in pairs(ab)do local ae=
self[ac]if ae and ae.Value~=nil then local af=pcall(function()end)if not af then
warn(`Failed to import value for flag "{ac}"`)end end end end function aa:Reset(
)for ab in pairs(self)do self[ab]=nil end end return aa end function a.af()local
aa,ab=a.load'F',{}function ab:Window(ac)ac=ac or{}print'Made a window'local ad=
aa.Wrap(ac,{Visible=function(ad)print('Set window visibility to:',ad)end})return
aa.Apply(ac,ad)end return ab end function a.ag()local aa,ab=a.load'F',{}return(
aa.Wrap(ab,{Enabled=function(ac)print(`{ac and'Enabled'or'Disabled'} ESP.`)end})
)end function a.ah()local aa,ab,ac=a.load'ae',a.load'af',a.load'ag'local ad=ab:
Window{Visible=true}return{Flags=aa,Esp=ac,Interface=ab,Window=ad,Tabs={Home=
function(ae)end,Visuals=function(ae)end,Settings=function(ae)end,Config=function
(ae)end}}end function a.ai()local aa={}function aa.GetPlayer()local ab,ac=pcall(
function()return game:GetService'Players'end)return ab and(ac).LocalPlayer end
function aa.GetCharacter(ab)local ac,ad=pcall(function()return ab and ab.
Character end)return ac and ad end function aa.GetHumanoid(ab)local ac,ad=pcall(
function()local ac=aa.GetCharacter(ab)return ac and ac:FindFirstChildOfClass
'Humanoid'end)return ac and ad end return aa end function a.aj()local aa=
function(aa)return game:GetService(aa)end return{Players=(aa'Players')}end
function a.ak()return function(aa)local ab,ac,ad=a.load'ah',a.load'ai',a.load
'aj'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab.Interface,ab.Window,ab.Tabs,ac
.GetPlayer(),ad.Players do ai.Home(aa)end do local al=ah:Tab{Name='Exploits'}al:
Toggle{Name='Flight'}end do ai.Visuals(aa)end do local al=ai.Settings(aa)al:
Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah.Title=aa.Name end end end
local aa=_G.ScriptHub_Cleanup if typeof(aa)=='function'then pcall(aa)end _G.
ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if typeof(ab)=='table'and typeof(
ab.Unload)=='function'then pcall(ab.Unload,ab)end _G.ScriptHub_UI=nil local ac={
{Name='DungeonQuest',Load=a.load'ad',UniverseId=9931749389,Places={
77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.load'ak',Places={
123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and game.PlaceId~=0 then
break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.Places then for af,ag
in ipairs(ae.Places)do if ag==game.PlaceId then return ae:Load()end end end if
ae.UniverseId and ae.UniverseId==game.GameId then return ae:Load()end end