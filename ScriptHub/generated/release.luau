--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-07T02:18:08.272159300+00:00",
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
F.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)F.Size=UDim2.
fromScale(0.325,1)local G=Instance.new'Frame'G.Name='Divider'G.AnchorPoint=
Vector2.new(1,0)G.BackgroundColor3=Color3.fromRGB(255,255,255)G.
BackgroundTransparency=0.9 G.BorderColor3=Color3.fromRGB(0,0,0)G.BorderSizePixel
=0 G.Position=UDim2.fromScale(1,0)G.Size=UDim2.new(0,1,1,0)G.Parent=F local H=
Instance.new'TextButton'H.Name='DividerInteract'H.AnchorPoint=Vector2.new(0.5,0)
H.BackgroundColor3=Color3.fromRGB(255,255,255)H.BackgroundTransparency=1 H.
BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel=0 H.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'H.Position=UDim2.fromScale(0.5,0)H
.Size=UDim2.new(1,6,1,0)H.Text=''H.TextColor3=Color3.fromRGB(0,0,0)H.TextSize=14
H.Parent=G local I=Instance.new'Frame'I.Name='WindowControls'I.BackgroundColor3=
Color3.fromRGB(255,255,255)I.BackgroundTransparency=1 I.BorderColor3=Color3.
fromRGB(0,0,0)I.BorderSizePixel=0 I.Size=UDim2.new(1,0,0,31)local J=Instance.new
'Frame'J.Name='Controls'J.BackgroundColor3=Color3.fromRGB(119,174,94)J.
BackgroundTransparency=1 J.BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0
J.Size=UDim2.fromScale(1,1)local K=Instance.new'UIListLayout'K.Name=
'UIListLayout'K.Padding=UDim.new(0,5)K.FillDirection=Enum.FillDirection.
Horizontal K.SortOrder=Enum.SortOrder.LayoutOrder K.VerticalAlignment=Enum.
VerticalAlignment.Center K.Parent=J local L=Instance.new'UIPadding'L.Name=
'UIPadding'L.PaddingLeft=UDim.new(0,11)L.Parent=J local M,N={sizes={enabled=
UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},transparencies={enabled=0,
disabled=1},strokeTransparency=0.9},Instance.new'UIStroke'N.Name='BaseUIStroke'N
.ApplyStrokeMode=Enum.ApplyStrokeMode.Border N.Color=Color3.fromRGB(255,255,255)
N.Transparency=M.strokeTransparency local O=Instance.new'TextButton'O.Name=
'Exit'O.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'O.Text=''
O.TextColor3=Color3.fromRGB(0,0,0)O.TextSize=14 O.AutoButtonColor=false O.
BackgroundColor3=Color3.fromRGB(250,93,86)O.BorderColor3=Color3.fromRGB(0,0,0)O.
BorderSizePixel=0 local P=Instance.new'UICorner'P.Name='UICorner'P.CornerRadius=
UDim.new(1,0)P.Parent=O O.Parent=J local Q=Instance.new'TextButton'Q.Name=
'Minimize'Q.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'Q.
Text=''Q.TextColor3=Color3.fromRGB(0,0,0)Q.TextSize=14 Q.AutoButtonColor=false Q
.BackgroundColor3=Color3.fromRGB(252,190,57)Q.BorderColor3=Color3.fromRGB(0,0,0)
Q.BorderSizePixel=0 Q.LayoutOrder=1 local R=Instance.new'UICorner'R.Name=
'UICorner'R.CornerRadius=UDim.new(1,0)R.Parent=Q Q.Parent=J local S=Instance.new
'TextButton'S.Name='Maximize'S.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'S.Text=''S.TextColor3=Color3.
fromRGB(0,0,0)S.TextSize=14 S.AutoButtonColor=false S.BackgroundColor3=Color3.
fromRGB(119,174,94)S.BorderColor3=Color3.fromRGB(0,0,0)S.BorderSizePixel=0 S.
LayoutOrder=1 local T=Instance.new'UICorner'T.Name='UICorner'T.CornerRadius=UDim
.new(1,0)T.Parent=S S.Parent=J local U=function(U,V)local W,X=V and M.sizes.
enabled or M.sizes.disabled,V and M.transparencies.enabled or M.transparencies.
disabled U.Size=W U.BackgroundTransparency=X U.Active=V U.Interactable=V for Y,Z
in ipairs(U:GetChildren())do if Z:IsA'UIStroke'then Z.Transparency=X end end if
not V then N:Clone().Parent=U end end U(S,false)local V={O,Q}for W,X in pairs(V)
do local Y,Z=X.Name,true if v.DisabledWindowControls and table.find(v.
DisabledWindowControls,Y)then Z=false end U(X,Z)end J.Parent=I local W=Instance.
new'Frame'W.Name='Divider'W.AnchorPoint=Vector2.new(0,1)W.BackgroundColor3=
Color3.fromRGB(255,255,255)W.BackgroundTransparency=0.9 W.BorderColor3=Color3.
fromRGB(0,0,0)W.BorderSizePixel=0 W.Position=UDim2.fromScale(0,1)W.Size=UDim2.
new(1,0,0,1)W.Parent=I I.Parent=F local X=Instance.new'Frame'X.Name=
'Information'X.BackgroundColor3=Color3.fromRGB(255,255,255)X.
BackgroundTransparency=1 X.BorderColor3=Color3.fromRGB(0,0,0)X.BorderSizePixel=0
X.Position=UDim2.fromOffset(0,31)X.Size=UDim2.new(1,0,0,60)local Y=Instance.new
'Frame'Y.Name='Divider'Y.AnchorPoint=Vector2.new(0,1)Y.BackgroundColor3=Color3.
fromRGB(255,255,255)Y.BackgroundTransparency=0.9 Y.BorderColor3=Color3.fromRGB(0
,0,0)Y.BorderSizePixel=0 Y.Position=UDim2.fromScale(0,1)Y.Size=UDim2.new(1,0,0,1
)Y.Parent=X local Z=Instance.new'Frame'Z.Name='InformationHolder'Z.
BackgroundColor3=Color3.fromRGB(255,255,255)Z.BackgroundTransparency=1 Z.
BorderColor3=Color3.fromRGB(0,0,0)Z.BorderSizePixel=0 Z.Size=UDim2.fromScale(1,1
)local _=Instance.new'UIPadding'_.Name='InformationHolderUIPadding'_.
PaddingBottom=UDim.new(0,10)_.PaddingLeft=UDim.new(0,23)_.PaddingRight=UDim.new(
0,22)_.PaddingTop=UDim.new(0,10)_.Parent=Z local aa=Instance.new'ImageButton'aa.
Name='GlobalSettingsButton'aa.Image=o.globe aa.ImageTransparency=0.5 aa.
AnchorPoint=Vector2.new(1,0.5)aa.BackgroundColor3=Color3.fromRGB(255,255,255)aa.
BackgroundTransparency=1 aa.BorderColor3=Color3.fromRGB(0,0,0)aa.BorderSizePixel
=0 aa.Position=UDim2.fromScale(1,0.5)aa.Size=UDim2.fromOffset(16,16)aa.Parent=Z
local ab=function(ab)if ab=='Default'then u(aa,TweenInfo.new(0.2,Enum.
EasingStyle.Sine),{ImageTransparency=0.5}):Play()elseif ab=='Hover'then u(aa,
TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.3}):Play()end end
aa.MouseEnter:Connect(function()ab'Hover'end)aa.MouseLeave:Connect(function()ab
'Default'end)local ac=Instance.new'Frame'ac.Name='TitleFrame'ac.BackgroundColor3
=Color3.fromRGB(255,255,255)ac.BackgroundTransparency=1 ac.BorderColor3=Color3.
fromRGB(0,0,0)ac.BorderSizePixel=0 ac.Size=UDim2.fromScale(1,1)local ad=Instance
.new'TextLabel'ad.Name='Title'ad.FontFace=Font.new(o.interFont,Enum.FontWeight.
SemiBold,Enum.FontStyle.Normal)ad.Text=v.Title ad.TextColor3=Color3.fromRGB(255,
255,255)ad.RichText=true ad.TextSize=18 ad.TextTransparency=0.1 ad.TextTruncate=
Enum.TextTruncate.SplitWord ad.TextXAlignment=Enum.TextXAlignment.Left ad.
TextYAlignment=Enum.TextYAlignment.Top ad.AutomaticSize=Enum.AutomaticSize.Y ad.
BackgroundColor3=Color3.fromRGB(255,255,255)ad.BackgroundTransparency=1 ad.
BorderColor3=Color3.fromRGB(0,0,0)ad.BorderSizePixel=0 ad.Size=UDim2.new(1,-20,0
,0)ad.Parent=ac local ae=Instance.new'TextLabel'ae.Name='Subtitle'ae.FontFace=
Font.new(o.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)ae.RichText=
true ae.Text=v.Subtitle ae.RichText=true ae.TextColor3=Color3.fromRGB(255,255,
255)ae.TextSize=12 ae.TextTransparency=0.7 ae.TextTruncate=Enum.TextTruncate.
SplitWord ae.TextXAlignment=Enum.TextXAlignment.Left ae.TextYAlignment=Enum.
TextYAlignment.Top ae.AutomaticSize=Enum.AutomaticSize.Y ae.BackgroundColor3=
Color3.fromRGB(255,255,255)ae.BackgroundTransparency=1 ae.BorderColor3=Color3.
fromRGB(0,0,0)ae.BorderSizePixel=0 ae.LayoutOrder=1 ae.Size=UDim2.new(1,-20,0,0)
ae.Parent=ac local af=Instance.new'UIListLayout'af.Name='TitleFrameUIListLayout'
af.Padding=UDim.new(0,3)af.SortOrder=Enum.SortOrder.LayoutOrder af.
VerticalAlignment=Enum.VerticalAlignment.Center af.Parent=ac ac.Parent=Z Z.
Parent=X X.Parent=F local ag=Instance.new'Frame'ag.Name='SidebarGroup'ag.
BackgroundColor3=Color3.fromRGB(255,255,255)ag.BackgroundTransparency=1 ag.
BorderColor3=Color3.fromRGB(0,0,0)ag.BorderSizePixel=0 ag.Position=UDim2.
fromOffset(0,91)ag.Size=UDim2.new(1,0,1,-91)local ah=Instance.new'Frame'ah.Name=
'UserInfo'ah.AnchorPoint=Vector2.new(0,1)ah.BackgroundColor3=Color3.fromRGB(255,
255,255)ah.BackgroundTransparency=1 ah.BorderColor3=Color3.fromRGB(0,0,0)ah.
BorderSizePixel=0 ah.Position=UDim2.fromScale(0,1)ah.Size=UDim2.new(1,0,0,107)
local ai=Instance.new'Frame'ai.Name='InformationGroup'ai.BackgroundColor3=Color3
.fromRGB(255,255,255)ai.BackgroundTransparency=1 ai.BorderColor3=Color3.fromRGB(
0,0,0)ai.BorderSizePixel=0 ai.Size=UDim2.fromScale(1,1)local aj=Instance.new
'UIPadding'aj.Name='InformationGroupUIPadding'aj.PaddingBottom=UDim.new(0,17)aj.
PaddingLeft=UDim.new(0,25)aj.Parent=ai local ak=Instance.new'UIListLayout'ak.
Name='InformationGroupUIListLayout'ak.FillDirection=Enum.FillDirection.
Horizontal ak.SortOrder=Enum.SortOrder.LayoutOrder ak.VerticalAlignment=Enum.
VerticalAlignment.Center ak.Parent=ai local al,am,an=k.UserId,Enum.ThumbnailType
.AvatarBust,Enum.ThumbnailSize.Size48x48 local ao,ap=i:GetUserThumbnailAsync(al,
am,an)local aq=Instance.new'ImageLabel'aq.Name='Headshot'aq.BackgroundColor3=
Color3.fromRGB(255,255,255)aq.BackgroundTransparency=1 aq.BorderColor3=Color3.
fromRGB(0,0,0)aq.BorderSizePixel=0 aq.Size=UDim2.fromOffset(32,32)aq.Image=(ap
and ao)or'rbxassetid://0'local ar=Instance.new'UICorner'ar.Name='UICorner'ar.
CornerRadius=UDim.new(1,0)ar.Parent=aq local as=Instance.new'UIStroke'as.Name=
'BaseUIStroke'as.ApplyStrokeMode=Enum.ApplyStrokeMode.Border as.Color=Color3.
fromRGB(255,255,255)as.Transparency=0.9 as.Parent=aq aq.Parent=ai local at=
Instance.new'Frame'at.Name='UserAndDisplayFrame'at.BackgroundColor3=Color3.
fromRGB(255,255,255)at.BackgroundTransparency=1 at.BorderColor3=Color3.fromRGB(0
,0,0)at.BorderSizePixel=0 at.LayoutOrder=1 at.Size=UDim2.new(1,-42,0,32)local au
=Instance.new'TextLabel'au.Name='DisplayName'au.FontFace=Font.new(o.interFont,
Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)au.Text=k.DisplayName au.
TextColor3=Color3.fromRGB(255,255,255)au.TextSize=13 au.TextTransparency=0.1 au.
TextTruncate=Enum.TextTruncate.SplitWord au.TextXAlignment=Enum.TextXAlignment.
Left au.TextYAlignment=Enum.TextYAlignment.Top au.AutomaticSize=Enum.
AutomaticSize.XY au.BackgroundColor3=Color3.fromRGB(255,255,255)au.
BackgroundTransparency=1 au.BorderColor3=Color3.fromRGB(0,0,0)au.BorderSizePixel
=0 au.Parent=at au.Size=UDim2.fromScale(1,0)local av=Instance.new'UIPadding'av.
Name='UserAndDisplayFrameUIPadding'av.PaddingLeft=UDim.new(0,8)av.PaddingTop=
UDim.new(0,3)av.Parent=at local aw=Instance.new'UIListLayout'aw.Name=
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
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw=aa.player,0.05,
'enemyProjectiles',0.5,{},false,50,16,false,{},0,{},0,{},{},{},{},{},{},0,{}
local ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ=function()for ax=#aw,1,-1 do pcall(
aw[ax])end end,{},'unknown',true,{},{},{}local aK=function(aK)if aK then table.
insert(aD,aK)end return aK end function ag.OnRespawn(aL)table.insert(aC,aL)end
local aL=function(aL)if not aL or not aL:IsA'Model'then return nil end local aM=
aL:FindFirstChild'HumanoidRootPart'if aM and aM:IsA'BasePart'then return aM end
if aL.PrimaryPart and aL.PrimaryPart:IsA'BasePart'then return aL.PrimaryPart end
for aN,aO in ipairs(aL:GetDescendants())do if aO:IsA'BasePart'then return aO end
end return nil end local aM,aN=function(aM)if not aM or not aM:IsA'Model'or not
aM.Parent or aM==ac.Character then return false end local aN=aM:
FindFirstChildOfClass'Humanoid'if not aN or aN.Health<=0 then return false end
return aL(aM)~=nil end,function(aM)local aN=at[aM]if not aN then return end if
aN.Died then aN.Died:Disconnect()aN.Died=nil end at[aM]=nil end local aO,aP=
function(aO)if not aO or not ar[aO]then return end au[aO]=nil ar[aO]=nil av-=1
aN(aO)ax()end,function(aO)if not dungeon or not aO then return nil end local aP=
aO.Parent while aP do if aP==dungeon then return nil end if aP.Parent==dungeon
and(aP:IsA'Folder'or aP:IsA'Model')then return aP end aP=aP.Parent end return
nil end local aQ=function(aQ)if not aM(aQ)or ar[aQ]then return end local aR,aS=
aL(aQ),aQ:FindFirstChildOfClass'Humanoid'if not aR or not aS then return end ar[
aQ]={Model=aQ,Root=aR,Humanoid=aS,Room=aP(aQ)}av+=1 at[aQ]={Died=aS.Died:
Connect(function()aO(aQ)end)}ax()end local aR=function(aR)if not aR then return
end if aM(aR)then aQ(aR)return end if au[aR]then return end au[aR]=true task.
spawn(function()local aS=os.clock()+3 while aR.Parent and os.clock()<aS do if
aM(aR)then au[aR]=nil aQ(aR)return end task.wait(0.1)end au[aR]=nil if aR.Parent
and aM(aR)then aQ(aR)end end)end local aS=function(aS)if not aS or aq[aS]then
return end aq[aS]=true for aT,aU in ipairs(aS:GetDescendants())do if aU:IsA
'Model'and aM(aU)then aQ(aU)end end as[aS]={Added=aS.DescendantAdded:Connect(
function(aT)if aT:IsA'Model'then aR(aT)elseif aT:IsA'Humanoid'then local aU=aT:
FindFirstAncestorOfClass'Model'if aU then aR(aU)end end end),Removed=aS.
DescendantRemoving:Connect(function(aT)if aT:IsA'Model'then aO(aT)end end)}end
aG=function()if not dungeon then dungeon=workspace:WaitForChild('dungeon',30)end
if not dungeon then return false end am=0 for aT=#an,1,-1 do pcall(an[aT],am)end
ao=0 for aT=#ap,1,-1 do pcall(ap[aT],ao)end for aT,aU in ipairs(dungeon:
GetChildren())do if aU:IsA'Folder'or aU:IsA'Model'then aS(aU)end end as[dungeon]
={Added=dungeon.DescendantAdded:Connect(function(aT)if aT:IsA'Model'then aR(aT)
elseif aT:IsA'Humanoid'then local aU=aT:FindFirstAncestorOfClass'Model'if aU
then aR(aU)end end end),Removed=dungeon.DescendantRemoving:Connect(function(aT)
if aT:IsA'Model'then aO(aT)end end)}return true end aH=function()if not dungeon
then return end for aT,aU in pairs(as)do if aU.Added then pcall(function()aU.
Added:Disconnect()end)end if aU.Removed then pcall(function()aU.Removed:
Disconnect()end)end end as={}aq={}for aT in pairs(ar)do aN(aT)end ar={}av=0 au={
}dungeon=nil end aF=function()for aT,aU in pairs(ar)do if not aT or not aT.
Parent then aO(aT)else local aV=aU.Humanoid or aT:FindFirstChildOfClass
'Humanoid'aU.Humanoid=aV if not aV or aV.Health<=0 then aO(aT)else local aW=aU.
Root if not aW or not aW.Parent then aW=aL(aT)if aW then aU.Root=aW else aO(aT)
end end end end end end function ag.SetFastSpeed(aT)ai=aT if ah and humanoid and
humanoid.Parent then humanoid.WalkSpeed=ai end end function ag.SetSpeedEnabled(
aT)ah=aT if humanoid and humanoid.Parent then humanoid.WalkSpeed=ah and ai or aj
end end function ag.IsSpeedEnabled()return ah end function ag.GetFastSpeed()
return ai end local aT=function()if aJ then aJ:Disconnect()aJ=nil end if not
humanoid or not humanoid.Parent then return end aJ=humanoid:
GetPropertyChangedSignal'WalkSpeed':Connect(function()if ah and humanoid and
humanoid.Parent and humanoid.WalkSpeed~=ai then humanoid.WalkSpeed=ai end end)
end function ag.SetHumanoid(aU)if not aU then return end local aV=aU:
WaitForChild('Humanoid',10)if not aV then return end humanoid=aV aj=humanoid.
WalkSpeed if ah then humanoid.WalkSpeed=ai end end function ag.
GetDungeonStartTime()return dungeonStartTime end function ag.SetDungeonStartTime
(aU)dungeonStartTime=aU end function ag.GetDungeonElapsed()if not
dungeonStartTime then return nil end return os.clock()-dungeonStartTime end
function ag.ReadyDungeon()if not dungeon and not aG()then return false end
return true end function ag.GetHumanoid()return humanoid end function ag.
GetEnemyNames()local aU={}local aV=function(aV)if aV and aV~=''and aV~=ac.Name
then aU[aV]=true end end if dungeon then for aW,aX in ipairs(dungeon:
GetChildren())do if aX:IsA'Folder'or aX:IsA'Model'then for aY,aZ in ipairs(aX:
GetDescendants())do if aZ:IsA'Model'and aZ:FindFirstChildOfClass'Humanoid'then
aV(aZ.Name)end end end end end for aW in pairs(ar)do aV(aW.Name)end local aW={}
for aX in pairs(aU)do table.insert(aW,aX)end table.sort(aW)return aW end
function ag.GetEnemyCount()return av end function ag.GetTrackedEnemyData()local
aU={}for aV,aW in pairs(ar)do if aW and aW.Root and aW.Root.Parent then aU[#aU+1
]=aW end end return aU end function ag.OnEnemyChanged(aU)if type(aU)~='function'
then return function()end end table.insert(aw,aU)return function()for aV,aW in
ipairs(aw)do if aW==aU then table.remove(aw,aV)break end end end end function ag
.GetEnemyProjectileNames()local aU,aV={},game:GetService'ReplicatedStorage'local
aW=aV:FindFirstChild(ae)if not aW then return aU end for aX,aY in ipairs(aW:
GetChildren())do local aZ=aY.ClassName if aZ=='Model'or aZ=='MeshPart'or aZ==
'Part'then aU[aY.Name]=true end end return aU end function ag.GetKeyHoldTime()
return ad end if ac and ac.Character and ac.Character.Parent then ag.
SetHumanoid(ac.Character)aT()else local aU=ac and ac.CharacterAdded and task.
spawn(function()local aU=ac.CharacterAdded:Wait()if aU and ab.IsActive()then ag.
SetHumanoid(aU)aT()end end)end if ac then aK(ac.CharacterAdded:Connect(function(
aU)local aV,aW=pcall(function()if not aU then return end ag.SetHumanoid(aU)aT()
for aV,aW in ipairs(aC)do pcall(aW)end end)if not aV then warn(
'[Shared] respawn handler error:',tostring(aW))end end))end task.spawn(function(
)while ab.IsActive()do task.wait(af)local aU=workspace:FindFirstChild'dungeon'if
dungeon and aU~=dungeon then aH()elseif not dungeon and aU then aG()end aI()end
end)local aU=function()local aU=game:GetService'Workspace'for aV,aW in ipairs(aU
:GetDescendants())do if aW.Name=='dungeonName'and aW:IsA'ValueBase'then local aX
=aW.Value if type(aX)=='string'then local aY=string.gsub(aX,'%s+','')if aY~=''
and string.lower(aY)~=az then return aX end end end end return nil end task.
spawn(function()while ab.IsActive()do task.wait(af)local aV=aU()if aV~=aE then
aE=aV if aV then ag.ResetBossIndex()end for aW=#ay,1,-1 do pcall(ay[aW],aV)end
end end end)local aV=function()return not(aE and#aE>0)end task.spawn(function()
while ab.IsActive()do task.wait(af)local aW=aV()if aW~=aA then aA=aW for aX=#aB,
1,-1 do pcall(aB[aX],aA)end end end end)task.spawn(function()local aW,aX=pcall(
function()return aG()end)if not aW then warn(
'[EnemyTracker] Initialization error:',aX)end end)local aW,aX=0,2 task.spawn(
function()while ab.IsActive()do task.wait(aX)local aY=os.clock()if aY-aW<aX then
continue end aW=aY if not dungeon then continue end local aZ=pcall(function()for
aZ,a_ in ipairs(dungeon:GetChildren())do if a_:IsA'Folder'or a_:IsA'Model'then
for a0,a1 in ipairs(a_:GetDescendants())do if a1:IsA'Model'then aR(a1)end end
end end aF()end)if not aZ then warn'[EnemyTracker] rescan error'end end end)
function ag.IsBossActive()return ak end function ag.OnBossActiveChanged(aY)if
type(aY)~='function'then return function()end end table.insert(al,aY)return
function()for aZ,a_ in ipairs(al)do if a_==aY then table.remove(al,aZ)break end
end end end function ag.GetCurrentBossIndex()return am end function ag.
GetCombatTargetKey()if not ak then return'Mob'end local aY=math.clamp(am,1,3)
return'Boss'..tostring(aY)end function ag.ResetBossIndex()am=0 for aY=#an,1,-1
do pcall(an[aY],am)end end function ag.OnBossIndexChanged(aY)if type(aY)~=
'function'then return function()end end table.insert(an,aY)return function()for
aZ,a_ in ipairs(an)do if a_==aY then table.remove(an,aZ)break end end end end
local aY=function(aY)if type(aY)~='string'then return 0 end local aZ=string.
match(aY,'^room(%d+)$')if not aZ then return 0 end return tonumber(aZ)or 0 end
local aZ=function()if not dungeon then return 0 end for aZ,a_ in pairs(ar)do if
a_ and a_.Room then local a0=aY(a_.Room.Name)if a0>0 then return a0 end end end
return 0 end aI=function()local a_=aZ()if a_==ao then return end ao=a_ for a0=#
ap,1,-1 do pcall(ap[a0],ao)end end function ag.GetCurrentRoomIndex()return ao
end function ag.OnRoomIndexChanged(a_)if type(a_)~='function'then return
function()end end table.insert(ap,a_)return function()for a0,a1 in ipairs(ap)do
if a1==a_ then table.remove(ap,a0)break end end end end function ag.
GetCurrentDungeonName()return aE end function ag.OnDungeonNameChanged(a_)if
type(a_)~='function'then return function()end end table.insert(ay,a_)return
function()for a0,a1 in ipairs(ay)do if a1==a_ then table.remove(ay,a0)break end
end end end function ag.IsInLobby()return aA end function ag.OnLobbyChanged(a_)
if type(a_)~='function'then return function()end end table.insert(aB,a_)return
function()for a0,a1 in ipairs(aB)do if a1==a_ then table.remove(aB,a0)break end
end end end local a_,a0=function(a_)if ak==a_ then return end ak=a_ if a_ then
am+=1 for a0=#an,1,-1 do pcall(an[a0],am)end end for a0=#al,1,-1 do pcall(al[a0]
,ak)end end local function a1()if not ac then return end local a2=ac:
FindFirstChild'PlayerGui'if not a2 then a0=nil a_(false)return end local a3=a2:
FindFirstChild('bossHealth',true)if a3 then if a3~=a0 then a0=a3 if a0:IsA
'ScreenGui'then aK(a0:GetPropertyChangedSignal'Enabled':Connect(a1))elseif a0:
IsA'GuiObject'then aK(a0:GetPropertyChangedSignal'Visible':Connect(a1))end end
local a4=if a3:IsA'ScreenGui'then a3.Enabled elseif a3:IsA'GuiObject'then a3.
Visible else true a_(a4)else a0=nil a_(false)end end task.spawn(function()if not
ac then return end local a2=ac:WaitForChild('PlayerGui',30)if not a2 then return
end aK(a2.DescendantAdded:Connect(a1))aK(a2.DescendantRemoving:Connect(a1))a1()
while ab.IsActive()and task.wait(0.5)do a1()end end)ab.Register(function()if aJ
then aJ:Disconnect()aJ=nil end for a2,a3 in ipairs(aD)do pcall(function()a3:
Disconnect()end)end table.clear(aD)aH()end)return ag end function a.g()local aa=
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
aa end function a.h()local aa,ab={},{}function aa.Register(ac,ad,ae)if type(ac)
~='string'or type(ad)~='function'or type(ae)~='function'then return end ab[ac]={
setEnabled=ad,isEnabled=ae}end function aa.EnableExclusive(ac)for ad,ae in
pairs(ab)do if ad~=ac and ae.isEnabled()then pcall(ae.setEnabled,false)end end
end function aa.IsEnabled(ac)local ad=ab[ac]return ad~=nil and ad.isEnabled()end
return aa end function a.i()local aa,ab,ac,ad,ae,af=game:GetService'Players',
game:GetService'Workspace',2.2,25,{}function ae.BindDetection(ag)af=ag or nil
end local ag=function()return af end function ae.GetHitboxPadding()return ac end
function ae.SetHitboxPadding(ah)if type(ah)=='number'and ah>=0 then ac=ah end
end local ah=RaycastParams.new()ah.FilterType=Enum.RaycastFilterType.Exclude ah.
IgnoreWater=true function ae.GetFloorPosition(ai)local aj={}for ak,al in ipairs(
aa:GetPlayers())do if al.Character then table.insert(aj,al.Character)end end if
ab:FindFirstChild'RaycastIgnore'then table.insert(aj,ab.RaycastIgnore)end for ak
in pairs(ag().GetActiveHazardsMap())do table.insert(aj,ak)end ah.
FilterDescendantsInstances=aj local ak,al=Vector3.new(ai.X,ai.Y+6,ai.Z),Vector3.
new(0,-ad,0)local am=ab:Raycast(ak,al,ah)if am and am.Position then return
Vector3.new(ai.X,am.Position.Y+3,ai.Z),true end return ai,false end function ae.
IsPointInTrajectory(ai,aj)local ak=ag()local al=ak.GetLockedProjectiles()[aj]if
not al then al=ak.LockTrajectoryForPart(aj)end if not al then return false end
local am,an,ao,ap=aj.Position,al.forward2D,al.maxLookahead,al.dangerRadius local
aq=ai-am local ar=Vector3.new(aq.X,0,aq.Z)local as=ar:Dot(an)if as<-ap or as>ao
then return false end local at=an*as local au=ar-at local av,aw=au.Magnitude,
math.abs(ai.Y-am.Y)if aw>14 then return false end if av<=(ap+ac)then return true
,av,ap,an,am,ao end return false end function ae.IsPointInPart(ai,aj)if not aj
or not aj:IsA'BasePart'or not aj.Parent or ag().IsIgnoredPart(aj)then return
false end if aj:IsA'Part'and(aj.Shape==Enum.PartType.Ball or aj.Shape==Enum.
PartType.Cylinder)then local ak,al,am=math.max(aj.Size.X,aj.Size.Z)/2+ac,ai.X-aj
.Position.X,ai.Z-aj.Position.Z local an,ao=al*al+am*am,math.abs(ai.Y-aj.Position
.Y)return(an<=ak*ak)and(ao<=math.max(10,aj.Size.Y/2+5))end local ak,al,am,an=aj.
CFrame:PointToObjectSpace(ai),aj.Size.X/2+ac,aj.Size.Z/2+ac,math.max(8,aj.Size.Y
/2+5)return math.abs(ak.X)<=al and math.abs(ak.Z)<=am and math.abs(ak.Y)<=an end
function ae.IsPointInRingPart(ai,aj)if not aj or not aj:IsA'BasePart'or not aj.
Parent or ag().IsIgnoredPart(aj)then return false end local ak=aj.Parent:
FindFirstChild'center'or aj.Parent:FindFirstChild'Center'or aj.Parent.
PrimaryPart local al=ak and ak.Position or aj.Position local am=math.abs(ai.Y-al
.Y)if am>math.max(14,aj.Size.Y/2+8)then return false end local an,ao=ai.X-al.X,
ai.Z-al.Z local ap,aq=math.sqrt(an*an+ao*ao),aj.Size.Z if aq<1 then aq=math.max(
aj.Size.X,aj.Size.Z)/2 end local ar=(aq>90)and 18 or 13 local as=math.max(0,aq-
ar)if ap<as-ac then return false end if ap>aq+ac then return false end local at,
au=aj.Position.X-al.X,aj.Position.Z-al.Z local av=math.sqrt(at*at+au*au)if av>
0.5 then local aw,ax=at/av,au/av local ay=(an*aw)+(ao*ax)if ay<-ac then return
false end end return true,ap,as,aq,al,aj.CFrame end function ae.
IsPointInThirdBossMultiRings(ai,aj)if not aj or not aj.Instance or not aj.
Instance.Parent then return false,nil end local ak=ag().GetFadeThreshold()if aj.
ActiveParts then for al in pairs(aj.ActiveParts)do if al and al.Parent and al:
IsA'BasePart'and al.Transparency<ak then local am=ae.IsPointInRingPart(ai,al)if
am then return true,al end end end end return false,nil end function ae.
IsPointInAnyHazard(ai)local aj,ak,al,am,an=ag(),(math.huge)for ao,ap in pairs(aj
.GetActiveHazardsMap())do local aq=ap.Name and ap.Name:lower():find'multiring'~=
nil if aq then local ar,as=ae.IsPointInThirdBossMultiRings(ai,ap)if ar then
local at=(ai-as.Position).Magnitude if at<ak then ak=at al=ap am=as an=nil end
end elseif ap.ActiveParts then for ar in pairs(ap.ActiveParts)do local as=aj.
GetTrajectoryConfigForPart(ar)if as then local at,au,av,aw,ax,ay=ae.
IsPointInTrajectory(ai,ar)if at then local az=(ai-ar.Position).Magnitude if az<
ak then ak=az al=ap am=ar an={isTrajectory=true,perpDist=au,dangerRadius=av,
forward2D=aw,originPos=ax,maxLookahead=ay}end end else if ae.IsPointInPart(ai,ar
)then local at=(ai-ar.Position).Magnitude if at<ak then ak=at al=ap am=ar an=nil
end end end end end end if am then return true,al,am,an end return false,nil,nil
,nil end function ae.GetAllHazardsAtPoint(ai)local aj,ak,al=ag(),{},0 for am,an
in pairs(aj.GetActiveHazardsMap())do local ao=an.Name and an.Name:lower():find
'multiring'~=nil if ao then local ap,aq=ae.IsPointInThirdBossMultiRings(ai,an)if
ap then local ar=an.Instance or(aq and aq.Parent)if ar then ak[ar]=true al=al+1
end end elseif an.ActiveParts then for ap in pairs(an.ActiveParts)do local aq=aj
.GetTrajectoryConfigForPart(ap)if aq then local ar=ae.IsPointInTrajectory(ai,ap)
if ar then local as=an.Instance or ap ak[as]=true al=al+1 break end else if ae.
IsPointInPart(ai,ap)then local ar=an.Instance or(ap:IsA'Model'and ap or ap.
Parent)ak[ar]=true al=al+1 break end end end end end return ak,al end function
ae.IsPathSafe(ai,aj,ak,al)local am=(aj-ai).Magnitude if am<=3.5 then return true
end local an=math.clamp(math.ceil(am/1.8),2,8)for ao=1,an-1 do local ap=ao/an
local aq=ai:Lerp(aj,ap)local ar,as,at,au=ae.IsPointInAnyHazard(aq)if ar then if
au and au.isTrajectory then return false end local av=(as and as.Instance)or(at
and(at:IsA'Model'and at or at.Parent))if ak and next(ak)~=nil then if av and not
ak[av]then return false end elseif al then local aw=al:IsA'Model'and al or al.
Parent if aw and av and aw~=av then return false end end end end return true end
return ae end function a.j()local aa,ab=(a.load'e')local ac,ad,ae,af,ag,ah,ai,aj
,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax=function()if not ab then ab=a.load'i'
end return ab end,game:GetService'Players',game:GetService'Workspace',aa.player,
{},false,false,true,{},0,{},{},{DodgeNode_ESP=true,['Enhanced Aura Ring']=true,
EnhancedAuraRing=true,['Enhanced Aura']=true,EnhancedAura=true,['Aura Ring']=
true,AuraRing=true,AuraRingMesh=true,groundAura=true,GroundAura=true,[
'Ground Aura']=true,['ground aura']=true},{largeIceSpikes=true,mediumIceSpikes=
true,smallIceSpikes=true,thirdBossMultiRings=true,firstBossCrissCross=true,
firstBossSeekingSpikes=true},0.95,{dungeon=true,Dungeon=true,Terrain=true,Camera
=true,CurrentCamera=true,RaycastIgnore=true,Drops=true,Loot=true,DodgeNode_ESP=
true,SmartDodge_SafeMarker=true,SmartDodge_SelectionBox=true,
SmartDodge_TrajectoryBox=true,['Enhanced Aura Ring']=true,EnhancedAuraRing=true,
['Enhanced Aura']=true,EnhancedAura=true,['Aura Ring']=true,AuraRing=true,
groundAura=true,GroundAura=true,['Ground Aura']=true,['ground aura']=true},{
firstbosscrisscross={name='firstBossCrissCross',dangerRadius=4,maxLookahead=nil,
visualColor=Color3.fromRGB(255,130,0)},firstbossseekingspikes={name=
'firstBossSeekingSpikes',dangerRadius=4.5,maxLookahead=nil,visualColor=Color3.
fromRGB(255,110,0)}},50,2.5,{},{}ag.SetTrajectoryLookahead=function(ay)if type(
ay)=='number'and ay>=10 then at=ay end end ag.GetTrajectoryLookahead=function()
return at end ag.SetTrajectoryWidthPadding=function(ay)if type(ay)=='number'and
ay>=0 then au=ay end end ag.GetTrajectoryWidthPadding=function()return au end ag
.GetActiveHazardsMap=function()return ak end ag.GetLockedProjectiles=function()
return av end ag.GetFadeThreshold=function()return aq end ag.IsEnabled=function(
)return ah end ag.SetEnabled=function(ay)ah=ay and true or false end ag.
ClearTrajectoryVisuals=function()for ay,az in pairs(aw)do pcall(function()az:
Destroy()end)end table.clear(aw)table.clear(av)end function ag.AddCustomHazard(
ay)if type(ay)=='string'and#ay>0 then ap[ay]=true end end function ag.
AddTrajectoryProjectile(ay,az,aA)if type(ay)=='string'and#ay>0 then local aB=ay:
lower():gsub('%s+','')as[aB]={name=ay,dangerRadius=az or 4,maxLookahead=aA,
visualColor=Color3.fromRGB(255,130,0)}if ai then print((
'[SmartDodge] \u{1f680} Registered Trajectory Projectile: %s'):format(ay))end
end end local ay=function(ay)if not ay then return nil end local az=ay.Name:
lower():gsub('%s+','')if as[az]then return as[az]end if ay.Parent and ay.Parent:
IsA'Model'then local aA=ay.Parent.Name:lower():gsub('%s+','')if as[aA]then
return as[aA]end end return nil end ag.GetTrajectoryConfigForPart=function(az)
return ay(az)end local az=function(az)if not az or not az:IsA'BasePart'then
return nil end if av[az]then return av[az]end local aA=ay(az)if not aA then
return nil end local aB,aC=Vector3.new(0,0,-1),(az.AssemblyLinearVelocity or(az:
IsA'BasePart'and az.Velocity))if aC and Vector3.new(aC.X,0,aC.Z).Magnitude>2
then aB=Vector3.new(aC.X,0,aC.Z).Unit else local aD=az.CFrame.LookVector local
aE=Vector3.new(aD.X,0,aD.Z)if aE.Magnitude>0.001 then aB=aE.Unit end end local
aD=math.min(az.Size.X,az.Size.Z)if aD<1 then aD=math.max(az.Size.X,az.Size.Z)end
aD=math.clamp(aD,2,12)local aE=aA.dangerRadius or(aD/2)local aF,aG=aE+au,aA.
maxLookahead or at local aH={part=az,originPos=az.Position,forward2D=aB,
dangerRadius=aF,maxLookahead=aG,config=aA,spawnTime=os.clock(),locked=true}av[az
]=aH if ai then print((
'[SmartDodge] \u{1f680} Locked Trajectory for %s | Dir: (%.2f, %.2f) | Lookahead: %.0fm | Width: %.1fm (Radius: %.1fm)'
):format(az.Name,aB.X,aB.Z,aH.maxLookahead,aH.dangerRadius*2,aH.dangerRadius))
end return aH end ag.LockTrajectoryForPart=function(aA)return az(aA)end function
ag.RegisterPlayerSkill(aA)if type(aA)=='string'and#aA>0 then local aB=aA:gsub(
'^%s+',''):gsub('%s+$','')if not ao[aB]then ao[aB]=true local aC=aB:lower():
gsub('%s+','')ao[aC]=true if ai then print((
'[SmartDodge] \u{1f6e1}\u{fe0f} Registered Player Skill (Ignored): %s'):format(
aB))end end end end local aA=function()local aA=function(aA)if not aA then
return end local aB=function(aB)if not aB then return end for aC,aD in ipairs(aB
:GetChildren())do ag.RegisterPlayerSkill(aD.Name)end end local aC,aD=function(aC
)if not aC then return end aB(aC)aC.ChildAdded:Connect(function(aD)ag.
RegisterPlayerSkill(aD.Name)end)end,function(aC)if not aC then return end aB(aC)
aC.ChildAdded:Connect(function(aD)if aD:IsA'Tool'then ag.RegisterPlayerSkill(aD.
Name)end end)end if aA:FindFirstChild'Backpack'then aC(aA.Backpack)end aA.
ChildAdded:Connect(function(aE)if aE.Name=='Backpack'or aE:IsA'Backpack'then aC(
aE)end end)if aA.Character then aD(aA.Character)end aA.CharacterAdded:Connect(aD
)end for aB,aC in ipairs(ad:GetPlayers())do aA(aC)end ad.PlayerAdded:Connect(aA)
task.spawn(function()while ah or#ad:GetPlayers()>0 do for aB,aC in ipairs(ad:
GetPlayers())do if aC:FindFirstChild'Backpack'then for aD,aE in ipairs(aC.
Backpack:GetChildren())do ag.RegisterPlayerSkill(aE.Name)end end if aC.Character
then for aD,aE in ipairs(aC.Character:GetChildren())do if aE:IsA'Tool'then ag.
RegisterPlayerSkill(aE.Name)end end end end task.wait(1)end end)end aA()local aB
,aC,aD=function(aB)if not aB then return true end for aC,aD in ipairs(ad:
GetPlayers())do if aD.Character and(aB==aD.Character or aB:IsDescendantOf(aD.
Character))then return true end end local aC=aB.Name:gsub('^%s+',''):gsub('%s+$'
,'')local aD=aC:lower():gsub('%s+','')for aE,aF in ipairs(ad:GetPlayers())do
local aG=aF:FindFirstChild'Backpack'if aG then if aG:FindFirstChild(aB.Name)or
aG:FindFirstChild(aC)then ag.RegisterPlayerSkill(aB.Name)return true end for aH,
aI in ipairs(aG:GetChildren())do local aJ=aI.Name:lower():gsub('%s+','')if aI.
Name==aB.Name or aJ==aD or aD:find(aJ,1,true)or aJ:find(aD,1,true)then ag.
RegisterPlayerSkill(aI.Name)return true end end end if aF.Character then if aF.
Character:FindFirstChild(aB.Name)or aF.Character:FindFirstChild(aC)then ag.
RegisterPlayerSkill(aB.Name)return true end for aH,aI in ipairs(aF.Character:
GetChildren())do if aI:IsA'Tool'then local aJ=aI.Name:lower():gsub('%s+','')if
aI.Name==aB.Name or aJ==aD or aD:find(aJ,1,true)or aJ:find(aD,1,true)then ag.
RegisterPlayerSkill(aI.Name)return true end end end end end local aE=aB:
FindFirstChild'creator'or aB:FindFirstChild'Creator'or aB:FindFirstChild'owner'
or aB:FindFirstChild'Owner'or aB:FindFirstChild'player'or aB:FindFirstChild
'Player'or aB:FindFirstChild'caster'or aB:FindFirstChild'Caster'if aE then if aE
:IsA'ObjectValue'and aE.Value and aE.Value:IsA'Player'then return true elseif aE
:IsA'StringValue'and ad:FindFirstChild(aE.Value)then return true end end local
aF=aB:GetAttribute'Owner'or aB:GetAttribute'Player'or aB:GetAttribute'creator'or
aB:GetAttribute'Creator'if aF then if type(aF)=='string'and ad:FindFirstChild(aF
)then return true end end if ap[aB.Name]or aB.Name:lower():find'multiring'or aB.
Name:lower():find'thirdboss'then return false end for aG,aH in ipairs(ad:
GetPlayers())do local aI=aH.Name:lower()if aD:find(aI,1,true)or aB.Name:find(
tostring(aH.UserId),1,true)then return true end end if ao[aB.Name]or ao[aC]or ao
[aD]then return true end for aG in pairs(ao)do local aH=aG:lower():gsub('%s+',''
)if#aH>=4 and aD:find(aH,1,true)then return true end end return false end,{
primarypart=true,center=true,root=true,main=true,handle=true,humanoidrootpart=
true},function(aB)if not aB then return true end if aB.Name:find'SmartDodge'then
return true end local aC=aB.Name:gsub('^%s+',''):gsub('%s+$','')local aD=aC:
lower():gsub('%s+','')if ap[aB.Name]or(aB.Parent and ap[aB.Parent.Name])or aB.
Name:lower():find'multiring'or(aB.Parent and aB.Parent.Name:lower():find
'multiring')or aB.Name:lower():find'crisscross'or(aB.Parent and aB.Parent.Name:
lower():find'crisscross')or aB.Name:lower():find'seekingspike'or(aB.Parent and
aB.Parent.Name:lower():find'seekingspike')or aB.Name:lower():find'thirdboss'or(
aB.Parent and aB.Parent.Name:lower():find'thirdboss')then return false end if ao
[aB.Name]or ao[aC]or ao[aD]or ar[aB.Name]then return true end if aD:find(
'enhancedaura',1,true)or aD:find('auraring',1,true)or aD:find('groundaura',1,
true)then return true end return false end ag.IsIgnoredPart=function(aE)return
aD(aE)end local aE,aF,aG,aH,aI=function(aE)local aF={}if not aE or aE.Name:find
'SmartDodge'or aD(aE)then return aF,false end local aG,aH=ap[aE.Name]or aE.Name:
lower():find'multiring'or aE.Name:lower():find'crisscross'or aE.Name:lower():
find'seekingspike'or aE.Name:lower():find'thirdboss',function(aG)if not aG or
not aG:IsA'BasePart'or aD(aG)then return false end local aH=aG.Name:lower():
gsub('%s+','')if aC[aH]then return false end if aE.Name:lower():find'multiring'
and not aH:find'ring'then return false end return aG.Transparency<aq end if aG
then if aE:IsA'BasePart'then if aH(aE)then table.insert(aF,aE)end elseif aE:IsA
'Model'then local aI={}for aJ,aK in ipairs(aE:GetDescendants())do if aH(aK)and
aK.Name:lower():find'precast'then table.insert(aI,aK)end end if#aI>0 then aF=aI
else for aJ,aK in ipairs(aE:GetDescendants())do if aH(aK)then table.insert(aF,aK
)end end end end else if aE:IsA'BasePart'then if aH(aE)and aE.Material==Enum.
Material.Neon then table.insert(aF,aE)end elseif aE:IsA'Model'then for aI,aJ in
ipairs(aE:GetDescendants())do if aH(aJ)and aJ.Material==Enum.Material.Neon then
table.insert(aF,aJ)end end end end return aF,aG end,function(aE,aF)if aE:IsA
'BasePart'then return aE.Position elseif aE:IsA'Model'then if aE.PrimaryPart
then return aE.PrimaryPart.Position end local aG=aE:GetPivot()if aG and aG.
Position~=Vector3.zero then return aG.Position end end if aF and#aF>0 then
return aF[1].Position end return Vector3.zero end,function()for aE,aF in ipairs(
am)do pcall(aF,al,ax)end end,function(aE)local aF={}for aG,aH in ipairs(aE)do if
aH and aH:IsA'BasePart'and aH.Parent then local aI=Instance.new'SelectionBox'aI.
Name='SmartDodge_SelectionBox'aI.Color3=Color3.fromRGB(255,45,45)aI.
SurfaceColor3=Color3.fromRGB(255,30,30)aI.SurfaceTransparency=0.6 aI.
LineThickness=0.05 aI.Adornee=aH aI.Parent=aH table.insert(aF,aI)end end return
aF end local function aJ(aK)if not ah or not aK or ak[aK]then return end if aK:
IsA'Folder'then return end if aK:FindFirstChildOfClass'Humanoid'then return end
if aK.Name:find'SmartDodge'then return end if ar[aK.Name]or ao[aK.Name]or aB(aK)
then return end local aL,aM=aE(aK)if#aL==0 then if aK:IsA'Model'then local aN aN
=aK.DescendantAdded:Connect(function(aO)if aO:IsA'BasePart'and aO.Transparency<
aq then if aM or aO.Material==Enum.Material.Neon then if aN then aN:Disconnect()
aN=nil end aJ(aK)end end end)task.delay(1,function()if aN then aN:Disconnect()aN
=nil end end)end return end local aN,aO=aF(aK,aL),af and af.Character and af.
Character:FindFirstChild'HumanoidRootPart'local aP,aQ,aR=aO and math.floor((aN-
aO.Position).Magnitude)or 0,{},{}for aS,aT in ipairs(aL)do aQ[aT]=true end local
aS=aj and aH(aL)or{}local aT={Instance=aK,Name=aK.Name,Class=aK.ClassName,
Position=aN,Distance=aP,NeonCount=#aL,SpawnTime=os.clock(),Connections=aR,
ActiveParts=aQ,VisualBoxes=aS,IsException=aM}ak[aK]=aT al=al+1 ax=aT for aU,aV
in ipairs(aL)do if ay(aV)then az(aV)end end local aU=function(aU)if not ak[aK]or
not aQ[aU]then return end local aV=(not aU.Parent)or(aU.Transparency>=aq)or(not
aM and aU.Material~=Enum.Material.Neon)if aV then aQ[aU]=nil if aw[aU]then
pcall(function()aw[aU]:Destroy()end)aw[aU]=nil end if av[aU]then av[aU]=nil end
local aW=0 for aX in pairs(aQ)do aW=aW+1 end if aW==0 then aI(aK,
'Faded / Finished')else aT.NeonCount=aW end end end for aV,aW in ipairs(aL)do
table.insert(aR,aW:GetPropertyChangedSignal'Transparency':Connect(function()aU(
aW)end))if not aM then table.insert(aR,aW:GetPropertyChangedSignal'Material':
Connect(function()aU(aW)end))end table.insert(aR,aW.AncestryChanged:Connect(
function()aU(aW)end))end if aK:IsA'Model'then table.insert(aR,aK.DescendantAdded
:Connect(function(aV)if not ak[aK]then return end local aW=aV:IsA'BasePart'and
not aD(aV)and aV.Transparency<aq if aW then local aX=aV.Name:lower():gsub('%s+',
'')if not aC[aX]then if aM or aV.Material==Enum.Material.Neon then if not aQ[aV]
then aQ[aV]=true aT.NeonCount=aT.NeonCount+1 if ay(aV)then az(aV)end if aj then
local aY=aH{aV}if aY and#aY>0 then for aZ,a_ in ipairs(aY)do table.insert(aT.
VisualBoxes,a_)end end end table.insert(aR,aV:GetPropertyChangedSignal
'Transparency':Connect(function()aU(aV)end))table.insert(aR,aV.AncestryChanged:
Connect(function()aU(aV)end))end end end end end))end if aK.Name:lower():find
'multiring'then task.delay(0.3,function()if not aK or not aK.Parent then return
end local aV=aK:FindFirstChild'center'or aK:FindFirstChild'Center'or aK.
PrimaryPart local aW=aV and aV.Position or Vector3.zero print
[[================ [MULTIRINGS INSPECTOR DUMP] ================]]print((
'[MultiRings] Model: %s | Center: (%.1f, %.1f, %.1f)'):format(aK.Name,aW.X,aW.Y,
aW.Z))local aX=0 for aY,aZ in ipairs(aK:GetDescendants())do if aZ:IsA'BasePart'
then aX=aX+1 local a_,a0,a1=aZ.Position-aW,aZ.CFrame:ToOrientation()print((
[[[%d] Name: '%s' | Class: %s | Size: (%.1f, %.1f, %.1f) | Offset: (%.1f, %.1f, %.1f) | RotY: %.1f deg]]
):format(aX,aZ.Name,aZ.ClassName,aZ.Size.X,aZ.Size.Y,aZ.Size.Z,a_.X,a_.Y,a_.Z,
math.deg(a1)))end end print
[[=============================================================]]end)end if ai
then print((
'[SmartDodge][Hazard] \u{1f6a8} Hazard Detected: %s | Class: %s | Parts: %d | Dist: %d studs%s'
):format(aT.Name,aT.Class,aT.NeonCount,aT.Distance,aM and' (Exception)'or''))end
aG()end function aI(aK,aL)if not ak[aK]then return end local aM=ak[aK]if aM.
VisualBoxes then for aN,aO in ipairs(aM.VisualBoxes)do pcall(function()aO:
Destroy()end)end table.clear(aM.VisualBoxes)end if aM.Connections then for aN,aO
in ipairs(aM.Connections)do pcall(function()aO:Disconnect()end)end table.clear(
aM.Connections)end if aM.ActiveParts then for aN in pairs(aM.ActiveParts)do if
aw[aN]then pcall(function()aw[aN]:Destroy()end)aw[aN]=nil end if av[aN]then av[
aN]=nil end end end ak[aK]=nil al=math.max(0,al-1)if ai and aM then local aN=aL
and(' ('..aL..')')or''print((
'[SmartDodge][Hazard] \u{1f7e2} Hazard Expired: %s%s'):format(aM.Name,aN))end
aG()end ag.RegisterHazard=aJ ag.UnregisterHazard=aI function ag.
UpdateTrajectoryVisuals()if not aj or not ah then for aK,aL in pairs(aw)do
pcall(function()aL:Destroy()end)end table.clear(aw)return end local aK={}for aL,
aM in pairs(ak)do if aM.ActiveParts then for aN in pairs(aM.ActiveParts)do if aN
and aN.Parent and aN:IsA'BasePart'and aN.Transparency<aq then local aO=ay(aN)if
aO then local aP=av[aN]or az(aN)if aP and aP.forward2D then aK[aN]=true local aQ
=math.min(aN.Size.X,aN.Size.Z)if aQ<1 then aQ=math.max(aN.Size.X,aN.Size.Z)end
aQ=math.clamp(aQ,2,12)local aR=aP.config.dangerRadius or(aQ/2)local aS,aT=aR+au,
aP.config.maxLookahead or at aP.dangerRadius=aS aP.maxLookahead=aT local aU,aV=
aP.forward2D,aN.Position local aW,aX=aV+aU*(aT/2),aw[aN]if not aX or not aX.
Parent then aX=Instance.new'Part'aX.Name='SmartDodge_TrajectoryBox'aX.Material=
Enum.Material.Neon aX.Color=aO.visualColor or Color3.fromRGB(255,130,0)aX.
Transparency=0.82 aX.Anchored=true aX.CanCollide=false aX.CanQuery=false aX.
CanTouch=false local aY=Instance.new'SelectionBox'aY.Name='TrajectoryBorder'aY.
Color3=Color3.fromRGB(255,150,30)aY.SurfaceColor3=aO.visualColor or Color3.
fromRGB(255,130,0)aY.SurfaceTransparency=0.8 aY.LineThickness=0.04 aY.Adornee=aX
aY.Parent=aX local aZ=Instance.new'BillboardGui'aZ.Name='TrajGui'aZ.Size=UDim2.
fromOffset(200,26)aZ.StudsOffset=Vector3.new(0,3.5,0)aZ.AlwaysOnTop=true aZ.
Adornee=aX aZ.Parent=aX local a_=Instance.new'TextLabel'a_.Name='Label'a_.Size=
UDim2.fromScale(1,1)a_.BackgroundTransparency=1 a_.TextColor3=Color3.fromRGB(255
,170,40)a_.TextStrokeTransparency=0 a_.TextStrokeColor3=Color3.fromRGB(0,0,0)a_.
Font=Enum.Font.GothamBold a_.TextSize=12 a_.Text=(
'\u{1f680} TRAJECTORY: %s (%.0fm | W:%.1fm)'):format(aN.Name,aT,aS*2)a_.Parent=
aZ aw[aN]=aX else local aY=aX:FindFirstChild'TrajGui'local aZ=aY and aY:
FindFirstChild'Label'if aZ then aZ.Text=(
'\u{1f680} TRAJECTORY: %s (%.0fm | W:%.1fm)'):format(aN.Name,aT,aS*2)end end aX.
Size=Vector3.new(aS*2,2,aT)local aY,aZ=ac().GetFloorPosition(aW)local a_=aZ and
Vector3.new(aW.X,aY.Y,aW.Z)or aW aX.CFrame=CFrame.lookAt(a_,a_+aU)aX.Parent=ae.
Terrain end end end end end end for aL,aM in pairs(aw)do if not aK[aL]then
pcall(function()aM:Destroy()end)aw[aL]=nil av[aL]=nil end end end function ag.
StartScan()for aK,aL in ipairs(an)do aL:Disconnect()end table.clear(an)for aK,aL
in pairs(ak)do if aL.VisualBoxes then for aM,aN in ipairs(aL.VisualBoxes)do
pcall(function()aN:Destroy()end)end end if aL.Connections then for aM,aN in
ipairs(aL.Connections)do pcall(function()aN:Disconnect()end)end end end table.
clear(ak)al=0 for aK,aL in ipairs(ae:GetChildren())do aJ(aL)end table.insert(an,
ae.ChildAdded:Connect(function(aK)aJ(aK)end))table.insert(an,ae.ChildRemoved:
Connect(function(aK)aI(aK,'Destroyed')end))if ai then print
'[SmartDodge] \u{1f4e1} Threat Detector & Safe Spot Engine started!'end end
function ag.StopScan()for aK,aL in ipairs(an)do aL:Disconnect()end table.clear(
an)for aK,aL in pairs(ak)do if aL.VisualBoxes then for aM,aN in ipairs(aL.
VisualBoxes)do pcall(function()aN:Destroy()end)end end if aL.Connections then
for aM,aN in ipairs(aL.Connections)do pcall(function()aN:Disconnect()end)end end
end table.clear(ak)al=0 aG()if ai then print
'[SmartDodge] \u{1f6d1} Threat Detector stopped.'end end function ag.
SetLogHazards(aK)ai=aK and true or false end function ag.IsLogHazardsEnabled()
return ai end function ag.SetVisualEsp(aK)aj=aK and true or false ag.
UpdateTrajectoryVisuals()if aj then for aL,aM in pairs(ak)do if(not aM.
VisualBoxes or#aM.VisualBoxes==0)and aM.ActiveParts then local aN={}for aO in
pairs(aM.ActiveParts)do table.insert(aN,aO)end aM.VisualBoxes=aH(aN)end end else
for aL,aM in pairs(ak)do if aM.VisualBoxes then for aN,aO in ipairs(aM.
VisualBoxes)do pcall(function()aO:Destroy()end)end table.clear(aM.VisualBoxes)
end end end end function ag.IsVisualEspEnabled()return aj end function ag.
GetHazardCount()return al end function ag.GetActiveHazards()local aK={}for aL,aM
in pairs(ak)do if aM.Instance and aM.Instance.Parent==ae then table.insert(aK,aM
)end end return aK end function ag.GetLastHazardInfo()return ax end function ag.
OnHazardChanged(aK)if type(aK)~='function'then return end table.insert(am,aK)end
return ag end function a.k()local aa,ab,ac,ad=a.load'e',a.load'i',a.load'j',game
:GetService'Workspace'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.player,
true,false,4.5,{3.5,5.5,7.5,10,13,16,20,25},{0,15,-15,30,-30,45,-45,60,-60,75,-
75,90,-90,105,-105,120,-120,135,-135,150,-150,165,-165,180},false,0,{}function
am.IsShowSafeMarkerEnabled()return af end function am.SetShowSafeMarker(as)af=as
and true or false am.UpdateMarker(aq,ak,al)end function am.
IsShowHitboxVisualEnabled()return ag end function am.SetShowHitboxVisual(as)ag=
as and true or false am.UpdateHitbox(ar)end function am.SetHitboxPadding(as)ab.
SetHitboxPadding(as)if ap and ap.Parent then local at=math.max(0.4,ab.
GetHitboxPadding()*2)ap.Size=Vector3.new(0.15,at,at)end end function am.
HideVisuals()if ao then ao.Parent=nil end if ap then ap.Parent=nil end end
function am.DestroyVisuals()if ao then pcall(function()ao:Destroy()end)ao=nil
end if ap then pcall(function()ap:Destroy()end)ap=nil end end function am.
ResetLock()an=nil end local as=function()if ap and ap.Parent then return ap end
local as=Instance.new'Part'as.Name='SmartDodge_HitboxVisual'as.Shape=Enum.
PartType.Cylinder local at=math.max(0.4,ab.GetHitboxPadding()*2)as.Size=Vector3.
new(0.15,at,at)as.Color=Color3.fromRGB(0,220,255)as.Material=Enum.Material.Neon
as.Transparency=0.75 as.Anchored=true as.CanCollide=false as.CanQuery=false as.
CanTouch=false local au=Instance.new'SelectionBox'au.Name='HitboxBorder'au.
Color3=Color3.fromRGB(120,240,255)au.SurfaceColor3=Color3.fromRGB(0,220,255)au.
SurfaceTransparency=0.8 au.LineThickness=0.04 au.Adornee=as au.Parent=as ap=as
return as end function am.UpdateHitbox(at)ar=at if not ag or not ac.IsEnabled()
or not at then if ap then ap.Parent=nil end return end local au,av=as(),math.
max(0.4,ab.GetHitboxPadding()*2)au.Size=Vector3.new(0.15,av,av)local aw,ax=ab.
GetFloorPosition(at)local ay=ax and(aw.Y-2.8)or(at.Y-2.8)local az=Vector3.new(at
.X,ay,at.Z)au.CFrame=CFrame.new(az)*CFrame.Angles(0,0,math.rad(90))au.Parent=ad.
Terrain end local at=function()if ao and ao.Parent then return ao end local at=
Instance.new'Part'at.Name='SmartDodge_SafeMarker'at.Shape=Enum.PartType.Ball at.
Size=Vector3.new(1.5,1.5,1.5)at.Color=Color3.fromRGB(0,255,120)at.Material=Enum.
Material.Neon at.Transparency=0.2 at.Anchored=true at.CanCollide=false at.
CanQuery=false at.CanTouch=false local au=Instance.new'BillboardGui'au.Name=
'MarkerGui'au.Size=UDim2.fromOffset(130,24)au.StudsOffset=Vector3.new(0,1.5,0)au
.AlwaysOnTop=true au.Adornee=at au.Parent=at local av=Instance.new'TextLabel'av.
Name='Label'av.Size=UDim2.fromScale(1,1)av.BackgroundTransparency=1 av.
TextColor3=Color3.fromRGB(80,255,160)av.TextStrokeTransparency=0 av.
TextStrokeColor3=Color3.fromRGB(0,0,0)av.Font=Enum.Font.GothamBold av.TextSize=
12 av.Text='\u{1f7e2} SAFE SPOT'av.Parent=au ao=at return at end function am.
UpdateMarker(au,av,aw)aq,ak,al=au,av or false,aw or 0 if not af or not av or not
au then if ao then ao.Parent=nil end return end local ax,ay=at(),au.Y-2.2 ax.
CFrame=CFrame.new(au.X,ay,au.Z)ax.Parent=ad.Terrain local az=ax:FindFirstChild
'MarkerGui'local aA=az and az:FindFirstChild'Label'if aA then aA.Text=(
'\u{1f7e2} SAFE SPOT (%.1fm)'):format(aw or 0)end end local au,av,aw=function(au
)local av,aw,ax=0,0,ac.GetActiveHazardsMap and ac.GetActiveHazardsMap()if not ax
then return nil end local ay=0 for az,aA in pairs(ax)do local aB=aA.Position if
not aB and aA.ActiveParts then for aC in pairs(aA.ActiveParts)do if aC and aC.
Parent and aC:IsA'BasePart'then aB=aC.Position break end end end if aB then
local aC,aD=au.X-aB.X,au.Z-aB.Z local aE=aC*aC+aD*aD if aE<1600 and aE>0.01 then
local aF=math.sqrt(aE)local aG=1/math.max(1,aF)av=av+(aC/aF)*aG aw=aw+(aD/aF)*aG
ay=ay+1 end end end local az=av*av+aw*aw if ay>0 and az>0.001 then local aA=math
.sqrt(az)return Vector3.new(av/aA,0,aw/aA)end return nil end,function(au)local
av=0 if au then av=math.deg(math.atan2(au.Z,au.X))end local aw=table.create(24)
for ax,ay in ipairs(aj)do aw[ax]=(av+ay)%360 end return aw end,function(au)local
av,aw={Vector3.new(2,0,0),Vector3.new(-2,0,0),Vector3.new(0,0,2),Vector3.new(0,0
,-2),Vector3.new(1.5,0,1.5),Vector3.new(-1.5,0,1.5),Vector3.new(1.5,0,-1.5),
Vector3.new(-1.5,0,-1.5),Vector3.new(3.5,0,0),Vector3.new(-3.5,0,0),Vector3.new(
0,0,3.5),Vector3.new(0,0,-3.5)},0 for ax,ay in ipairs(av)do if not ab.
IsPointInAnyHazard(au+ay)then aw=aw+1 end end return aw*0.3 end local ax=
function(ax,ay,az)local aA,aB=(ay-ax).Magnitude,aw(ay)local aC=aA-(aB*0.25)if az
and aA>0.5 then local aD=(ay-ax).Unit local aE=aD:Dot(az)aC=aC-(aE*0.6)end
return aC end local ay=function(ay,az,aA,aB)local aC,aD,aE,aF,aG=av(az),math.
huge,(math.huge)for aH,aI in ipairs(ai)do local aJ,aK=(math.huge)for aL,aM in
ipairs(aC)do local aN=math.rad(aM)local aO=Vector3.new(math.cos(aN)*aI,0,math.
sin(aN)*aI)local aP=ay+aO local aQ,aR=ab.GetFloorPosition(aP)if aR and not ab.
IsPointInAnyHazard(aQ)then local aS=ax(ay,aQ,az)if aS<aE then aE=aS aG=aQ end if
ab.IsPathSafe(ay,aQ,aA,aB)then if aS<aJ then aJ=aS aK=aQ end end end end if aK
then aF=aK aD=aJ break end end if aF then return aF,aD end return aG,aE end
function am.CalculateSafeSpot(az)local aA=ae and ae.Character and ae.Character:
FindFirstChild'HumanoidRootPart'local aB=az or(aA and aA.Position)if not aB then
an=nil return false,nil,nil,0 end local aC,aD,aE,aF=ab.IsPointInAnyHazard(aB)if
not aC or not aE then an=nil return false,nil,nil,0 end local aG,aH,aI,aJ=aD.
Name or'Unknown',ab.GetAllHazardsAtPoint(aB),false,math.huge if an and not ab.
IsPointInAnyHazard(an)then aJ=(an-aB).Magnitude if aJ<=35 and ab.IsPathSafe(aB,
an,aH,aE)then aI=true else an=nil end else an=nil end local aK,aL,aM=aG:lower():
find'multiring'~=nil or(aD.Instance and aD.Instance.Name:lower():find'multiring'
~=nil),(au(aB))if aK then local aN,aO,aP,aQ,aR,aS=ab.IsPointInRingPart(aB,aE)
local aT={}if aN and aR and aO and aO>0.1 then local aU,aV=aB.X-aR.X,aB.Z-aR.Z
local aW,aX=aU/aO,aV/aO if aP and aP>2 then local aY=Vector3.new(aR.X+aW*(aP-2.5
),aB.Y,aR.Z+aX*(aP-2.5))table.insert(aT,aY)end if aQ then local aY=Vector3.new(
aR.X+aW*(aQ+2.5),aB.Y,aR.Z+aX*(aQ+2.5))table.insert(aT,aY)end local aY=Vector3.
new(aR.X-aU,aB.Y,aR.Z-aV)table.insert(aT,aY)end local aU,aV={3,6,9,12,15,18,22,
26,30,35,40},{0,22.5,45,67.5,90,112.5,135,157.5,180,202.5,225,247.5,270,292.5,
315,337.5}for aW,aX in ipairs(aU)do for aY,aZ in ipairs(aV)do local a_=math.rad(
aZ)local a0=Vector3.new(math.cos(a_)*aX,0,math.sin(a_)*aX)table.insert(aT,aB+a0)
end end local aW,aX,aY,aZ=math.huge,(math.huge)for a_,a0 in ipairs(aT)do local
a1,a2=ab.GetFloorPosition(a0)if a2 and not ab.IsPointInAnyHazard(a1)then local
a3=(a1-aB).Magnitude local a4=a3-aw(a1)if a4<aX then aX=a4 aZ=a1 end if ab.
IsPathSafe(aB,a1,aH,aE)then if a4<aW then aW=a4 aY=a1 end end end end aM=aY or
aZ elseif aF and aF.isTrajectory then local aN,aO,aP=aF.forward2D,aF.perpDist,aF
.dangerRadius local aQ,aR,aS,aT,aU=math.max(3.5,(aP-aO)+ah),Vector3.new(aN.Z,0,-
aN.X),Vector3.new(-aN.Z,0,aN.X),{0,3,-3,6,-6},{}for aV,aW in ipairs(aT)do local
aX=aN*aW table.insert(aU,aB+aR*aQ+aX)table.insert(aU,aB+aS*aQ+aX)table.insert(aU
,aB+aR*(aQ+2)+aX)table.insert(aU,aB+aS*(aQ+2)+aX)end local aV,aW,aX,aY=math.huge
,(math.huge)for aZ,a_ in ipairs(aU)do local a0,a1=ab.GetFloorPosition(a_)if a1
and not ab.IsPointInAnyHazard(a0)then local a2=ax(aB,a0,aL)if a2<aW then aW=a2
aY=a0 end if ab.IsPathSafe(aB,a0,aH,aE)then if a2<aV then aV=a2 aX=a0 end end
end end if not aX then local aZ,a_=ay(aB,aL,aH,aE)if aZ then aX=aZ aV=a_ end end
aM=aX or aY else local aN,aO,aP,aQ,aR=math.huge,math.huge,{}if aE:IsA'Part'and(
aE.Shape==Enum.PartType.Ball or aE.Shape==Enum.PartType.Cylinder)then local aS,
aT=math.max(aE.Size.X,aE.Size.Z)/2,Vector3.new(aB.X-aE.Position.X,0,aB.Z-aE.
Position.Z)local aU,aV,aW=aT.Magnitude>0.1 and math.atan2(aT.Z,aT.X)or 0,aS+ah,{
0,math.rad(25),-math.rad(25),math.rad(50),-math.rad(50)}for aX,aY in ipairs(aW)
do local aZ=aU+aY local a_=aE.Position+Vector3.new(math.cos(aZ)*aV,0,math.sin(aZ
)*aV)table.insert(aP,a_)end else local aS,aT,aU=aE.CFrame:PointToObjectSpace(aB)
,aE.Size.X/2,aE.Size.Z/2 table.insert(aP,aE.CFrame:PointToWorldSpace(Vector3.
new(aT+ah,0,aS.Z)))table.insert(aP,aE.CFrame:PointToWorldSpace(Vector3.new(-(aT+
ah),0,aS.Z)))table.insert(aP,aE.CFrame:PointToWorldSpace(Vector3.new(aS.X,0,aU+
ah)))table.insert(aP,aE.CFrame:PointToWorldSpace(Vector3.new(aS.X,0,-(aU+ah))))
table.insert(aP,aE.CFrame:PointToWorldSpace(Vector3.new(aT+ah,0,aU+ah)))table.
insert(aP,aE.CFrame:PointToWorldSpace(Vector3.new(aT+ah,0,-(aU+ah))))table.
insert(aP,aE.CFrame:PointToWorldSpace(Vector3.new(-(aT+ah),0,aU+ah)))table.
insert(aP,aE.CFrame:PointToWorldSpace(Vector3.new(-(aT+ah),0,-(aU+ah))))end for
aS,aT in ipairs(aP)do local aU,aV=ab.GetFloorPosition(aT)if aV and not ab.
IsPointInAnyHazard(aU)then local aW=ax(aB,aU,aL)if aW<aO then aO=aW aR=aU end if
ab.IsPathSafe(aB,aU,aH,aE)then if aW<aN then aN=aW aQ=aU end end end end local
aS,aT=ay(aB,aL,aH,aE)if aS and(not aQ or aT<aN)then aN=aT aQ=aS end aM=aQ or aR
end if aI and an and not ab.IsPointInAnyHazard(an)then local aN=math.floor(aJ*10
)/10 return true,an,aG,aN end if aM and not ab.IsPointInAnyHazard(aM)then an=aM
local aN=math.floor((an-aB).Magnitude*10)/10 return true,an,aG,aN end an=nil
return true,nil,aG,0 end return am end function a.l()local aa=a.load'e'local ab,
ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an=aa.player,false,1,3,0.5,true,false,{},{}
function aj.SetRuntime(ao)an=ao or nil end local ao,ap,aq,ar=function()return an
and an.getInDanger and an.getInDanger()or false end,function()return an and an.
getLogInDanger and an.getLogInDanger()or false end,function(ao)for ap,aq in
ipairs(ai)do pcall(aq,ao)end end,function()if not am then return nil end local
ao,ap=pcall(am)if ao and type(ap)=='table'and ap.X and ap.Z then return ap end
return nil end local as=function(as,at,au,av)local aw=av or au.Y if not ag and
at and at.HipHeight then local ax,ay=at.HipHeight+(as.Size.Y/2),au.Y-3 aw=ay+ax
end local ax,ay=Vector3.new(au.X,aw,au.Z),ar()if ay then as.CFrame=CFrame.new(ax
,Vector3.new(ay.X,aw,ay.Z))else as.CFrame=CFrame.new(ax,ax+as.CFrame.LookVector)
end end function aj.Perform(at,au)local av=ab and ab.Character local aw,ax=av
and av:FindFirstChild'HumanoidRootPart',av and av:FindFirstChild'Humanoid'if not
aw or not ax or ax.Health<=0 then return end al=at if ah then local ay=Vector3.
new(at.X,aw.Position.Y,at.Z)ax:MoveTo(ay)return end ak=task.spawn(function()ah=
true aq'Dodging'local ay,az,aA=aw.Position.Y,ax.AutoRotate,am~=nil if aA then ax
.AutoRotate=false end local aB,aC=function()if aA then ax.AutoRotate=az end ah=
false al=nil aq'Safe'end,aw.Position local aD=(at-aC).Magnitude if aD<=ae then
as(aw,ax,at,ay)if ap()then print((
'[SmartDodge][Dodge] \u{26a1} Instant Snap (%.1f studs) to Safe Spot!'):format(
aD))end aB()return end if ap()then print((
'[SmartDodge][Dodge] \u{1f6b6} Walk + Snap Hybrid (%.1f studs, budget %.2fs)...'
):format(aD,ad))end local aE=os.clock()while ao()and ac and(os.clock()-aE<ad)do
if not aw.Parent or not ax.Parent or ax.Health<=0 then break end local aF=al or
at aC=aw.Position local aG=(aF-aC).Magnitude if aG<=ae then as(aw,ax,aF,ay)break
end local aH=ar()if aH then aw.CFrame=CFrame.lookAt(aC,Vector3.new(aH.X,aC.Y,aH.
Z))end local aI=Vector3.new(aF.X,aC.Y,aF.Z)ax:MoveTo(aI)task.wait(0.05)end local
aF=al or at if(os.clock()-aE)>=ad and(aF-aw.Position).Magnitude>af then as(aw,ax
,aF,ay)if ap()then print
'[SmartDodge][Dodge] \u{26a1} Time Budget reached \u{2014} snapped the remainder to Safe Spot!'
end end aB()end)end function aj.Cancel()if ak then task.cancel(ak)ak=nil end ah=
false al=nil end function aj.FireStatus(at)aq(at)end function aj.SetAutoDodge(at
)ac=at and true or false end function aj.IsAutoDodgeEnabled()return ac end
function aj.SetMaxDodgeTime(at)if type(at)=='number'and at>0 then ad=at end end
function aj.GetMaxDodgeTime()return ad end function aj.SetMaxSnapDistance(at)if
type(at)=='number'and at>0 then ae=at end end function aj.GetMaxSnapDistance()
return ae end aj.SetMaxTeleportStep=aj.SetMaxSnapDistance aj.GetMaxTeleportStep=
aj.GetMaxSnapDistance function aj.SetMaintainSnapHeight(at)ag=at and true or
false end function aj.IsMaintainSnapHeightEnabled()return ag end function aj.
IsDodging()return ah end function aj.SetFaceTargetProvider(at)am=type(at)==
'function'and at or nil end function aj.GetStatus()if ah then return'Dodging'
elseif ao()then return'Safe (Standing in Spot)'else return'Idle'end end function
aj.OnDodgeStatusChanged(at)if type(at)~='function'then return end table.insert(
ai,at)end return aj end function a.m()local aa,ab,ac,ad,ae,af=a.load'e',a.load
'h',a.load'j',a.load'i',a.load'k',a.load'l'ad.BindDetection{GetActiveHazardsMap=
ac.GetActiveHazardsMap,GetLockedProjectiles=ac.GetLockedProjectiles,
GetTrajectoryConfigForPart=ac.GetTrajectoryConfigForPart,LockTrajectoryForPart=
ac.LockTrajectoryForPart,IsIgnoredPart=ac.IsIgnoredPart,GetFadeThreshold=ac.
GetFadeThreshold}local ag,ah,ai,aj,ak,al,am,an=aa.player,false,0,{},true af.
SetRuntime{getInDanger=function()return ah end,getLogInDanger=function()return
ak end}local ao,ap={},function(ao,ap,aq,ar)for as,at in ipairs(aj)do pcall(at,ao
,ap,aq,ar)end end local aq,ar=function()if an then return end an=task.spawn(
function()local aq=0 while ac.IsEnabled()do local ar,as,at,au=ae.
CalculateSafeSpot()local av=(ar~=ah)or(as~=al)ah=ar al=as am=at ai=au or 0 ae.
UpdateMarker(as,ar,au)local aw=ag and ag.Character and ag.Character:
FindFirstChild'HumanoidRootPart'local ax=aw and aw.Position ae.UpdateHitbox(ax)
ac.UpdateTrajectoryVisuals()if ar and as and af.IsAutoDodgeEnabled()then af.
Perform(as,au)end if av then ap(ar,as,at,au)if ak and ar and as and(os.clock()-
aq>0.5)then aq=os.clock()print((
'[SmartDodge][InDanger] \u{26a0}\u{fe0f} IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)'
):format(at,au,as.X,as.Y,as.Z))end end task.wait(0.05)end end)end,function()if
an then task.cancel(an)an=nil end af.Cancel()ae.HideVisuals()ac.
ClearTrajectoryVisuals()ae.ResetLock()ah=false al=nil am=nil ap(false,nil,nil,0)
af.FireStatus'Idle'end local as,at=function()ac.StartScan()aq()end,function()ac.
StopScan()ar()end function ao.StartEngine()if ac.IsEnabled()then return end ac.
SetEnabled(true)as()end function ao.StopEngine()if not ac.IsEnabled()then return
end ac.SetEnabled(false)at()end function ao.Toggle(au)if au then ao.StartEngine(
)ab.EnableExclusive'SmartDodge'else ao.StopEngine()end end function ao.IsEnabled
()return ac.IsEnabled()end function ao.Shutdown()at()ae.DestroyVisuals()ac.
ClearTrajectoryVisuals()af.Cancel()end function ao.SetLogInDanger(au)ak=au and
true or false end function ao.IsLogInDangerEnabled()return ak end function ao.
IsInDanger()return ah end function ao.GetCurrentSafeSpot()return al,ah,am,ai end
function ao.OnSafeSpotChanged(au)if type(au)~='function'then return end table.
insert(aj,au)end return ao end function a.n()local aa,ab,ac,ad,ae,af,ag,ah=a.
load'b',a.load'h',a.load'j',a.load'i',a.load'k',a.load'l',a.load'm',{}ah.
AddCustomHazard=ac.AddCustomHazard ah.AddTrajectoryProjectile=ac.
AddTrajectoryProjectile ah.SetTrajectoryLookahead=ac.SetTrajectoryLookahead ah.
GetTrajectoryLookahead=ac.GetTrajectoryLookahead ah.SetTrajectoryWidthPadding=ac
.SetTrajectoryWidthPadding ah.GetTrajectoryWidthPadding=ac.
GetTrajectoryWidthPadding ah.RegisterPlayerSkill=ac.RegisterPlayerSkill ah.
SetLogHazards=ac.SetLogHazards ah.IsLogHazardsEnabled=ac.IsLogHazardsEnabled ah.
SetLogThreats=ah.SetLogHazards ah.IsLogThreatsEnabled=ah.IsLogHazardsEnabled ah.
SetVisualEsp=ac.SetVisualEsp ah.IsVisualEspEnabled=ac.IsVisualEspEnabled ah.
GetHazardCount=ac.GetHazardCount ah.GetActiveHazards=ac.GetActiveHazards ah.
GetLastHazardInfo=ac.GetLastHazardInfo ah.OnHazardChanged=ac.OnHazardChanged ah.
CalculateSafeSpot=ae.CalculateSafeSpot ah.SetShowSafeMarker=ae.SetShowSafeMarker
ah.IsShowSafeMarkerEnabled=ae.IsShowSafeMarkerEnabled ah.SetShowHitboxVisual=ae.
SetShowHitboxVisual ah.IsShowHitboxVisualEnabled=ae.IsShowHitboxVisualEnabled ah
.SetHitboxPadding=ae.SetHitboxPadding ah.GetHitboxPadding=ad.GetHitboxPadding ah
.SetAutoDodge=af.SetAutoDodge ah.IsAutoDodgeEnabled=af.IsAutoDodgeEnabled ah.
SetMaxDodgeTime=af.SetMaxDodgeTime ah.GetMaxDodgeTime=af.GetMaxDodgeTime ah.
SetMaxSnapDistance=af.SetMaxSnapDistance ah.GetMaxSnapDistance=af.
GetMaxSnapDistance ah.SetMaxTeleportStep=af.SetMaxTeleportStep ah.
GetMaxTeleportStep=af.GetMaxTeleportStep ah.SetMaintainSnapHeight=af.
SetMaintainSnapHeight ah.IsMaintainSnapHeightEnabled=af.
IsMaintainSnapHeightEnabled ah.IsDodging=af.IsDodging ah.SetFaceTargetProvider=
af.SetFaceTargetProvider ah.GetDodgeStatus=af.GetStatus ah.OnDodgeStatusChanged=
af.OnDodgeStatusChanged ah.StartEngine=ag.StartEngine ah.StopEngine=ag.
StopEngine ah.Toggle=ag.Toggle ah.IsEnabled=ag.IsEnabled ah.SetLogInDanger=ag.
SetLogInDanger ah.IsLogInDangerEnabled=ag.IsLogInDangerEnabled ah.IsInDanger=ag.
IsInDanger ah.GetCurrentSafeSpot=ag.GetCurrentSafeSpot ah.OnSafeSpotChanged=ag.
OnSafeSpotChanged ab.Register('SmartDodge',ah.StopEngine,ah.IsEnabled)aa.
Register(function()ag.Shutdown()end)return ah end function a.o()local aa,ab,ac,
ad,ae,af,ag=a.load'e',a.load'f',a.load'b',a.load'h',a.load'n',a.load'a',game:
GetService'HttpService'local ah,ai,aj,ak,al,am,an,ao,ap=af.Folder..
'/settings/pathfinder-debug.json',af.Folder..'/settings/anchors.json',true,
'Sphere',true,false,true,{},0 local aq,ar,as,at=function()if not(isfile and
isfile(ah))then return end local aq,ar=pcall(function()return ag:JSONDecode(
readfile(ah))end)if aq and type(ar)=='table'then if ar.enabled~=nil then aj=ar.
enabled==true end if ar.showAnchors~=nil then an=ar.showAnchors==true end if ar.
mode=='Sphere'or ar.mode=='Line'then ak=ar.mode end end end,function()if not(
isfile and writefile)then return end pcall(function()writefile(ah,ag:JSONEncode{
enabled=aj,showAnchors=an,mode=ak})end)end,function(aq)return{id=aq.id,room=aq.
room,pos={aq.pos.X,aq.pos.Y,aq.pos.Z}}end,function()if not(isfile and isfile(ai)
)then return end local aq,ar=pcall(function()return ag:JSONDecode(readfile(ai))
end)if not aq or type(ar)~='table'then return end ao={}ap=0 for as,at in pairs(
ar)do if type(as)=='string'and#as>0 and type(at)=='table'then local au={}for av,
aw in ipairs(at)do local ax,ay,az=typeof(aw.room)=='number'and aw.room or nil,
typeof(aw.id)=='number'and aw.id or nil if typeof(aw.pos)=='table'and typeof(aw.
pos[1])=='number'and typeof(aw.pos[2])=='number'and typeof(aw.pos[3])=='number'
then az=Vector3.new(aw.pos[1],aw.pos[2],aw.pos[3])end if ax and ay and az then
table.insert(au,{id=ay,room=ax,pos=az})if ay>ap then ap=ay end end end if#au>0
then ao[as]=au end end end end local au,av,aw,ax,ay,az,aA,aB,aC,aD,aE,aF,aG,aH,
aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ,a_,a0,a1,a2,a3,a4,a5,a6,a7
,a8,a9,b,ba,bb,bc,bd,be,bf,bg,bh,bi,bj,bk,bl,bm,bn,bo,bp,bq,br,bs,bt,bu,bv,bw,bx
,by,bz,bA,bB,bC,bD,bE,bF=function()if not(isfile and writefile)then return end
local au={}for av,aw in pairs(ao)do local ax={}for ay=1,#aw do ax[ay]=as(aw[ay])
end au[av]=ax end pcall(function()writefile(ai,ag:JSONEncode(au))end)end,aa.
RunService,aa.VirtualInputManager,aa.player,game:GetService'PathfindingService',
{},false,false,70,50,1,true,0.5,'Alternate',0,'Orbit',20,4,0,false,0,false,2,0,
false,1,false,false,{},{},{},false,false,0,0,1,false,0,1.5,40,3,0,1,0,1,0,0,0,0,
0.3,0.6,5,1 local bG,bH=function()local bG=ax and ax.Character local bH=bG and
bG:FindFirstChild'HumanoidRootPart'if bH and bH.Parent then return bH end return
nil end,function(bG)if not bG or not bG.Parent then return nil end local bH,bI=
pcall(function()return bG.Position end)if not bH or not bI then return nil end
return bI end local bI,bJ,bK=function()local bI=bG()if not bI then return nil
end local bJ=bH(bI)if not bJ then return nil end local bK,bL=(math.huge)for bM,
bN in ipairs(ab.GetTrackedEnemyData())do if bN and bN.Root and bN.Root.Parent
then local bO=bH(bN.Root)if bO then local bP=(bO-bJ).Magnitude if bP<bK then bK=
bP bL=bN end end end end return bL end,function(bI)if not bI then return nil end
for bJ,bK in ipairs(ab.GetTrackedEnemyData())do if bK and bK.Model==bI and bK.
Root and bK.Root.Parent then return bK end end return nil end,function()if not
aV then return end local bI=bq or ab.GetHumanoid()if bI and bI.Parent then bI.
AutoRotate=br end aV=false bq=nil br=nil end local bL,bM,bN,bO,bP=function()
local bL=ab.GetHumanoid()if not bL or not bL.Parent then return end if aV and bL
==bq then return end if aV then bK()end br=bL.AutoRotate bL.AutoRotate=false bq=
bL aV=true end,{AgentRadius=1,AgentHeight=5,AgentCanJump=true,AgentCanClimb=true
,AgentMaxSlope=75,WaypointSpacing=2,Costs={Water=20,Lava=20}},{AgentRadius=0.25,
AgentHeight=4,AgentCanJump=true,AgentCanClimb=true,AgentMaxSlope=90,
WaypointSpacing=6,Costs={}},3,{}local bQ,bR=function(bQ,bR,bS)if bS then local
bT=bP[bS]if bT and bT.cost~=nil and bT.keyDest and(bT.keyDest-bR).Magnitude<=bO
and(bT.keyStart-bQ).Magnitude<=bO then return bT.cost end end local bT=ay:
CreatePath(bM)local bU,bV=(pcall(function()bT:ComputeAsync(bQ,bR)end))if bU and
bT.Status==Enum.PathStatus.Success then bV=bT:GetWaypoints()end pcall(function()
bT:Destroy()end)if not bV or#bV==0 then return nil end local bW,bX=0,bQ for bY=1
,#bV do local bZ=bV[bY].Position local b_,b1=bZ.X-bX.X,bZ.Z-bX.Z bW+=math.sqrt(
b_*b_+b1*b1)bX=bZ end if bS then bP[bS]={keyStart=bQ,keyDest=bR,cost=bW}end
return bW end,function(bQ)if bQ==by then return by end by=bQ if bo then pcall(
function()bo:Destroy()end)end bo=nil aU=false bz=nil if bx and not bJ(bx)then bx
=nil bv=nil bw=nil end return by end local bS,bT,bU=function(bS)aO+=1 local bT=
aO if aP then return end aP=true task.spawn(function()local bU,bV=pcall(function
()local bU=bG()local bV,bW,bX=bU and bH(bU)or nil,(math.huge)if bV then local bY
={}for bZ,b_ in ipairs(ab.GetTrackedEnemyData())do if b_ and b_.Root and b_.Root
.Parent then local b1=bH(b_.Root)if b1 then local b3,b5=b1.X-bV.X,b1.Z-bV.Z
local b6=math.sqrt(b3*b3+b5*b5)table.insert(bY,{data=b_,straight=b6})end end end
table.sort(bY,function(bZ,b_)return bZ.straight<b_.straight end)for bZ=1,#bY do
if bT~=aO then return end local b_=bY[bZ]if b_.straight>=bW then break end local
b1=bH(b_.data.Root)if b1 then local b3=bQ(bV,b1,b_.data.Model)if bT~=aO then
return end if b3 and b3<bW then bW=b3 bX=b_.data end end end if not bX or bW>aC
then local bZ=bI()if bZ then local b_=bH(bZ.Root)if b_ then local b1,b3=b_.X-bV.
X,b_.Z-bV.Z if math.sqrt(b1*b1+b3*b3)<=aC then bX=bZ end end end end end if not
aA or not aB then return end if a_ then return end if bX then bR(bX.Model)elseif
bS then bR(bS.Model)end end)aP=false if not bU then warn((
'[PathSelector] l\u{1ed7}i cost-select: %s'):format(tostring(bV)))end end)end,5
local bV,bW,bX,bY=function(bV)local bW=ab.GetCurrentDungeonName()local bX=(type(
bW)=='string'and ao[bW])or nil if not bX then return false end local bY=ab.
GetCurrentRoomIndex()bY=(type(bY)=='number'and bY)or-1 local bZ=false for b_,b1
in ipairs(bX)do if b1.room~=bY then continue end local b3=b1.pos and bV and(b1.
pos-bV).Magnitude or math.huge if not b1.visited and b3>bT then b1.wasFar=true
elseif not b1.visited and b1.wasFar and b3<=bT then b1.visited=true b1.wasFar=
nil bZ=true end end if bZ then bU()end return bZ end,function()local bV=ab.
GetCurrentDungeonName()local bW=(type(bV)=='string'and ao[bV])or nil if not(
type(bV)=='string'and#bV>0)or not bW then return nil end local bX=ab.
GetCurrentRoomIndex()bX=(type(bX)=='number'and bX)or-1 if bX<=0 then return nil
end for bY,bZ in ipairs(bW)do if bZ.room==bX then if bZ.visited then return nil
end return bZ.pos end end return nil end,function()local bV=ab.
GetCurrentDungeonName()local bW=(type(bV)=='string'and ao[bV])or nil if not bW
or#bW==0 then return{}end local bX=ab.GetCurrentRoomIndex()bX=(type(bX)==
'number'and bX)or-1 local bY={}for bZ,b_ in ipairs(bW)do if b_.room==bX and b_.
pos then bY[#bY+1]=b_.pos if#bY>=2 then break end end end return bY end,function
(bV,bW,bX,bY)if bo then pcall(function()bo:Destroy()end)end for bZ,b_ in ipairs{
bM,bN}do local b1=ay:CreatePath(b_)local b3=pcall(function()b1:ComputeAsync(bV,
bW)end)if b3 and b1.Status==Enum.PathStatus.Success and#b1:GetWaypoints()>0 then
bp=bW bz=bX aZ=bY==true bD=nil bE=nil b1.Blocked:Connect(function()if bY then if
bc>=1 then if aj then warn
'[PathAnchor] anchor path blocked + \u{111}ang k\u{1eb9}t -> rebuild'end bo=nil
aU=false end return end bo=nil aU=false end)bo=b1 aT=1 aU=true return true end
b1:Destroy()end return false end local bZ,b_,b1,b3=function(bZ,b_)local b1=bG()
if not b1 then return false end local b3=bH(b1)if not b3 then return false end
if not bZ or not b_ then bo=nil aU=false bp=nil bz=nil aZ=false return false end
local b5=b3 if bY(b5,b_,bZ.Model,false)then a_=false return true end if am then
local b6=bW()if b6 then aU=true aZ=true a_=true local b7=os.clock()if b7-a0>=3
then a0=b7 warn
'[PathAnchor] FALLBACK: \u{111}ang r\u{1a1}i v\u{e0}o anchor cho room hi\u{1ec7}n t\u{1ea1}i'
end return true end end bo=nil aU=false bp=nil bz=nil aZ=false a_=false bD=bZ.
Model bE=b_ a8=os.clock()if aj then warn(
'[PathAnchor] no enemy path, no anchor -> '..(al and'self-kill'or'stand'))end if
al and os.clock()-b>=ba then b=os.clock()local b6=ab.GetHumanoid()if b6 and b6.
Parent then b6.Health=0 end end return false end,function()if not aF then return
end if os.clock()-aM<aG then return end local bZ=ab.GetHumanoid()if not bZ or
not bZ.Parent or bZ.Health<=0 then return end if ab.IsInLobby()then return end
aM=os.clock()local b_=function(b_)aw:SendKeyEvent(true,b_,false,game)task.delay(
ab.GetKeyHoldTime(),function()aw:SendKeyEvent(false,b_,false,game)end)end if aH
=='Alternate'then local b1=(aI==0)and Enum.KeyCode.Q or Enum.KeyCode.E aI=1-aI
b_(b1)else b_(Enum.KeyCode.Q)b_(Enum.KeyCode.E)end end,function()if bj then
return end bj={wasEnabled=ae.IsEnabled(),wasAutoDodge=ae.IsAutoDodgeEnabled()}
end,function()local bZ=bI()if bZ and bZ.Root and bZ.Root.Parent then return bH(
bZ.Root)end return nil end local b5,b6,b7,b8=function()b1()if not ae.IsEnabled()
then ae.StartEngine()end if not ae.IsAutoDodgeEnabled()then ae.SetAutoDodge(true
)end ae.SetFaceTargetProvider(b3)end,function()ae.SetFaceTargetProvider(nil)if
not bj then return end local b5=bj bj=nil if not b5.wasEnabled and ae.IsEnabled(
)then ae.StopEngine()end if ae.IsAutoDodgeEnabled()~=b5.wasAutoDodge then ae.
SetAutoDodge(b5.wasAutoDodge)end end,function()if bs and bs.Parent then return
bs end bs=Instance.new'Part'bs.Name='PathfinderTarget_Debug'bs.Anchored=true bs.
CanCollide=false bs.CanQuery=false bs.CanTouch=false bs.Size=Vector3.new(2,2,2)
bs.Transparency=0.4 bs.Color=Color3.fromRGB(255,0,0)bs.Material=Enum.Material.
Neon bs.Parent=workspace return bs end,function()if bt and bt.Parent then return
bt end if bt then pcall(function()bt:Destroy()end)bt=nil end bt=Instance.new
'Highlight'bt.Name='PathfinderEnemy_Debug'bt.FillColor=Color3.fromRGB(255,200,0)
bt.FillTransparency=0.5 bt.OutlineColor=Color3.fromRGB(255,0,0)bt.
OutlineTransparency=0 bt.Parent=workspace return bt end local b9,c,ca,cc,cd=
function()if ab.IsInLobby()then return end if not aj then return end if bp then
local b9=b7()b9.CFrame=CFrame.new(bp)elseif bs and bs.Parent then bs.CFrame=
CFrame.new(0,-1E3,0)end local b9 if bx then local c=bJ(bx)b9=c and c.Model or
nil end if not b9 then local c=aN and bn or bI()b9=c and c.Model or nil end
local c=b8()if not b9 or not b9.Parent then c.Enabled=false return end c.Adornee
=b9 c.Enabled=true end,0.9,2,function(b9)for c,ca in ipairs(b9)do pcall(function
()ca:Destroy()end)end table.clear(b9)end local ce,cf=function()cc(aW)cc(aX)cd=
nil end,function()if bu and bu.Parent then return bu end bu=Instance.new'Part'bu
.Name='PathfinderPathAdornee_Debug'bu.Anchored=true bu.CanCollide=false bu.
CanQuery=false bu.CanTouch=false bu.Transparency=1 bu.Size=Vector3.new(1,1,1)bu.
CFrame=CFrame.new(0,0,0)bu.Parent=workspace return bu end local cg,ch,ci=
function()if not aj then ce()return nil end if bo==cd then return nil end ce()if
not bo or not aU then return nil end local cg,ch=pcall(function()return bo:
GetWaypoints()end)if not cg or not ch then return nil end if ak=='Line'then
local ci=cf()for cj=2,#ch do local cl,cn=ch[cj-1],ch[cj]if cl and cn and cl.
Position and cn.Position then local co=(cn.Position-cl.Position).Magnitude if co
>0.01 then local cp=Instance.new'LineHandleAdornment'cp.Name=
'PathfinderPath_Debug'cp.Adornee=ci cp.Length=co cp.Thickness=ca cp.Transparency
=0.3 cp.Color3=Color3.fromRGB(0,255,120)cp.ZIndex=0 cp.CFrame=CFrame.lookAt(cl.
Position,cn.Position)cp.Parent=workspace aX[#aX+1]=cp end end end else for ci=1,
#ch do local cj=ch[ci]if cj then local cl=Instance.new'Part'cl.Name=
'PathfinderPath_Debug'cl.Anchored=true cl.CanCollide=false cl.CanQuery=false cl.
CanTouch=false cl.Size=Vector3.new(c,c,c)cl.Shape=Enum.PartType.Ball cl.
Transparency=0.3 cl.Color=Color3.fromRGB(0,255,120)cl.Material=Enum.Material.
Neon cl.CFrame=CFrame.new(cj.Position)cl.Parent=workspace aW[#aW+1]=cl end end
end cd=bo end,function()for cg,ch in ipairs(aY)do pcall(function()ch:Destroy()
end)end table.clear(aY)end,function()if bs then pcall(function()bs:Destroy()end)
bs=nil end if bt then pcall(function()bt:Destroy()end)bt=nil end ce()if bu then
pcall(function()bu:Destroy()end)bu=nil end end bU=function()if not an then ch()
return end local cj,cl=ab.GetCurrentDungeonName(),{}if type(cj)=='string'and#cj>
0 and ao[cj]then cl=ao[cj]end for cn,co in ipairs(aY)do pcall(function()co:
Destroy()end)end table.clear(aY)for cn,co in ipairs(cl)do local cp=co.visited==
true local cq,cr=cp and Color3.fromRGB(0,200,120)or Color3.fromRGB(0,150,255),
Instance.new'Part'cr.Name='PathfinderAnchor_Debug'cr.Anchored=true cr.CanCollide
=false cr.CanQuery=false cr.CanTouch=false cr.Size=Vector3.new(2,2,2)cr.
Transparency=0.3 cr.Color=cq cr.Material=Enum.Material.Neon cr.CFrame=CFrame.
new(co.pos)cr.Parent=workspace aY[#aY+1]=cr local cs=Instance.new'BillboardGui'
cs.Name='PathfinderAnchorLabel'cs.Adornee=cr cs.Size=UDim2.fromOffset(120,30)cs.
StudsOffset=Vector3.new(0,2,0)cs.AlwaysOnTop=true local ct=Instance.new
'TextLabel'ct.Size=UDim2.fromScale(1,1)ct.BackgroundTransparency=1 ct.Text=(
'R%d #%d%s'):format(co.room,cn,cp and' \u{2713}'or'')ct.TextColor3=cq ct.
TextSize=14 ct.Font=Enum.Font.GothamBold ct.TextStrokeTransparency=0 ct.Parent=
cs cs.Parent=cr aY[#aY+1]=cs end end local cj=function()bF=nil bb=0 bc=0 bd=0
end local cl,cn=function()if bo then pcall(function()bo:Destroy()end)end bo=nil
aU=false bp=nil bv=nil bw=nil bx=nil by=nil bz=nil aZ=false a_=false a3=false bB
=nil bC=nil bn=nil aN=false table.clear(bP)aO+=1 aP=false aR=0 bD=nil bE=nil a8=
0 cj()end,function()local cl=bG()if not cl then return end local cn=bI()bn=cn aN
=cn~=nil if a_ then return by end if cn then local co,cp=bH(cn.Root),bH(cl)if co
and cp then local cq,cr=co.X-cp.X,co.Z-cp.Z if math.sqrt(cq*cq+cr*cr)<=aC then
return bR(cn.Model)end end end if not cn then return bR(nil)end bS(cn)return by
end local co,cp,cq,cr=function()if not aA or not aB then return end cn()end,
function()cl()cn()end,function(co)if bc==0 then bc=1 co.Jump=true elseif bc==1
then bc=2 bd=-1 be=os.clock()+bi elseif bc==2 then bc=3 bd=1 be=os.clock()+bi
elseif bc==3 then bc=4 if co and co.Parent then co.Health=0 end cj()end end,
function(co,cp)local cq,cr=(bI())if cq and cq.Root and cq.Root.Parent then cr=
bH(cq.Root)end if aV then bK()end if cr then co.AutoRotate=false local cs=cp.
CFrame.Position local ct,cu=cr.X-cs.X,cr.Z-cs.Z if ct*ct+cu*cu>0.25 then cp.
CFrame=CFrame.lookAt(cs,cr)end else co.AutoRotate=true end end local cs,ct,cu=
function(cs,ct,cu)local cv=bH(cu)if not cv then return end local cw=function()a_
=false aZ=false bA=nil a1=0 end if not am then cw()return end if not bo then
local cx=bW()if cx and bY(cv,cx,nil,true)then bA=nil a1=0 return end if not a3
then a3=true a4=a5 local cy=bX()if#cy>=2 then local cz=cy[2]-cy[1]bB=Vector3.
new(cz.X,0,cz.Z)else local cz=cu.CFrame.LookVector bB=Vector3.new(cz.X,0,cz.Z)
end if bB.Magnitude<0.01 then bB=Vector3.new(0,0,-1)else bB=bB.Unit end bC=cv+bB
*a6 if#cy>=2 then if aj then warn((
'[PathAnchor] h\u{1ebf}t anchor -> FREE-WALK %gs theo h\u{1b0}\u{1edb}ng anchor1->anchor2'
):format(a5))end elseif aj then warn((
'[PathAnchor] h\u{1ebf}t anchor -> FREE-WALK %gs theo h\u{1b0}\u{1edb}ng nh\u{ec}n'
):format(a5))end end cr(ct,cu)ct:MoveTo(bC)a4-=cs if a4<=0 then a3=false bB=nil
bC=nil cw()return end return end local cx=bo:GetWaypoints()if not cx or#cx==0
then bo=nil aU=false return end if aT>#cx then local cy=ab.
GetCurrentDungeonName()local cz=(type(cy)=='string'and ao[cy])or nil if cz then
for cA,cB in ipairs(cz)do if not cB.visited and cB.pos and bp and(cB.pos-bp).
Magnitude<=bT then cB.visited=true bU()if aj then warn((
'[PathAnchor] T\u{1eda}I anchor (R%d) -> visited'):format(cB.room))end break end
end end bo=nil aU=false return end cr(ct,cu)local cy=cx[aT]local cz,cA=cy.
Position,cv local cB=Vector3.new(cz.X-cA.X,0,cz.Z-cA.Z)local cC,cD=cB.Magnitude,
(cy.Action==Enum.PathWaypointAction.Jump and 2.5)or 2 if cC<=cD then aT+=1 if cy
.Action==Enum.PathWaypointAction.Jump then ct.Jump=true end return end ct:
MoveTo(cz)if bA then if(cv-bA).Magnitude>0.5 then bA=cv a1=0 else a1+=cs if a1>=
a2 then bA=nil a1=0 bo=nil aU=false end end else bA=cv a1=0 end end,function(cs,
ct,cu)local cv,cw,cx=cs.CFrame.LookVector,cu.X-ct.X,cu.Z-ct.Z local cy=math.
sqrt(cw*cw+cx*cx)if cy<0.01 then return 0 end local cz,cA=cv.X,cv.Z local cB=
math.sqrt(cz*cz+cA*cA)if cB<0.01 then return 0 end local cC=(cz/cB)*(cw/cy)+(cA/
cB)*(cx/cy)cC=math.max(-1,math.min(1,cC))return math.deg(math.acos(cC))end,
function(cs,ct)local cu=cs.CFrame.Position local cv,cw=ct.X-cu.X,ct.Z-cu.Z if cv
*cv+cw*cw<=0.25 then return false end cs.CFrame=CFrame.lookAt(cu,ct)return true
end local cv=function(cv,cw,cx,cy,cz,cA)bv=nil bw=nil local cB=ae.IsDodging()if
not bx then bx=cy.Model end if bo then pcall(function()bo:Destroy()end)end bo=
nil aU=false bp=nil cj()if not cB then cw.AutoRotate=false local cC,cD=cA.X-cz.X
,cA.Z-cz.Z local cE=math.sqrt(cC*cC+cD*cD)if aL>0 and cE<aL then local cF,cG=
math.min(aD*math.max(cv,1.6666666666666665E-2),aL-cE),cA if cE>0.01 then cG=
Vector3.new(cA.X+(cC/cE)*cF,cA.Y,cA.Z+(cD/cE)*cF)end pcall(function()cw:MoveTo(
cA)end)if aF and ct(cx,cA,cz)<=aK then b_()end cx.CFrame=CFrame.lookAt(cG,cz)cx.
AssemblyLinearVelocity=Vector3.zero cx.AssemblyAngularVelocity=Vector3.zero
return end pcall(function()cw:MoveTo(cA)end)if ct(cx,cA,cz)>aK then cu(cx,cz)end
if aF and ct(cx,cA,cz)<=aK then b_()end end end local cw,cx=function(cw,cx,cy,cz
,cA,cB)if aJ=='SmartDodge'then cv(cw,cx,cy,cz,cA,cB)return end bL()pcall(
function()cx:MoveTo(cB)end)if not bx then bx=cz.Model end if bo then pcall(
function()bo:Destroy()end)end bo=nil aU=false bp=nil cj()local cC=Vector3.new(cB
.X-cA.X,0,cB.Z-cA.Z)if not bv then bv=math.atan2(cC.Z,cC.X)bw=cC.Magnitude end
local cD,cE=Vector3.new(cA.X+math.cos(bv)*bw,cB.Y,cA.Z+math.sin(bv)*bw),cB local
cF=Vector3.new(cD.X-cE.X,0,cD.Z-cE.Z)local cG,cH,cI=cF.Magnitude,aD*math.max(cw,
1.6666666666666665E-2),cE if cG>0.01 then if cG<=cH then cI=Vector3.new(cD.X,cE.
Y,cD.Z)else cI=cE+cF.Unit*cH end end if aF and ct(cy,cE,cA)<=aK then b_()end cy.
CFrame=CFrame.lookAt(cI,cA)cy.AssemblyLinearVelocity=Vector3.zero cy.
AssemblyAngularVelocity=Vector3.zero end,function(cw,cx,cy,cz,cA,cB)bv=nil bw=
nil bx=nil cx.AutoRotate=false cu(cy,cA)if not aZ and bo and bz and bz~=cz.Model
then pcall(function()bo:Destroy()end)bo=nil aU=false end if not aU or not bo
then local cC=bD~=nil and bD==cz.Model and bE~=nil and(cA-bE).Magnitude<=a7 if
not cC or os.clock()-a8>=a9 then local cD=bZ(cz,cA)if cD then cj()return end
return end return end local cC=bo:GetWaypoints()if not cC or#cC==0 then bo=nil
aU=false return end if aT>#cC then if aj and aZ then warn((
'[PathAnchor] anchor path HO\u{c0}N TH\u{c0}NH (\u{111}\u{e3} \u{111}i h\u{1ebf}t waypoint idx=%d) -> t\u{ed}nh l\u{1ea1}i'
):format(aT))end aU=false return end local cD=cC[aT]local cE,cF=cD.Position,cB
local cG=Vector3.new(cE.X-cF.X,0,cE.Z-cF.Z)local cH,cI=cG.Magnitude,(cD.Action==
Enum.PathWaypointAction.Jump and 2.5)or 2 if bc>=2 and os.clock()<be and cH>0.01
then local cJ=cG.Unit local cK=Vector3.new(-cJ.Z,0,cJ.X)cE=cE+cK*(bd*bh)cG=
Vector3.new(cE.X-cF.X,0,cE.Z-cF.Z)cH=cG.Magnitude end if cH<=cI then aT+=1 if cD
.Action==Enum.PathWaypointAction.Jump then cx.Jump=true end cj()return end cx:
MoveTo(cE)if bF then local cJ=cB-bF local cK=Vector3.new(cJ.X,0,cJ.Z).Magnitude
if cK>bf then bF=cB bb=0 bc=0 bd=0 else bb+=cw if bb>=bg then bF=cB bb=0 if aZ
then bo=nil aU=false if aj then warn
'[PathAnchor] stuck while anchor path -> d\u{1ecd}n path \u{111}\u{1ec3} re-route'
end end cq(cx)end end else bF=cB bb=0 end end local cy=function(cy)if aJ==
'SmartDodge'then b5()end if ab.IsInLobby()then return end if not aS then return
end local cz,cA=bG(),ab.GetHumanoid()if not cz or not cz.Parent or not cA or not
cA.Parent or cA.Health<=0 then bo=nil aU=false aN=false return end local cB=os.
clock()if cB-aR>=aQ then aR=cB if not bx then cn()end end if aj then b9()cg()end
if a_ then cs(cy,cA,cz)return end local cC if bx then cC=bJ(bx)if not cC then bx
=nil bv=nil bw=nil end end if not cC then cC=bJ(by)if not cC then by=nil local
cD=bI()if cD and not aP then by=cD.Model cC=cD end end end bn=cC aN=cC~=nil if
not cC or not cC.Root or not cC.Root.Parent then if bo then pcall(function()bo:
Destroy()end)end bo=nil aU=false bp=nil if not(aJ=='SmartDodge'and ae.IsDodging(
))then pcall(function()cA:MoveTo(bH(cz))end)end return end local cD,cE=cC and
bH(cC.Root)or nil,bH(cz)if not cD or not cE then return end bV(cE)local cF=
Vector3.new(cD.X-cE.X,0,cD.Z-cE.Z)if cF.Magnitude<=aC then local cG,cH=pcall(cw,
cy,cA,cz,cC,cD,cE)if not cG then warn((
'[AutoFarmPathfinder] l\u{1ed7}i HOLD: %s'):format(tostring(cH)))end return end
if aJ=='SmartDodge'then local cG,cH=ae.IsDodging(),ae.IsInDanger()if cG or cH
then if not cG then pcall(function()cA:MoveTo(bH(cz))end)cu(cz,cD)end return end
end local cG,cH=pcall(cx,cy,cA,cz,cC,cD,cE)if not cG then warn((
'[AutoFarmPathfinder] l\u{1ed7}i CHASE: %s'):format(tostring(cH)))end end
function az.IsEnabled()return aA end function az.GetSkillRange()return aC end
function az.SetSkillRange(cz)aC=tonumber(cz)or aC end function az.GetMoveSpeed()
return aD end function az.SetMoveSpeed(cz)aD=tonumber(cz)or aD end function az.
GetRetargetInterval()return aE end function az.SetRetargetInterval(cz)aE=
tonumber(cz)or aE end function az.IsSkillEnabled()return aF end function az.
SetSkillEnabled(cz)aF=cz==true end function az.GetSkillInterval()return aG end
function az.SetSkillInterval(cz)local cA,cB=tonumber(cz)or aG,ab.GetKeyHoldTime(
)+0.02 aG=math.max(cA,cB)end function az.GetSkillMode()return aH end function az
.SetSkillMode(cz)if cz=='Both'or cz=='Alternate'then aH=cz end end function az.
GetHoldMode()return aJ end function az.SetHoldMode(cz)if cz~='Orbit'and cz~=
'SmartDodge'then return end if aJ==cz then return end aJ=cz if aB then if aJ==
'SmartDodge'then b5()else b6()end end end function az.GetFaceTolerance()return
aK end function az.SetFaceTolerance(cz)aK=math.clamp(tonumber(cz)or aK,0,90)end
function az.GetMinDistance()return aL end function az.SetMinDistance(cz)aL=math.
clamp(tonumber(cz)or aL,0,50)end function az.IsVisualDebugEnabled()return aj end
function az.SetVisualDebug(cz)aj=cz==true ar()if not aj then ci()end end
function az.GetDebugPathMode()return ak end function az.SetDebugPathMode(cz)if
cz~='Sphere'and cz~='Line'then return end if ak==cz then return end ak=cz ce()
ar()if aj then cg()end end function az.IsRespawnOnNoPathEnabled()return al end
function az.SetRespawnOnNoPath(cz)al=cz==true end function az.
IsAnchorFallbackEnabled()return am end function az.SetAnchorFallback(cz)am=cz==
true if not am then a_=false aZ=false if bo then pcall(function()bo:Destroy()end
)end bo=nil aU=false a3=false bB=nil bC=nil end end function az.
IsAnchorMarkersEnabled()return an end function az.SetAnchorMarkers(cz)an=cz==
true ar()if an then bU()else ch()end end function az.GetCurrentAnchorMap()local
cz=ab.GetCurrentDungeonName()if type(cz)=='string'and#cz>0 then return cz end
return nil end function az.SetAnchor(cz)local cA=cz if not(type(cA)=='string'and
#cA>0)then cA=ab.GetCurrentDungeonName()end if not(type(cA)=='string'and#cA>0)
then warn
'[AutoFarmPathfinder] Ch\u{1b0}a x\u{e1}c \u{111}\u{1ecb}nh map hi\u{1ec7}n t\u{1ea1}i, kh\u{f4}ng \u{111}\u{1eb7}t anchor \u{111}\u{1b0}\u{1ee3}c'
return nil end local cB=ab.GetCurrentRoomIndex()if cB==nil or cB<=0 then warn
'[AutoFarmPathfinder] Ch\u{1b0}a x\u{e1}c \u{111}\u{1ecb}nh room hi\u{1ec7}n t\u{1ea1}i, kh\u{f4}ng \u{111}\u{1eb7}t anchor \u{111}\u{1b0}\u{1ee3}c'
return nil end local cC=bG()if not cC then return nil end local cD=bH(cC)if not
cD then return nil end local cE=ao[cA]if not cE then cE={}ao[cA]=cE end local cF
=0 for cG,cH in ipairs(cE)do if cH.room==cB then cF+=1 end end if cF>=2 then
warn((
'[AutoFarmPathfinder] Room %d \u{111}\u{e3} c\u{f3} \u{111}\u{1ee7} 2 anchor, kh\u{f4}ng th\u{1ec3} th\u{ea}m'
):format(cB))return nil end ap+=1 cE[#cE+1]={id=ap,room=cB,pos=cD}bU()au()return
#cE end function az.RemoveAnchor(cz,cA)if not(type(cz)=='string'and#cz>0)then
return false end local cB=ao[cz]if not cB then return false end if type(cA)~=
'number'or cA<1 or cA>#cB then return false end table.remove(cB,cA)if#cB==0 then
ao[cz]=nil ap=0 end bU()au()return true end function az.ClearAllAnchors(cz)if
type(cz)=='string'and#cz>0 then if ao[cz]then ap=0 ao[cz]=nil end else ao={}ap=0
end bU()au()end function az.GetAnchors(cz)local cA=cz if not(type(cA)=='string'
and#cA>0)then cA=ab.GetCurrentDungeonName()end local cB,cC={},(type(cA)==
'string'and ao[cA])or nil if cC then for cD=1,#cC do cB[cD]=cC[cD]end end return
cB end function az.GetAnchorMapNames()local cz={}for cA in pairs(ao)do table.
insert(cz,cA)end table.sort(cz)return cz end function az.Toggle(cz)if cz==aA
then return end aA=cz if aA then if aJ=='SmartDodge'then b1()end ad.
EnableExclusive'AutoFarm'if aJ=='SmartDodge'then b5()end if bk then bk:
Disconnect()bk=nil end aB=true aM=0 bn=nil aN=false aO=0 aP=false aR=0 aZ=false
bD=nil bE=nil b=0 by=nil if not bl then bl=ab.OnEnemyChanged(co)end if not bm
then bm=ab.OnRespawn(cp)end if not aS then task.spawn(function()if ab.
ReadyDungeon()then aS=true end end)end task.defer(cn)bk=av.Heartbeat:Connect(
function(cA)local cB,cC=pcall(function()cy(cA)end)if not cB then warn((
'[AutoFarmPathfinder] l\u{1ed7}i stepMovement: %s'):format(tostring(cC)))end end
)else if bk then bk:Disconnect()bk=nil end aB=false if bl then bl()bl=nil end if
bm then bm()bm=nil end bK()local cA,cB=ab.GetHumanoid(),bG()if cA and cA.Parent
and cB and cB.Parent then pcall(function()cA:MoveTo(bH(cB))end)end cl()ci()b6()
end end function az.IsRunning()return aB end function az.GetDebugInfo()local cz,
cA,cB=bG(),bI(),bx and bJ(bx)local cC,cD,cE,cF,cG,cH,cI=cB or cA,'IDLE','-',0,0,
'-',0 if cB then cH=cB.Model and cB.Model.Name or'-'end if cC and cC.Root and cC
.Root.Parent then local cJ,cK=bH(cC.Root),bH(cz)cE=cC.Model and cC.Model.Name or
'-'if cJ and cK then cF=(cJ-cK).Magnitude local cL=Vector3.new(cJ.X-cK.X,0,cJ.Z-
cK.Z)cG=cL.Magnitude end cD=cG<=aC and'HOLD'or'CHASE'if cD=='HOLD'then cI=ct(cz,
cK,cJ)end end local cJ=aJ=='SmartDodge'local cK,cL=cJ and ae.IsDodging()or false
,cJ and ae.IsInDanger()or false return{phase=cD,enemyName=cE,enemyDist=cF,
enemyFlat=cG,lockedName=cH,locked=cB~=nil,skillRange=aC,holdAngle=bv,holdRadius=
bw,pathComputed=aU,chaseTarget=bp,isAnchor=aZ,dunReady=aS,enabled=aA,holdMode=aJ
,dodging=cK,threatActive=cL,faceTolerance=aK,faceErr=cI,minDistance=aL}end ac.
Register(function()az.Toggle(false)ch()end)aq()at()ab.OnDungeonNameChanged(
function()bU()end)task.defer(function()bU()end)ad.Register('AutoFarm',az.Toggle,
az.IsEnabled)return az end function a.p()local aa,ab,ac,ad,ae=a.load'f',a.load
'g',a.load'd',a.load'o',a.load'a'return function(af,ag)local ah=ag:Section{Side=
'Right'}ah:Header{Name='Movement Speed'}ah:Toggle({Name='Fast Speed',Default=aa.
IsSpeedEnabled(),Callback=ac.Wrap(function(ai)aa.SetSpeedEnabled(ai)end)},
'Toggle_FastSpeed')ab.PatchSliderLoadCallback(ah:Slider({Name=
'Custom Fast Speed',Default=aa.GetFastSpeed(),Minimum=16,Maximum=24,
DisplayMethod='Round',Precision=0,Callback=ac.Wrap(function(ai)aa.SetFastSpeed(
ai)end)},'Slider_FastSpeed'))ah:Header{Name='Auto Farm'}local ai=function()local
ai,aj=not ad.IsEnabled(),ae.Options and ae.Options.Toggle_PathfinderFarm if aj
and aj.UpdateState then aj:UpdateState(ai)else ad.Toggle(ai)end end ah:Keybind({
Name='Toggle Auto Farm',Default=Enum.KeyCode.X,Callback=function()ai()end},
'Keybind_AutoFarm')end end function a.q()local aa,ab,ac,ad,ae,af,ag,ah={'Easy',
'Medium','Hard','Insane','Nightmare'},{'Desert Temple','Winter Outpost',
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
return ad end function a.r()local aa,ab,ac,ad,ae,af,ag,ah=a.load'f',a.load'c',a.
load'a',a.load'd',a.load'q',a.load'b',a.load'o',{}local ai,aj,ak,al={
PathfinderRetargetInterval={get=function()return ag.GetRetargetInterval()end,set
=function(ai)ag.SetRetargetInterval(ai)end},PathfinderSkillRange={get=function()
return ag.GetSkillRange()end,set=function(ai)ag.SetSkillRange(ai)end},
PathfinderSkillInterval={get=function()return ag.GetSkillInterval()end,set=
function(ai)ag.SetSkillInterval(ai)end},PathfinderSkillEnabled={get=function()
return ag.IsSkillEnabled()end,set=function(ai)ag.SetSkillEnabled(ai)end},
PathfinderSkillMode={get=function()return ag.GetSkillMode()end,set=function(ai)
ag.SetSkillMode(ai)end}},{Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',Boss3=
'Boss 3'},{},{}function ah.OnConfigChanged(am)if type(am)~='function'then return
end table.insert(al,am)end function ah.ReloadFromConfig()local am,an=ac.
contextData or{},ad.GetActive()local ao,ap=an~=activeConfig,am~=lastDataRef ak=
am lastDataRef=am activeConfig=an if(ao or ap)and#al>0 then for aq,ar in ipairs(
al)do pcall(ar,an)end end return ao or ap end local am=function()ac.contextData=
ak end local an,ao=function()am()ad.SaveNow()end,function(an,ao)if not(an and
type(an)=='string'and#an>0)then return end if not aj[ao]then return end ak[an]=
ak[an]or{}ak[an][ao]=ak[an][ao]or{}local ap,aq=ak[an][ao],false for ar in pairs(
ai)do if ap[ar]==nil then ap[ar]=ai[ar].get()aq=true end end return aq end
function ah.SeedAllDefaults()local ap,aq={'Mob','Boss1','Boss2','Boss3'},false
for ar,as in ipairs(ae.GetDungeons())do for at,au in ipairs(ap)do if ao(as,au)
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
ap,aq=aa.GetCurrentDungeonName(),aa.GetCombatTargetKey()ah.ApplyContext(ap,aq)
return ap,aq end function ah.GetFields()local ap={}for aq in pairs(ai)do table.
insert(ap,aq)end return ap end function ah.GetTargets()local ap={}for aq,ar in
ipairs{'Mob','Boss1','Boss2','Boss3'}do table.insert(ap,{Key=ar,Display=aj[ar]})
end return ap end function ah.GetDisplayForTarget(ap)return aj[ap]end local ap,
aq local ar=function(ar)local as,at=aa.GetCurrentDungeonName(),aa.
GetCombatTargetKey()if not as then aq=nil ap=nil return end if not ar and as==aq
and at==ap then return end ah.ApplyContext(as,at)if at~='Mob'then ab.Notify(
'Auto Farm Context',as..' - '..aj[at],2)end ap=at aq=as end function ah.Init()ah
.ReloadFromConfig()ah.SeedAllDefaults()am()aa.OnDungeonNameChanged(function()ar(
false)end)aa.OnBossIndexChanged(function()ar(false)end)aa.OnBossActiveChanged(
function()ar(false)end)task.spawn(function()while af.IsActive()do task.wait(1)if
ah.ReloadFromConfig()then ar(true)end end end)end return ah end function a.s()
local aa,ab,ac=a.load'e',a.load'f',a.load'b'local ad,ae,af,ag,ah=aa.
UserInputService,aa.VirtualInputManager,{},false function af.IsMouseComboEnabled
()return ag end function af.SetMouseComboEnabled(ai)ag=ai==true end local ai=
function()task.spawn(function()ae:SendKeyEvent(true,Enum.KeyCode.Q,false,game)ae
:SendKeyEvent(true,Enum.KeyCode.E,false,game)task.wait(ab.GetKeyHoldTime())ae:
SendKeyEvent(false,Enum.KeyCode.Q,false,game)ae:SendKeyEvent(false,Enum.KeyCode.
E,false,game)end)end function af.Init()if af.inited then return end af.inited=
true ah=ad.InputBegan:Connect(function(aj,ak)if ak then return end if aj.
UserInputType==Enum.UserInputType.MouseButton2 then if ag then ai()end end end)
end ac.Register(function()if ah then ah:Disconnect()ah=nil end af.inited=false
end)return af end function a.t()local aa,ab,ac,ad,ae,af,ag=a.load'd',a.load'o',a
.load'f',a.load'r',a.load's',a.load'g',a.load'q'return function(ah,ai)local aj=
ai:Section{Side='Left'}aj:Header{Name='Auto Farm'}aj:Toggle({Name=
'Enable Pathfinder Farm',Default=ab.IsEnabled(),Callback=aa.Wrap(function(ak)ab.
Toggle(ak)end)},'Toggle_PathfinderFarm')local ak={'Orbit (Classic)',
'SmartDodge Integration'}aj:Dropdown({Name='Hold Mode',Options=ak,Default=ab.
GetHoldMode()=='SmartDodge'and 2 or 1,Required=true,Callback=aa.Wrap(function(al
)ab.SetHoldMode(al:find'SmartDodge'and'SmartDodge'or'Orbit')end)},
'Dropdown_PathfinderHoldMode')aj:Slider({Name=
'Face Tolerance Before Skill (deg)',Default=ab.GetFaceTolerance(),Minimum=0,
Maximum=45,DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(al)ab.
SetFaceTolerance(al)end)},'Slider_PathfinderFaceTolerance')aj:Slider({Name=
'Min Distance From Enemy (0 = off)',Default=ab.GetMinDistance(),Minimum=0,
Maximum=30,DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(al)ab.
SetMinDistance(al)end)},'Slider_PathfinderMinDistance')aj:Toggle({Name=
'Right Click Combo (Q+E)',Default=ae.IsMouseComboEnabled(),Callback=aa.Wrap(
function(al)ae.SetMouseComboEnabled(al)end)},'Toggle_PathfinderMouseCombo')local
al=ai:Section{Side='Left'}al:Header{Name='Fallback'}al:Toggle({Name=
'Anchor Fallback',Default=ab.IsAnchorFallbackEnabled(),Callback=aa.Wrap(function
(am)ab.SetAnchorFallback(am)end)},'Toggle_PathfinderAnchorFallback')al:Toggle({
Name='Respawn On No Path',Default=ab.IsRespawnOnNoPathEnabled(),Callback=aa.
Wrap(function(am)ab.SetRespawnOnNoPath(am)end)},'Toggle_PathfinderSelfKill')
local am=ai:Section{Side='Left'}am:Header{Name='Anchor Manager'}local an=
function()local an,ao,ap={},{},ab.GetCurrentAnchorMap()if ap and#ap>0 then table
.insert(an,ap)ao[ap]=true end for aq,ar in ipairs(ag.GetDungeons())do if type(ar
)=='string'and#ar>0 and not ao[ar]then ao[ar]=true table.insert(an,ar)end end
return an end local ao,ap=an(),ab.GetCurrentAnchorMap()if not ap then ap=ao[1]
end local aq,ar=function(aq,ar)if not ar then return 1 end for as,at in ipairs(
aq)do if at==ar then return as end end return 1 end local as,at=af.
PatchDropdownRestore(am:Dropdown({Name='Map (Edit Anchors)',Options=ao,Default=
aq(ao,ap),Required=true,Callback=function(as)ap=as ar()end},
'Dropdown_PathfinderAnchorMap'),true),am:Label{Text='No anchors set'}ar=function
()local au=ab.GetAnchors(ap)if#au==0 then at:UpdateName('Map: '..tostring(ap or
'-')..'\nNo anchors set')return end local av={}for aw,ax in ipairs(au)do table.
insert(av,(('%d.R%d'):format(aw,ax.room)))end at:UpdateName('Map: '..tostring(ap
or'-')..'\nOrder: '..table.concat(av,' '))end am:Button{Name=
'Add Anchor at Current Room',Callback=function()local au=ap or ab.
GetCurrentAnchorMap()local av=ab.SetAnchor(au)if av then ah:Notify{Title=
'Auto Farm',Description=('Anchor #%d added'):format(av)}else ah:Notify{Title=
'Auto Farm',Description=
'Kh\u{f4}ng th\u{ea}m \u{111}\u{1b0}\u{1ee3}c anchor (room \u{111}\u{e3} \u{111}\u{1ee7} 2 ho\u{1eb7}c ch\u{1b0}a x\u{e1}c \u{111}\u{1ecb}nh room/map)'
}end ar()end}local au am:Input{Name='Anchor Number to Remove',Placeholder=
'number',AcceptedCharacters='Numeric',Callback=function(av)au=av end}am:Button{
Name='Remove Anchor',Callback=function()local av,aw=au and tonumber(au),ap if av
and aw and ab.RemoveAnchor(aw,av)then ah:Notify{Title='Auto Farm',Description=(
'Removed anchor #%d'):format(av)}else ah:Notify{Title='Auto Farm',Description=
'Kh\u{f4}ng t\u{ec}m th\u{1ea5}y anchor #'..tostring(au)}end ar()end}am:Button{
Name='Clear Anchors for Selected Map',Callback=function()local av=ap if av then
ab.ClearAllAnchors(av)ah:Notify{Title='Auto Farm',Description=(
'Cleared anchors: %s'):format(av)}end ar()end}am:Toggle({Name=
'Show Anchor Markers',Default=ab.IsAnchorMarkersEnabled(),Callback=aa.Wrap(
function(av)ab.SetAnchorMarkers(av)end)},'Toggle_PathfinderAnchorMarkers')ac.
OnDungeonNameChanged(function()local av=ab.GetCurrentAnchorMap()if av and#av>0
then ap=av pcall(function()as:UpdateSelection(av)end)end ar()end)ar()local av=ai
:Section{Side='Right'}av:Header{Name='Visual Debug'}av:Toggle({Name=
'Show Debug Overlays',Default=ab.IsVisualDebugEnabled(),Callback=aa.Wrap(
function(aw)ab.SetVisualDebug(aw)end)},'Toggle_PathfinderDebug')local aw={
'Sphere','Line'}av:Dropdown({Name='Debug Path Mode',Options=aw,Default=ab.
GetDebugPathMode()=='Line'and 2 or 1,Required=true,Callback=aa.Wrap(function(ax)
ab.SetDebugPathMode(ax)end)},'Dropdown_PathfinderDebugMode')local ax=ai:Section{
Side='Right'}ax:Header{Name='Debug'}local ay,az,aA=ax:Label{Text=
'Initializing...'},{CHASE='0, 255, 255',HOLD='255, 200, 0',IDLE='160, 160, 160'}
,function(ay)return ay and"<font color='rgb(0,255,0)'>Yes</font>"or
"<font color='rgb(255,80,80)'>No</font>"end local aB=function()local aB,aC=
pcall(ab.GetDebugInfo)if not aB or not aC then return end local aD,aE=az[aC.
phase]or'160, 160, 160',aC.holdAngle local aF,aG,aH,aI,aJ=aE and string.format(
'%.1fdeg',math.deg(aE))or'-',aC.holdRadius and string.format('%.1f',aC.
holdRadius)or'-',ac.GetCurrentRoomIndex(),ac.GetCurrentBossIndex(),ac.
GetEnemyCount()local aK,aL=(aH and aH>0)and tostring(aH)or'-',(aI and aI>0)and
tostring(aI)or'-'local aM=table.concat{"State: <font color='rgb("..aD..")'>"..aC
.phase..'</font>\n','Room: '..aK..' / Boss: '..aL..' / Enemies: '..tostring(aJ)
..'\n','Locked: '..(aC.locked and("<font color='rgb(255,200,0)'>"..aC.lockedName
..'</font>')or'No')..'\n','Current: '..aC.enemyName..'\n','Dist 3D: '..string.
format('%.1f',aC.enemyDist)..'\n','Dist XZ: '..string.format('%.1f',aC.enemyFlat
)..' / Range '..aC.skillRange..' / MinDist '..tostring(aC.minDistance)..'\n',
'Orbit: angle '..aF..' / radius '..aG..'\n','Hold: '..aC.holdMode..(aC.holdMode
=='SmartDodge'and(' | Dodge '..aA(aC.dodging)..' | Threat '..aA(aC.threatActive)
)or'')..'\n','Facing: '..string.format('%.1f',aC.faceErr)..'deg / Tol '..
tostring(aC.faceTolerance)..'deg\n','Path: '..(aC.pathComputed and(aC.isAnchor
and"<font color='rgb(0,255,0)'>anchor</font>"or'active')or'none')..'\n',
'Tracking: '..aA(aC.dunReady)..' / Enabled '..aA(aC.enabled)}pcall(function()ay:
UpdateName(aM)end)end aB()task.spawn(function()while task.wait(0.25)do aB()end
end)local aC=ai:Section{Side='Right'}aC:Header{Name=
'AutoFarm Pathfinder Context'}local aD=aC:Label{Text=''}local aE,aF,aG,aH,aI,aJ,
aK,aL,aM,aN,aO,aP,aQ,aR=function()local aE,aF=ac.GetCurrentDungeonName(),ac.
GetCombatTargetKey()aD:UpdateName("Active: <font color='rgb(120,200,255)'>"..(aE
or'Not in dungeon')..'</font> / '..ad.GetDisplayForTarget(aF))end,ac.
GetCurrentDungeonName(),'Mob',false local aS=function()return aF==ac.
GetCurrentDungeonName()and aG==ac.GetCombatTargetKey()end aL=aC:Dropdown({Name=
'Edit Target',Options={'Normal','Boss 1','Boss 2','Boss 3'},Default=1,Required=
true,Callback=aa.Wrap(function(aT)local aU={Normal='Mob',['Boss 1']='Boss1',[
'Boss 2']='Boss2',['Boss 3']='Boss3'}aG=aU[aT]or'Mob'aI()end)},
'Dropdown_PathfinderTarget')local aT,aU,aV,aW,aX=false,'Reset Context to Global'
,"<font color='rgb(255,80,80)'>Confirm Reset?</font>",3 local aY=function()if
not aT then return end aT=false if aX then task.cancel(aX)aX=nil end pcall(
function()aR:UpdateName(aU)end)end aR=aC:Button{Name=aU,Callback=aa.Wrap(
function()if not aT then aT=true if aX then task.cancel(aX)end aX=task.delay(aW,
aY)pcall(function()aR:UpdateName(aV)end)return end aY()ad.ClearContext(aF,aG)aI(
)if aS()then ad.ApplyContext(aF,aG)end end)}aK=aC:Label{Text=''}aM=af.
PatchSliderLoadCallback(aC:Slider({Name='Retarget Interval',Default=ad.GetField(
aF,aG,'PathfinderRetargetInterval'),Minimum=0.2,Maximum=5,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(aZ)if aH then return end ad.SetField(aF,aG
,'PathfinderRetargetInterval',aZ)if aS()then ad.ApplyContext(aF,aG)end end)},
'Slider_PathfinderCtxRetarget'))aN=af.PatchSliderLoadCallback(aC:Slider({Name=
'Skill Range',Default=ad.GetField(aF,aG,'PathfinderSkillRange'),Minimum=1,
Maximum=200,DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(aZ)if aH
then return end ad.SetField(aF,aG,'PathfinderSkillRange',aZ)if aS()then ad.
ApplyContext(aF,aG)end end)},'Slider_PathfinderCtxSkillRange'))aO=af.
PatchSliderLoadCallback(aC:Slider({Name='Skill Interval',Default=ad.GetField(aF,
aG,'PathfinderSkillInterval'),Minimum=0.2,Maximum=10,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(aZ)if aH then return end ad.SetField(aF,aG
,'PathfinderSkillInterval',aZ)if aS()then ad.ApplyContext(aF,aG)end end)},
'Slider_PathfinderCtxSkillInterval'))aP=aC:Toggle({Name='Skill Enabled',Default=
ad.GetField(aF,aG,'PathfinderSkillEnabled'),Callback=aa.Wrap(function(aZ)if aH
then return end ad.SetField(aF,aG,'PathfinderSkillEnabled',aZ)if aS()then ad.
ApplyContext(aF,aG)end end)},'Toggle_PathfinderCtxSkillEnabled')local aZ={
'Both (Q+E c\u{f9}ng l\u{fa}c)','Alternate (Q -> E -> Q -> E)'}local a_=function
(a_)if a_=='Alternate'then return aZ[2]end return aZ[1]end aQ=aC:Dropdown({Name=
'Skill Mode',Options=aZ,Default=a_(ad.GetField(aF,aG,'PathfinderSkillMode'))==aZ
[2]and 2 or 1,Required=true,Callback=aa.Wrap(function(a0)if not a0 or aH then
return end local a1=a0:find'Alternate'and'Alternate'or'Both'ad.SetField(aF,aG,
'PathfinderSkillMode',a1)if aS()then ad.ApplyContext(aF,aG)end end)},
'Dropdown_PathfinderCtxSkillMode')aI=function()aH=true aY()pcall(function()aM:
UpdateValue(ad.GetField(aF,aG,'PathfinderRetargetInterval'))end)pcall(function()
aN:UpdateValue(ad.GetField(aF,aG,'PathfinderSkillRange'))end)pcall(function()aO:
UpdateValue(ad.GetField(aF,aG,'PathfinderSkillInterval'))end)pcall(function()aP:
UpdateState(ad.GetField(aF,aG,'PathfinderSkillEnabled'))end)pcall(function()aQ:
UpdateSelection(a_(ad.GetField(aF,aG,'PathfinderSkillMode')))end)aH=false pcall(
function()aK:UpdateName("Editing: <font color='rgb(150,255,150)'>"..(aF or
'Not in dungeon')..'</font> / '..ad.GetDisplayForTarget(aG))end)end aJ=function(
a0)pcall(function()aM:SetVisibility(a0)end)pcall(function()aN:SetVisibility(a0)
end)pcall(function()aO:SetVisibility(a0)end)pcall(function()aP:SetVisibility(a0)
end)pcall(function()aQ:SetVisibility(a0)end)pcall(function()aR:SetVisibility(a0)
end)end local a0,a1=function()aG='Mob'pcall(function()aL:UpdateSelection'Normal'
end)aI()end,aF~=nil local a2=function()local a2=ac.GetCurrentDungeonName()local
a3=a2~=nil aF=a2 if a3 and not a1 then a0()end a1=a3 aE()aI()aJ(a3)end ac.
OnDungeonNameChanged(a2)ac.OnBossIndexChanged(aE)ac.OnBossActiveChanged(aE)ad.
OnConfigChanged(function()aF=ac.GetCurrentDungeonName()aE()aI()aJ(aF~=nil)end)
aE()aI()aJ(aF~=nil)end end function a.u()local aa,ab,ac=a.load'g',a.load'd',a.
load'n'return function(ad,ae)local af=ae:Section{Side='Left'}af:Header{Name=
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
an,ao,ap,aq)if an and ao then pcall(function()aj:UpdateName((
"Player State: <font color='rgb(255,60,60)'>\u{26a0}\u{fe0f} IN DANGER (%s)</font>"
):format(ap or'Hazard'))ak:UpdateName((
"Safe Target: <font color='rgb(0,255,120)'>\u{1f7e2} (%.1f, %.1f, %.1f) - %.1fm</font>"
):format(ao.X,ao.Y,ao.Z,aq or 0))end)else pcall(function()aj:UpdateName
"Player State: <font color='rgb(0,255,0)'>\u{1f7e2} SAFE</font>"ak:UpdateName
[[Safe Target: <font color='rgb(160,160,160)'>None (No Dodge Needed)</font>]]end
)end end,function(an)an=an or ac.GetDodgeStatus()local ao='160, 160, 160'if an==
'Dodging'then ao='255, 200, 50'elseif an=='Returning'then ao='80, 180, 255'
elseif an:find'Safe'then ao='0, 255, 120'end pcall(function()al:UpdateName(
"Dodge Action: <font color='rgb("..ao..")'>"..an..'</font>')end)end ac.
OnHazardChanged(function(aq,ar)an(aq,ar)end)ac.OnSafeSpotChanged(function(aq,ar,
as,at)ao(aq,ar,as,at)end)ac.OnDodgeStatusChanged(function(aq)ap(aq)end)af:
Toggle({Name='Enable Threat & Safe Spot Engine',Default=ac.IsEnabled(),Callback=
ab.Wrap(function(aq)ac.Toggle(aq)an()end)},'Toggle_SmartDodgeThreatDetection')af
:Toggle({Name='Auto Dodge Execution',Default=ac.IsAutoDodgeEnabled(),Callback=ab
.Wrap(function(aq)ac.SetAutoDodge(aq)end)},'Toggle_SmartDodgeAutoExecution')aa.
PatchSliderLoadCallback(af:Slider({Name='Max Dodge Time Budget (s)',Default=ac.
GetMaxDodgeTime(),Minimum=0.3,Maximum=3,DisplayMethod='Round',Precision=1,
Callback=ab.Wrap(function(aq)ac.SetMaxDodgeTime(aq)end)},
'Slider_SmartDodgeMaxTime'))aa.PatchSliderLoadCallback(af:Slider({Name=
'Instant / Final Snap Distance (studs)',Default=ac.GetMaxSnapDistance(),Minimum=
1,Maximum=6,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(aq)ac.
SetMaxSnapDistance(aq)end)},'Slider_SmartDodgeMaxStep'))af:Toggle({Name=
'Maintain Height When Snapping',Default=ac.IsMaintainSnapHeightEnabled(),
Callback=ab.Wrap(function(aq)ac.SetMaintainSnapHeight(aq)end)},
'Toggle_SmartDodgeMaintainHeight')aa.PatchSliderLoadCallback(af:Slider({Name=
'Player Hitbox Padding (studs)',Default=ac.GetHitboxPadding(),Minimum=0,Maximum=
5,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(function(aq)ac.
SetHitboxPadding(aq)end)},'Slider_SmartDodgeHitboxPadding'))aa.
PatchSliderLoadCallback(af:Slider({Name='Trajectory Lookahead Length (studs)',
Default=ac.GetTrajectoryLookahead(),Minimum=20,Maximum=150,DisplayMethod='Round'
,Precision=1,Callback=ab.Wrap(function(aq)ac.SetTrajectoryLookahead(aq)end)},
'Slider_SmartDodgeTrajLookahead'))aa.PatchSliderLoadCallback(af:Slider({Name=
'Trajectory Width Padding (studs)',Default=ac.GetTrajectoryWidthPadding(),
Minimum=0.5,Maximum=6,DisplayMethod='Round',Precision=1,Callback=ab.Wrap(
function(aq)ac.SetTrajectoryWidthPadding(aq)end)},'Slider_SmartDodgeTrajPadding'
))af:Toggle({Name='Show Hitbox Padding Visual (Cyan Circle)',Default=ac.
IsShowHitboxVisualEnabled(),Callback=ab.Wrap(function(aq)ac.SetShowHitboxVisual(
aq)end)},'Toggle_SmartDodgeHitboxVisual')af:Toggle({Name=
'Threat Visual ESP (SelectionBox)',Default=ac.IsVisualEspEnabled(),Callback=ab.
Wrap(function(aq)ac.SetVisualEsp(aq)end)},'Toggle_SmartDodgeVisualEsp')af:
Toggle({Name='Show Safe Spot Marker (Green ESP)',Default=ac.
IsShowSafeMarkerEnabled(),Callback=ab.Wrap(function(aq)ac.SetShowSafeMarker(aq)
end)},'Toggle_SmartDodgeShowSafeMarker')af:Toggle({Name=
'Log Hazards (Spawns / Despawns)',Default=ac.IsLogHazardsEnabled(),Callback=ab.
Wrap(function(aq)ac.SetLogHazards(aq)end)},'Toggle_SmartDodgeLogHazards')af:
Toggle({Name='Log In Danger & Safe Spot',Default=ac.IsLogInDangerEnabled(),
Callback=ab.Wrap(function(aq)ac.SetLogInDanger(aq)end)},
'Toggle_SmartDodgeLogInDanger')af:Button{Name='Clear Console',Callback=function(
)pcall(function()if rconsoleclear then rconsoleclear()end end)end}an()local aq,
ar,as,at=ac.GetCurrentSafeSpot()ao(ar,aq,as,at)ap()end end function a.v()return
function(aa,ab)a.load'p'(aa,ab)a.load't'(aa,ab)a.load'u'(aa,ab)end end function
a.w()local aa,ab,ac,ad,ae=a.load'e',a.load'c',a.load'q',a.load'f',a.load'b'local
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.player.Name,false,false,false,
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
return av end function a.x()local aa,ab,ac,ad,ae,af,ag,ah=a.load'f',a.load'c',{[
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
function a.y()local aa={[77649408247578]=true,[115445507767090]=true}local ab,ac
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
if ac then ah()end end return ai end function a.z()local aa,ab=a.load'e',a.load
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
A()local aa,ab,ac,ad,ae,af,ag=a.load'g',a.load'w',a.load'x',a.load'y',a.load'z',
a.load'd',a.load'q'return function(ah,ai)local aj,ak,al=ai:Section{Side='Left'},
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
GetSelectedDifficulty())end)ap()end)end end function a.B()local aa,ab,ac,ad,ae,
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
function a.C()local aa,ab,ac=a.load'd',a.load'B',a.load'c'return function(ad,ae)
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
end)end)end},{Name='Cancel'}}}end)end}ao()end end function a.D()local aa,ab,ac,
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
return aF end return ac end function a.E()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
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
'[EnemyESP] recolor error'end end return ac end function a.F()local aa,ab,ac,ad,
ae,af,ag,ah,ai,aj,ak,al,am,an=a.load'e',a.load'b',{},false,{},{},{},2,0.05,16,30
,function(aa)if not aa then return false end local ab=aa while ab and ab~=
workspace do local ac=ab.Name:lower()if ac:find'stairramp'or ac:find'step'or ac:
find'meshes/cylinder'or ac:find'cylinder'then return true end ab=ab.Parent end
return false end local ao=function(ao)if not ad or not ao or not ao:IsA
'BasePart'then return end if al(ao)then return end if not af[ao]then af[ao]={
CanCollide=ao.CanCollide,CanTouch=ao.CanTouch}end pcall(function()ao.CanCollide=
false ao.CanTouch=false end)end local ap={['meshes/ice3']=true,['meshes/snow']=
true,['invisible platform']=true,part=true}local aq,ar,as=function(aq)if not aq
then return true end if aq:IsA'Model'or aq:IsA'Folder'then return true end local
ar=aq.Name:lower()if ap[ar]or aq.Name=='Meshes/Ice3'or aq.Name=='Meshes/Snow'or
aq.Name=='Invisible platform'or aq.Name=='Part'then return true end return false
end,function()if not ad then return end local aq=workspace:FindFirstChild'Map'if
not aq then return end for ar,as in ipairs(aq:GetDescendants())do if(as:IsA
'Model'or as:IsA'Folder')and as.Name:lower():find'border'then for at,au in
ipairs(as:GetChildren())do pcall(function()au:Destroy()end)end end end end,
function()if not ad then return end local aq=workspace:FindFirstChild'Map'if not
aq then return end for ar,as in ipairs(aq:GetDescendants())do if as.Name:lower()
:find'wooden plank'then local at=as.Parent while at and at~=aq and at~=workspace
do if at:IsA'Model'then pcall(function()at:Destroy()end)break end at=at.Parent
end end end end local at,au,av=function()if not ad then return end local at=
workspace:FindFirstChild'Map'if not at then return end for au,av in ipairs(at:
GetChildren())do if not aq(av)then pcall(function()av:Destroy()end)end end end,{
Vector3.new(-724.4873046875,33.9286003112793,174.7227325439453),Vector3.new(-
697.8023681640625,26.397010803222656,380.60272216796875),Vector3.new(-
649.3167724609375,31.39712905883789,397.80535888671875),Vector3.new(-
581.634033203125,3.4567506313323975,318.2510070800781),Vector3.new(-
491.9974365234375,41.522090911865234,384.67694091796875),Vector3.new(-
484.0378723144531,35.76678466796875,418.82659912109375),Vector3.new(-
470.1619567871094,32.919700622558594,461.6861267089844),Vector3.new(-
468.8152770996094,39.06712341308594,514.388916015625),Vector3.new(-
600.4266357421875,13.99144172668457,570.6660766601563),Vector3.new(-
338.2521667480469,42.990394592285156,439.36456298828125),Vector3.new(-
355.2449951171875,57.510982513427734,385.5475769042969),Vector3.new(-
606.5220336914063,37.41774368286133,372.6407470703125)},0.2 local aw=function(aw
)if not aw then return false end for ax,ay in ipairs(au)do if(aw-ay).Magnitude<=
av then return true end end return false end local ax=function(ax)if not ax or
not ax:IsA'Model'or not ax.Parent then return false end local ay,az=pcall(
function()return ax:GetPivot().Position end)if ay and az and aw(az)then return
true end if ax.PrimaryPart and aw(ax.PrimaryPart.Position)then return true end
for aA,aB in ipairs(ax:GetDescendants())do if aB:IsA'BasePart'and aw(aB.Position
)then return true end end return false end local ay,az=function()if not ad then
return end local ay=workspace:FindFirstChild'Map'or workspace:FindFirstChild
'dungeon'or workspace:FindFirstChild'Dungeon'if not ay then return end for az,aA
in ipairs(ay:GetDescendants())do if not aA.Parent then continue end if aA:IsA
'Model'then if ax(aA)then pcall(function()aA:Destroy()end)end elseif aA:IsA
'BasePart'then if aw(aA.Position)then local aB=aA:FindFirstAncestorOfClass
'Model'if aB and aB~=workspace and aB~=ay then pcall(function()aB:Destroy()end)
else pcall(function()aA:Destroy()end)end end end end end,function(ay)if not ad
or not ay or not ay:IsA'BasePart'then return end if ay.Name=='Meshes/Snow'or ay.
Name:lower():find'meshes/snow'or ay.Name:lower()=='snow'then if ag[ay]==nil then
ag[ay]=ay.Transparency end pcall(function()ay.Transparency=1 end)end end local
aA=function()if not ad then return end local aA=workspace:FindFirstChild'Map'if
not aA then return end for aB,aC in ipairs(aA:GetDescendants())do if aC:IsA
'BasePart'and(aC.Name=='Meshes/Snow'or aC.Name:lower():find'meshes/snow'or aC.
Name:lower()=='snow')then az(aC)end end end local aB,aC=function()if not ad then
return end at()ar()as()ay()aA()end,function(aB)if not aB then return false end
local aC=aB.Name:lower()if aC:find'solid spikes'then local aD=aB.Parent if aD
and aD:IsA'Model'and aD~=workspace then return true end end return false end
local aD,aE,aF=function()local aD=aa.player local aE=aD and aD.Character local
aF=aE and aE:FindFirstChild'HumanoidRootPart'if not aF then return end local aG=
RaycastParams.new()aG.FilterType=Enum.RaycastFilterType.Exclude aG.
FilterDescendantsInstances={aE,workspace.Terrain}aG.IgnoreWater=true local aH,aI
={0.5,2},aF.Position for aJ,aK in ipairs(aH)do local aL=Vector3.new(aI.X,aI.Y+aK
,aI.Z)for aM=1,aj do local aN=(aM/aj)*(math.pi*2)local aO=Vector3.new(math.cos(
aN),0,math.sin(aN))*ak local aP=workspace:Raycast(aL,aO,aG)if aP and aP.Instance
and aP.Instance:IsA'BasePart'then local aQ=aP.Instance if not al(aQ)and not aC(
aQ)then if not af[aQ]then af[aQ]={CanCollide=aQ.CanCollide,CanTouch=aQ.CanTouch}
end pcall(function()aQ.CanCollide=false aQ.CanTouch=false end)end end end end
end,function()for aD,aE in ipairs(ae)do pcall(function()aE:Disconnect()end)end
table.clear(ae)local aD,aE=function(aD)if not aD then return end table.insert(ae
,aD.ChildAdded:Connect(function(aE)if not ad then return end if not aq(aE)then
pcall(function()aE:Destroy()end)end end))table.insert(ae,aD.DescendantAdded:
Connect(function(aE)if not ad then return end if aE.Name:lower():find
'wooden plank'then local aF=aE.Parent while aF and aF~=aD and aF~=workspace do
if aF:IsA'Model'then pcall(function()aF:Destroy()end)return end aF=aF.Parent end
end local aF=aE.Parent while aF and aF~=aD and aF~=workspace do if(aF:IsA'Model'
or aF:IsA'Folder')and aF.Name:lower():find'border'then pcall(function()aE:
Destroy()end)break end aF=aF.Parent end if aE:IsA'Model'and ax(aE)then pcall(
function()aE:Destroy()end)return elseif aE:IsA'BasePart'and aw(aE.Position)then
local aG=aE:FindFirstAncestorOfClass'Model'if aG and aG~=workspace and aG~=aD
then pcall(function()aG:Destroy()end)else pcall(function()aE:Destroy()end)end
return end if aE:IsA'BasePart'and(aE.Name=='Meshes/Snow'or aE.Name:lower():find
'meshes/snow'or aE.Name:lower()=='snow')then az(aE)end end))end,workspace:
FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or workspace:
FindFirstChild'Dungeon'if aE then aD(aE)end table.insert(ae,workspace.ChildAdded
:Connect(function(aF)if not ad then return end local aG=aF.Name:lower()if aG==
'map'or aG=='dungeon'then aD(aF)task.delay(0.2,aB)end end))end,function()for aD,
aE in pairs(ag)do if aD and aD.Parent then pcall(function()aD.Transparency=aE
end)end end table.clear(ag)for aD,aE in pairs(af)do if aD and aD.Parent then
pcall(function()aD.CanCollide=aE.CanCollide aD.CanTouch=aE.CanTouch end)end end
table.clear(af)end function ac.Toggle(aG)if aG==ad then return end ad=aG and
true or false if ad then aB()aE()if am then task.cancel(am)am=nil end am=task.
spawn(function()while ad do task.wait(ah)pcall(aB)end end)if an then task.
cancel(an)an=nil end an=task.spawn(function()while ad do task.wait(ai)pcall(aD)
end end)else for aH,aI in ipairs(ae)do pcall(function()aI:Disconnect()end)end
table.clear(ae)if am then task.cancel(am)am=nil end if an then task.cancel(an)an
=nil end aF()end end function ac.IsEnabled()return ad end ab.Register(function()
ac.Toggle(false)end)return ac end function a.G()local aa,ab,ac,ad,ae,af,ag=a.
load'd',a.load'D',a.load'E',a.load'F',a.load'g',{'Custom Hitbox','Real Hitbox'},
function(aa)return(aa=='Custom'and 1)or 2 end local ah=function(ah)return(ah==af
[1]and'Custom')or'Real'end return function(ai,aj)local ak,al=(aj:Section{Side=
'Left'})ak:Header{Name='Player'}ak:Toggle({Name='Hitbox',Default=ab.
IsPlayerHitboxEnabled(),Callback=aa.Wrap(function(am)ab.TogglePlayerHitbox(am)
end)},'Toggle_PlayerHitbox')ak:Dropdown({Name='Hitbox Mode',Options=af,Default=
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
function a.H()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'f',a.load'b',game:
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
false end)return ag end function a.I()local aa=a.load'H'return function(ab,ac)
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
}end end function a.J()local aa={}function aa.Apply(ab,ac,ad)for ae,af in pairs(
ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=af end
)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af,{
__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local ai,
aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.K()local aa,ab,ac,ad,ae,af=a.load'J',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.L()local aa
,ab,ac=a.load'd',a.load'g',a.load'K'return function(ad,ae)local af=ae:Section{
Side='Left'}af:Header{Name='Anti AFK'}af:Toggle({Name='Anti AFK',Default=ac.
IsEnabled(),Callback=aa.Wrap(function(ag)if ag then ac.Start()else ac.Stop()end
end)},'Toggle_AntiAFK')ab.PatchSliderLoadCallback(af:Slider({Name=
'Interval (gi\u{e2}y)',Default=ac.GetInterval(),Minimum=5,Maximum=300,
DisplayMethod='Round',Precision=0,Callback=aa.Wrap(function(ag)ac.SetInterval(ag
)end)},'Slider_AntiAFKInterval'))end end function a.M()return function(aa,ab)a.
load'G'(aa,ab)a.load'I'(aa,ab)a.load'L'(aa,ab)end end function a.N()local aa,ab,
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
Hide()end)end ah()return ae end function a.O()local aa,ab,ac=a.load'a',a.load'd'
,a.load'N'return function(ad,ae)local af=aa.Folder local ag=af..
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
'Press RightControl to show the window again.'}end end function a.P()local aa,ab
,ac,ad,ae,af=a.load'f',a.load'z','Boss Active','Boss','Dungeon','Time Left'
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
end end end}end end function a.Q()return function(aa,ab)a.load'O'(aa,ab)a.load
'P'(aa,ab)end end function a.R()return function(aa)local ab,ac=game:GetService
'Players',os.clock()+15 while not ab.LocalPlayer do if os.clock()>ac then break
end task.wait(0.1)end local ad=ab.LocalPlayer if not ad then return warn
'[DungeonQuest] Kh\u{f4}ng l\u{1ea5}y \u{111}\u{1b0}\u{1ee3}c LocalPlayer, h\u{1ee7}y kh\u{1edf}i t\u{1ea1}o script.'
end local ae,af,ag=a.load'a',a.load'b',a.load'd'ag.Suspend()local ah,ai=ae:
Window{Title='DungeonQuest',Subtitle='EsclipseHub',Size=UDim2.fromOffset(900,600
),DragStyle=1,DisabledWindowControls={},ShowUserInfo=true,Keybind=Enum.KeyCode.
RightControl,AcrylicBlur=true},a.load'c'ai:SetWindow(ah)_G.ScriptHub_UI=ah _G.
ScriptHub_Cleanup=function()af.Cleanup()end ah.onUnloaded(function()af.Cleanup()
if _G.ScriptHub_UI==ah then _G.ScriptHub_UI=nil end end)local aj=ah:TabGroup()
local ak={Combat=aj:Tab{Name='Combat',Image='rbxassetid://18821914323'},Dungeon=
aj:Tab{Name='Dungeon Joiner',Image='rbxassetid://10734950309'},Inventory=aj:Tab{
Name='Inventory',Image='rbxassetid://10734950309'},Utilities=aj:Tab{Name=
'Utilities',Image='rbxassetid://10734950309'},Configs=aj:Tab{Name='Configs',
Image='rbxassetid://10734950309'}}ae:SetFolder'EsclipseHub'local al,am,an,ao,ap=
a.load'v',a.load'A',a.load'C',a.load'M',a.load'Q'al(ah,ak.Combat)am(ah,ak.
Dungeon)an(ah,ak.Inventory)ao(ah,ak.Utilities)ap(ah,ak.Configs)local aq=a.load
's'aq.Init()local ar=a.load'H'ar.Init()a.load'E'local as,at=a.load'r',a.load'N'
at.SetWindow(ah)at.Execute()ak.Combat:Select()ae:LoadAutoLoadConfig()as.Init()
task.delay(1.5,function()ag.Resume()end)end end function a.S()local aa={}
function aa:Export()local ab={}for ac,ad in pairs(self)do if typeof(ad)==
'Instance'or type(ad)=='table'then local ae,af=pcall(function()end)if ae and af
~=nil then ab[ac]=af end end end return ab end function aa:Import(ab)for ac,ad
in pairs(ab)do local ae=self[ac]if ae and ae.Value~=nil then local af=pcall(
function()end)if not af then warn(`Failed to import value for flag "{ac}"`)end
end end end function aa:Reset()for ab in pairs(self)do self[ab]=nil end end
return aa end function a.T()local aa,ab=a.load'J',{}function ab:Window(ac)ac=ac
or{}print'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.U()local aa,ab=a.load'J',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.V()local aa,ab,
ac=a.load'S',a.load'T',a.load'U'local ad=ab:Window{Visible=true}return{Flags=aa,
Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)end
,Settings=function(ae)end,Config=function(ae)end}}end function a.W()local aa={}
function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.X()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.Y()return function(aa)local ab,ac,ad
=a.load'V',a.load'W',a.load'X'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab.
Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do local
al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end do
local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah.
Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'R',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.
load'Y',Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and game
.PlaceId~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.
Places then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:
Load()end end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae
:Load()end end