--!nocheck
--!nolint

--[[
    @authors YOUR_NAME
    @repository YOUR_REPOSITORY

    This file was automatically generated with darklua, it is not intended for manual editing.
--]]

_P = {
    genDate = "2026-09-20T03:32:40.296934600+00:00",
    cfg = "Release",
    vers = "v0.0.0"
}

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
ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax=aa.player,0.05,
'enemyProjectiles',0.5,{},false,16,16,false,false,{},0,{},0,{},{},{},{},{},{},0,
{}local ay,az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ=function()for
ay=#ax,1,-1 do pcall(ax[ay])end end,{},'unknown',true,{},{},{},0,4,false local
aR=function(aR)if aR then table.insert(aE,aR)end return aR end function ag.
OnRespawn(aS)table.insert(aD,aS)end function ag.GetLastRespawnTime()return aF
end function ag.GetRespawnProtectionDuration()return aG end function ag.
SetRespawnProtectionDuration(aS)if type(aS)=='number'and aS>=0 then aG=aS end
end function ag.GetRespawnProtectionRemaining()if aF==0 then return 0 end local
aS=os.clock()-aF local aT=aG-aS return math.max(0,aT)end function ag.
IsJustRespawned(aS)local aT=aS or aG if aF==0 then return false end return(os.
clock()-aF)<=aT end function ag.WasDead()return aH end function ag.IsDead()local
aS=ac and ac.Character if not aS or not aS.Parent then return true end local aT=
aS:FindFirstChildOfClass'Humanoid'if not aT or aT.Health<=0 then return true end
return false end function ag.IsInvulnerable()local aS=ac and ac.Character if not
aS or not aS.Parent then return false,nil end local aT=aS:FindFirstChildOfClass
'Humanoid'if aT and aT.Health<=0 then return false,nil end local aU=ag.
GetRespawnProtectionRemaining()if aU>0 then return true,(
'Respawn Shield (%.1fs)'):format(aU)end return false,nil end local aS=function(
aS)if not aS or not aS:IsA'Model'then return nil end local aT=aS:FindFirstChild
'HumanoidRootPart'if aT and aT:IsA'BasePart'then return aT end if aS.PrimaryPart
and aS.PrimaryPart:IsA'BasePart'then return aS.PrimaryPart end for aU,aV in
ipairs(aS:GetDescendants())do if aV:IsA'BasePart'then return aV end end return
nil end local aT,aU=function(aT)if not aT or not aT:IsA'Model'or not aT.Parent
or aT==ac.Character then return false end local aU=aT:FindFirstChildOfClass
'Humanoid'if not aU or aU.Health<=0 then return false end return aS(aT)~=nil end
,function(aT)local aU=au[aT]if not aU then return end if aU.Died then aU.Died:
Disconnect()aU.Died=nil end au[aT]=nil end local aV,aW=function(aV)if not aV or
not as[aV]then return end av[aV]=nil as[aV]=nil aw-=1 aU(aV)ay()aM()end,function
(aV)if not dungeon or not aV then return nil end local aW=aV.Parent while aW do
if aW==dungeon then return nil end if aW.Parent==dungeon and(aW:IsA'Folder'or aW
:IsA'Model')then return aW end aW=aW.Parent end return nil end local aX=function
(aX)if not aT(aX)or as[aX]then return end local aY,aZ=aS(aX),aX:
FindFirstChildOfClass'Humanoid'if not aY or not aZ then return end as[aX]={Model
=aX,Root=aY,Humanoid=aZ,Room=aW(aX)}aw+=1 au[aX]={Died=aZ.Died:Connect(function(
)aV(aX)end)}if al and not aO then if aN then aN()end end ay()aM()end local aY=
function(aY)if not aY then return end if aT(aY)then aX(aY)return end if av[aY]
then return end av[aY]=true task.spawn(function()local aZ=os.clock()+2 while aY.
Parent and os.clock()<aZ do if aT(aY)then av[aY]=nil aX(aY)return end task.wait(
0.03)end av[aY]=nil if aY.Parent and aT(aY)then aX(aY)end end)end local aZ=
function(aZ)if not aZ or ar[aZ]then return end ar[aZ]=true for a_,a0 in ipairs(
aZ:GetDescendants())do if a0:IsA'Model'and aT(a0)then aX(a0)end end at[aZ]={
Added=aZ.DescendantAdded:Connect(function(a_)if a_:IsA'Model'then aY(a_)elseif
a_:IsA'Humanoid'then local a0=a_:FindFirstAncestorOfClass'Model'if a0 then aY(a0
)end end end),Removed=aZ.DescendantRemoving:Connect(function(a_)if a_:IsA'Model'
then aV(a_)end end)}end aK=function()if not dungeon then dungeon=workspace:
WaitForChild('dungeon',30)end if not dungeon then return false end an=0 for a_=#
ao,1,-1 do pcall(ao[a_],an)end ap=0 for a_=#aq,1,-1 do pcall(aq[a_],ap)end for
a_,a0 in ipairs(dungeon:GetChildren())do if a0:IsA'Folder'or a0:IsA'Model'then
aZ(a0)end end at[dungeon]={Added=dungeon.DescendantAdded:Connect(function(a_)if
a_:IsA'Model'then aY(a_)elseif a_:IsA'Humanoid'then local a0=a_:
FindFirstAncestorOfClass'Model'if a0 then aY(a0)end end end),Removed=dungeon.
DescendantRemoving:Connect(function(a_)if a_:IsA'Model'then aV(a_)end end)}
return true end aL=function()if not dungeon then return end for a_,a0 in pairs(
at)do if a0.Added then pcall(function()a0.Added:Disconnect()end)end if a0.
Removed then pcall(function()a0.Removed:Disconnect()end)end end at={}ar={}for a_
in pairs(as)do aU(a_)end as={}aw=0 av={}ag.ResetBossIndex()dungeon=nil end aJ=
function()for a_,a0 in pairs(as)do if not a_ or not a_.Parent then aV(a_)else
local a1=a0.Humanoid or a_:FindFirstChildOfClass'Humanoid'a0.Humanoid=a1 if not
a1 or a1.Health<=0 then aV(a_)else local a2=a0.Root if not a2 or not a2.Parent
then a2=aS(a_)if a2 then a0.Root=a2 else aV(a_)end end end end end end function
ag.SetFastSpeed(a_)ai=a_ if ah and humanoid and humanoid.Parent then if humanoid
.WalkSpeed<ai then ak=true humanoid.WalkSpeed=ai ak=false end end end function
ag.SetSpeedEnabled(a_)ah=a_ if humanoid and humanoid.Parent then ak=true if ah
then if humanoid.WalkSpeed<ai then humanoid.WalkSpeed=ai end else humanoid.
WalkSpeed=aj end ak=false end end function ag.IsSpeedEnabled()return ah end
function ag.GetFastSpeed()return ai end local a_=function()if aP then aP:
Disconnect()aP=nil end if not humanoid or not humanoid.Parent then return end aP
=humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()if ak then
return end if not humanoid or not humanoid.Parent then return end local a_=
humanoid.WalkSpeed if ah then if a_<ai then ak=true humanoid.WalkSpeed=ai ak=
false end else aj=a_ end end)end function ag.SetHumanoid(a0)if not a0 then
return end local a1=a0:WaitForChild('Humanoid',10)if not a1 then return end
humanoid=a1 rootPart=a0:WaitForChild('HumanoidRootPart',10)or a0.PrimaryPart aj=
humanoid.WalkSpeed if ah and humanoid.WalkSpeed<ai then ak=true humanoid.
WalkSpeed=ai ak=false end if aQ then aQ:Disconnect()aQ=nil end aQ=humanoid.Died:
Connect(function()aH=true end)aR(humanoid.HealthChanged:Connect(function(a2)if
a2<=0 then aH=true elseif aH and a2>0 then aH=false end end))end function ag.
GetDungeonStartTime()return dungeonStartTime end function ag.SetDungeonStartTime
(a0)dungeonStartTime=a0 end function ag.GetDungeonElapsed()if not
dungeonStartTime then return nil end return os.clock()-dungeonStartTime end
function ag.ReadyDungeon()if not dungeon and not aK()then return false end
return true end function ag.GetHumanoid()return humanoid end function ag.
GetEnemyNames()local a0={}local a1=function(a1)if a1 and a1~=''and a1~=ac.Name
then a0[a1]=true end end if dungeon then for a2,a3 in ipairs(dungeon:
GetChildren())do if a3:IsA'Folder'or a3:IsA'Model'then for a4,a5 in ipairs(a3:
GetDescendants())do if a5:IsA'Model'and a5:FindFirstChildOfClass'Humanoid'then
a1(a5.Name)end end end end end for a2 in pairs(as)do a1(a2.Name)end local a2={}
for a3 in pairs(a0)do table.insert(a2,a3)end table.sort(a2)return a2 end
function ag.GetEnemyCount()return aw end function ag.GetTrackedEnemyData()local
a0={}for a1,a2 in pairs(as)do if a2 and a2.Root and a2.Root.Parent then a0[#a0+1
]=a2 end end return a0 end function ag.OnEnemyChanged(a0)if type(a0)~='function'
then return function()end end table.insert(ax,a0)return function()for a1,a2 in
ipairs(ax)do if a2==a0 then table.remove(ax,a1)break end end end end function ag
.GetEnemyProjectileNames()local a0,a1={},game:GetService'ReplicatedStorage'local
a2=a1:FindFirstChild(ae)if not a2 then return a0 end for a3,a4 in ipairs(a2:
GetChildren())do local a5=a4.ClassName if a5=='Model'or a5=='MeshPart'or a5==
'Part'then a0[a4.Name]=true end end return a0 end function ag.GetKeyHoldTime()
return ad end if ac and ac.Character and ac.Character.Parent then ag.
SetHumanoid(ac.Character)a_()else local a0=ac and ac.CharacterAdded and task.
spawn(function()local a0=ac.CharacterAdded:Wait()if a0 and ab.IsActive()then ag.
SetHumanoid(a0)a_()end end)end if ac then aR(ac.CharacterAdded:Connect(function(
a0)local a1,a2=pcall(function()if not a0 then return end aF=os.clock()ag.
SetHumanoid(a0)a_()for a1,a2 in ipairs(aD)do pcall(a2)end end)if not a1 then
warn('[Shared] respawn handler error:',tostring(a2))end end))end task.spawn(
function()while ab.IsActive()do task.wait(af)local a0=workspace:FindFirstChild
'dungeon'if dungeon and a0~=dungeon then aL()elseif not dungeon and a0 then aK()
end aM()end end)local a0=function()local a0=game:GetService'Workspace'for a1,a2
in ipairs(a0:GetDescendants())do if a2.Name=='dungeonName'and a2:IsA'ValueBase'
then local a3=a2.Value if type(a3)=='string'then local a4=string.gsub(a3,'%s+',
'')if a4~=''and string.lower(a4)~=aA then return a3 end end end end return nil
end task.spawn(function()while ab.IsActive()do task.wait(af)local a1=a0()if a1~=
aI then aI=a1 if a1 then ag.ResetBossIndex()end for a2=#az,1,-1 do pcall(az[a2],
a1)end end end end)local a1=function()return not(aI and#aI>0)end task.spawn(
function()while ab.IsActive()do task.wait(af)local a2=a1()if a2~=aB then aB=a2
for a3=#aC,1,-1 do pcall(aC[a3],aB)end end end end)task.spawn(function()local a2
,a3=pcall(function()return aK()end)if not a2 then warn(
'[EnemyTracker] Initialization error:',a3)end end)local a2=function()if not
dungeon then dungeon=workspace:FindFirstChild'dungeon'end if not dungeon then
return end local a2=pcall(function()for a2,a3 in ipairs(dungeon:GetChildren())do
if a3:IsA'Folder'or a3:IsA'Model'then if a3:IsA'Model'and aT(a3)then aY(a3)end
for a4,a5 in ipairs(a3:GetDescendants())do if a5:IsA'Model'then aY(a5)end end
end end aJ()end)if not a2 then warn'[EnemyTracker] scanDungeonEnemies error'end
end function ag.ForceRescan()a2()end local a3,a4=0,2 task.spawn(function()while
ab.IsActive()do task.wait(a4)local a5=os.clock()if a5-a3<a4 then continue end a3
=a5 a2()end end)function ag.IsBossActive()return al end function ag.
OnBossActiveChanged(a5)if type(a5)~='function'then return function()end end
table.insert(am,a5)return function()for a6,a7 in ipairs(am)do if a7==a5 then
table.remove(am,a6)break end end end end function ag.GetCurrentBossIndex()return
an end function ag.GetCombatTargetKey()if not al then return'Mob'end local a5=
math.clamp(an,1,3)return'Boss'..tostring(a5)end function ag.ResetBossIndex()
local a5=al an=0 al=false aO=nil for a6=#ao,1,-1 do pcall(ao[a6],an)end if a5
then for a6=#am,1,-1 do pcall(am[a6],false)end end aM()end function ag.
OnBossIndexChanged(a5)if type(a5)~='function'then return function()end end table
.insert(ao,a5)return function()for a6,a7 in ipairs(ao)do if a7==a5 then table.
remove(ao,a6)break end end end end local a5=function(a5)if type(a5)~='string'
then return 0 end local a6=string.lower(a5)local a7=string.match(a6,
'boss.*(%d+)')if a7 then return 100+(tonumber(a7)or 1)end if string.find(a6,
'boss')then return 100+math.max(1,an)end local a8=string.match(a5,'^room(%d+)$')
if not a8 then return 0 end return tonumber(a8)or 0 end local a6=function()if
not dungeon then return 0 end for a6,a7 in pairs(as)do if a7 and a7.Room then
local a8=a5(a7.Room.Name)if a8>0 then return a8 end end end if al then return
100+math.max(1,an)end return 0 end aM=function()local a7=a6()if a7==ap then
return end ap=a7 for a8=#aq,1,-1 do pcall(aq[a8],ap)end end function ag.
GetCurrentRoomIndex()return ap end function ag.OnRoomIndexChanged(a7)if type(a7)
~='function'then return function()end end table.insert(aq,a7)return function()
for a8,a9 in ipairs(aq)do if a9==a7 then table.remove(aq,a8)break end end end
end function ag.GetCurrentDungeonName()return aI end function ag.
OnDungeonNameChanged(a7)if type(a7)~='function'then return function()end end
table.insert(az,a7)return function()for a8,a9 in ipairs(az)do if a9==a7 then
table.remove(az,a8)break end end end end function ag.IsInLobby()return aB end
function ag.OnLobbyChanged(a7)if type(a7)~='function'then return function()end
end table.insert(aC,a7)return function()for a8,a9 in ipairs(aC)do if a9==a7 then
table.remove(aC,a8)break end end end end local a7 function ag.SetRealPlayerLevel
(a8)local a9=tonumber(tostring(a8 or''):match'%d+')if a9 and a9>0 then a7=
tostring(a9)_G.RealPlayerLevel=a7 end end function ag.GetRealPlayerLevel()return
a7 or _G.RealPlayerLevel end local a8 aN=function()if not al or aO~=nil then
return end for a9,b in pairs(as)do if b and b.Root and b.Root.Parent then local
ba=false if b.Room and type(b.Room.Name)=='string'and string.find(string.lower(b
.Room.Name),'boss')then ba=true elseif string.find(string.lower(a9.Name),'boss')
then ba=true elseif a9.Parent and string.find(string.lower(a9.Parent.Name),
'boss')then ba=true end if ba then aO=b.Root.Position return end end end for a9,
b in pairs(as)do if b and b.Root and b.Root.Parent then aO=b.Root.Position
return end end end local a9=function(a9)if al==a9 then return end al=a9 if a9
then an+=1 aO=nil a2()aN()for b=#ao,1,-1 do pcall(ao[b],an)end else aO=nil end
for b=#am,1,-1 do pcall(am[b],al)end aM()end function ag.GetBossSpawnPosition()
if aO then return aO end aN()return aO end function ag.SetBossSpawnPosition(b)aO
=b end local function b()if not ac then return end local ba=ac:FindFirstChild
'PlayerGui'if not ba then a8=nil a9(false)return end local bb=ba:FindFirstChild(
'bossHealth',true)if bb then if bb~=a8 then a8=bb if a8:IsA'ScreenGui'then aR(a8
:GetPropertyChangedSignal'Enabled':Connect(b))elseif a8:IsA'GuiObject'then aR(a8
:GetPropertyChangedSignal'Visible':Connect(b))end end local bc=if bb:IsA
'ScreenGui'then bb.Enabled elseif bb:IsA'GuiObject'then bb.Visible else true a9(
bc)else a8=nil a9(false)end end task.spawn(function()if not ac then return end
local ba=ac:WaitForChild('PlayerGui',30)if not ba then return end aR(ba.
DescendantAdded:Connect(b))aR(ba.DescendantRemoving:Connect(b))b()while ab.
IsActive()and task.wait(0.5)do b()end end)local ba,bb={}local bc=function()if bb
then return bb end pcall(function()local bc=ac or game:GetService'Players'.
LocalPlayer local bd=bc and bc:FindFirstChild'PlayerScripts'local be=bd and bd:
FindFirstChild'PlayerModule'if be then bb=require(be):GetControls()end end)
return bb end function ag.DisableControls(bd)bd=bd or'default'ba[bd]=true local
be=bc()if be and type(be.Disable)=='function'then pcall(function()be:Disable()
end)end end function ag.EnableControls(bd)bd=bd or'default'ba[bd]=nil if next(ba
)~=nil then return end local be=bc()if be and type(be.Enable)=='function'then
pcall(function()be:Enable()end)end end ab.Register(function()if aP then aP:
Disconnect()aP=nil end for bd,be in ipairs(aE)do pcall(function()be:Disconnect()
end)end table.clear(aE)table.clear(ba)local bd=bc()if bd and type(bd.Enable)==
'function'then pcall(function()bd:Enable()end)end aL()end)return ag end function
a.g()local aa,ab,ac,ad,ae,af=a.load'b',a.load'f',{},{},{},'Lobby'function ac.
GetCurrentZone()return ab.IsInLobby()and'Lobby'or'Dungeon'end function ac.
IsInZone(ag)if ag=='Global'then return true end return ac.GetCurrentZone()==ag
end function ac.IsLobby()return ac.GetCurrentZone()=='Lobby'end function ac.
IsDungeon()return ac.GetCurrentZone()=='Dungeon'end function ac.Register(ag)if
not ag or type(ag.Name)~='string'or not ag.Zone then return end ad[ag.Name]=ag
if ac.IsInZone(ag.Zone)and ag.OnEnter then task.spawn(function()pcall(ag.OnEnter
)end)end end function ac.Unregister(ag)ad[ag]=nil end function ac.Guard(ag,ah,ai
)return function(...)if not ac.IsInZone(ag)then return ai end return ah(...)end
end function ac.OnZoneChanged(ag)if type(ag)=='function'then table.insert(ae,ag)
end end local ag=function(ag)local ah=ag and'Lobby'or'Dungeon'if ah==af then
return end local ai=af af=ah for aj,ak in pairs(ad)do if ak.Zone~='Global'and ak
.Zone==ai and ak.OnLeave then task.spawn(function()pcall(ak.OnLeave)end)end end
for aj,ak in pairs(ad)do if ak.Zone~='Global'and ak.Zone==ah and ak.OnEnter then
task.spawn(function()pcall(ak.OnEnter)end)end end for aj,ak in ipairs(ae)do task
.spawn(function()pcall(ak,ah,ai)end)end end af=ac.GetCurrentZone()ab.
OnLobbyChanged(function(ah)ag(ah)end)aa.Register(function()table.clear(ad)table.
clear(ae)end)return ac end function a.h()local aa,ab,ac={},{},false function aa.
SetLocked(ad)ac=ad and true or false end function aa.IsLocked()return ac end
function aa.Register(ad,ae,af)if type(ad)~='string'or type(ae)~='function'or
type(af)~='function'then return end ab[ad]={setEnabled=ae,isEnabled=af}end
function aa.EnableExclusive(ad)if ac then return end for ae,af in pairs(ab)do if
ae~=ad and af.isEnabled()then pcall(af.setEnabled,false)end end end function aa.
IsEnabled(ad)local ae=ab[ad]return ae~=nil and ae.isEnabled()end return aa end
function a.i()local aa,ab=a.load'e',a.load'f'local ac,ad=aa.player,{}function ad
.Validate(ae)if not ae then return false end local af=ae.Model if not af or not
af.Parent or af==ac.Character then return false end local ag=ae.Humanoid if not
ag or not ag.Parent then ag=af:FindFirstChildOfClass'Humanoid'ae.Humanoid=ag end
if not ag or ag.Health<=0 then return false end local ah=ae.Root if not ah or
not ah.Parent then ah=af:FindFirstChild'HumanoidRootPart'or af.PrimaryPart if
not ah then for ai,aj in ipairs(af:GetDescendants())do if aj:IsA'BasePart'then
ah=aj break end end end if not ah then return false end ae.Root=ah end return
true end function ad.Scan()local ae,af={},ab.GetTrackedEnemyData()for ag,ah in
ipairs(af)do if ad.Validate(ah)then table.insert(ae,ah)end end if#ae==0 and ab.
ForceRescan then ab.ForceRescan()af=ab.GetTrackedEnemyData()for ag,ah in ipairs(
af)do if ad.Validate(ah)then table.insert(ae,ah)end end end return ae end return
ad end function a.j()local aa={}function aa.SelectBestTarget(ab,ac,ad)local ae,
af,ag=(math.huge)for ah,ai in ipairs(ac)do if ad and ad()then return nil,nil,nil
,nil,math.huge end local aj=ai.Root if aj and aj.Parent then local ak=aj.
Position local al,am=ak.X-ab.X,ak.Z-ab.Z local an=al*al+am*am if an<ae then ae=
an af=ai ag=ak end end end local ah=ae<math.huge and math.sqrt(ae)or math.huge
return af,nil,nil,ag,ah end return aa end function a.k()local aa,ab,ac,ad,ae,af,
ag,ah,ai=a.load'j',a.load'i',{},{},1,6 function ac.GetTarget()return ag end
function ac.GetPathInstance()return ah end function ac.GetWaypoints()return ad
end function ac.GetWaypointIndex()return ae end function ac.SetWaypointIndex(aj)
ae=math.clamp(aj,1,math.max(1,#ad))end function ac.AdvanceWaypointIndex(aj)if
not ad or#ad==0 then return end local ak=ad[ae]if ak then local al=Vector3.new(
ak.Position.X-aj.X,0,ak.Position.Z-aj.Z).Magnitude if al<=3.5 then ae=math.min(#
ad+1,ae+1)end end end function ac.GetLastPathDestPos()return ai end function ac.
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
ac end function a.l()local aa=a.load'e'local ab,ac=aa.player,{}local ad=function
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
end function a.m()local aa,ab,ac,ad,ae,af,ag={},0.85,0,2,{},64 function aa.
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
aA.Unit end end local az=game:GetService'Players'.LocalPlayer local aA=az and az
.Character local aB=aA and(aA:FindFirstChild'HumanoidRootPart'or aA.PrimaryPart)
if aB and ax then local aC=Vector3.new(aB.Position.X-ax.Position.X,0,aB.Position
.Z-ax.Position.Z)if aC.Magnitude>0.1 then return aC.Unit end end return Vector3.
new(0,0,-1)end local aA=function(aA)if not aA or not aA.Instance or not aA.
Instance.Parent then return nil end local aB=aA.Instance local aC=aA.Name or(aB
and aB.Name)or''local aD,aE=av(aC),aA.IsTrajectory==true local aF,aG=aE and ad
or ac if al(aC)then local aH,aI=(au())if aB:IsA'BasePart'then aI=aw(aB)and aB or
nil elseif aB:IsA'Model'then if aB.PrimaryPart and aw(aB.PrimaryPart)then aI=aB.
PrimaryPart else for aJ,aK in ipairs(aB:GetDescendants())do if aK:IsA'BasePart'
and aw(aK)and aK.Parent then aI=aK break end end end end if not aI then return
nil end local aJ=aI.Position local aK={radius=aH,cx=aJ.X,cz=aJ.Z,part=aI,
isTrajectory=false,isIceSpikes=true}return{zones={aK},center=Vector3.new(aJ.X,0,
aJ.Z),boundingRadius=aH+aF}end if ao(aC)then local aH if aB:IsA'BasePart'then aH
=aw(aB)and aB or nil elseif aB:IsA'Model'then if aB.PrimaryPart and aw(aB.
PrimaryPart)then aH=aB.PrimaryPart else for aI,aJ in ipairs(aB:GetDescendants())
do if aJ:IsA'BasePart'and aw(aJ)and aJ.Parent then aH=aJ break end end end end
if not aH then return nil end local aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aR=aH.Position,
az(aB,aH),aA.SpawnClock or os.clock(),{},10,11,3,22,an,0.4 local aS=(aM-1)*aP
for aT=1,aM do local aU=(aT-1)*aP local aV,aW,aX=Vector3.new(aI.X,0,aI.Z)+aJ*aU,
aN+(aT-1)*aO,aK+aQ+(aT-1)*aR table.insert(aL,{radius=aW,cx=aV.X,cz=aV.Z,part=aH,
expireTime=aX,isTrajectory=false,isSecondBossChain=true,circleIndex=aT})end
local aT,aU=Vector3.new(aI.X,0,aI.Z)+aJ*(aS/2),aN+(aM-1)*aO local aV,aW=(aS/2)+
aU+aF,aK+aQ+(aM-1)*aR if aA then aA.MaxExpireTime=aW aA.IsSyntheticChain=true
end return{zones=aL,center=aT,boundingRadius=aV,maxExpireTime=aW}end if as(aC)
then return nil end if at(aC)then local aH if aB:IsA'BasePart'then aH=aw(aB)and
aB or nil elseif aB:IsA'Model'then aH=aB.PrimaryPart or aB:
FindFirstChildWhichIsA'BasePart'if not aH or not aw(aH)then for aI,aJ in ipairs(
aB:GetDescendants())do if aJ:IsA'BasePart'and aw(aJ)and aJ.Parent then aH=aJ
break end end end end if not aH then return nil end local aI,aJ,aK=aH.Position,
aH.Size,aH:FindFirstChildWhichIsA('SpecialMesh',true)if aK then aJ=Vector3.new(
aJ.X*math.abs(aK.Scale.X),aJ.Y*math.abs(aK.Scale.Y),aJ.Z*math.abs(aK.Scale.Z))
end local aL={aJ.X,aJ.Y,aJ.Z}table.sort(aL)local aM,aN=math.clamp(aL[2],6,60),
math.clamp(aL[3],8,80)local aO,aP=aM/2+aF,aN/2+aF local aQ={half=Vector3.new(aO,
0,aP),cframe=aH.CFrame,part=aH,cx=aI.X,cz=aI.Z,isTrajectory=aE,isBigSpike=true}
return{zones={aQ},center=Vector3.new(aI.X,0,aI.Z),boundingRadius=math.sqrt(aO*aO
+aP*aP)}end if aB:IsA'BasePart'then if not aw(aB)then return nil end aG={aB}else
aG={}for aH,aI in ipairs(aB:GetDescendants())do if#aG>=af then break end if aI:
IsA'BasePart'and aw(aI)and aI.Parent then aG[#aG+1]=aI end end if#aG==0 then
return nil end end local aH,aI,aJ,aK,aL={},math.huge,-math.huge,math.huge,-math.
huge for aM,aN in ipairs(aG)do local aO,aP=aN.Position,aN.Size local aQ=math.
max(aP.X,aP.Y,aP.Z)/2+aF aI=math.min(aI,aO.X-aQ)aJ=math.max(aJ,aO.X+aQ)aK=math.
min(aK,aO.Z-aQ)aL=math.max(aL,aO.Z+aQ)local aR=ax(aN,aD,aE)if aR then aR.part=aN
aR.isTrajectory=aE aH[#aH+1]=aR end end if#aH==0 then return nil end local aM,aN
,aO,aP=(aI+aJ)/2,(aK+aL)/2,(aJ-aI)/2,(aL-aK)/2 return{zones=aH,center=Vector3.
new(aM,0,aN),boundingRadius=math.sqrt(aO*aO+aP*aP)}end local aB=function(aB)
local aC=aB and aB.HazardZones if not aC then aC=aA(aB)if aC and aB then aB.
HazardZones=aC end end return aC end function aa.GetHazardZones(aC)return aB(aC)
end function aa.GetNearbyHazards(aC,aD)local aE=ag if not aE then return{}end aD
=aD or 65 local aF,aG,aH={},aC.X,aC.Z for aI,aJ in pairs(aE.GetActiveHazardsMap(
))do local aK,aL=aJ.Instance,aB(aJ)if aL then local aM,aN=aL.center.X,aL.center.
Z if aK and aK.Parent then local aO=aK:IsA'BasePart'and aK or aK.PrimaryPart or
aK:FindFirstChildWhichIsA'BasePart'if aO then aM=aO.Position.X aN=aO.Position.Z
end end local aO,aP=aG-aM,aH-aN local aQ,aR=aO*aO+aP*aP,aD+aL.boundingRadius if
aQ<=aR*aR then table.insert(aF,aJ)end end end return aF end function aa.
IsPointInAnyHazard(aC,aD,aE,aF)local aG=ag if not aG then return false,nil,nil
end aE=aE or 0 local aH,aI,aJ,aK=math.huge,aF or aG.GetActiveHazardsMap()for aL,
aM in pairs(aI)do local aN=aM.Instance or(typeof(aL)=='Instance'and aL)if aD and
(aD==aN or(aN and aD.Name==aN.Name))then continue end local aO=aM.Name or(aN and
aN.Name)or''if aq(aO)or at(aO)then continue end local aP=aB(aM)if not aP then
continue end local aQ,aR=aP.center.X,aP.center.Z if aN and aN.Parent then local
aS=aN:IsA'BasePart'and aN or aN.PrimaryPart or aN:FindFirstChildWhichIsA
'BasePart'if aS then aQ=aS.Position.X aR=aS.Position.Z end end local aS,aT=aC.X-
aQ,aC.Z-aR local aU,aV=aS*aS+aT*aT,aP.boundingRadius+aE if aU>aV*aV then
continue end local aW=aM.IsTrajectory==true for aX=1,#aP.zones do local aY=aP.
zones[aX]if aw(aY.part)and ay(aC,aY,aE,aW or aY.isTrajectory)then local aZ=(aC-
aY.part.Position).Magnitude if aZ<aH then aH=aZ aJ=aM aK=aY.part end break end
end end return aK~=nil,aJ,aK end return aa end function a.n()local aa,ab,ac=a.
load'e',a.load'b',a.load'm'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.
RunService or game:GetService'RunService',aa.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),Color3.fromRGB(0,230,90),0.55,0.25
local aq=function()local aq=ae and ae.Character if not aq then return nil end
local ar=aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart if not ar then
return nil end return ar.Position.Y-2.5 end function af.BindDetection(ar)ao=ar
or nil end local ar function af.BindTrajectory(as)ar=as or nil end function af.
IsEnabled()return ag end local as=function(as,at)local au,av,aw=as.ad,as.zone,as
.part local ax=as.anchorPart or aw if not au or not au.Parent or not ax or not
ax.Parent then return end local ay=av and(av.isSecondBossChain or(as.hazardInfo
and as.hazardInfo.IsSyntheticChain))local az=(ay and av.cx and av.cz and Vector3
.new(av.cx,0,av.cz))or(aw and aw.Parent and aw.Position)or((av and av.cx and av.
cz)and Vector3.new(av.cx,0,av.cz))if not az then return end local aA=Vector3.
new(az.X,at or az.Y,az.Z)if as.isCircle then local aB=CFrame.new(aA)*CFrame.
Angles(math.rad(90),0,0)au.CFrame=(ax==workspace.Terrain)and aB or ax.CFrame:
ToObjectSpace(aB)else local aB if av and av.isBigSpike then local aC=ar and ar.
GetHazardDirection and ar.GetHazardDirection(as.hazardInfo)if aC and aC.
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
end)ab.Register(function()af.ClearAll()end)return af end function a.o()local aa,
ab,ac=a.load'e',a.load'b',a.load'm'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,
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
return ag end function a.p()local aa,ab,ac,ad,ae=a.load'e',a.load'b',a.load'm',a
.load'o',a.load'n'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=aa.
RunService or game:GetService'RunService',aa.player,{},false,45,{
secondbossmovingbeam=80},{firstbossbigspike=28,firstbossseekingspikes=10},{},
0.85,Color3.fromRGB(255,140,0),0.65,0.2,3.5,{firstbossseekingspikes=
'look_vector',firstbossbigspike='look_vector',firstbossbeampart='look_vector',
secondbossmovingbeam='look_vector'},function(af)if not af or type(af)~='string'
then return false end local ag=af:lower():gsub('%s+','')return string.find(ag,
'firstbossbeampart',1,true)~=nil end,function(af)if not af then return
'seeking_spike'end local ag=typeof(af)=='string'and af or(af.Name or'')local ah=
ag:lower():gsub('%s+','')if not string.find(ah,'firstbossbeampart',1,true)then
if string.find(ah,'bigspike',1,true)and not string.find(ah,'seekingspike',1,true
)then return'big_spike'end if string.find(ah,'seekingspike',1,true)then return
'seeking_spike'end return nil end if typeof(af)=='Instance'then local ai=af:
FindFirstChildWhichIsA('Beam',true)if ai then if ai.Width0>=25 or ai.Width1>=25
then return'big_spike'else return'seeking_spike'end end local aj=af:IsA
'BasePart'and af.Position or(af:IsA'Model'and af:GetPivot().Position)if aj then
for ak,al in ipairs(workspace:GetChildren())do local am=al.Name:lower():gsub(
'%s+','')if string.find(am,'firstbossbigspike',1,true)then local an=al:IsA
'BasePart'and al.Position or(al:IsA'Model'and al:GetPivot().Position)if an and(
an-aj).Magnitude<15 then return'big_spike'end elseif string.find(am,
'seekingspike',1,true)then local an=al:IsA'BasePart'and al.Position or(al:IsA
'Model'and al:GetPivot().Position)if an and(an-aj).Magnitude<15 then return
'seeking_spike'end end end end end return'seeking_spike'end local av,aw=function
(av,aw)if not av or type(av)~='string'then return false end local ax=av:lower():
gsub('%s+','')if#ax==0 or string.find(ax,'seekingspike',1,true)then return false
end if string.find(ax,'firstbossbeampart',1,true)then return au(aw)=='big_spike'
end return string.find(ax,'firstbossbigspike',1,true)~=nil or string.find(ax,
'bigspike',1,true)~=nil end,function(av,aw)if not av or type(av)~='string'then
return false end local ax=av:lower():gsub('%s+','')if#ax==0 or string.find(ax,
'firstbossbigspike',1,true)then return false end if string.find(ax,
'firstbossbeampart',1,true)then return au(aw)=='seeking_spike'end return string.
find(ax,'firstbossseekingspikes',1,true)~=nil or string.find(ax,'seekingspike',1
,true)~=nil end local ax,ay=function(ax,ay)return av(ax,ay)or aw(ax,ay)end,
function(ax)if not ax or not ax.Parent then return nil,nil,nil,nil end local ay,
az=((ax.Name or''):lower())if at(ay)then az=ax:IsA'BasePart'and ax or ax:
FindFirstChildWhichIsA'BasePart'end if not az then local aA=ax:IsA'BasePart'and
ax.Position or(ax:IsA'Model'and ax:GetPivot().Position)if aA then local aB,aC=35
,av(ax.Name,ax)and'big_spike'or'seeking_spike'for aF,aG in ipairs(workspace:
GetChildren())do local aH=aG.Name:lower()if at(aH)or string.find(aH,'beampart',1
,true)then if au(aG)==aC then local aI=aG:IsA'BasePart'and aG.Position or(aG:IsA
'Model'and aG:GetPivot().Position)if aI then local aJ=(aI-aA).Magnitude if aJ<aB
then aB=aJ az=aG end end end end end end end if not az then return nil,nil,nil,
nil end local aA=az:FindFirstChild('Attachment2',true)if not aA or not aA:IsA
'Attachment'then for aB,aC in ipairs(az:GetDescendants())do if aC:IsA
'Attachment'and aC.Name~='Attachment0'and aC.Name~='Attachment1'then aA=aC break
end end end local aB,aC=az.Position,aA and aA.WorldPosition if aC and aB then
local aF=aC-aB local aG=Vector3.new(aF.X,0,aF.Z)local aH=aG.Magnitude if aH>5
then local aI=aG.Unit return aH,aI,aB,aC end end return nil,nil,nil,nil end
local az=function(az)if not az then return nil end local aA,aB,aC,aF=0,0,0,{}if
az:IsA'BasePart'then table.insert(aF,az)else for aG,aH in ipairs(az:
GetDescendants())do if aH:IsA'BasePart'then table.insert(aF,aH)end end end for
aG,aH in ipairs(aF)do local aI,aJ=aH.Size,aH:FindFirstChildWhichIsA(
'SpecialMesh',true)if aJ then aI=Vector3.new(aI.X*math.abs(aJ.Scale.X),aI.Y*math
.abs(aJ.Scale.Y),aI.Z*math.abs(aJ.Scale.Z))end aA=math.max(aA,aI.X)aB=math.max(
aB,aI.Y)aC=math.max(aC,aI.Z)end if aA<=0 and aB<=0 and aC<=0 then return nil end
local aG={aA,aB,aC}table.sort(aG)local aH=aG[2]if aH<2 then aH=math.max(aG[1],aG
[2])end return aH end local aA,aB=function(aA)if al.firstbossbigspike then
return al.firstbossbigspike end if cachedBigSpikeWidth then return
cachedBigSpikeWidth end if aA and aA.Parent then local aB=aA:
FindFirstAncestorWhichIsA'Model'or aA local aC=az(aB)if aC and aC>=6 then
cachedBigSpikeWidth=aC return cachedBigSpikeWidth end end return 28 end local aC
=function(aC)if al.firstbossseekingspikes then return al.firstbossseekingspikes
end if aB then return aB end if aC and aC.Parent then local aF=aC:
FindFirstAncestorWhichIsA'Model'or aC local aG=az(aF)if aG and aG>=2 then aB=aG
return aB end end return 10 end local aF,aG,aH,aI=function(aF,aG)if av(aF,aG)
then return aA(aG)else return aC(aG)end end,function(aF)if not aF then return aj
end local aG=aF.Instance local aH=aF.Name or(aG and aG.Name)or''local aI=aH:
lower():gsub('%s+','')if ax(aH,aG)then local aJ=am[aF]if aJ and aJ.beamLength
and aJ.beamLength>5 then return aJ.beamLength end local aK=ay(aG)if aK and aK>5
then return aK end if ak.firstbossbigspike then return ak.firstbossbigspike end
return 60 end if ak[aI]then return ak[aI]end for aJ,aK in pairs(ak)do if string.
find(aI,aJ,1,true)then return aK end end return aj end,function(aF,aG)if not aF
or not aG or not aG.Parent then return nil end local aH,aI=(aF:lower():gsub(
'%s+',''))if as[aH]then aI=as[aH]else for aJ,aK in pairs(as)do if string.find(aH
,aJ,1,true)then aI=aK break end end end if not aI then return nil end if aI==
'look_vector'then local aJ=aG.CFrame local aK=aJ.LookVector local aL=Vector3.
new(aK.X,0,aK.Z)if aL.Magnitude>0.05 then return aL.Unit,aI end elseif aI==
'target_player'or aI==true then local aJ=game:GetService'Players'.LocalPlayer
local aK=aJ and aJ.Character local aL=aK and(aK:FindFirstChild'HumanoidRootPart'
or aK.PrimaryPart)if aL then local aM=aL.Position-aG.Position local aN=Vector3.
new(aM.X,0,aM.Z)if aN.Magnitude>0.1 then return aN.Unit,aI end end end return
nil end,function()local aF=game:GetService'Players'.LocalPlayer local aG=aF and
aF.Character if not aG then return nil end local aH=aG:FindFirstChild
'HumanoidRootPart'or aG.PrimaryPart if not aH then return nil end return aH.
Position.Y-2.5 end function ah.BindDetection(aJ)data=aJ or nil end function ah.
IsEnabled()return ai end function ah.GetPredictionLength()return aj end function
ah.SetPredictionLength(aJ)if type(aJ)=='number'and aJ>=5 then aj=aJ ah.
RefreshAll()end end function ah.GetHazardPredictionLength(aJ)return aG(aJ)end
function ah.GetCustomLength(aJ)if not aJ then return nil end local aK=aJ:lower()
:gsub('%s+','')return ak[aK]end function ah.SetCustomLength(aJ,aK)if not aJ then
return end local aL=aJ:lower():gsub('%s+','')if type(aK)=='number'and aK>=5 then
ak[aL]=aK else ak[aL]=nil end ah.RefreshAll()end function ah.
GetSecondBossBeamLength()return ak.secondbossmovingbeam or 80 end function ah.
SetSecondBossBeamLength(aJ)if type(aJ)=='number'and aJ>=5 then ak.
secondbossmovingbeam=aJ else ak.secondbossmovingbeam=nil end ah.RefreshAll()end
function ah.GetFirstBossBigSpikeWidth()return al.firstbossbigspike or(
cachedBigSpikeWidth or 28)end function ah.SetFirstBossBigSpikeWidth(aJ)if type(
aJ)=='number'and aJ>0 then al.firstbossbigspike=math.clamp(aJ,6,80)else al.
firstbossbigspike=nil end cachedBigSpikeWidth=nil ah.RefreshAll()end function ah
.GetFirstBossSeekingSpikeWidth()return al.firstbossseekingspikes or(aB or 10)end
function ah.SetFirstBossSeekingSpikeWidth(aJ)if type(aJ)=='number'and aJ>0 then
al.firstbossseekingspikes=math.clamp(aJ,4,40)else al.firstbossseekingspikes=nil
end aB=nil ah.RefreshAll()end function ah.GetCustomWidth(aJ)if not aJ then
return nil end local aK=aJ:lower():gsub('%s+','')return al[aK]end function ah.
SetCustomWidth(aJ,aK)if not aJ then return end local aL=aJ:lower():gsub('%s+',''
)if type(aK)=='number'and aK>0 then al[aL]=math.clamp(aK,4,100)else al[aL]=nil
end ah.RefreshAll()end function ah.IsHazardMoving(aJ)if not aJ then return false
end local aK=am[aJ]return aK and aK.isMoving==true end function ah.
GetHazardDirection(aJ)if not aJ then return nil end local aK=am[aJ]return aK and
aK.dir or nil end local aJ,aK=function(aJ,aK)local aL=aJ.Instance if not aL or
not aL.Parent then return nil,4 end local aM,aN=ac.GetTrajectoryMargin and ac.
GetTrajectoryMargin()or 2,aJ.Name or(aL and aL.Name)or''if ax(aN,aL)then local
aO=am[aJ]local aP=(aO and aO.mainPart)or(aL:IsA'BasePart'and aL or aL.
PrimaryPart or aL:FindFirstChildWhichIsA'BasePart')local aQ,aR=(aO and aO.
beamStartPos)or(aP and aP.Position)or aL.Position,aF(aN,aP)local aS=math.max(1,
aR+aM*2)return Vector3.new(aQ.X,0,aQ.Z),aS end local aO,aP={},ac.IsForceCircle
and ac.IsForceCircle(aN)if aL:IsA'BasePart'then if aL.Transparency<=an then
table.insert(aO,aL)end else for aQ,aR in ipairs(aL:GetDescendants())do if aR:IsA
'BasePart'and aR.Parent and aR.Transparency<=an then table.insert(aO,aR)end end
end if#aO==0 then return nil,4 end local aQ,aR,aS,aT=Vector3.new(-aK.Z,0,aK.X),
math.huge,-math.huge,0 for aU,aV in ipairs(aO)do local aW,aX,aY=aV.Position,aV.
Size,0 if aP or(aV:IsA'Part'and(aV.Shape==Enum.PartType.Ball or aV.Shape==Enum.
PartType.Cylinder))then aY=math.max(aX.X,aX.Y,aX.Z)/2 else local aZ=aV.CFrame
local a_,a0,a1,a2,a3,a4=aZ.RightVector,aZ.UpVector,aZ.LookVector,aX.X/2,aX.Y/2,
aX.Z/2 aY=a2*math.abs(a_.X*aQ.X+a_.Z*aQ.Z)+a3*math.abs(a0.X*aQ.X+a0.Z*aQ.Z)+a4*
math.abs(a1.X*aQ.X+a1.Z*aQ.Z)end local aZ=aW.X*aQ.X+aW.Z*aQ.Z aR=math.min(aR,aZ-
aY)aS=math.max(aS,aZ+aY)local a_=aW.X*aK.X+aW.Z*aK.Z aT+=a_ end local aU,aV,aW=
math.max(1,(aS-aR)+aM*2),(aR+aS)/2,aT/#aO local aX=aK*aW+aQ*aV return aX,aU end,
function(aJ,aK,aL,aM,aN,aO,aP)if not aK or not aK.Parent or not aJ or not aJ.
Parent then return end local aQ=aO/2 local aR=Vector3.new(aL.X+aM.X*aQ,aN or aL.
Y,aL.Z+aM.Z*aQ)local aS=aR+Vector3.new(aM.X,0,aM.Z)local aT=CFrame.lookAt(aR,aS)
aJ.CFrame=(aJ.Adornee==workspace.Terrain)and aT or aK.CFrame:ToObjectSpace(aT)aJ
.Size=Vector3.new(aP,aq,aO)if not aJ.Visible then aJ.Visible=true end end local
aL=function()if not ai then return end local aL,aM,aN=false,os.clock(),aI()for
aO,aP in pairs(am)do local aQ=aO.Instance if not aQ or not aQ.Parent then ah.
DetachTrajectoryVisuals(aO)else aL=true local aR,aS=aP.mainPart,aO.Name or(aQ
and aQ.Name)local aT=ad and ad.IsChasingProjectile and ad.IsChasingProjectile(aS
)if aT then if aP.ad and aP.ad.Visible then aP.ad.Visible=false end aP.isMoving=
false aO.IsTrajectory=false elseif aR and aR.Parent then local aU,aV=aR.Position
,aM-(aP.lastClock or aM)if aP.isBossSpike then if not aP.beamFound then local aW
,aX,aY,aZ=ay(aR)if aW and aX then aP.beamFound=true aP.beamLength=aW aP.beamDir=
aX aP.beamStartPos=aY aP.beamTargetPos=aZ aP.dir=aX end end if aP.beamDir then
aP.dir=aP.beamDir end aP.isMoving=true end if aV>=0.035 then local aW=aU-(aP.
lastPos or aU)local aX,aY=aW.Magnitude/aV,Vector3.new(aW.X,0,aW.Z)local aZ,a_=aY
.Magnitude/aV,aP.isMoving==true if aZ>=ar then aP.isMoving=true if not aP.
isBossSpike then aP.dir=aY.Unit end else if not aP.isInstant and not aP.
isBossSpike and aV>=0.25 and aX<ar then aP.isMoving=false end end if aP.isMoving
~=a_ then aO.IsTrajectory=aP.isMoving aO.HazardZones=nil if data and data.
UpdateHazardVisualColor then pcall(data.UpdateHazardVisualColor,aO,aP.isMoving)
end if ae and ae.UpdateHazardVisualColor then pcall(ae.UpdateHazardVisualColor,
aO,aP.isMoving)end end aP.lastPos=aU aP.lastClock=aM end if aP.isMoving and aP.
dir and aP.ad then local aW,aX=aJ(aO,aP.dir)if aW then local aY=aG(aO)aK(aP.ad,
aR,aW,aP.dir,aN,aY,aX)end else if aP.ad and aP.ad.Visible then aP.ad.Visible=
false end end end end end if not aL and heartbeatConnection then
heartbeatConnection:Disconnect()heartbeatConnection=nil end end local aM=
function()if not heartbeatConnection and ai then heartbeatConnection=af.
Heartbeat:Connect(aL)end end function ah.DetachTrajectoryVisuals(aN)if not aN
then return end local aO=am[aN]if not aO then return end if aO.ad then pcall(
function()aO.ad:Destroy()end)aO.ad=nil end if aO.connections then for aP,aQ in
ipairs(aO.connections)do pcall(function()aQ:Disconnect()end)end table.clear(aO.
connections)end am[aN]=nil end function ah.AttachTrajectoryVisuals(aN)if not ai
or not aN then return end if am[aN]then ah.DetachTrajectoryVisuals(aN)end local
aO=aN.Instance if not aO or not aO.Parent then return end local aP=aN.Name or(aO
and aO.Name)if ad and ad.IsChasingProjectile and ad.IsChasingProjectile(aP)then
aN.IsTrajectory=false return end local aQ if aO:IsA'BasePart'then aQ=aO else aQ=
aO.PrimaryPart or aO:FindFirstChildWhichIsA'BasePart'if not aQ then for aR,aS in
ipairs(aO:GetDescendants())do if aS:IsA'BasePart'and aS.Parent then aQ=aS break
end end end end if not aQ or not aQ.Parent then return end local aR,aS=aG(aN),
Instance.new'BoxHandleAdornment'aS.Name='HazardTrajectoryCorridor'aS.Adornee=
workspace.Terrain aS.Size=Vector3.new(4,aq,aR)aS.Color3=ao aS.Transparency=ap aS
.ZIndex=1 aS.AlwaysOnTop=true aS.Visible=false aS.Parent=workspace.Terrain local
aT=aN.Name or(aO and aO.Name)local aU,aV=at(aT),ax(aT,aO)local aW=aV and(av(aT,
aO)and'big_spike'or'seeking_spike')or nil if aV then if not aU then for aX,aY in
pairs(am)do if aY and aY.isBeam and aY.spikeType==aW then aY.linkedSpike=aQ aN.
IsTrajectory=false return end end else for aX,aY in pairs(am)do if aY and not aY
.isBeam and aY.spikeType==aW then aN.IsTrajectory=false return end end end end
local aX={}if not aU then local aY=aQ:GetPropertyChangedSignal'Transparency':
Connect(function()if aQ.Parent and aQ.Transparency>an then pcall(function()aS:
Destroy()end)end end)table.insert(aX,aY)end local aY local aZ=aQ.AncestryChanged
:Connect(function(aZ,a_)if not a_ then if aY and aY.linkedSpike and aY.
linkedSpike.Parent and aY.linkedSpike.Transparency<=an then local a0=aY.
linkedSpike.AncestryChanged:Connect(function(a0,a1)if not a1 then pcall(function
()aS:Destroy()end)end end)table.insert(aX,a0)return end pcall(function()aS:
Destroy()end)end end)table.insert(aX,aZ)local a_,a0=aH(aT,aQ)local a1,a2,a3,a4,
a5=(a_~=nil)if aV then a2,a3,a4,a5=ay(aO)if a3 then a_=a3 a1=true end end aY={ad
=aS,connections=aX,mainPart=aQ,lastPos=aQ.Position,lastClock=os.clock(),velocity
=Vector3.zero,dir=a_,isMoving=a1,isInstant=a1,instantMode=a0,isBossSpike=aV,
isBigSpike=av(aT,aO),isSeekingSpike=aw(aT,aO),spikeType=aW,isBeam=aU,beamFound=
a2~=nil,beamLength=a2,beamDir=a3,beamStartPos=a4 or aQ.Position,beamTargetPos=a5
,linkedSpike=nil}if aU and aW then local a6=aW=='big_spike'and
'firstbossbigspike'or'seekingspike'for a7,a8 in ipairs(workspace:GetChildren())
do local a9=a8.Name:lower():gsub('%s+','')if string.find(a9,a6,1,true)and not
at(a9)then local b=a8:IsA'BasePart'and a8 or(a8:FindFirstChildWhichIsA'BasePart'
or(a8:IsA'Model'and a8.PrimaryPart))if b then local ba=(b.Position-aQ.Position).
Magnitude if ba<25 then aY.linkedSpike=b break end end end end end am[aN]=aY if
a1 and a_ then aN.IsTrajectory=true aN.HazardZones=nil local a6,a7,a8=aI(),aJ(aN
,a_)local a9=aG(aN)if a7 then aK(aS,aQ,a7,a_,a6,a9,a8)end if data and data.
UpdateHazardVisualColor then pcall(data.UpdateHazardVisualColor,aN,true)end if
ae and ae.UpdateHazardVisualColor then pcall(ae.UpdateHazardVisualColor,aN,true)
end if ad and ad.UpdateHazardVisualColor then pcall(ad.UpdateHazardVisualColor,
aN,true)end end aM()end function ah.ClearAll()if heartbeatConnection then
heartbeatConnection:Disconnect()heartbeatConnection=nil end for aN in pairs(am)
do ah.DetachTrajectoryVisuals(aN)end table.clear(am)end function ah.RefreshAll()
ah.ClearAll()if not ai or not data then return end for aN,aO in pairs(data.
GetActiveHazardsMap())do ah.AttachTrajectoryVisuals(aO)end end function ah.
GetNearbyTrajectories(aN,aO)aO=aO or 65 local aQ,aR,aS={},aN.X,aN.Z for aT,aU in
pairs(am)do if aU.isMoving and aU.dir and aU.mainPart and aU.mainPart.Parent
then local aV,aW=aJ(aT,aU.dir)if aV and aW then local aX,aY,aZ=aG(aT),aV.X,aV.Z
local a_,a0=aR-aY,aS-aZ local a1,a2=a_*a_+a0*a0,aO+aX+(aW/2)if a1<=a2*a2 then
table.insert(aQ,{info=aT,record=aU})end end end end return aQ end function ah.
IsPointInAnyTrajectory(aN,aO,aQ)local aR,aS=aN.X,aN.Z aO=aO or 0 local aT=3 if
aQ then for aU,aV in ipairs(aQ)do local aW,aX=aV.info,aV.record if aX and aX.
isMoving and aX.dir and aX.mainPart and aX.mainPart.Parent then local aY,aZ=aJ(
aW,aX.dir)if aY and aZ then local a_,a0=aG(aW),aX.dir local a1,a2,a3=Vector3.
new(-a0.Z,0,a0.X),aR-aY.X,aS-aY.Z local a4,a5,a6,a7,a8=a2*a0.X+a3*a0.Z,a2*a1.X+
a3*a1.Z,aZ/2,-aT,a_ if aO<=0 then if a4>=a7 and a4<=a8 and math.abs(a5)<=a6 then
return true,aW,a0,aY,aZ end else local a9=0 if a4<a7 then a9=a7-a4 elseif a4>a8
then a9=a4-a8 end local b=math.max(0,math.abs(a5)-a6)if(a9*a9+b*b)<=(aO*aO)then
return true,aW,a0,aY,aZ end end end end end return false,nil,nil,nil,nil end for
aU,aV in pairs(am)do if aV.isMoving and aV.dir and aV.mainPart and aV.mainPart.
Parent then local aW,aX=aJ(aU,aV.dir)if aW and aX then local aY,aZ=aG(aU),aV.dir
local a_,a0,a1=Vector3.new(-aZ.Z,0,aZ.X),aR-aW.X,aS-aW.Z local a2,a3,a4,a5,a6=a0
*aZ.X+a1*aZ.Z,a0*a_.X+a1*a_.Z,aX/2,-aT,aY if aO<=0 then if a2>=a5 and a2<=a6 and
math.abs(a3)<=a4 then return true,aU,aZ,aW,aX end else local a7=0 if a2<a5 then
a7=a5-a2 elseif a2>a6 then a7=a2-a6 end local a8=math.max(0,math.abs(a3)-a4)if(
a7*a7+a8*a8)<=(aO*aO)then return true,aU,aZ,aW,aX end end end end end return
false,nil,nil,nil,nil end function ah.GetActiveTrajectoriesList()local aN={}for
aO,aQ in pairs(am)do if aQ and aQ.isMoving and aQ.dir and aQ.mainPart and aQ.
mainPart.Parent then local aR,aS=aJ(aO,aQ.dir)if aR and aS then local aT,aU=aG(
aO),(aQ.velocity and aQ.velocity.Magnitude)or 0 table.insert(aN,{name=aO.Name or
(aQ.mainPart and aQ.mainPart.Name)or'Trajectory',originX=aR.X,originZ=aR.Z,dirX=
aQ.dir.X,dirZ=aQ.dir.Z,length=aT,width=aS,speed=aU})end end end return aN end
function ah.SetEnabled(aN)ai=aN and true or false if ai then ah.RefreshAll()else
ah.ClearAll()end end ac.OnPaddingChanged(function()if ai then ah.RefreshAll()end
end)ab.Register(function()ah.ClearAll()end)return ah end function a.q()local aa,
ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.load'd',a.load'f',{},{Mob={Min=15,Max=35,
BossArea=false,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=true},
Boss1={Min=25,Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false,
EnableHazardScanner=true},Boss2={Min=25,Max=50,BossArea=false,BossAreaRadius=80,
DisableDodge=false,EnableHazardScanner=true},Boss3={Min=25,Max=50,BossArea=false
,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=true}},{Normal='Mob',[
'Boss 1']='Boss1',['Boss 2']='Boss2',['Boss 3']='Boss3'},{Mob='Normal',Boss1=
'Boss 1',Boss2='Boss 2',Boss3='Boss 3'},{},{}function ad.GetTargetDisplay(aj)
return ag[aj]or'Normal'end function ad.GetTargetKey(aj)return af[aj]or'Mob'end
function ad.GetTargetOptions()return{'Normal','Boss 1','Boss 2','Boss 3'}end
function ad.GetSaveData()return ah end function ad.LoadData(aj)if type(aj)==
'table'then ah=aj else ah={}end aa.contextData=ah for ak,al in ipairs(ai)do
pcall(al)end end function ad.OnDataChanged(aj)if type(aj)~='function'then return
function()end end table.insert(ai,aj)return function()for ak,al in ipairs(ai)do
if al==aj then table.remove(ai,ak)break end end end end local aj=function()aa.
contextData=ah ab.Save()end function ad.GetCombatDistances(ak,al)local am=al or
'Mob'local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak]
[am]then local ao=ah[ak][am]local ap,aq=(type(ao.Min)=='number'and ao.Min>0)and
ao.Min or an.Min,(type(ao.Max)=='number'and ao.Max>0)and ao.Max or an.Max return
ap,aq end return an.Min,an.Max end function ad.GetActiveCombatDistances(ak)local
al,am,an=ac.GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.
IsBossActive()then an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room
and type(ak.Room.Name)=='string'and string.find(string.lower(ak.Room.Name),
'boss')then an=true elseif ak.Model then local ao=string.lower(ak.Model.Name)if
string.find(ao,'boss')then an=true else local ap=ak.Model.Parent if ap and
string.find(string.lower(ap.Name),'boss')then an=true end end end if an then
local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..
tostring(math.clamp(ao,1,3))end end return ad.GetCombatDistances(al,am)end
function ad.GetBossArea(ak,al)local am=al or'Mob'if am=='Mob'then return false,
80 end local an=ae[am]or ae.Boss1 if type(ak)=='string'and#ak>0 and ah[ak]and ah
[ak][am]then local ao=ah[ak][am]local ap,aq=ao.BossArea==true,(type(ao.
BossAreaRadius)=='number'and ao.BossAreaRadius>0)and ao.BossAreaRadius or(an.
BossAreaRadius or 80)return ap,aq end return an.BossArea or false,an.
BossAreaRadius or 80 end function ad.SetBossAreaEnabled(ak,al,am)if not(type(ak)
=='string'and#ak>0)then return end local an=al or'Mob'if an=='Mob'then return
end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][an].BossArea=am and true or
false aj()end function ad.SetBossAreaRadius(ak,al,am)if not(type(ak)=='string'
and#ak>0)then return end local an=al or'Mob'if an=='Mob'then return end if type(
am)~='number'or am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}
ah[ak][an].BossAreaRadius=am aj()end function ad.GetActiveBossArea(ak)local al,
am,an=ac.GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.
IsBossActive()then an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room
and type(ak.Room.Name)=='string'and string.find(string.lower(ak.Room.Name),
'boss')then an=true elseif ak.Model then local ao=string.lower(ak.Model.Name)if
string.find(ao,'boss')then an=true else local ap=ak.Model.Parent if ap and
string.find(string.lower(ap.Name),'boss')then an=true end end end if an then
local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..
tostring(math.clamp(ao,1,3))end end if not an or am=='Mob'then return false,0,
nil end local ao,ap=ad.GetBossArea(al,am)if not ao then return false,ap,nil end
local aq=ac.GetBossSpawnPosition and ac.GetBossSpawnPosition()if not aq and ak
and ak.Root then aq=ak.Root.Position if ac.SetBossSpawnPosition then ac.
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
ad.GetEnableHazardScanner(al,am)end ad.GetEnableEvasion=ad.
GetEnableHazardScanner ad.SetEnableEvasion=ad.SetEnableHazardScanner ad.
IsActiveEvasionEnabled=ad.IsActiveHazardScannerEnabled function ad.
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
return end if ah[ak]then ah[ak]=nil aj()end end return ad end function a.r()
local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.load'e',a.load'f',a.load'b',a.load'm',a
.load'n',a.load'p',a.load'o',a.load'q',game:GetService'Players',game:GetService
'Workspace',game:GetService'ReplicatedStorage'local al,am,an,ao,ap,aq,ar,as,at,
au,av,aw,ax,ay,az,aA,aB,aC,aF,aG,aH,aI=aa.player,{},false,false,true,false,false
,'',false,{},0,{},{},0,0,2,{'abilities','projectiles'},false,{},{
firstbossbeamparticles=true}local aJ,aK,aL,aM,aN,aO,aQ,aR=function()if aC then
return end aC=true for aJ,aK in ipairs(aB)do local aL=ak:FindFirstChild(aK)if aL
then for aM,aN in ipairs(aL:GetChildren())do local aO=(aN.Name or''):lower():
gsub('%s+','')if#aO>0 then aF[aO]=true end end end end end,function(aJ)if not aJ
then return true end local aK=aJ.Name if typeof(aK)=='string'then local aL=aK:
lower()if aL:sub(1,3)=='tm_'or aL:sub(1,3)=='pr_'or aL:sub(1,3)=='dq_'or aL:find
'pathrecord'or aL:find'safespot'or aL:find'hazard'or aL:find'adornment'or aL:
find'debug'or aL:find'targetpart'or aL:find'actualmarker'then return true end
local aM=aJ.Parent while aM and aM~=workspace and aM~=game do local aN=aM.Name
if typeof(aN)=='string'then local aO=aN:lower()if aO:find'pathrecord'or aO:sub(1
,3)=='tm_'or aO:sub(1,3)=='pr_'then return true end end aM=aM.Parent end local
aN=aL:gsub('%s+','')if#aN>0 and aF[aN]==true then return true end if aG[aN]==
true or aG[aK]==true then return true end for aO,aQ in pairs(aG)do if string.
find(aN,aO,1,true)then return true end end end return false end,function(aJ)if
not aJ then return false end if ai:GetPlayerFromCharacter(aJ)then return true
end if ai:FindFirstChild(aJ.Name)then return true end for aK,aL in ipairs(ai:
GetPlayers())do if aJ.Name==aL.Name then return true end local aM=aL.Character
if aM and(aJ==aM or aJ:IsDescendantOf(aM))then return true end end local aK=al
and al.Character if aK and(aJ==aK or aJ:IsDescendantOf(aK))then return true end
return false end,function()local aJ=0 for aK in pairs(au)do aJ+=1 end av=aJ for
aK=#aw,1,-1 do pcall(aw[aK],aJ,aH)end end,0.85,50,0.05,{}local aS,aT,aU=function
(aS)local aT=aR[aS]if aT then aT.active=false aR[aS]=nil end end,function()for
aS,aT in pairs(aR)do if aT then aT.active=false end end table.clear(aR)end,
function(aS)if not aS or type(aS)~='string'then return false end local aT=aS:
lower():gsub('%s+','')return string.find(aT,'firstbossbeampart',1,true)~=nil end
local aV,aW,aX,aY,aZ,a_=function(aV)if not aV then return{}end local aW,aX={},
aU(aV.Name)local aY=function(aY)if aY and aY.Parent and(aY.Transparency<=aN or
aX)then aW[#aW+1]=aY end end if aV:IsA'BasePart'then aY(aV)else for aZ,a_ in
ipairs(aV:GetDescendants())do if a_:IsA'BasePart'and a_.Parent then aY(a_)end
end end return aW end,function(aV)local aW=al and al.Character if not aW then
return 0 end local aX=aW:FindFirstChild'HumanoidRootPart'or aW.PrimaryPart if
not aX then return 0 end local aY,aZ=(aX.Position)if aV:IsA'BasePart'then aZ=aV.
Position elseif aV:IsA'Model'then local a_,a0=pcall(function()return aV:
GetPivot().Position end)if a_ then aZ=a0 else local a1=aV:FindFirstChildWhichIsA
'BasePart'aZ=a1 and a1.Position end end if not aZ then return 0 end return math.
floor((aY-aZ).Magnitude+0.5)end,Color3.fromRGB(255,45,45),Color3.fromRGB(255,30,
30),Color3.fromRGB(0,170,255),Color3.fromRGB(0,140,255)local a0=function(a0,a1,
a2)local a3,a4,a5={},a2 and aZ or aX,a2 and a_ or aY for a6,a7 in ipairs(a0)do
if a7 and a7.Parent and not aU(a7.Name)and not aU(a7.Parent and a7.Parent.Name)
then local a8=Instance.new'SelectionBox'a8.Name='HazardSelectionBox'a8.Color3=a4
a8.SurfaceColor3=a5 a8.SurfaceTransparency=0.6 a8.LineThickness=0.05 a8.Adornee=
a7 a8.Parent=a7 local a9=a7:GetPropertyChangedSignal'Transparency':Connect(
function()if a7.Parent and a7.Transparency>aN then pcall(function()a8:Destroy()
end)end end)if a1 then table.insert(a1,a9)end a3[#a3+1]=a8 end end return a3 end
function am.UpdateHazardVisualColor(a1,a2)if not a1 or not a1.Boxes then return
end local a3=a2==true or a1.IsTrajectory==true local a4,a5=a3 and aZ or aX,a3
and a_ or aY for a6,a7 in ipairs(a1.Boxes)do if a7 and a7.Parent then a7.Color3=
a4 a7.SurfaceColor3=a5 end end ag.UpdateHazardVisualColor(a1,a3)end local a1,a2=
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
then return end if aL(a6)then return end if au[a6]then return end if aR[a6]then
return end local a7={active=true,count=0}aR[a6]=a7 task.spawn(function()while a7
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
):format(aO,#a8))aS(a6)return end task.wait(aQ)end aS(a6)end)end a5=function(a7)
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
false end function am.IsSelectionBoxesEnabled()return ap end function am.
SetLogHazards(a8)aq=a8 and true or false end function am.IsLogHazardsEnabled()
return aq end function am.SetLogFailed(a8)ar=a8 and true or false end function
am.IsLogFailedEnabled()return ar end function am.SetInspectTarget(a8)as=typeof(
a8)=='string'and a8 or''end function am.GetInspectTarget()return as end function
am.SetInspectEnabled(a8)at=a8 and true or false end function am.IsInspectEnabled
()return at end function am.GetHazardCount()return av end function am.
GetActiveHazards()local a8={}for a9,b in pairs(au)do table.insert(a8,{Name=b.
Name,Class=b.Class,Distance=b.Distance})end return a8 end function am.
GetActiveHazardsMap()return au end function am.GetLastHazardInfo()return aH end
function am.OnHazardChanged(a8)if type(a8)=='function'then table.insert(aw,a8)
end end return am end function a.s()local aa,ab,ac,ad,ae=a.load'e',a.load'b',a.
load'm',a.load'p',a.load'q'local af,ag,ah,ai,aj,ak,al,am,an,ao=aa.RunService or
game:GetService'RunService',game:GetService'Players',aa.player,{},false,{},1.8
local ap=function()local ap=ah or ag.LocalPlayer if not ap then return nil end
local aq=ap.Character if not aq or not aq.Parent then return nil end local ar=aq
:FindFirstChildOfClass'Humanoid'if ar and ar.Health<=0 then return nil end
return aq:FindFirstChild'HumanoidRootPart'or aq.PrimaryPart end local aq=
function()local aq=ap()if not aq or not aq.Parent then if aj then aj=false am=
nil an=nil for ar,as in ipairs(ak)do pcall(as,false,nil,nil)end end return false
,nil,nil end if ae.IsActiveHazardScannerEnabled and not ae.
IsActiveHazardScannerEnabled()then if aj then aj=false am=nil an=nil for ar,as
in ipairs(ak)do pcall(as,false,nil,nil)end end return false,nil,nil end local ar
=Vector3.new(aq.Position.X,0,aq.Position.Z)local as,at,au=ac.IsPointInAnyHazard(
ar,nil,al)local av,aw=false if not as and ad.IsPointInAnyTrajectory then av,aw=
ad.IsPointInAnyTrajectory(ar,al)end local ax,ay,az=as or av,as and at or(av and
aw or nil),as and'GroundZone'or(av and'Trajectory'or nil)if ax~=aj or ay~=am
then aj=ax am=ay an=az for aA,aB in ipairs(ak)do pcall(aB,ax,ay,az)end end
return ax,ay,az end local ar=function()aq()end local as=function()if not ao then
ao=af.Heartbeat:Connect(ar)end end function ai.IsPlayerInDanger()return aq()end
function ai.GetCurrentThreat()return am,an end function ai.GetRadius()return al
end function ai.SetRadius(at)if type(at)=='number'and at>=0.5 then al=at end end
function ai.OnDangerStatusChanged(at)if type(at)=='function'then table.insert(ak
,at)end return at end function ai.GetPlayerRoot()return ap()end as()ab.Register(
function()if ao then ao:Disconnect()ao=nil end table.clear(ak)end)return ai end
function a.t()local aa,ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/
ac)ab[ad]=Vector3.new(math.cos(ae),0,math.sin(ae))end local ad,ae={},16 for af=1
,ae do local ag=(af-1)*(2*math.pi/ae)ad[af]=Vector3.new(math.cos(ag),0,math.sin(
ag))end local af,ag,ah={1.5,3,5,8,12,18,25},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32
,38,45},{1.5,3,4.5,6,8,10.5,13.5,17,21,26,32,38,45,50,55}aa.COARSE_DIRECTIONS=ab
aa.FINE_DIRECTIONS=ad aa.COARSE_RADII=af aa.FINE_RADII=ag aa.FALLBACK_RADII=ah
function aa.SamplePass(ai,aj,ak,al,am,an,ao,ap)local aq,ar,as,at,au=math.huge,
Vector3.zero,false,aj if ap and ap.Magnitude>0.1 then local av=Vector3.new(ap.X,
0,ap.Z).Unit at=table.clone(aj)table.sort(at,function(aw,ax)local ay,az=aw.X*av.
X+aw.Z*av.Z,ax.X*av.X+ax.Z*av.Z return ay>az end)end for av,aw in ipairs(ak)do
local ax=false for ay,az in ipairs(at)do local aA=ai+az*aw local aB=an(aA)if ao
then table.insert(ao,{pos=aA,isSafe=aB,isChosen=false})end if aB then local aC=
aA if am and al>0 then local aF=aA+az*al if an(aF)then aC=aF end end local aF=(
aC-ai).Magnitude if aF<aq then aq=aF au=aC ar=az ax=true end end end if ax and
au then as=true break end end return au,as,aq,ar end return aa end function a.u(
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
a.v()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'e',a.load'f',a.load'b',a.load'm',a.
load'p',a.load's',a.load't',a.load'u',a.load'q'local aj,ak,al,am,an,ao,ap,aq,ar,
as,at,au,av,aw,ax,ay,az,aA,aB,aC,aF=aa.RunService or game:GetService'RunService'
,game:GetService'Players',aa.player,{},true,true,true,true,false,2,0,false,{},{}
,0,function()return af.GetPlayerRoot()end local aG,aH=function(aG)local aH=al or
ak.LocalPlayer if not aH then return nil end local aI=aH.Character if not aI or
not aI.Parent then return nil end local aJ=aI:FindFirstChildOfClass'Humanoid'if
aJ and aJ.Health>0 then local aK=aJ.MoveDirection if aK and aK.Magnitude>0.1
then return Vector3.new(aK.X,0,aK.Z).Unit end end if aG and aG.Parent then local
aK=Vector3.zero pcall(function()aK=aG.AssemblyLinearVelocity or aG.Velocity or
Vector3.zero end)local aL=Vector3.new(aK.X,0,aK.Z)if aL.Magnitude>=2 then return
aL.Unit end end return nil end,function(aG)if not aG then return 0 end return aG
.Position.Y-2.5 end function am.IsPointSafe(aI,aJ)if not aI then return false
end local aK,aL,aM,aN=Vector3.new(aI.X,0,aI.Z),ai.GetActiveBossArea()if aL and
aN and aM and aM>0 then local aO=Vector3.new(aN.X,0,aN.Z)if(aK-aO).Magnitude>aM
then return false end end local aO=(af.GetRadius and af.GetRadius()or 1.8)+(aJ
or 0)if ad.IsPointInAnyHazard and ad.IsPointInAnyHazard(aK,nil,aO)then return
false end if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aK,aO)then
return false end return true end function am.FindNearestSafeSpot(aI)if ab.
IsInvulnerable and ab.IsInvulnerable()then return nil,false,0,Vector3.zero end
local aJ=ay()if not aI then if not aJ then return nil,false,0,Vector3.zero end
aI=aJ.Position end local aK,aL=Vector3.new(aI.X,0,aI.Z),aG(aJ)table.clear(aw)
local aM,aN,aO=ai.GetActiveBossArea()local aQ,aR,aS=(aM and aO and aN and aN>0)
and Vector3.new(aO.X,0,aO.Z)or nil,ad.GetNearbyHazards and ad.GetNearbyHazards(
aK,75)or nil,ae.GetNearbyTrajectories and ae.GetNearbyTrajectories(aK,75)or nil
local aT=function(aT,aU)if not aT then return false end local aV=Vector3.new(aT.
X,0,aT.Z)if aQ and aN then local aW=(aV-aQ).Magnitude if aW>aN then return false
end end local aW=(af.GetRadius and af.GetRadius()or 1.8)+(aU or 0)if ad.
IsPointInAnyHazard and ad.IsPointInAnyHazard(aV,nil,aW,aR)then return false end
if ae.IsPointInAnyTrajectory and ae.IsPointInAnyTrajectory(aV,aW,aS)then return
false end return true end if(aR and#aR==0 and aS and#aS==0 and not aQ)or aT(aK,0
)then table.insert(aw,{pos=aK,isSafe=true,isChosen=true})return aK,true,0,
Vector3.zero end local aU,aV=aL,af.GetRadius and af.GetRadius()or 1.8 local aW,
aX,aY,aZ=ae.IsPointInAnyTrajectory(aK,aV,aS)if aW and aY and aZ then local a_,a0
,a1=Vector3.new(-aY.Z,0,aY.X),Vector3.new(aY.Z,0,-aY.X),aK-aZ local a2=a1.X*a_.X
+a1.Z*a_.Z local a3=a2>=0 and a_ or a0 if aL and aL.Magnitude>0.1 then local a4,
a5=aL.X*a_.X+aL.Z*a_.Z,aL.X*a0.X+aL.Z*a0.Z if a4>a5+0.3 then a3=a_ elseif a5>a4+
0.3 then a3=a0 end end local a4=0.45 if aL and aL.Magnitude>0.1 then local a5,a6
=-(aL.X*aY.X+aL.Z*aY.Z),math.abs(aL.X*a3.X+aL.Z*a3.Z)if a6>0.05 then local a7=a5
/a6 a4=math.clamp(a7,0.18,1)elseif a5>0 then a4=1 else a4=0.18 end end local a5=
(a3-a4*aY).Unit aU=a5 elseif aQ and(aK-aQ).Magnitude>aN then aU=(aQ-aK).Unit end
local a_,a0,a1,a2=ag.SamplePass(aK,ag.COARSE_DIRECTIONS,ag.COARSE_RADII,as,true,
aT,aw,aU)if not a0 and aq then a_,a0,a1,a2=ag.SamplePass(aK,ag.FINE_DIRECTIONS,
ag.FINE_RADII,as,true,aT,aw,aU)end if not a0 and ar then a_,a0,a1,a2=ag.
SamplePass(aK,ag.FINE_DIRECTIONS,ag.FALLBACK_RADII or ag.FINE_RADII,0,false,aT,
aw,aU)end if a0 and a_ then for a3,a4 in ipairs(aw)do if(a4.pos-a_).Magnitude<
0.25 then a4.isChosen=true break end end return a_,true,a1,a2 end return aK,
false,math.huge,Vector3.zero end local aI=function()if not an then ah.Hide()
return end local aI=ay()if not aI or not aI.Parent then ah.Hide()return end if
ab.IsInvulnerable and ab.IsInvulnerable()then am.Clear()return end if(ai.
IsActiveDodgeDisabled and ai.IsActiveDodgeDisabled())or(ai.
IsActiveHazardScannerEnabled and not ai.IsActiveHazardScannerEnabled())then am.
Clear()return end local aJ,aK,aL=false if af.IsPlayerInDanger then aJ,aK,aL=af.
IsPlayerInDanger()end local aM=aJ or(az~=nil)or au if not aM then local aN=os.
clock()if aN-ax<0.05 then return end ax=aN end local aN,aO=aH(aI),Vector3.new(aI
.Position.X,0,aI.Position.Z)if aJ then local aQ,aR=az and(az-aO).Magnitude or 0,
az and am.IsPointSafe(az)if not az or not aR then local aS,aT,aU,aV=am.
FindNearestSafeSpot(aI.Position)if aT and aS then az=aS aA=aK aB=aL at=aU au=
true ah.Update(aI,aS,aN,aw,ao,ap)for aW,aX in ipairs(av)do pcall(aX,true,aS,aU)
end else ah.Hide()end else at=aQ ah.Update(aI,az,aN,aw,ao,ap)for aS,aT in
ipairs(av)do pcall(aT,true,az,aQ)end end else local aQ,aR=az and(az-aO).
Magnitude or 0,az and am.IsPointSafe(az)if aR and aQ>0.8 then at=aQ ah.Update(aI
,az,aN,aw,ao,ap)for aS,aT in ipairs(av)do pcall(aT,true,az,aQ)end else if au or
az then au=false az=nil aA=nil aB=nil at=0 ah.Hide()for aS,aT in ipairs(av)do
pcall(aT,false,nil,0)end end end end end local aJ=function()if not aC then aC=aj
.Heartbeat:Connect(aI)end if not aF and af.OnDangerStatusChanged then aF=af.
OnDangerStatusChanged(function(aJ)if aJ and an then aI()end end)end end function
am.Clear()if au or az then au=false az=nil aA=nil aB=nil at=0 table.clear(aw)ah.
Hide()for aK,aL in ipairs(av)do pcall(aL,false,nil,0)end end end function am.
Cleanup()if aC then aC:Disconnect()aC=nil end ah.Cleanup()table.clear(aw)az=nil
aA=nil aB=nil at=0 au=false ax=0 end function am.GetLastSafeSpot()return az,at,
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
function a.w()local aa,ab,ac,ad,ae,af=a.load'e',a.load'f',a.load'b',a.load's',a.
load'v',a.load'q'local ag,ah,ai,aj,ak,al,am,an,ao,ap=aa.RunService or game:
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
aL.X,0,ao.Z-aL.Z)local aN=aM.Magnitude if aN<=al then local aO,aQ=aF.CFrame,
Vector3.new(ao.X,aL.Y,ao.Z)local aR=CFrame.new(aQ)*(aO-aO.Position)aB:PivotTo(aR
)aA(aC,aF)local aS=ao ao=nil if am then am=false for aT,aU in ipairs(an)do
pcall(aU,false,aS,aN)end end else if not am then am=true ar()av()for aO,aQ in
ipairs(an)do pcall(aQ,true,ao,aN)end end ay(ao)end else if am or ao then ao=nil
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
function a.x()local aa,ab,ac=a.load'e',a.load'b',a.load's'local ad,ae,af,ag,ah,
ai,aj,ak,al,am,an,ao=aa.RunService or game:GetService'RunService',aa.player,{},
true,Color3.fromRGB(0,255,170),Color3.fromRGB(255,35,35),0.45,0.2,0.2,game:
GetService'Players',function()return ac.GetPlayerRoot()end,function(ad)if not ad
then return 0 end return ad.Position.Y-2.5 end local ap,aq=function(ap)if
playerAdornment then if playerAdornment.Parent~=ap or not playerAdornment:
IsDescendantOf(workspace)then pcall(function()playerAdornment:Destroy()end)
playerAdornment=nil else if playerAdornment.Adornee~=ap then playerAdornment.
Adornee=ap end return playerAdornment end end if not ap or not ap.Parent then
return nil end local aq,ar,as=ac.IsPlayerInDanger(),ac.GetRadius(),Instance.new
'CylinderHandleAdornment'as.Name='Player_2D_HitboxVisual'as.Adornee=ap as.Radius
=ar as.Height=al as.Color3=aq and ai or ah as.Transparency=aq and ak or aj as.
ZIndex=5 as.AlwaysOnTop=false as.Visible=ag as.Parent=ap playerAdornment=as
return as end,function(ap)if not playerAdornment or not playerAdornment.Parent
then return end playerAdornment.Color3=ap and ai or ah playerAdornment.
Transparency=ap and ak or aj end local ar=function()local ar=an()if not ar or
not ar.Parent then if playerAdornment and playerAdornment.Parent then
playerAdornment.Visible=false end return end local as=ap(ar)if as and as.Parent
then as.Visible=ag as.Radius=ac.GetRadius()local at=ao(ar)local au=CFrame.new(
Vector3.new(ar.Position.X,at,ar.Position.Z))*CFrame.Angles(math.rad(90),0,0)as.
CFrame=ar.CFrame:ToObjectSpace(au)end end ac.OnDangerStatusChanged(function(as)
aq(as)end)local as=function()if not heartbeatConnection then heartbeatConnection
=ad.Heartbeat:Connect(ar)end end function af.SetVisualEnabled(at)ag=at and true
or false if playerAdornment and playerAdornment.Parent then playerAdornment.
Visible=ag end end function af.IsVisualEnabled()return ag end af.
IsPlayerInDanger=ac.IsPlayerInDanger af.GetCurrentThreat=ac.GetCurrentThreat af.
GetRadius=ac.GetRadius af.SetRadius=ac.SetRadius af.OnDangerStatusChanged=ac.
OnDangerStatusChanged as()ab.Register(function()if heartbeatConnection then
heartbeatConnection:Disconnect()heartbeatConnection=nil end if playerAdornment
then pcall(function()playerAdornment:Destroy()end)playerAdornment=nil end end)
return af end function a.y()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al=a.load'b',
a.load'g',a.load'r',a.load'm',a.load'p',a.load's',a.load'v',a.load'w',a.load'n',
a.load'x',a.load'o',{}ad.BindDetection(ac)ai.BindDetection(ac)ai.BindTrajectory(
ae)ae.BindDetection(ac)ak.BindDetection(ac)al.IsPointInAnyHazard=ad.
IsPointInAnyHazard al.GetHazardPadding=ad.GetHazardPadding al.SetHazardPadding=
ad.SetHazardPadding al.GetHitboxPadding=ad.GetHazardPadding al.SetHitboxPadding=
ad.SetHazardPadding al.GetTrajectoryMargin=ad.GetTrajectoryMargin al.
SetTrajectoryMargin=ad.SetTrajectoryMargin al.GetHazardZones=ad.GetHazardZones
al.GetNearbyHazards=ad.GetNearbyHazards al.AddForceCircleName=ad.
AddForceCircleName al.GetForceCircleNames=ad.GetForceCircleNames al.
IsForceCircle=ad.IsForceCircle al.IsSecondBossCircleChain=ad.
IsSecondBossCircleChain al.GetSecondBossCircleDuration=ad.
GetSecondBossCircleDuration al.SetSecondBossCircleDuration=ad.
SetSecondBossCircleDuration al.IsPlayerInDanger=af.IsPlayerInDanger al.
GetPlayerThreat=af.GetCurrentThreat al.OnPlayerDangerChanged=af.
OnDangerStatusChanged al.SetPlayerHitboxRadius=af.SetRadius al.
GetPlayerHitboxRadius=af.GetRadius al.SetPlayerVisualEnabled=aj.SetVisualEnabled
al.IsPlayerVisualEnabled=aj.IsVisualEnabled al.FindNearestSafeSpot=ag.
FindNearestSafeSpot al.IsPointSafe=ag.IsPointSafe al.GetLastSafeSpot=ag.
GetLastSafeSpot al.OnSafeSpotChanged=ag.OnSafeSpotChanged al.
SetSafeSpotVisualEnabled=ag.SetVisualEnabled al.IsSafeSpotVisualEnabled=ag.
IsVisualEnabled al.SetSafeSpotEnabled=ag.SetEnabled al.IsSafeSpotEnabled=ag.
IsEnabled al.SetSafeSpotBuffer=ag.SetSafetyBuffer al.GetSafeSpotBuffer=ag.
GetSafetyBuffer al.SetShowCandidates=ag.SetShowCandidates al.IsShowCandidates=ag
.IsShowCandidates al.SetFinePassEnabled=ag.SetFinePassEnabled al.
IsFinePassEnabled=ag.IsFinePassEnabled al.SetFallbackPassEnabled=ag.
SetFallbackPassEnabled al.IsFallbackPassEnabled=ag.IsFallbackPassEnabled al.
ClearSafeSpot=ag.Clear al.SetAutoDodgeEnabled=ah.SetEnabled al.
IsAutoDodgeEnabled=ah.IsEnabled al.SetDodgeSnapDistance=ah.SetSnapDistance al.
GetDodgeSnapDistance=ah.GetSnapDistance al.IsCurrentlyDodging=ah.IsDodging al.
OnDodgeStateChanged=ah.OnDodgeStateChanged al.ClearDodge=ah.Clear al.
SetVisualizerEnabled=ai.SetEnabled al.IsVisualizerEnabled=ai.IsEnabled al.
RefreshVisuals=ai.RefreshAll al.SetTrajectoryEnabled=ae.SetEnabled al.
IsTrajectoryEnabled=ae.IsEnabled al.SetTrajectoryLength=ae.SetPredictionLength
al.GetTrajectoryLength=ae.GetPredictionLength al.GetHazardTrajectoryLength=ae.
GetHazardPredictionLength al.GetCustomTrajectoryLength=ae.GetCustomLength al.
SetCustomTrajectoryLength=ae.SetCustomLength al.GetSecondBossBeamLength=ae.
GetSecondBossBeamLength al.SetSecondBossBeamLength=ae.SetSecondBossBeamLength al
.GetFirstBossBigSpikeWidth=ae.GetFirstBossBigSpikeWidth al.
SetFirstBossBigSpikeWidth=ae.SetFirstBossBigSpikeWidth al.
GetFirstBossSeekingSpikeWidth=ae.GetFirstBossSeekingSpikeWidth al.
SetFirstBossSeekingSpikeWidth=ae.SetFirstBossSeekingSpikeWidth al.
GetCustomTrajectoryWidth=ae.GetCustomWidth al.SetCustomTrajectoryWidth=ae.
SetCustomWidth al.RefreshTrajectory=ae.RefreshAll al.IsPointInAnyTrajectory=ae.
IsPointInAnyTrajectory al.GetNearbyTrajectories=ae.GetNearbyTrajectories al.
SetSelectionBoxesEnabled=ac.SetSelectionBoxesEnabled al.IsSelectionBoxesEnabled=
ac.IsSelectionBoxesEnabled al.SetTimerVisualEnabled=ak.SetEnabled al.
IsTimerVisualEnabled=ak.IsEnabled al.RefreshTimerVisuals=ak.RefreshAll al.
StartDetection=ac.StartScan al.StopDetection=ac.StopScan al.IsDetectionEnabled=
ac.IsEnabled al.SetDetectionEnabled=ac.SetEnabled al.SetLogHazards=ac.
SetLogHazards al.IsLogHazardsEnabled=ac.IsLogHazardsEnabled al.SetLogThreats=al.
SetLogHazards al.IsLogThreatsEnabled=al.IsLogHazardsEnabled al.SetLogFailed=ac.
SetLogFailed al.IsLogFailedEnabled=ac.IsLogFailedEnabled al.SetInspectTarget=ac.
SetInspectTarget al.GetInspectTarget=ac.GetInspectTarget al.SetInspectEnabled=ac
.SetInspectEnabled al.IsInspectEnabled=ac.IsInspectEnabled al.GetHazardCount=ac.
GetHazardCount al.GetActiveHazards=ac.GetActiveHazards al.GetActiveHazardsMap=ac
.GetActiveHazardsMap al.GetActiveTrajectoriesList=ae.GetActiveTrajectoriesList
al.GetLastHazardInfo=ac.GetLastHazardInfo al.OnHazardChanged=ac.OnHazardChanged
al.ClearAllHazards=ac.ClearAllHazards al.TriggerRoomTransition=ac.
TriggerRoomTransition al.IsRoomTransitioning=ac.IsRoomTransitioning function al.
StartScan()if not ab.IsDungeon()then return end ac.StartScan()end function al.
StopScan()ac.StopScan()end function al.Toggle(am)if am then al.StartScan()else
al.StopScan()end end function al.IsEnabled()return ac.IsEnabled()end ab.Register
{Name='Evasion',Zone='Dungeon',OnLeave=function()ac.StopScan()end,OnEnter=
function()if ac.IsEnabled()then ac.StartScan()end end}aa.Register(function()ac.
StopScan()end)return al end function a.z()local aa,ab,ac,ad=a.load'e',a.load'f',
a.load'b',a.load'k'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at=aa.
RunService or game:GetService'RunService',aa.VirtualInputManager or game:
GetService'VirtualInputManager',aa.player,{},false,35,0.15,4,0,0,false,false,-
math.huge,0 function ah.IsEnabled()return ai end local au,av function ah.
SetEnabled(ax)local ay=ax==true if ay==ai then return end ai=ay if ai then au()
else av()end end ah.IsSkillQEnabled=ah.IsEnabled ah.SetSkillQEnabled=ah.
SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.SetSkillEEnabled=ah.SetEnabled
function ah.GetSkillERange()return aj end function ah.SetSkillERange(ax)if type(
ax)=='number'and ax>=2 then aj=ax end end function ah.GetSpamInterval()return ak
end function ah.SetSpamInterval(ax)if type(ax)=='number'and ax>=0.05 then ak=ax
end end function ah.GetBuffDuration()return al end function ah.SetBuffDuration(
ax)if type(ax)=='number'and ax>=0.5 then al=ax end end function ah.IsBuffActive(
)return(os.clock()-aq)<al end function ah.TriggerBuff()aq=os.clock()end function
ah.GetLastBuffTime()return aq end function ah.GetRemainingBuffTime()local ax=al-
(os.clock()-aq)return ax>0 and ax or 0 end local ax=function()local ax=ag or
game:GetService'Players'.LocalPlayer if not ax then return nil end local ay=ax:
FindFirstChild'Backpack'if ay then for az,aA in ipairs(ay:GetChildren())do local
aB=aA:FindFirstChild'abilitySlot'if aB and string.lower(tostring(aB.Value))=='q'
then return aA end end end local az=ax.Character if az then for aA,aB in ipairs(
az:GetChildren())do if aB:IsA'Tool'then local aC=aB:FindFirstChild'abilitySlot'
if aC and string.lower(tostring(aC.Value))=='q'then return aB end end end end
return nil end local ay=function()local ay=ax()if ay then local az=ay:
FindFirstChild'cooldown'if az and typeof(az.Value)=='number'then return az.Value
end end return nil end local az,aA,aB,aC=function(az)local aA=ay()if aA~=nil
then if aA>(ar+0.5)or(ar<=0.2 and aA>0.5)then aq=az end ar=aA end end,function()
if at then return end pcall(function()local az=aa.ReplicatedStorage or game:
GetService'ReplicatedStorage'local aA=az and az:FindFirstChild'remotes'local aB=
aA and aA:FindFirstChild'abilityCast'if aB and aB:IsA'RemoteEvent'then at=aB.
OnClientEvent:Connect(function(aC,aF)local aG=ag or game:GetService'Players'.
LocalPlayer if aC==aG then local aH=ax()if(aH and aH.Name==aF)or(not aH)then aq=
os.clock()end end end)end end)end,function()if at then pcall(function()at:
Disconnect()end)at=nil end end,function()local az=ag or game:GetService'Players'
.LocalPlayer local aA=az and az.Character local aB=aA and(aA:FindFirstChild
'HumanoidRootPart'or aA.PrimaryPart)if aB and aB.Parent then return aB end
return nil end local aF=function()local aF=aC()if not aF then return nil,math.
huge,false end local aG,aH=aF.Position,ad.GetTarget and ad.GetTarget()if aH and
aH.Root and aH.Root.Parent then local aI=aH.Humanoid or(aH.Model and aH.Model:
FindFirstChildOfClass'Humanoid')if aI and aI.Health>0 then local aJ=aH.Root.
Position local aK=Vector3.new(aJ.X-aG.X,0,aJ.Z-aG.Z).Magnitude return aH,aK,true
end end local aI,aJ,aK,aL=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),
math.huge,false if aI and#aI>0 then for aM,aN in ipairs(aI)do if aN and aN.Root
and aN.Root.Parent then local aO=aN.Humanoid or(aN.Model and aN.Model:
FindFirstChildOfClass'Humanoid')if aO and aO.Health>0 then aK=true local aQ=aN.
Root.Position local aR,aS=aQ.X-aG.X,aQ.Z-aG.Z local aT=aR*aR+aS*aS if aT<aJ then
aJ=aT aL=aN end end end end end local aM=aJ<math.huge and math.sqrt(aJ)or math.
huge return aL,aM,aK end function ah.CastSkillQ()if ao then return end ao=true
task.spawn(function()local aG=(ab.GetKeyHoldTime and ab.GetKeyHoldTime())or 0.05
pcall(function()af:SendKeyEvent(true,Enum.KeyCode.Q,false,game)end)task.wait(aG)
pcall(function()af:SendKeyEvent(false,Enum.KeyCode.Q,false,game)end)ao=false end
)end function ah.CastSkillE()if ap then return end ap=true task.spawn(function()
local aG=(ab.GetKeyHoldTime and ab.GetKeyHoldTime())or 0.05 pcall(function()af:
SendKeyEvent(true,Enum.KeyCode.E,false,game)end)task.wait(aG)pcall(function()af:
SendKeyEvent(false,Enum.KeyCode.E,false,game)end)ap=false end)end local aG=
function()if not ai or ab.IsInLobby()then return end local aG=aC()if not aG then
return end local aH=aG.Parent local aI=aH and aH:FindFirstChildOfClass'Humanoid'
if aI and aI.Health<=0 then return end local aJ,aK,aL=aF()local aM=os.clock()az(
aM)if(aM-am>=ak)and not ao then if aL then local aN=ay()local aO=(aN==nil)or(aN
<=0.2)if aO then am=aM ah.CastSkillQ()if aN==nil and not ah.IsBuffActive()then
aq=aM end end end end if(aM-an>=ak)and not ap then if aJ and aK<=aj then local
aN=ah.IsBuffActive()if aN then an=aM ah.CastSkillE()end end end end au=function(
)if not as then as=ae.Heartbeat:Connect(aG)end aA()end av=function()if as then
as:Disconnect()as=nil end aB()ao=false ap=false ar=0 aq=-math.huge end function
ah.Step(aH,aI,aJ)end ac.Register(function()ah.SetEnabled(false)end)return ah end
function a.A()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al=a.load'e',a.load'f',a.
load'b',a.load'h',a.load'g',a.load'i',a.load'j',a.load'k',a.load'l',a.load'y',a.
load'z',a.load'q'local am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG=aa.
RunService,aa.player,{NO_TARGET='NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',
TRACKING_TARGET='TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',KITE='KITE',BLOCKED=
'BLOCKED',REPATHING='REPATHING'},{},false,false,1.5,15,35,25,50,true,6,true,true
,true,true,true local aH,aI,aJ,aK,aL,aM,aN,aO,aQ,aR,aS,aT,aU,aV,aW,aX,aY,aZ,a_,
a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b,ba,bb,bc,bd=ao.NO_TARGET,'None',0,0,false,false,
0,0,false,10,false,{},function()if ab.DisableControls then ab.DisableControls
'AutoFarm'end end,function()if ab.EnableControls then ab.EnableControls
'AutoFarm'end end,(Vector3.zero)local be,bf,bg,bh,bi,bj,bk,bl,bm=function()if bd
then return end local be=am.PreSimulation or am.RenderStepped or am.Heartbeat bd
=be:Connect(function()if not ar or aS then return end if aj.IsCurrentlyDodging
and aj.IsCurrentlyDodging()then return end local bf=ab.GetHumanoid()if bf then
bf:Move(aW,false)end end)end,function()if bd then bd:Disconnect()bd=nil end aW=
Vector3.zero end,function(be)if be and be.Magnitude>0.05 then aW=Vector3.new(be.
X,0,be.Z).Unit else aW=Vector3.zero end end,function()aW=Vector3.zero end,
function()local be=an and an.Character local bf=be and be:FindFirstChild
'HumanoidRootPart'if bf and bf.Parent then return bf end return nil end,function
(be)if not be or not be.Parent then return nil end local bf,bg=pcall(function()
return be.Position end)if not bf or not bg then return nil end return bg end,
function(be)if ab.IsBossActive and ab.IsBossActive()then return true end if be
then if be.Room and type(be.Room.Name)=='string'and string.find(string.lower(be.
Room.Name),'boss')then return true end if be.Model then local bf=string.lower(be
.Model.Name)if string.find(bf,'boss')then return true end local bg=be.Model.
Parent if bg and string.find(string.lower(bg.Name),'boss')then return true end
end end return false end,function(be)return al.GetActiveCombatDistances(be)end,
function(be,bf)if be==bf then return true end if be and bf and be.Model and bf.
Model and be.Model==bf.Model then return true end return false end local bn=
function(bn,bo)local bp=ah.GetTarget()if bm(bp,bn)then return end ah.SetTarget(
bn,nil,nil,bo)aX=nil aI='None'aY=nil aZ=nil aN=0 if bn then aH=ao.CHASE else aH=
ao.NO_TARGET end end bc=function()if aL or not aq or not ar then return end aK+=
1 local bo=aK aL=true local bp=bi()local bq=bp and bj(bp)if not bq then aL=false
return end local br=af.Scan()if#br==0 then if bo==aK and aq and ar then bn(nil,
nil)end aL=false return end local bs,bt,bu,bv=ag.SelectBestTarget(bq,br,function
()return bo~=aK or not aq or not ar end)if bo==aK and aq and ar then bn(bs,bv)
end aL=false end local bo,bp,bq,br=function(bo)if not ae.IsDungeon()or not aM
then return end local bp,bq=bi(),ab.GetHumanoid()if not bp or not bq or bq.
Health<=0 then return end local br=bj(bp)if not br then return end if aj.
IsCurrentlyDodging and aj.IsCurrentlyDodging()then aW=Vector3.zero return end if
aS then aW=Vector3.zero return end local bs=os.clock()if bs-aJ>=as then aJ=bs if
aH~=ao.HOLD and aH~=ao.KITE then bc()end end local bu=ah.GetTarget()if bu then
if not ah.IsTargetValid()then ah.ClearTarget()aH=ao.NO_TARGET aX=nil aI='None'aZ
=nil bh()pcall(function()bq.AutoRotate=true end)bc()return end end if not bu or
aH==ao.NO_TARGET then aX=nil aI='None'aZ=nil bh()pcall(function()bq.AutoRotate=
true end)if not aL and bs-aJ>=0.5 then aJ=bs bc()end return end local bv=bu.Root
and bj(bu.Root)if not bv then ah.ClearTarget()aH=ao.NO_TARGET aZ=nil bh()pcall(
function()bq.AutoRotate=true end)return end local bw,bx=bl(bu)local by=Vector3.
new(bv.X-br.X,0,bv.Z-br.Z)local bz,bA,bB,bC=by.Magnitude,al.GetActiveBossArea(bu
)local bD,bE=false if bA and bC and bB and bB>0 then bE=Vector3.new(bC.X,0,bC.Z)
local bF=(Vector3.new(br.X,0,br.Z)-bE).Magnitude if bF>bB then bD=true end end
if bD and bE and bC then local bF=Vector3.new(bC.X-br.X,0,bC.Z-br.Z)local bG,bH=
bF.Magnitude>0.1 and bF.Unit or Vector3.new(0,0,1),Vector3.new(bC.X,br.Y,bC.Z)aH
=ao.CHASE aI='Enter Boss Area'aX=bH aN=0 bg(bG)return end if ay and bz<=(bx+25)
then pcall(function()bq.AutoRotate=false local bF=Vector3.new(bv.X,bp.Position.Y
,bv.Z)if(bF-bp.Position).Magnitude>0.5 then bp.CFrame=CFrame.lookAt(bp.Position,
bF)end end)else pcall(function()bq.AutoRotate=true end)end ak.Step(bo,bu,bz)
local bF,bG,bH,bI=ab.IsInvulnerable and ab.IsInvulnerable(),al.
IsActiveDodgeDisabled and al.IsActiveDodgeDisabled(bu),not(al.
IsActiveHazardScannerEnabled and not al.IsActiveHazardScannerEnabled(bu)),aj.
IsAutoDodgeEnabled and aj.IsAutoDodgeEnabled()local bJ=not bF and not bG and bH
and bI and aj and aj.IsPointSafe if bz<bw then local bK=Vector3.new(br.X-bv.X,0,
br.Z-bv.Z)local bL,bM=bK.Magnitude>0.1 and bK.Unit or Vector3.new(0,0,1),math.
clamp(bw-bz+6,4,15)local bN=br+bL*bM if bE and bB then local bO=Vector3.new(bN.X
,0,bN.Z)if(bO-bE).Magnitude>bB then local bP=bE+(bO-bE).Unit*math.max(1,bB-2)bN=
Vector3.new(bP.X,br.Y,bP.Z)if(bN-br).Magnitude<2 then aH=ao.HOLD aI=
'Hold (Boss Area Edge)'aX=nil aN=0 bh()return end end end local bO=true if bJ
then bO=aj.IsPointSafe(bN,0.5)end if not bO then aH=ao.HOLD aI=
'Hold (Danger Behind)'aX=nil aN=0 bh()else aH=ao.KITE aI='Kite'aN=0 aX=bN bg(bL)
end elseif bz<=bx then aH=ao.HOLD aX=nil aI='Hold'aN=0 bh()else local bK,bL=by.
Magnitude>0.1 and by.Unit or Vector3.new(0,0,1),false if bJ then local bM=
Vector3.new(-bK.Z,0,bK.X)*1.2 for bN,bO in ipairs{3,7}do if bO<bz then local bP=
br+bK*bO if not aj.IsPointSafe(bP,0.5)then bL=true break end end end if not bL
and 3<bz then local bN=br+bK*3 local bO,bP=bN+bM,bN-bM if not aj.IsPointSafe(bO,
0.5)or not aj.IsPointSafe(bP,0.5)then bL=true end end end if bL then aH=ao.HOLD
aI='Hold (Danger Ahead)'aX=nil aN=0 bh()else aH=ao.CHASE aI='Chase'local bM=
Vector3.new(bv.X,br.Y,bv.Z)aX=bM bg(bK)local bN=bv.Y-br.Y if bN>1.8 and bz<=8
then bq.Jump=true end local bO=bp.AssemblyLinearVelocity or bp.Velocity local bP
,bQ=bO and Vector3.new(bO.X,0,bO.Z).Magnitude or 0,(type(bo)=='number'and bo>0)
and bo or 0.016 if bP<aR then aN+=bQ if aQ and(bs-aO)>=0.4 then bq.Jump=true
pcall(function()bq:ChangeState(Enum.HumanoidStateType.Jumping)end)aO=bs end else
aN=0 end end end end,function()if a2 and a2.Parent then return a2 end if a2 then
pcall(function()a2:Destroy()end)a2=nil end a2=Instance.new'Highlight'a2.Name=
'TM_EnemyHighlight_Debug'a2.FillColor=Color3.fromRGB(255,200,0)a2.
FillTransparency=0.5 a2.OutlineColor=Color3.fromRGB(255,0,0)a2.
OutlineTransparency=0 a2.Parent=aa.CoreGui or game:GetService'CoreGui'return a2
end,function()return workspace.Terrain end,function()for bo,bp in ipairs(aT)do
pcall(function()bp:Destroy()end)end table.clear(aT)bb=nil end local bs,bu=
function()if not ae.IsDungeon()then return end local bs,bu=ah.GetTarget(),bi()
local bv,bw=bu and bj(bu),bq()if not aC or not bs or not bs.Root then if a2 and
a2.Parent then a2.Enabled=false end else local bx=bp()if bs.Model and bs.Model.
Parent then bx.Adornee=bs.Model bx.Enabled=true else bx.Enabled=false end end
local bx,by=ah.GetWaypoints(),ah.GetPathInstance()if not aA or not bx or#bx==0
or not bw then br()else local bz=tostring(by)..'_'..tostring(#bx)if bb~=bz then
br()for bA=2,#bx do local bB,bC=bx[bA-1].Position,bx[bA].Position local bD=(bC-
bB).Magnitude if bD>0.01 then local bE=Instance.new'LineHandleAdornment'bE.Name=
'TM_PathLine_Debug'bE.Adornee=bw bE.AlwaysOnTop=true bE.Length=bD bE.Thickness=2
bE.Transparency=0.3 bE.Color3=Color3.fromRGB(0,255,120)bE.ZIndex=0 bE.CFrame=
CFrame.lookAt(bB,bC)bE.Parent=aa.CoreGui or game:GetService'CoreGui'aT[#aT+1]=bE
end end bb=bz end end if not aB or not aX or not bv or not bw then if a3 then a3
.Visible=false end if a4 then a4.Visible=false end else local bz,bA=bv+Vector3.
new(0,0.5,0),aX+Vector3.new(0,0.5,0)local bB=(bA-bz).Magnitude if bB>=0.3 then
if not a3 or not a3.Parent then a3=Instance.new'LineHandleAdornment'a3.Name=
'TM_ActualPath_Debug'a3.Adornee=bw a3.AlwaysOnTop=true a3.Thickness=3.5 a3.
Transparency=0.15 a3.Color3=Color3.fromRGB(0,230,255)a3.ZIndex=2 a3.Parent=aa.
CoreGui or game:GetService'CoreGui'end a3.Length=bB a3.CFrame=CFrame.lookAt(bz,
bA)a3.Visible=true if not a4 or not a4.Parent then a4=Instance.new
'SphereHandleAdornment'a4.Name='TM_ActualMarker_Debug'a4.Adornee=bw a4.
AlwaysOnTop=true a4.Radius=0.65 a4.Transparency=0.2 a4.Color3=Color3.fromRGB(0,
230,255)a4.ZIndex=3 a4.Parent=aa.CoreGui or game:GetService'CoreGui'end a4.
CFrame=CFrame.new(bA)a4.Visible=true else if a3 then a3.Visible=false end if a4
then a4.Visible=false end end end if not aF or not aZ or not bv or not bs or not
bw then if a5 then a5.Visible=false end if a6 then a6.Visible=false end else
local bz,bA,bB=aZ.origin or(bv+Vector3.new(0,1.5,0)),aZ.directHitPos or aZ.
targetPos,aZ.directBlocked if bA then local bC=(bA-bz).Magnitude if bC>=0.2 then
if not a5 or not a5.Parent then a5=Instance.new'LineHandleAdornment'a5.Name=
'TM_BlockerRay_Debug'a5.Adornee=bw a5.AlwaysOnTop=true a5.Thickness=3 a5.
Transparency=0.2 a5.ZIndex=3 a5.Parent=aa.CoreGui or game:GetService'CoreGui'end
a5.Length=bC a5.Color3=bB and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)a5.CFrame=CFrame.lookAt(bz,bA)a5.Visible=true if bB and aZ.directHitPos then
if not a6 or not a6.Parent then a6=Instance.new'SphereHandleAdornment'a6.Name=
'TM_BlockerHitMarker_Debug'a6.Adornee=bw a6.AlwaysOnTop=true a6.Radius=0.5 a6.
Transparency=0.2 a6.Color3=Color3.fromRGB(255,30,30)a6.ZIndex=4 a6.Parent=aa.
CoreGui or game:GetService'CoreGui'end a6.CFrame=CFrame.new(aZ.directHitPos)a6.
Visible=true else if a6 then a6.Visible=false end end else if a5 then a5.Visible
=false end if a6 then a6.Visible=false end end end end local bz=bs and bs.Root
if not aG or not bz or not bz.Parent then if a7 then a7.Visible=false end if a8
then a8.Visible=false end if a9 then a9.Visible=false end if b then b.Visible=
false end else local bA=bj(bz)or bz.Position local bB=bv and(bv.Y-2.5)or(bA.Y-
2.5)local bC=Vector3.new(bA.X,bB,bA.Z)local bD=CFrame.new(bC)*CFrame.Angles(math
.rad(90),0,0)local bE,bF,bG=bz.CFrame:ToObjectSpace(bD),bl(bs)local bH=math.max(
1,bF)local bI,bJ=math.max(bH+0.5,bG),0.35 if not a7 or not a7.Parent then a7=
Instance.new'CylinderHandleAdornment'a7.Name='TM_MinDistanceFill_Debug'a7.
AlwaysOnTop=true a7.ZIndex=4 a7.Parent=aa.CoreGui or game:GetService'CoreGui'end
a7.Adornee=bz a7.Height=0.02 a7.InnerRadius=0 a7.Radius=bH a7.Color3=Color3.
fromRGB(255,200,0)a7.Transparency=0.82 a7.CFrame=bE a7.Visible=true if not a8 or
not a8.Parent then a8=Instance.new'CylinderHandleAdornment'a8.Name=
'TM_MinDistanceRing_Debug'a8.AlwaysOnTop=true a8.ZIndex=5 a8.Parent=aa.CoreGui
or game:GetService'CoreGui'end a8.Adornee=bz a8.Height=0.05 a8.InnerRadius=math.
max(0.1,bH-bJ)a8.Radius=bH a8.Color3=Color3.fromRGB(255,215,20)a8.Transparency=
0.25 a8.CFrame=bE a8.Visible=true if not a9 or not a9.Parent then a9=Instance.
new'CylinderHandleAdornment'a9.Name='TM_MaxDistanceFill_Debug'a9.AlwaysOnTop=
true a9.ZIndex=4 a9.Parent=aa.CoreGui or game:GetService'CoreGui'end a9.Adornee=
bz a9.Height=0.02 a9.InnerRadius=bH a9.Radius=bI a9.Color3=Color3.fromRGB(0,255,
120)a9.Transparency=0.82 a9.CFrame=bE a9.Visible=true if not b or not b.Parent
then b=Instance.new'CylinderHandleAdornment'b.Name='TM_MaxDistanceRing_Debug'b.
AlwaysOnTop=true b.ZIndex=5 b.Parent=aa.CoreGui or game:GetService'CoreGui'end b
.Adornee=bz b.Height=0.05 b.InnerRadius=math.max(0.1,bI-bJ)b.Radius=bI b.Color3=
Color3.fromRGB(0,255,120)b.Transparency=0.25 b.CFrame=bE b.Visible=true local bK
,bL,bM=al.GetActiveBossArea(bs)if bK and bM and bL and bL>0 then local bN=
Vector3.new(bM.X,bB,bM.Z)local bO=CFrame.new(bN)*CFrame.Angles(math.rad(90),0,0)
local bP=bz.CFrame:ToObjectSpace(bO)if not ba or not ba.Parent then ba=Instance.
new'CylinderHandleAdornment'ba.Name='TM_BossAreaRing_Debug'ba.AlwaysOnTop=true
ba.ZIndex=5 ba.Parent=aa.CoreGui or game:GetService'CoreGui'end ba.Adornee=bz ba
.Height=0.05 ba.InnerRadius=math.max(0.1,bL-0.45)ba.Radius=bL ba.Color3=Color3.
fromRGB(0,200,255)ba.Transparency=0.3 ba.CFrame=bP ba.Visible=true else if ba
then ba.Visible=false end end end end,function()if a2 then pcall(function()a2:
Destroy()end)a2=nil end if a3 then pcall(function()a3:Destroy()end)a3=nil end if
a4 then pcall(function()a4:Destroy()end)a4=nil end if a5 then pcall(function()a5
:Destroy()end)a5=nil end if a6 then pcall(function()a6:Destroy()end)a6=nil end
if a7 then pcall(function()a7:Destroy()end)a7=nil end if a8 then pcall(function(
)a8:Destroy()end)a8=nil end if a9 then pcall(function()a9:Destroy()end)a9=nil
end if b then pcall(function()b:Destroy()end)b=nil end if ba then pcall(function
()ba:Destroy()end)ba=nil end br()end function ap.IsEnabled()return aq end
function ap.IsRunning()return ar end function ap.GetState()return aH end
function ap.GetScanInterval()return as end function ap.SetScanInterval(bv)if
type(bv)=='number'and bv>0.1 then as=bv end end function ap.
GetMobMinCombatDistance()return at end function ap.SetMobMinCombatDistance(bv)if
type(bv)=='number'and bv>=1 then at=bv if at>au then au=at+5 end end end
function ap.GetMobMaxCombatDistance()return au end function ap.
SetMobMaxCombatDistance(bv)if type(bv)=='number'and bv>=2 then au=bv if at>au
then at=math.max(1,au-5)end end end function ap.GetBossMinCombatDistance()return
av end function ap.SetBossMinCombatDistance(bv)if type(bv)=='number'and bv>=1
then av=bv if av>ax then ax=av+5 end end end function ap.
GetBossMaxCombatDistance()return ax end function ap.SetBossMaxCombatDistance(bv)
if type(bv)=='number'and bv>=2 then ax=bv if av>ax then av=math.max(1,ax-5)end
end end function ap.GetMinCombatDistance()return at end function ap.
SetMinCombatDistance(bv)ap.SetMobMinCombatDistance(bv)end function ap.
GetMaxCombatDistance()return au end function ap.SetMaxCombatDistance(bv)ap.
SetMobMaxCombatDistance(bv)end ap.IsTargetBoss=bk function ap.
IsAutoFaceTargetEnabled()return ay end function ap.SetAutoFaceTarget(bv)ay=bv
and true or false if not ay then local bw=ab.GetHumanoid()if bw and bw.Parent
then pcall(function()bw.AutoRotate=true end)end end end function ap.
GetReachDistance()return maxCombatDistance end function ap.SetReachDistance(bv)
if type(bv)=='number'and bv>=2 then ap.SetMaxCombatDistance(bv)end end function
ap.GetRepathDistance()return az end function ap.SetRepathDistance(bv)if type(bv)
=='number'and bv>=1 then az=bv ah.SetRepathThreshold(bv)end end function ap.
SetAutoJumpOnStuck(bv)aQ=bv==true end function ap.IsAutoJumpOnStuckEnabled()
return aQ end function ap.SetStuckVelocityThreshold(bv)if type(bv)=='number'and
bv>0 then aR=bv end end function ap.GetStuckVelocityThreshold()return aR end
function ap.SetPaused(bv)local bw=bv and true or false if bw==aS then return end
aS=bw if aS then bh()aV()local bx=ab.GetHumanoid()if bx and bx.Parent then
pcall(function()bx.AutoRotate=true if not(aj.IsCurrentlyDodging and aj.
IsCurrentlyDodging())then bx:Move(Vector3.zero,false)end end)end else if aq and
ar then aU()end end end function ap.IsPaused()return aS end function ap.
IsAutoSkillEnabled()return ak.IsEnabled()end function ap.SetAutoSkillEnabled(bv)
ak.SetEnabled(bv)end ap.IsAutoSkillQEnabled=ak.IsSkillQEnabled ap.
SetAutoSkillQEnabled=ak.SetSkillQEnabled ap.IsAutoSkillEEnabled=ak.
IsSkillEEnabled ap.SetAutoSkillEEnabled=ak.SetSkillEEnabled ap.GetSkillERange=ak
.GetSkillERange ap.SetSkillERange=ak.SetSkillERange ap.GetSkillSpamInterval=ak.
GetSpamInterval ap.SetSkillSpamInterval=ak.SetSkillSpamInterval ap.
GetBuffDuration=ak.GetBuffDuration ap.SetBuffDuration=ak.SetBuffDuration ap.
IsBuffActive=ak.IsBuffActive ap.CastSkillQ=ak.CastSkillQ ap.CastSkillE=ak.
CastSkillE function ap.IsPlannedPathVisualEnabled()return aA end function ap.
SetPlannedPathVisual(bv)aA=bv==true if not aA then br()end end function ap.
IsActualPathVisualEnabled()return aB end function ap.SetActualPathVisual(bv)aB=
bv==true if not aB then if a3 then a3.Visible=false end if a4 then a4.Visible=
false end end end function ap.IsBlockerRayVisualEnabled()return aF end function
ap.SetBlockerRayVisual(bv)aF=bv==true if not aF then if a5 then a5.Visible=false
end if a6 then a6.Visible=false end end end function ap.IsTargetVisualEnabled()
return aC end function ap.SetTargetVisual(bv)aC=bv==true if not aC then if a2
and a2.Parent then a2.Enabled=false end end end function ap.
IsCombatRangeVisualEnabled()return aG end function ap.SetCombatRangeVisual(bv)aG
=bv==true if not aG then if a7 then a7.Visible=false end if a8 then a8.Visible=
false end if a9 then a9.Visible=false end if b then b.Visible=false end end end
function ap.GetDebugInfo()local bv=bi()local bw,bx,by,bz,bA,bB=bv and bj(bv),ah.
GetTarget(),'-',0,0,ah.GetWaypoints()if bx and bx.Model then by=bx.Model.Name or
'-'local bC=bj(bx.Root)if bC and bw then bz=(bC-bw).Magnitude bA=Vector3.new(bC.
X-bw.X,0,bC.Z-bw.Z).Magnitude end end local bC={directBlocked=false,blockerName=
'None',blockerDist=0}if aZ then bC.directBlocked=aZ.directBlocked==true if aZ.
directHitPart then bC.blockerName=aZ.directHitPart.Name or'Part'end if aZ.
directHitPos and bw then bC.blockerDist=(aZ.directHitPos-bw).Magnitude end end
local bD,bE=0,0 if bv then local bF=bv.AssemblyLinearVelocity or bv.Velocity if
bF then bD=Vector3.new(bF.X,0,bF.Z).Magnitude bE=bF.Y end end return{state=aH,
enemyName=by,enemyDist=bz,enemyFlat=bA,hasTarget=bx~=nil,destMode=aI,nodeIndex=
aY,waypointCount=bB and#bB or 0,hasDestination=aX~=nil,blocker=bC,velocity=bD,
verticalVelocity=bE,stuckTimer=aN}end function ap.Toggle(bv,bw)if bv==aq then
return end aq=bv if aq then if not bw then ad.EnableExclusive'AutoFarm'end if a_
then a_:Disconnect()a_=nil end aU()be()ar=true aK=0 aL=false aJ=0 ah.
SetRepathThreshold(az)if not a0 then a0=ab.OnEnemyChanged(function()if aq and ar
and aH~=ao.HOLD then bc()end end)end if not a1 then a1=ab.OnRespawn(function()ah
.ClearTarget()aH=ao.NO_TARGET aZ=nil bc()end)end if not aM then task.spawn(
function()if ab.ReadyDungeon()then aM=true end end)end task.defer(bc)a_=am.
Heartbeat:Connect(function(bx)local by,bz=pcall(bo,bx)if not by then warn((
'[AutoFarm] Error in stepMovementLoop: %s'):format(tostring(bz)))end bs()end)
else if a_ then a_:Disconnect()a_=nil end bf()aV()ar=false if a0 then a0()a0=nil
end if a1 then a1()a1=nil end bh()local bx=ab.GetHumanoid()if bx and bx.Parent
then pcall(function()bx.AutoRotate=true if not(aj.IsCurrentlyDodging and aj.
IsCurrentlyDodging())then bx:Move(Vector3.zero,false)end end)end ah.ClearTarget(
)aH=ao.NO_TARGET aX=nil aI='None'aZ=nil aN=0 aK+=1 aL=false bu()end end ad.
Register('AutoFarm',ap.Toggle,ap.IsEnabled)ae.Register{Name='AutoFarm',Zone=
'Dungeon',OnLeave=function()if ar then ap.SetPaused(true)end bu()end,OnEnter=
function()if aq then ap.SetPaused(false)end end}ac.Register(function()ap.Toggle(
false)bu()end)return ap end function a.B()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.
load'b',a.load'A',a.load'y',a.load'h',a.load'c',{},false,true,false,{}local ak=
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
function a.C()local aa={}function aa.PatchSliderLoadCallback(ab)if not ab or
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
ad(ae,af)end return ab end return aa end function a.D()local aa,ab,ac=a.load'e',
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
=false end)return af end function a.E()local aa,ab,ac,ad,ae=a.load'e',a.load'f',
a.load'c',a.load'b',a.load'g'local af,ag,ah,ai,aj,ak,al,am,an,ao=aa.player,{},
false,{[2]=true},0,{},{}for ap=1,15 do table.insert(al,('Room %d'):format(ap))
end local ap,aq=function(ap)if type(ap)=='number'then return math.clamp(math.
floor(ap),1,20)elseif type(ap)=='string'then local aq=tonumber(ap:match'%d+')if
aq then return math.clamp(math.floor(aq),1,20)end end return nil end,ae.Guard(
'Dungeon',function()local ap,aq=ab.GetHumanoid(),af and af.Character if ap and
ap.Health>0 then pcall(function()ap.Health=0 end)pcall(function()ap:ChangeState(
Enum.HumanoidStateType.Dead)end)end if aq and aq.Parent then pcall(function()aq:
BreakJoints()end)end end)local ar=function(ar)if not ah then return end if ab.
IsInLobby()or ab.IsDead()then return end if ar<=0 then return end if not ai[ar]
then return end if ak[ar]then return end ak[ar]=true task.spawn(function()if aj>
0 then task.wait(aj)end if not ah or ab.IsInLobby()or ab.IsDead()then return end
if ab.GetCurrentRoomIndex()~=ar then return end ac.Notify('Auto Reset',(
'Reset character at Room %d (Once per room/run)'):format(ar),3)aq()end)end local
as,at=function()if am then return end am=ab.OnRoomIndexChanged(function(as)if as
<=1 then table.clear(ak)end ar(as)end)an=ab.OnLobbyChanged(function(as)if as
then table.clear(ak)end end)ao=ab.OnDungeonNameChanged(function()table.clear(ak)
end)end,function()if am then am()am=nil end if an then an()an=nil end if ao then
ao()ao=nil end end function ag.Toggle(au)ah=au and true or false if ah then
table.clear(ak)as()ar(ab.GetCurrentRoomIndex())else at()end end function ag.
IsEnabled()return ah end function ag.GetRoomOptions()return al end function ag.
SetTargetRooms(au)local av={}if type(au)=='table'then for ax,ay in pairs(au)do
if ay==true then local az=ap(ax)if az then av[az]=true end else local az=ap(ay)
if az then av[az]=true end end end elseif au~=nil then local ax=ap(au)if ax then
av[ax]=true end end ai=av end function ag.GetTargetRooms()local au={}for av in
pairs(ai)do table.insert(au,av)end table.sort(au)local av={}for ax,ay in ipairs(
au)do table.insert(av,('Room %d'):format(ay))end return av end function ag.
GetTargetRoomNumbers()local au={}for av in pairs(ai)do table.insert(au,av)end
table.sort(au)return au end function ag.SetTargetRoom(au)local av=ap(au)if av
then ai={[av]=true}end end function ag.GetTargetRoom()for au in pairs(ai)do
return au end return 2 end function ag.SetDelay(au)if type(au)=='number'then aj=
math.clamp(au,0,15)end end function ag.GetDelay()return aj end function ag.
ResetNow()ac.Notify('Auto Reset','Manual character reset executed',2)aq()end ae.
Register{Name='AutoReset',Zone='Dungeon',OnEnter=function()table.clear(ak)if ah
then as()end end,OnLeave=function()table.clear(ak)at()end}ad.Register(function()
at()ah=false table.clear(ak)ae.Unregister'AutoReset'end)return ag end function a
.F()local aa,ab,ac,ad,ae=a.load'f',a.load'C',a.load'd',a.load'D',a.load'E'return
function(af,ag)local ah=ag:Section{Side='Right'}ah:Header{Name='Movement Speed'}
ah:Toggle({Name='Fast Speed',Default=aa.IsSpeedEnabled(),Callback=ac.Wrap(
function(ai)aa.SetSpeedEnabled(ai)end)},'Toggle_FastSpeed')ab.
PatchSliderLoadCallback(ah:Slider({Name='Custom Fast Speed',Default=aa.
GetFastSpeed(),Minimum=16,Maximum=24,DisplayMethod='Value',Precision=1,Callback=
ac.Wrap(function(ai)aa.SetFastSpeed(ai)end)},'Slider_FastSpeed'))ah:Header{Name=
'Shortcuts'}ah:Toggle({Name='Right Click Combo (Q+E)',Default=ad.
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
)ae.ResetNow()end}end end function a.G()local aa,ab,ac,ad,ae,af,ag=game:
GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage',a.load'e',{},{},{'largeicespikes','mediumicespikes',
'smallicespikes','icespikes'}local ah=function()table.clear(af)local ah={
'abilities','projectiles'}for ai,aj in ipairs(ah)do local ak=ac:FindFirstChild(
aj)if ak then for al,am in ipairs(ak:GetChildren())do local an=am.Name:lower():
gsub('%s+','')af[an]=true end end end end ah()function ae.IsIceSpikes(ai)if not
ai then return false end local aj=typeof(ai)=='Instance'and ai.Name or tostring(
ai)local ak=aj:lower():gsub('%s+','')if#ak==0 then return false end for al,am in
ipairs(ag)do if string.find(ak,am,1,true)then return true end end return false
end function ae.IsPlayerCharacter(ai)if not ai then return true end for aj,ak in
ipairs(aa:GetPlayers())do if ak.Character and(ai==ak.Character or ai:
IsDescendantOf(ak.Character))then return true end end return false end function
ae.IsEnemyModel(ai)if not ai then return false end if ai:IsA'Model'and ai:
FindFirstChildOfClass'Humanoid'then return true end if ai.Parent and ai.Parent:
IsA'Model'and ai.Parent:FindFirstChildOfClass'Humanoid'then return true end
return false end function ae.IsPlayerAbility(ai)if not ai then return false end
local aj=ai.Name:lower():gsub('%s+','')if af[aj]then return true end if ai.
Parent then local ak=ai.Parent.Name:lower():gsub('%s+','')if af[ak]then return
true end end return false end function ae.IsValidLevel1WorkspaceChild(ai)if not
ai or not ai.Parent then return false end if ai.Parent~=ab then return false end
if ai:IsA'Folder'or ai:IsA'Terrain'or ai:IsA'Camera'then return false end if not
(ai:IsA'BasePart'or ai:IsA'Model')then return false end if ae.IsPlayerCharacter(
ai)then return false end if ae.IsEnemyModel(ai)then return false end if ae.
IsPlayerAbility(ai)then return false end return true end function ae.IsMultiRing
(ai)if not ai then return false end local aj=typeof(ai)=='Instance'and ai.Name
or tostring(ai)local ak=aj:lower():gsub('%s+','')return string.find(ak,
'thirdbossmultirings',1,true)~=nil or string.find(ak,'multiring',1,true)~=nil
end function ae.IsSweepingFlames(ai)if not ai then return false end local aj=
typeof(ai)=='Instance'and ai.Name or tostring(ai)local ak=aj:lower():gsub('%s+',
'')return string.find(ak,'bonusbosssweepingflames',1,true)~=nil or string.find(
ak,'sweepingflames',1,true)~=nil end function ae.IsHazardPart(ai,aj)if not ai or
not ai:IsA'BasePart'or not ai.Parent then return false end if ai.Name==
'PrimaryPart'then return false end if ae.IsMultiRing(ai)or(ai.Parent and ae.
IsMultiRing(ai.Parent))or(aj and ae.IsMultiRing(aj))then local ak=ai.Name:lower(
)if ak=='center'or ak:find'multiring'then return true end return false end if ae
.IsIceSpikes(ai)or(ai.Parent and ae.IsIceSpikes(ai.Parent))or(aj and ae.
IsIceSpikes(aj))then return true end local ak=ae.IsSweepingFlames(ai)or(ai.
Parent and ae.IsSweepingFlames(ai.Parent))or(ai.Parent and ai.Parent.Parent and
ae.IsSweepingFlames(ai.Parent.Parent))or(aj and ae.IsSweepingFlames(aj))if ak
then local al=ai.Name:lower()if al=='precast'then if ai.Transparency<=0.85 then
return true end local am=ai:FindFirstChildWhichIsA'ParticleEmitter'if am and am.
Enabled then return true end return false end return false end if ai.
Transparency>0.85 then return false end if ai.Material==Enum.Material.Neon then
return true end return false end ae.IsNeonHazardPart=ae.IsHazardPart function ae
.FindHazardPartsInLevel1Child(ai)local aj={}if not ae.
IsValidLevel1WorkspaceChild(ai)then return aj end if ai:IsA'BasePart'then if ae.
IsHazardPart(ai,ai)then table.insert(aj,ai)end elseif ai:IsA'Model'then if ae.
IsMultiRing(ai)then local ak=ai:FindFirstChild('center',true)or ai:
FindFirstChildWhichIsA'BasePart'if ak and ak.Name~='PrimaryPart'then table.
insert(aj,ak)return aj end end for ak,al in ipairs(ai:GetDescendants())do if al:
IsA'BasePart'and ae.IsHazardPart(al,ai)then table.insert(aj,al)end end end
return aj end ae.FindNeonPartsInLevel1Child=ae.FindHazardPartsInLevel1Child
return ae end function a.H()local aa,ab,ac,ad,ae,af,ag=a.load'G',{},function(aa)
if not aa then return'#ff2a55'end local ab,ac,ad=math.clamp(math.floor(aa.R*255)
,0,255),math.clamp(math.floor(aa.G*255),0,255),math.clamp(math.floor(aa.B*255),0
,255)return string.format('#%02x%02x%02x',ab,ac,ad)end,function(aa)if not aa
then return 0 end local ab=aa.LookVector if not ab or ab.Magnitude<0.001 then
return 0 end return math.deg(math.atan2(ab.X,-ab.Z))end,{coreRadius=12.5,
maxRadius=105,rings={{rIn=12.5,rOut=25,yawOffset=180,side=1},{rIn=25,rOut=37.5,
yawOffset=0,side=0},{rIn=37.5,rOut=50,yawOffset=180,side=1},{rIn=50,rOut=62.5,
yawOffset=0,side=0},{rIn=62.5,rOut=75,yawOffset=180,side=1},{rIn=75,rOut=87.5,
yawOffset=0,side=0},{rIn=87.5,rOut=105,yawOffset=180,side=1}}},function(aa,ab,ac
,ad,ae,af,ag)ag=ag or 12 local ah,ai={},(af or 180)/2 local aj,ak=ae-ai,ae+ai
local al,am=math.rad(aj),math.rad(ak)local an=am-al for ao=0,ag do local ap=al+(
an*(ao/ag))local aq,ar=aa+math.sin(ap)*ad,ab-math.cos(ap)*ad table.insert(ah,{x=
aq,z=ar})end for ao=ag,0,-1 do local ap=al+(an*(ao/ag))local aq,ar=aa+math.sin(
ap)*ac,ab-math.cos(ap)*ac table.insert(ah,{x=aq,z=ar})end return ah end,function
(aa,ab,ac,ad)ad=ad or 16 local ae={}for af=0,ad-1 do local ag=(math.pi*2)*(af/ad
)local ah,ai=aa+math.sin(ag)*ac,ab-math.cos(ag)*ac table.insert(ae,{x=ah,z=ai})
end return ae end function ab.AnalyzeHazardPart(ah)if not ah or not ah:IsA
'BasePart'or not ah.Parent then return nil end local ai,aj=ah.Size,ah.CFrame
local ak,al,am=aj.Position,ad(aj),ac(ah.Color)if aa.IsIceSpikes(ah)or(ah.Parent
and aa.IsIceSpikes(ah.Parent))then am='#38d9ff'end if aa.IsSweepingFlames(ah)or(
ah.Parent and aa.IsSweepingFlames(ah.Parent))or(ah.Parent and ah.Parent.Parent
and aa.IsSweepingFlames(ah.Parent.Parent))then am='#ff6b22'end local an=ah:
FindFirstChildWhichIsA('SpecialMesh',true)if an then local ao,ap,aq=math.abs(an.
Scale.X),math.abs(an.Scale.Y),math.abs(an.Scale.Z)ai=Vector3.new(ai.X*ao,ai.Y*ap
,ai.Z*aq)end local ao,ap=ah.Name:lower(),(ah.Parent and ah.Parent.Name:lower())
or''local aq=aa.IsMultiRing(ah)or aa.IsMultiRing(ah.Parent)or(ao=='center'and
string.find(ap,'ring')~=nil)if aq then local ar,as,at=ak,ah,(ah.Parent and ah.
Parent:IsA'Model')and ah.Parent or nil if at then local au=at:FindFirstChild(
'center',true)if au and au:IsA'BasePart'then ar=au.Position as=au end end local
au=al if as and as.CFrame then au=(ad(as.CFrame)+180)%360 end local av,ax={},{}
table.insert(ax,ag(ar.X,ar.Z,ae.coreRadius,16))for ay,az in ipairs(ae.rings)do
local aA=(au+az.yawOffset)%360 local aB=af(ar.X,ar.Z,az.rIn,az.rOut,aA,180,12)
table.insert(av,{rIn=az.rIn,rOut=az.rOut,yaw=aA,yawOffset=az.yawOffset,span=180,
side=az.side,polygon=aB})table.insert(ax,aB)end return{shape=
'compound_multiring',x=ar.X,y=ar.Y,z=ar.Z,yaw=au,color='#3cd0d0',transparency=ah
.Transparency or 0.5,coreRadius=ae.coreRadius,maxRadius=ae.maxRadius,rings=av,
polygons=ax,part=ah}end if ah:IsA'Part'and ah.Shape==Enum.PartType.Ball then
local ar=math.max(ai.X,ai.Y,ai.Z)/2 return{shape='circle',x=ak.X,y=ak.Y,z=ak.Z,
radius=ar,color=am,transparency=ah.Transparency,part=ah}end if ah:IsA'Part'and
ah.Shape==Enum.PartType.Cylinder then if math.abs(aj.RightVector.Y)>0.75 then
local ar=math.max(ai.Y,ai.Z)/2 return{shape='circle',x=ak.X,y=ak.Y,z=ak.Z,radius
=ar,color=am,transparency=ah.Transparency,part=ah}end end local ar,as=math.max(
ai.X,ai.Z),math.min(ai.X,ai.Z)if as>0 and(ar/as)<=1.15 and not ah:IsA'WedgePart'
and ai.Y<=math.min(ai.X,ai.Z)then return{shape='circle',x=ak.X,y=ak.Y,z=ak.Z,
radius=ar/2,color=am,transparency=ah.Transparency,part=ah}end local at,au=math.
max(0.5,ai.X/2),math.max(0.5,ai.Z/2)local av,ax,ay,az=aj:PointToWorldSpace(
Vector3.new(at,0,au)),aj:PointToWorldSpace(Vector3.new(-at,0,au)),aj:
PointToWorldSpace(Vector3.new(-at,0,-au)),aj:PointToWorldSpace(Vector3.new(at,0,
-au))local aA={{x=av.X,z=av.Z},{x=ax.X,z=ax.Z},{x=ay.X,z=ay.Z},{x=az.X,z=az.Z}}
return{shape='box',x=ak.X,y=ak.Y,z=ak.Z,halfX=at,halfZ=au,yaw=al,vertices=aA,
color=am,transparency=ah.Transparency,part=ah}end ab.AnalyzeNeonPart=ab.
AnalyzeHazardPart return ab end function a.I()local aa,ab,ac,ad,ae,af=a.load'e',
game:GetService'Players',{},{},2,15 local ag=function()local ag=aa.player or ab.
LocalPlayer local ah=ag and ag.Character local ai=ah and(ah:FindFirstChild
'HumanoidRootPart'or ah.PrimaryPart)return ai and ai.Position or nil end
function ac.UpdateRecord(ah,ai,aj)if not ah or not ai then return nil end local
ak,al=os.clock(),ad[ah]if not al then al={part=ah,lastPos=ai,lastYaw=aj or 0,
lastTime=ak,velocity=Vector3.zero,speed=0,angularVel=0,headingDir=Vector3.zero,
motionType='STATIC',spawnTime=ak}ad[ah]=al return al end local am=ak-al.lastTime
if am>=0.015 then local an=ai-al.lastPos local ao=Vector3.new(an.X,0,an.Z)local
ap,aq,ar=ao.Magnitude/am,ao/am,(aj or 0)-al.lastYaw while ar>180 do ar-=360 end
while ar<-180 do ar+=360 end local as=ar/am al.speed=al.speed*0.4+ap*0.6 al.
velocity=al.velocity*0.4+aq*0.6 al.angularVel=al.angularVel*0.4+as*0.6 if al.
speed>0.1 then al.headingDir=al.velocity.Unit end if math.abs(al.angularVel)>=af
then al.motionType='SPINNING'elseif al.speed>=ae then local at=ag()if at and(at-
ai).Magnitude<100 then local au=(at-ai).Unit local av=al.headingDir:Dot(au)if av
>0.85 then al.motionType='HOMING'else al.motionType='LINEAR'end else al.
motionType='LINEAR'end else al.motionType='STATIC'end al.lastPos=ai al.lastYaw=
aj or 0 al.lastTime=ak end return al end function ac.GetTrajectoryProjection(ah,
ai)local aj=ad[ah]if not aj or aj.motionType=='STATIC'then return nil end ai=ai
or 1.5 local ak,al={},5 local am=ai/al for an=1,al do local ao=an*am if aj.
motionType=='SPINNING'then local ap=aj.lastYaw+(aj.angularVel*ao)table.insert(ak
,{time=ao,x=aj.lastPos.X,z=aj.lastPos.Z,yaw=ap})else local ap=aj.lastPos+(aj.
velocity*ao)table.insert(ak,{time=ao,x=ap.X,z=ap.Z,yaw=aj.lastYaw})end end
return{motionType=aj.motionType,speed=aj.speed,angularVel=aj.angularVel,dirX=aj.
headingDir.X,dirZ=aj.headingDir.Z,futurePoints=ak}end function ac.RemoveRecord(
ah)ad[ah]=nil end function ac.ClearAll()table.clear(ad)end return ac end
function a.J()local aa,ab,ac=a.load'f',a.load'q',{}local ad,ae,af=function()if
not aa.GetTrackedEnemyData then return nil end local ad=aa.GetTrackedEnemyData()
for ae,af in ipairs(ad)do if af and af.Model and af.Humanoid and af.Humanoid.
Health>0 then local ag=af.Model.Name:lower()local ah=string.find(ag,'boss')~=nil
or(af.Room and string.find(af.Room.Name:lower(),'boss')~=nil)or(af.Model.Parent
and string.find(af.Model.Parent.Name:lower(),'boss')~=nil)if ah or(aa.
IsBossActive and aa.IsBossActive())then return af.Model,af.Humanoid,af.Root end
end end return nil,nil,nil end,function(ad)local ae={}if not ad then return ae
end local af,ag=ad:FindFirstChildOfClass'Animator'or ad,{}pcall(function()ag=af:
GetPlayingAnimationTracks()end)for ah,ai in ipairs(ag)do if ai and ai.IsPlaying
and ai.WeightCurrent>0.1 then local aj=''if ai.Animation then aj=ai.Animation.
AnimationId or''end local ak=math.max(0.1,ai.Length)local al=math.clamp(ai.
TimePosition/ak,0,1)table.insert(ae,{name=ai.Name or'Anim',animId=aj,speed=ai.
Speed,length=ak,timePos=ai.TimePosition,progress=al,weight=ai.WeightCurrent})end
end return ae end,function(ad)if not ad or ad.Magnitude<0.001 then return 0 end
return math.deg(math.atan2(ad.X,-ad.Z))end function ac.GetBossTelegraphData()
local ag,ah,ai=ad()local aj,ak,al,am,an=(aa.IsBossActive and aa.IsBossActive())
or(ag~=nil),(aa.GetCurrentBossIndex and aa.GetCurrentBossIndex())or 0,ab.
GetActiveBossArea()if not ag or not ai or not ah then return{active=false,
bossIndex=ak,name='None',x=0,y=0,z=0,health=0,maxHealth=100,healthPercent=100,
yaw=0,isCasting=false,activeAnimations={},arenaActive=al or false,arenaCenterX=(
an and an.X)or 0,arenaCenterZ=(an and an.Z)or 0,arenaRadius=am or 80}end local
ao=ae(ah)local ap,aq=#ao>0,ao[1]or nil return{active=true,bossIndex=ak,name=ag.
Name,x=ai.Position.X,y=ai.Position.Y,z=ai.Position.Z,health=math.max(0,ah.Health
),maxHealth=math.max(1,ah.MaxHealth),healthPercent=math.clamp((ah.Health/ah.
MaxHealth)*100,0,100),yaw=af(ai.CFrame.LookVector),isCasting=ap,activeAnimations
=ao,primaryAnimation=aq,arenaActive=al or false,arenaCenterX=(an and an.X)or 0,
arenaCenterZ=(an and an.Z)or 0,arenaRadius=am or 80}end return ac end function a
.K()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=game:GetService'Workspace',a.
load'e',a.load'b',a.load'G',a.load'H',a.load'I',a.load'J',{},false,{},{},{}local
an,ao=function(an,ao)if not an or not an:IsA'BasePart'then return end if not ad.
IsHazardPart(an,ao)then return end if aj[an]then return end local ap=ao and ao.
Name or(an.Parent and an.Parent.Name)or an.Name local aq=ad.IsMultiRing(ap)or ad
.IsMultiRing(an)or(an.Parent and ad.IsMultiRing(an.Parent.Name))or(ao and ad.
IsMultiRing(ao))if aq then for ar,as in pairs(aj)do if as.level1Parent==ao or(ao
and ar:IsDescendantOf(ao))or ar==an then return end end end local ar=ae.
AnalyzeHazardPart(an)if not ar then return end local as,at=os.clock(),Vector3.
new(ar.x,ar.y,ar.z)local au,av=af.UpdateRecord(an,at,ar.yaw or 0),(an.Name==ap)
and ap or(ap..'/'..an.Name)if aq then av=ap elseif ad.IsSweepingFlames(ap)and an
.Parent and an.Parent~=ao then av=ap..'/'..an.Parent.Name end aj[an]={part=an,
level1Parent=ao or an,name=av,spawnTime=as,shape=ar,motion=au}end,function(an)if
aj[an]then aj[an]=nil af.RemoveRecord(an)end end local ap,aq,ar,as=function(ap)
if not ad.IsValidLevel1WorkspaceChild(ap)then return end local aq=ad.
FindHazardPartsInLevel1Child(ap)for ar,as in ipairs(aq)do an(as,ap)end if ap:IsA
'Model'then ak[ap]=ap.DescendantAdded:Connect(function(ar)if ar:IsA'BasePart'
then if ad.IsMultiRing(ap)then local as=false for at,au in pairs(aj)do if au.
level1Parent==ap or at:IsDescendantOf(ap)or at==ap then as=true break end end if
not as and ad.IsHazardPart(ar,ap)then an(ar,ap)end elseif ad.IsHazardPart(ar,ap)
then an(ar,ap)end end end)end end,function(ap)if ak[ap]then ak[ap]:Disconnect()
ak[ap]=nil end local aq={}for ar,as in pairs(aj)do if as.level1Parent==ap or ar
==ap or(ap:IsA'Instance'and ar:IsDescendantOf(ap))then table.insert(aq,ar)end
end for ar,as in ipairs(aq)do ao(as)end end,function()for ap,aq in ipairs(aa:
GetChildren())do if ad.IsValidLevel1WorkspaceChild(aq)then local ar=ad.
FindHazardPartsInLevel1Child(aq)for as,at in ipairs(ar)do an(at,aq)end end end
end,function()if not ai then return end local ap,aq={},os.clock()for ar,as in
pairs(aj)do if not ar or not ar:IsDescendantOf(aa)then table.insert(ap,ar)
continue end if as.level1Parent and not as.level1Parent:IsDescendantOf(aa)then
table.insert(ap,ar)continue end local at,au=ad.IsMultiRing(as.name)or ad.
IsMultiRing(ar)or(as.level1Parent and ad.IsMultiRing(as.level1Parent)),ad.
IsSweepingFlames(as.name)or ad.IsSweepingFlames(ar)or(as.level1Parent and ad.
IsSweepingFlames(as.level1Parent))if at then local av=aq-as.spawnTime if av>4.5
then table.insert(ap,ar)continue end local ax=(as.level1Parent and as.
level1Parent:IsA'Model'and as.level1Parent)or(ar.Parent and ar.Parent:IsA'Model'
and ar.Parent)if ax then local ay=false for az,aA in ipairs(ax:GetDescendants())
do if aA:IsA'BasePart'and aA.Name~='PrimaryPart'then if aA.Transparency<=0.85
then ay=true break end end end if not ay then table.insert(ap,ar)continue end
elseif ar.Transparency>0.85 then table.insert(ap,ar)continue end elseif au then
local av=false if ar.Transparency<=0.85 then av=true else local ax=ar:
FindFirstChildWhichIsA'ParticleEmitter'if ax and ax.Enabled then av=true end end
local ax=aq-as.spawnTime if not av or ax>2 then table.insert(ap,ar)continue end
else if ar.Transparency>0.85 then table.insert(ap,ar)continue end end local av=
ae.AnalyzeHazardPart(ar)if av then as.shape=av local ax=Vector3.new(av.x,av.y,av
.z)as.motion=af.UpdateRecord(ar,ax,av.yaw or 0)else table.insert(ap,ar)end end
for ar,as in ipairs(ap)do ao(as)end for ar,as in ipairs(aa:GetChildren())do if
ad.IsSweepingFlames(as)and as:IsA'Model'then for at,au in ipairs(as:
GetDescendants())do if au:IsA'BasePart'and au.Name:lower()=='precast'and not aj[
au]then if ad.IsHazardPart(au,as)then an(au,as)end end end end end end function
ah.StartScan()if ai then return end ai=true table.clear(aj)table.clear(ak)af.
ClearAll()table.insert(al,aa.ChildAdded:Connect(ap))table.insert(al,aa.
ChildRemoved:Connect(aq))local at=ab.RunService or game:GetService'RunService'am
=at.Heartbeat:Connect(as)ar()end function ah.StopScan()if not ai then return end
ai=false if am then am:Disconnect()am=nil end for at,au in ipairs(al)do if au
and au.Disconnect then au:Disconnect()end end table.clear(al)for at,au in pairs(
ak)do if au and au.Disconnect then au:Disconnect()end end table.clear(ak)table.
clear(aj)af.ClearAll()end function ah.IsEnabled()return ai end function ah.
GetActiveHazardsTelemetry()local at,au={},os.clock()for av,ax in pairs(aj)do
local ay=ax.shape if not ay then continue end local az,aA=af.
GetTrajectoryProjection(av,1.5),au-ax.spawnTime if ay.shape==
'compound_multiring'then table.insert(at,{id=tostring(av),name=ax.name,shape=
'compound_multiring',x=ay.x,y=ay.y,z=ay.z,yaw=ay.yaw or 0,coreRadius=ay.
coreRadius or 12.5,maxRadius=ay.maxRadius or 105,rings=ay.rings,polygons=ay.
polygons,color=ay.color or'#3cd0d0',transparency=ay.transparency or 0.5,age=aA,
motionType=ax.motion and ax.motion.motionType or'STATIC',speed=ax.motion and ax.
motion.speed or 0,angularVel=ax.motion and ax.motion.angularVel or 0,trajectory=
az})elseif ay.shape=='circle'then table.insert(at,{id=tostring(av),name=ax.name,
shape='circle',x=ay.x,y=ay.y,z=ay.z,radius=ay.radius,color=ay.color or'#ff2a55',
age=aA,motionType=ax.motion and ax.motion.motionType or'STATIC',speed=ax.motion
and ax.motion.speed or 0,angularVel=ax.motion and ax.motion.angularVel or 0,
trajectory=az})elseif ay.shape=='box'then table.insert(at,{id=tostring(av),name=
ax.name,shape='box',x=ay.x,y=ay.y,z=ay.z,halfX=ay.halfX,halfZ=ay.halfZ,yaw=ay.
yaw,vertices=ay.vertices,color=ay.color or'#ff2a55',age=aA,motionType=ax.motion
and ax.motion.motionType or'STATIC',speed=ax.motion and ax.motion.speed or 0,
angularVel=ax.motion and ax.motion.angularVel or 0,trajectory=az})elseif ay.
shape=='polygon'then table.insert(at,{id=tostring(av),name=ax.name,shape=
'polygon',x=ay.x,y=ay.y,z=ay.z,vertices=ay.vertices,color=ay.color or'#ff2a55',
age=aA,motionType=ax.motion and ax.motion.motionType or'STATIC',speed=ax.motion
and ax.motion.speed or 0,angularVel=ax.motion and ax.motion.angularVel or 0,
trajectory=az})end end return at end function ah.GetBossTelegraphTelemetry()
return ag.GetBossTelegraphData()end ac.Register(function()ah.StopScan()end)
return ah end function a.L()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an=game
:GetService'HttpService',game:GetService'Players',a.load'e',a.load'f',a.load'q',
a.load'K',a.load'b',{},false,'ws://127.0.0.1:8765',30,'Disconnected',{},function
()if typeof(WebSocket)=='table'and typeof(WebSocket.connect)=='function'then
return WebSocket.connect elseif typeof(WebSocket)=='table'and typeof(WebSocket.
Connect)=='function'then return WebSocket.Connect elseif typeof(websocket)==
'table'and typeof(websocket.connect)=='function'then return websocket.connect
elseif typeof(syn)=='table'and typeof(syn.websocket)=='table'and typeof(syn.
websocket.connect)=='function'then return syn.websocket.connect end return nil
end local ao,ap=function(ao)if al==ao then return end al=ao for ap,aq in ipairs(
am)do pcall(aq,al)end end,function(ao)if not ao or ao.Magnitude<0.001 then
return 0 end return math.deg(math.atan2(ao.X,-ao.Z))end local aq=function()local
aq={}if not ad.GetTrackedEnemyData then return aq end local ar=ad.
GetTrackedEnemyData()for as,at in ipairs(ar)do if at and at.Model and at.Root
and at.Humanoid and at.Humanoid.Health>0 then local au=at.Model.Name local av=
string.find(au:lower(),'boss')~=nil table.insert(aq,{name=au,x=at.Root.Position.
X,y=at.Root.Position.Y,z=at.Root.Position.Z,yaw=at.Root and ap(at.Root.CFrame.
LookVector)or 0,health=math.max(0,at.Humanoid.Health),maxHealth=math.max(1,at.
Humanoid.MaxHealth),isBoss=av})end end return aq end local ar,as,at=function()
local ar=ac.player or ab.LocalPlayer local as=ar and ar.Character local at,au=as
and(as:FindFirstChild'HumanoidRootPart'or as.PrimaryPart),as and as:
FindFirstChildOfClass'Humanoid'local av,ax,ay,az,aA=at and at.Position or
Vector3.zero,at and ap(at.CFrame.LookVector)or 0,au and au.MoveDirection or
Vector3.zero,false if ad.IsInvulnerable then az,aA=ad.IsInvulnerable()end local
aB,aC=af.GetActiveHazardsTelemetry(),af.GetBossTelegraphTelemetry()local aF={
type='TELEMETRY',version='V2',timestamp=os.clock(),dungeon=(ad.
GetCurrentDungeonName and ad.GetCurrentDungeonName())or'Unknown',inLobby=(ad.
IsInLobby and ad.IsInLobby())or false,room=(ad.GetCurrentRoomIndex and ad.
GetCurrentRoomIndex())or 0,player={name=ar and ar.Name or'Player',x=av.X,y=av.Y,
z=av.Z,yaw=ax,moveX=ay.X,moveZ=ay.Z,health=au and math.max(0,au.Health)or 100,
maxHealth=au and math.max(1,au.MaxHealth)or 100,healthPercent=au and math.clamp(
(au.Health/au.MaxHealth)*100,0,100)or 100,isInvulnerable=az,invulnReason=aA,
isDead=(ad.IsDead and ad.IsDead())or(au and au.Health<=0)or false},boss=aC,
enemies=aq(),hazards=aB}return aF end,function(ar,as)if not ar then return false
,'No websocket instance'end if typeof(ar.Send)=='function'then return pcall(
function()ar:Send(as)end)elseif typeof(ar.send)=='function'then return pcall(
function()ar:send(as)end)end return false,'No Send method on websocket object'
end,function(ar)if not ar then return end if typeof(ar.Close)=='function'then
pcall(function()ar:Close()end)elseif typeof(ar.close)=='function'then pcall(
function()ar:close()end)end end local au=function()if sendThread then return end
sendThread=task.spawn(function()while ai and wsInstance do local au,av,ax,ay=1/
math.clamp(ak,5,60),os.clock(),pcall(ar)if ax and ay and wsInstance then local
az,aA=pcall(function()return aa:JSONEncode(ay)end)if az and aA and wsInstance
then local aB,aC=as(wsInstance,aA)if not aB then local aF=wsInstance wsInstance=
nil if aF then at(aF)end af.StopScan()ao'Disconnected'break end end end local az
=os.clock()-av local aA=math.max(0.01,au-az)task.wait(aA)end sendThread=nil end)
end function ah.Connect()if wsInstance then ah.Disconnect()end local av=an()if
not av then ao'Error'return false end ao'Connecting'local ax=aj if not ax or#ax
==0 then ax='ws://127.0.0.1:8765'end local ay,az=pcall(av,ax)if(not ay or not az
)and string.find(ax,'localhost')then local aA=string.gsub(ax,'localhost',
'127.0.0.1')ay,az=pcall(av,aA)end if not ay or not az then ao'Disconnected'
return false end wsInstance=az ao'Connected'af.StartScan()pcall(function()if az.
OnClose and typeof(az.OnClose.Connect)=='function'then az.OnClose:Connect(
function()ah.Disconnect()end)elseif typeof(az.OnClose)=='function'then az.
OnClose=function()ah.Disconnect()end end end)au()return true end function ah.
Disconnect()local av=wsInstance wsInstance=nil sendThread=nil if av then at(av)
end af.StopScan()ao'Disconnected'end local av=function()if reconnectThread then
return end reconnectThread=task.spawn(function()while ai and ag.IsActive()do if
ai and(not wsInstance or al=='Disconnected'or al=='Error')then ah.Connect()end
task.wait(3)end reconnectThread=nil end)end function ah.SetEnabled(ax)ai=ax and
true or false if ai then av()ah.Connect()else if reconnectThread then task.
cancel(reconnectThread)reconnectThread=nil end ah.Disconnect()end end function
ah.IsEnabled()return ai end function ah.SetUrl(ax)if type(ax)=='string'and#ax>0
and ax~=aj then aj=ax if ai then ah.Connect()end end end function ah.GetUrl()
return aj end function ah.SetFps(ax)if type(ax)=='number'and ax>=5 and ax<=60
then ak=math.floor(ax)end end function ah.GetFps()return ak end function ah.
GetStatus()return al end function ah.OnStatusChanged(ax)if type(ax)=='function'
then table.insert(am,ax)end end ag.Register(function()ah.SetEnabled(false)end)
return ah end function a.M()local aa,ab,ac,ad,ae,af=a.load'd',a.load'B',a.load
'y',a.load'L',a.load'f',a.load'C'return function(ag,ah)local ai=ah:Section{Side=
'Left'}ai:Header{Name='Evasion & Auto-Dodge Controls'}local aj=ah:Section{Side=
'Right'}aj:Header{Name='Real-time Evasion Monitor'}local ak,al,am,an,ao,ap=aj:
Label{Text="Detector: <font color='rgb(255,80,80)'>Disabled</font>"},aj:Label{
Text="Player: <font color='rgb(0,255,170)'>SAFE</font>"},aj:Label{Text=
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]},aj:Label{Text=
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"},aj:Label{Text=
"Active Hazards: <font color='rgb(160,160,160)'>0</font>"},aj:Label{Text=
"Last Detected: <font color='rgb(160,160,160)'>None</font>"}local aq=function(aq
,ar,as)if aq then local at,au=ar and ar.Name or'Unknown Threat',as and(' ['..as
..']')or''pcall(function()al:UpdateName((
[[Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)]]):format(at,
au))end)else pcall(function()al:UpdateName
"Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>"end)end end ac.
OnPlayerDangerChanged(function(ar,as,at)aq(ar,as,at)end)ac.OnSafeSpotChanged(
function(ar,as,at)if ar and as then pcall(function()am:UpdateName((
[[Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>]]):
format(at))end)else pcall(function()am:UpdateName
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]end)end end)ac.
OnDodgeStateChanged(function(ar,as,at)if ar and as then pcall(function()an:
UpdateName((
[[Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>]])
:format(at))end)else pcall(function()an:UpdateName
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"end)end end)local ar=
function(ar,as)ar=ar or ac.GetHazardCount()as=as or ac.GetLastHazardInfo()local
at=ac.IsEnabled()local au,av=at and'0, 255, 0'or'255, 80, 80',at and
'Active (Scanning & SelectionBox)'or'Disabled'pcall(function()ak:UpdateName(
"Detector: <font color='rgb("..au..")'>"..av..'</font>')end)local ax=ar>0 and
'255, 60, 60'or'0, 255, 0'pcall(function()ao:UpdateName(
"Active Hazards: <font color='rgb("..ax..")'>"..tostring(ar)..'</font>')end)if
as then pcall(function()ap:UpdateName((
[[Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)]]):
format(as.Name,as.Class,as.Distance))end)else pcall(function()ap:UpdateName
"Last Detected: <font color='rgb(160,160,160)'>None</font>"end)end end aj:Header
{Name='Specific Skill Inspector'}aj:Toggle({Name='Enable Deep Inspector',Default
=ac.IsInspectEnabled(),Callback=aa.Wrap(function(as)ac.SetInspectEnabled(as)end)
},'Toggle_HazardDeepInspector')aj:Input{Name='Target Skill Name',Placeholder=
'e.g. Meteor, Spike, Flame...',AcceptedCharacters='All',Default=ac.
GetInspectTarget(),Callback=aa.Wrap(function(as)ac.SetInspectTarget(as)end)}
local as=ah:Section{Side='Right'}as:Header{Name='Custom Trajectory Dimensions'}
af.PatchSliderLoadCallback(as:Slider({Name='Second Boss Moving Beam (studs)',
Default=ac.GetSecondBossBeamLength(),Minimum=10,Maximum=250,DisplayMethod=
'Value',Precision=0,Callback=aa.Wrap(function(at)ac.SetSecondBossBeamLength(at)
end)},'Slider_HazardSecondBossBeamLength'))af.PatchSliderLoadCallback(as:Slider(
{Name='First Boss Big Spike Width (studs)',Default=ac.GetFirstBossBigSpikeWidth(
),Minimum=10,Maximum=60,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(
function(at)ac.SetFirstBossBigSpikeWidth(at)end)},
'Slider_HazardFirstBossBigSpikeWidth'))af.PatchSliderLoadCallback(as:Slider({
Name='First Boss Seeking Spike Width (studs)',Default=ac.
GetFirstBossSeekingSpikeWidth(),Minimum=4,Maximum=30,DisplayMethod='Value',
Precision=0,Callback=aa.Wrap(function(at)ac.SetFirstBossSeekingSpikeWidth(at)end
)},'Slider_HazardFirstBossSeekingSpikeWidth'))af.PatchSliderLoadCallback(as:
Slider({Name='Second Boss Circle Chain Lifetime (s)',Default=ac.
GetSecondBossCircleDuration(),Minimum=0.5,Maximum=4,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(at)ac.SetSecondBossCircleDuration(at)end)}
,'Slider_HazardSecondBossCircleDuration'))local at=ah:Section{Side='Right'}at:
Header{Name='Live 2D Top-Down Radar (WebSocket)'}local au=at:Label{Text=
[[Radar Server: <font color='rgb(255,80,80)'>Disconnected</font>]]}local av=
function(av)local ax='255,80,80'if av=='Connected'then ax='0,255,136'elseif av==
'Connecting'then ax='255,170,0'end pcall(function()au:UpdateName(
"Radar Server: <font color='rgb("..ax..")'><b>"..tostring(av)..'</b></font>')end
)end ad.OnStatusChanged(function(ax)av(ax)end)at:Toggle({Name=
'Enable Live 2D Radar Stream',Default=ad.IsEnabled(),Callback=aa.Wrap(function(
ax)ad.SetEnabled(ax)av(ad.GetStatus())end)},'Toggle_LiveRadarEnabled')at:Input{
Name='WebSocket Server URL',Placeholder='ws://127.0.0.1:8765',AcceptedCharacters
='All',Default=ad.GetUrl(),Callback=aa.Wrap(function(ax)ad.SetUrl(ax)end)}af.
PatchSliderLoadCallback(at:Slider({Name='Stream Refresh Rate (FPS)',Default=ad.
GetFps(),Minimum=10,Maximum=60,DisplayMethod='Value',Precision=0,Callback=aa.
Wrap(function(ax)ad.SetFps(ax)end)},'Slider_LiveRadarFps'))ac.OnHazardChanged(
function(ax,ay)ar(ax,ay)end)local ax=ai:Toggle({Name='Enable Evasion Engine',
Default=ac.IsEnabled(),Callback=aa.Wrap(function(ax)ac.Toggle(ax)ar()end)},
'Toggle_SmartDodgeThreatDetection')ai:Toggle({Name=
'Show Player 2D Hitbox (Ground Visual)',Default=ac.IsPlayerVisualEnabled(),
Callback=aa.Wrap(function(ay)ac.SetPlayerVisualEnabled(ay)end)},
'Toggle_HazardPlayer2DVisual')af.PatchSliderLoadCallback(ai:Slider({Name=
'Player 2D Hitbox Radius (studs)',Default=ac.GetPlayerHitboxRadius(),Minimum=0.5
,Maximum=8,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(ay)ac.
SetPlayerHitboxRadius(ay)end)},'Slider_HazardPlayer2DHitboxRadius'))ai:Toggle({
Name='Show 3D Selection Boxes (Parts)',Default=ac.IsSelectionBoxesEnabled(),
Callback=aa.Wrap(function(ay)ac.SetSelectionBoxesEnabled(ay)end)},
'Toggle_HazardSelectionBoxes')ai:Toggle({Name=
'Show Lifespan Timer (3D Duration)',Default=ac.IsTimerVisualEnabled(),Callback=
aa.Wrap(function(ay)ac.SetTimerVisualEnabled(ay)end)},
'Toggle_HazardLifespanTimer')ai:Toggle({Name=
'Show Danger Zones (Ground Visualizer)',Default=ac.IsVisualizerEnabled(),
Callback=aa.Wrap(function(ay)ac.SetVisualizerEnabled(ay)end)},
'Toggle_HazardGroundVisualizer')ai:Toggle({Name='Show Trajectory Paths (Orange)'
,Default=ac.IsTrajectoryEnabled(),Callback=aa.Wrap(function(ay)ac.
SetTrajectoryEnabled(ay)end)},'Toggle_HazardTrajectoryVisualizer')ai:Toggle({
Name='Show Safe Spot Marker (Green Visual)',Default=ac.IsSafeSpotVisualEnabled()
,Callback=aa.Wrap(function(ay)ac.SetSafeSpotVisualEnabled(ay)end)},
'Toggle_HazardSafeSpotVisual')ai:Toggle({Name=
'Show Candidate Points & Rays (Scan Grid)',Default=ac.IsShowCandidates(),
Callback=aa.Wrap(function(ay)ac.SetShowCandidates(ay)end)},
'Toggle_HazardShowCandidates')af.PatchSliderLoadCallback(ai:Slider({Name=
'Safe Spot Safety Margin (studs)',Default=ac.GetSafeSpotBuffer(),Minimum=0,
Maximum=6,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(ay)ac.
SetSafeSpotBuffer(ay)end)},'Slider_HazardSafeSpotBuffer'))local ay=ai:Toggle({
Name='Enable Auto Dodge (Move + Snap)',Default=ac.IsAutoDodgeEnabled(),Callback=
aa.Wrap(function(ay)ac.SetAutoDodgeEnabled(ay)end)},
'Toggle_HazardAutoDodgeEnabled')ai:Header{Name='Sampling Pass Tiers'}ai:Toggle({
Name='Enable Fine Pass (Tier 2 - Max 45s)',Default=ac.IsFinePassEnabled(),
Callback=aa.Wrap(function(az)ac.SetFinePassEnabled(az)end)},
'Toggle_HazardFinePassEnabled')ai:Toggle({Name=
'Enable Emergency Fallback (Tier 3 - Max 55s)',Default=ac.IsFallbackPassEnabled(
),Callback=aa.Wrap(function(az)ac.SetFallbackPassEnabled(az)end)},
'Toggle_HazardFallbackPassEnabled')ab.OnStateChanged(function(az)pcall(function(
)ax:UpdateState(az,true)end)pcall(function()ay:UpdateState(az,true)end)ar()end)
af.PatchSliderLoadCallback(ai:Slider({Name='Dodge Snap Distance (studs)',Default
=ac.GetDodgeSnapDistance(),Minimum=0.5,Maximum=5,DisplayMethod='Value',Precision
=1,Callback=aa.Wrap(function(az)ac.SetDodgeSnapDistance(az)end)},
'Slider_HazardDodgeSnapDistance'))af.PatchSliderLoadCallback(ai:Slider({Name=
'Respawn Invulnerability Time (s)',Default=ae.GetRespawnProtectionDuration(),
Minimum=0.5,Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(
function(az)ae.SetRespawnProtectionDuration(az)end)},
'Slider_HazardRespawnInvulnerabilityTime'))af.PatchSliderLoadCallback(ai:Slider(
{Name='Trajectory Length (studs)',Default=ac.GetTrajectoryLength(),Minimum=10,
Maximum=150,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(function(az)ac.
SetTrajectoryLength(az)end)},'Slider_HazardTrajectoryLength'))ai:Toggle({Name=
'Log Hazards (Spawns / Despawns)',Default=ac.IsLogHazardsEnabled(),Callback=aa.
Wrap(function(az)ac.SetLogHazards(az)end)},'Toggle_SmartDodgeLogHazards')ai:
Toggle({Name='Log Rejected (Unrenderable)',Default=ac.IsLogFailedEnabled(),
Callback=aa.Wrap(function(az)ac.SetLogFailed(az)end)},
'Toggle_SmartDodgeLogRejected')af.PatchSliderLoadCallback(ai:Slider({Name=
'Blue Danger Zone Margin (studs)',Default=ac.GetTrajectoryMargin(),Minimum=0,
Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(az)ac.
SetTrajectoryMargin(az)end)},'Slider_HazardTrajectoryMargin'))ai:Button{Name=
'Clear Console',Callback=function()pcall(function()if rconsoleclear then
rconsoleclear()end end)end}ar()end end function a.N()local aa,ab,ac,ad,ae,af,ag,
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
end return 0 end ad.DUNGEONS=ab ad.DIFFICULTIES=aa return ad end function a.O()
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'd',a.load'A',a.load'B',a.load'q',a.load
'N',a.load'f',a.load'e',a.load'C',a.load'b'local aj=ag.RunService return
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
GetDungeons()local aG,aH,aI,aJ,aK,aL,aM,aN,aO,aQ,aR=af.GetCurrentDungeonName()or
aF[1]or'Desert Temple','Mob',false,function()local aG,aH=af.
GetCurrentDungeonName(),af.GetCombatTargetKey()local aI,aJ=ad.
GetCombatDistances(aG,aH)local aK,aL,aM,aN=aG and(
"<font color='rgb(0,255,255)'>"..aG..'</font>')or
"<font color='rgb(160,160,160)'>Lobby</font>","<font color='rgb(255,200,0)'>"..
ad.GetTargetDisplay(aH)..'</font>',(
"<font color='rgb(120,255,120)'>%.0f - %.0f studs</font>"):format(aI,aJ),''if aH
~='Mob'then local aO,aQ=ad.GetBossArea(aG,aH)local aR=aO and(
"<font color='rgb(0,255,255)'>Area: %.0f studs</font>"):format(aQ)or
"<font color='rgb(160,160,160)'>Area: Off</font>"aN=' | '..aR end local aO,aQ=ad
.GetDisableDodge(aG,aH),ad.GetEnableHazardScanner(aG,aH)if aO then aN=aN..
" | <font color='rgb(255,100,100)'>No Dodge</font>"end if not aQ or aO then aN=
aN.." | <font color='rgb(255,160,50)'>No Scanner</font>"end pcall(function()aC:
UpdateName(('Active: %s | Target: %s (%s%s)'):format(aK,aL,aM,aN))end)end local
aS=function()aI=true local aS,aT=ad.GetCombatDistances(aG,aH)if aK then pcall(
function()aK:UpdateValue(aS)end)end if aL then pcall(function()aL:UpdateValue(aT
)end)end if aM then pcall(function()aM:UpdateState(ad.GetDisableDodge(aG,aH),
true)end)end if aN then pcall(function()aN:UpdateState(ad.
GetEnableHazardScanner(aG,aH),true)end)end if aH=='Mob'then if aO then pcall(
function()aO:UpdateState(false,true)end)end if aQ then pcall(function()aQ:
UpdateValue(80)end)end else local aU,aV=ad.GetBossArea(aG,aH)if aO then pcall(
function()aO:UpdateState(aU,true)end)end if aQ then pcall(function()aQ:
UpdateValue(aV)end)end end if aR then pcall(function()local aU=aH=='Mob'and
" <font color='rgb(160,160,160)'>(Boss Area N/A)</font>"or''aR:UpdateName((
[[Editing: <font color='rgb(0,255,255)'>%s</font> / <font color='rgb(255,200,0)'>%s</font>%s]]
):format(aG,ad.GetTargetDisplay(aH),aU))end)end aI=false aJ()end local aT,aU=aB:
Dropdown{Name='Select Dungeon',Options=aF,Default=aG,Required=true,Callback=
function(aT)if type(aT)=='string'and#aT>0 then aG=aT aS()end end},aB:Dropdown{
Name='Select Target',Options=ad.GetTargetOptions(),Default='Normal',Required=
true,Callback=function(aT)aH=ad.GetTargetKey(aT)aS()end}aR=aB:Label{Text=''}
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
UpdateState(false)end)end return end ad.SetBossAreaEnabled(aG,aH,a0)aJ()end}aQ=
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
a.P()local aa,ab,ac,ad,ae=a.load'd',a.load'B',a.load'F',a.load'M',a.load'O'
return function(af,ag)local ah=ag:Section{Side='Left'}ah:Header{Name=
'Combat Master'}local ai=ah:Toggle({Name='Enable Combat Master',Default=ab.
IsEnabled(),Callback=aa.Wrap(function(ai)ab.Toggle(ai)end)},
'Toggle_CombatMaster')ah:Toggle({Name='Auto Boss Combat (Skip Boss Macro)',
Default=ab.IsAutoBossCombatEnabled(),Callback=aa.Wrap(function(aj)ab.
SetAutoBossCombat(aj)end)},'Toggle_AutoBossCombat')ab.OnStateChanged(function(aj
)pcall(function()ai:UpdateState(aj,true)end)end)ac(af,ag)ad(af,ag)ae(af,ag)end
end function a.Q()local aa,ab,ac=a.load'e',a.load'a',a.load'd'local ad,ae,af,ag,
ah,ai,aj=aa.HttpService or game:GetService'HttpService',{},'DQMacro',
'pathRecord',3,'normal','full'local ak,al,am,an,ao=function(ak)if ak==aj then
return aj end return ai end,(isfile~=nil and writefile~=nil and makefolder~=nil
and isfolder~=nil),{},false,{}local ap,aq=function()for ap=#ao,1,-1 do pcall(ao[
ap])end end,function()local ap=ab.Folder or'EsclipseHub'return ap..'/'..af end
local ar,as=function()if not al then return end pcall(function()local ar=ab.
Folder or'EsclipseHub'if not isfolder(ar)then makefolder(ar)end local as=aq()if
not isfolder(as)then makefolder(as)end end)end,function(ar)if type(ar)~='string'
then return'Unknown'end return(string.gsub(ar,'[/\\:*?"<>|]','_'))end local at,
au,av,ax,ay=function(at)return aq()..'/'..as(at)..'.json'end,function(at)if not
at then return nil end return{X=math.round(at.X*100)/100,Y=math.round(at.Y*100)/
100,Z=math.round(at.Z*100)/100}end,function(at)if not at or type(at)~='table'
then return nil end return Vector3.new(at.X or 0,at.Y or 0,at.Z or 0)end,
function(at)return type(at)=='table'and type(at.points)=='table'and#at.points>0
end,function(at)if type(at)~='table'or type(at.X)~='number'then return nil end
local au=Vector3.new(at.X,0,at.Z)if au.Magnitude<0.001 then return nil end
return au.Unit end local az,aA,aB,aC,aF,aG=function(az)if type(az)~='table'then
return nil end local aA={}for aB,aC in ipairs(az.dwells or{})do local aF=av(aC.
pos)if aF then aA[#aA+1]={pos=aF,dur=tonumber(aC.dur)or 0,facing=ay(aC.facing)}
end end local aB={}for aC,aF in ipairs(az.skills or{})do local aG=av(aF.pos)if
aG then aB[#aB+1]={pos=aG,facing=ay(aF.facing),key=aF.key,dw=math.floor(
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
aJ-1 do local aN,aO,aQ=aH[aM-1],aH[aM],aH[aM+1]local aR,aS=aO.X-aN.X,aO.Z-aN.Z
local aT,aU,aV=math.sqrt(aR*aR+aS*aS),aQ.X-aO.X,aQ.Z-aO.Z local aW=math.sqrt(aU*
aU+aV*aV)if aT>=aF and aW>=aF then local aX=(aR*aU+aS*aV)/(aT*aW)if aX<aC then
aK[aM]=true table.insert(aL,aM)end end end table.insert(aL,aJ)local aM,aN=aI*aI,
{}for aO=1,#aL-1 do local aQ,aR=aL[aO],aL[aO+1]if aR-aQ>1 then table.insert(aN,{
aQ,aR})end end while#aN>0 do local aO=table.remove(aN)local aQ,aR=aO[1],aO[2]
local aS,aT,aU,aV=aH[aQ].X,aH[aQ].Z,aH[aR].X,aH[aR].Z local aW,aX=aU-aS,aV-aT
local aY,aZ,a_=aW*aW+aX*aX,-1,0 for a0=aQ+1,aR-1 do local a1=0 if aY>0 then a1=(
(aH[a0].X-aS)*aW+(aH[a0].Z-aT)*aX)/aY a1=math.clamp(a1,0,1)end local a2,a3=aH[a0
].X-(aS+aW*a1),aH[a0].Z-(aT+aX*a1)local a4=a2*a2+a3*a3 if a4>aZ then aZ=a4 a_=a0
end end if a_>0 and aZ>aM then aK[a_]=true table.insert(aN,{aQ,a_})table.insert(
aN,{a_,aR})end end local aO={}for aQ=1,aJ do if aK[aQ]and(#aO==0 or aG(aO[#aO],
aH[aQ])>=aB or aQ==aJ)then table.insert(aO,aH[aQ])end end if#aO==1 then table.
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
,rooms={}}am[aH]=aO end if type(aO.rooms)~='table'then aO.rooms={}end local aQ={
}for aR,aS in ipairs(aK)do aQ[#aQ+1]=au(aS)end local aR={startPos=au(aJ)or aQ[1]
,points=aQ}if aN then aR.boss=true end if type(aM)=='number'and aM>0 then aR.
speed=aM end local aS=function(aS)if not aS or type(aS)~='table'then return nil
end local aT,aU=#(aS.dwells or{}),#(aS.skills or{})if aT==0 and aU==0 then
return nil end local aV={dwells={},skills={}}for aW,aX in ipairs(aS.dwells or{})
do aV.dwells[#aV.dwells+1]={pos=au(aX.pos),dur=aX.dur or 0,facing=aX.facing}end
for aW,aX in ipairs(aS.skills or{})do aV.skills[#aV.skills+1]={pos=au(aX.pos),
facing=aX.facing,key=aX.key,dw=aX.dw or 0,dwT=aX.dwT or 0}end return aV end if
aL and type(aL)=='table'then local aT=aS(aL)if aT then aR.events=aT end end aO.
rooms[tostring(aI)]=aR aO.version=ah aO.map=aH aO.updated=os.time()if al then
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
end function a.R()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'Q',a.load'd',a
.load'c'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.RunService,aa.player,aa.
UserInputService,0.1,8000,0.4,0.1,1.5,1,6,{},true,true function ap.SetCapture(as
)as=as and true or false aq=as ar=as end function ap.IsCaptureEnabled()return aq
or ar end local as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aQ,
aR,aS,aT,aU,aV,aW,aX,aY,aZ=false,0,{},0,{},{},0,false,0,0,false,false,false,0,0,
0,{}local a_,a0=function()local a_={recording=as,map=aM,room=at,pointCount=#au,
dwellCount=#ax,skillCount=#ay,savedRooms=aI}for a0,a1 in ipairs(aL)do pcall(a1,
a_)end end,function()local a_=ag and ag.Character local a0=a_ and a_:
FindFirstChild'HumanoidRootPart'if a0 and a0.Parent then return a0 end return
nil end local a1,a2,a3,a4=function()local a1=a0()if not a1 then return nil end
local a2=a1.CFrame.LookVector if a2.Magnitude<0.001 then return nil end return{X
=a2.X/a2.Magnitude,Z=a2.Z/a2.Magnitude}end,function()if aO then aO:Disconnect()
aO=nil end if aQ then aQ:Disconnect()aQ=nil end if aR then aR()aR=nil end if aS
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
end table.insert(au,ba)end)if ar then aQ=ah.InputBegan:Connect(function(b,ba)if
not as or not ar then return end if ah:GetFocusedTextBox()then return end if ab.
IsDead()then return end local bb if b.UserInputType==Enum.UserInputType.
MouseButton2 then if ba then return end bb='QE'elseif b.UserInputType==Enum.
UserInputType.Keyboard and(b.KeyCode==Enum.KeyCode.Q or b.KeyCode==Enum.KeyCode.
E)then bb=b.KeyCode==Enum.KeyCode.Q and'Q'or'E'else return end local bc=a0()if
not bc then return end local bd=aq and(aU~=nil)local be={pos=bd and aU.pos or bc
.Position,facing=a1(),key=bb,dw=0,dwT=0,_castAt=os.clock()}if bd then be.dw=aU.
index be.dwT=math.max(0,(os.clock()-av)-az)aU.facing=be.facing or aU.facing end
table.insert(ay,be)end)end aR=ab.OnRoomIndexChanged(function()if as then local b
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
end function a.S()local aa,ab,ac,ad=a.load'e',a.load'c',a.load'b',a.load'g'local
ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.player,2,false,false,false,false,60,
false,
'\r\nlocal ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")\r\n\r\nlocal payload = {}\r\nlocal function collectValue(name)\r\n\tlocal value = workspace:FindFirstChild(name)\r\n\tif value and value:IsA("ValueBase") then\r\n\t\tpayload[name] = value.Value\r\n\tend\r\nend\r\n\r\ncollectValue("dungeonName")\r\ncollectValue("dungeonProgress")\r\ncollectValue("dungeonStarted")\r\n\r\nlocal hardcore = workspace:FindFirstChild("hardcore")\r\nif hardcore and hardcore:IsA("BoolValue") then\r\n\tpayload.hardcore = hardcore.Value\r\n\tpayload.isHardcore = hardcore.Value\r\nend\r\n\r\nlocal dungeon = workspace:FindFirstChild("dungeon")\r\nif dungeon then\r\n\tfor _, value in ipairs(dungeon:GetChildren()) do\r\n\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\tend\r\n\tlocal bossRoom = dungeon:FindFirstChild("bossRoom")\r\n\tif bossRoom then\r\n\t\tfor _, value in ipairs(bossRoom:GetChildren()) do\r\n\t\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\t\tend\r\n\tend\r\nend\r\n\r\nif not payload.dungeonName then return end\r\nReplayDungeon:FireServer(payload)\r\n'
,[[game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder]],
function(ae)local af,ag=pcall(loadstring,'return '..ae)if af and type(ag)==
'function'then return ag end return nil end local ar,as=pcall(loadstring,am)if
ar and type(as)=='function'then ap=as end aq=ao(an)if not aq then aq=function()
return ae:FindFirstChild'PlayerGui'and ae.PlayerGui:FindFirstChild
'rewardGuiHolder'and ae.PlayerGui.rewardGuiHolder:FindFirstChild'holder'end end
local at,au,av=function()local at,au=pcall(function()local at=ae:FindFirstChild
'PlayerGui'local au=at and at:FindFirstChild'timeLeftGui'local av=au and au:
FindFirstChild'Frame'return av and av:FindFirstChild'time'end)if not at or
typeof(au)~='Instance'then return nil end local av if au:IsA'ValueBase'then av=
au.Value else av=au.Text end if type(av)=='number'then return av end if type(av)
=='string'then local ax=av:gsub('%s+',''):gsub('^%[',''):gsub('%]$','')local ay,
az=ax:match'^(%d+):(%d+)$'if ay and az then return tonumber(ay)*60+tonumber(az)
end local aA=tonumber(ax)if aA then return aA end end return nil end,{},function
()if not ad.IsDungeon()then return false end if not ap then ab.Notify(
'Auto Retry','Remote command invalid',3)return false end local at,au=pcall(ap)if
at then ab.Notify('Auto Retry','Retrying dungeon!',3)return true end ab.Notify(
'Auto Retry','Trigger failed: '..tostring(au),3)return false end function au.
Start()if ah then return end ah=true ai=false al=false task.spawn(function()
while(ag or aj)and ac.IsActive()do if not ad.IsDungeon()then task.wait(1)
continue end if ag then local ax=0 if aq then local ay,az=pcall(aq)if ay and
typeof(az)=='Instance'and az.Parent then ax=#az:GetChildren()end end if ax>=af
and not ai then ai=true av()elseif ax<af then ai=false end end if aj then local
ax=at()if ax and ax<ak and not al then al=true av()elseif ax and ax>=ak then al=
false end end if not ag and not aj then break end task.wait(0.75)end ah=false
end)end function au.Stop()ag=false end function au.Toggle(ax)ag=ax if ax then al
=false au.Start()ab.Notify('Auto Retry','Watching reward holder...',2)else au.
Stop()ab.Notify('Auto Retry','Stopped',2)end end function au.SetTimeRetryEnabled
(ax)aj=ax==true if aj then al=false au.Start()ab.Notify('Auto Retry',
'Watching time left...',2)else ab.Notify('Auto Retry','Time retry stopped',2)end
end function au.GetTimeRetryEnabled()return aj end function au.
SetTimeRetryThreshold(ax)ak=ax end function au.GetTimeRetryThreshold()return ak
end function au.GetTimeLeft()return at()end function au.RetryNow()if not ad.
IsDungeon()then ab.Notify('Auto Retry','Only available in Dungeon!',3)return end
task.spawn(function()av()end)end ad.Register{Name='AutoRetry',Zone='Dungeon',
OnLeave=function()ai=false al=false end}ac.Register(function()au.Stop()aj=false
end)return au end function a.T()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load
'Q',a.load'c',a.load'S'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,
ax,ay,az,aA,aB,aC,aF,aG,aH,aI=aa.player,aa.VirtualInputManager,aa.
UserInputService,aa.RunService or game:GetService'RunService',0.4,0.5,8,2,4.5,8,
14,8,2,0.5,2,0.001,0.5,{},true,true,true,0.9,0.1,0.1,2.5,false,true function ax.
SetAimSkillQ(aJ)aH=aJ and true or false end function ax.IsAimSkillQEnabled()
return aH end function ax.SetAimSkillE(aJ)aI=aJ and true or false end function
ax.IsAimSkillEEnabled()return aI end local aJ=function(aJ)if aJ=='Q'then return
aH elseif aJ=='E'then return aI end return aH or aI end function ax.
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
function ax.IsUseFastSpeedEnabled()return aL end local aO,aQ=false,5 function ax
.SetAutoRetryOnDeathLimit(aR)aO=aR and true or false end function ax.
IsAutoRetryOnDeathLimitEnabled()return aO end local aR,aS,aT,aU,aV,aW,aX,aY,aZ,
a_,a0=function(aR)local aS if aL then local aT=ab.GetFastSpeed()if type(aT)==
'number'and aT>0 then aS=aT end elseif aK then if type(aR)=='number'and aR>0
then aS=aR end end if not aS or aS<=0 then return end local aT=ab.GetHumanoid()
if not aT then return end if aM==nil then aN=aT.WalkSpeed end aM=aS if aT.
WalkSpeed~=aS then aT.WalkSpeed=aS end end,function()if aM==nil then return end
local aR=ab.GetHumanoid()if aN and aR and aR.WalkSpeed~=aN then aR.WalkSpeed=aN
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
bn then return end aR(bj.speed)local bo=ac.SimplifyPath(bj.points,aj)local bp=#
bo if bp<2 then return end local bq,br=0,{}br[1]=0 for bs=2,bp do local bu=a4(bo
[bs-1],bo[bs])bq+=bu br[bs]=bq end aW=0 aX=bq aY=0 a1'progress_init'local bs,bu=
function(bs,bu,bv)bu=bu or 0 bv=bv or bq local bw,bx=0,math.huge for by=2,bp do
if br[by]<bu then continue end if br[by-1]>bv then continue end local bz,bA=bo[
by-1],bo[by]local bB,bC=bz.X,bz.Z local bD,bE=bA.X-bB,bA.Z-bC local bF,bG=bD*bD+
bE*bE,0 if bF>0 then bG=((bs.X-bB)*bD+(bs.Z-bC)*bE)/bF bG=math.clamp(bG,0,1)end
local bH,bI=bs.X-(bB+bD*bG),bs.Z-(bC+bE*bG)local bJ=bH*bH+bI*bI if bJ<bx then bx
=bJ bw=br[by-1]+math.sqrt(bF)*bG end end return bw end,function(bs)local bu=2
while bu<=bp and br[bu]<bs do bu+=1 end bu=math.min(bu,bp)local bv=br[bu]-br[bu-
1]if bv<=0 then return bo[bu]end local bw,bx,by=math.clamp((bs-br[bu-1])/bv,0,1)
,bo[bu-1],bo[bu]return Vector3.new(bx.X+(by.X-bx.X)*bw,bx.Y+(by.Y-bx.Y)*bw,bx.Z+
(by.Z-bx.Z)*bw)end local bv,bw,bx=function(bv)local bw=bq-bv if bw<=1 then
return math.max(0.2,bw)end local bx,by=math.min(bv+2,bq),math.min(bv+4.5,bq)if
by-bv<0.8 then return math.min(am,bw)end local bz,bA,bB=bu(bv),bu(bx),bu(by)
local bC,bD,bE,bF=bA.X-bz.X,bA.Z-bz.Z,bB.X-bA.X,bB.Z-bA.Z local bG,bH=math.sqrt(
bC*bC+bD*bD),math.sqrt(bE*bE+bF*bF)if bG>0.1 and bH>0.1 then local bI=math.
clamp((bC*bE+bD*bF)/(bG*bH),-1,1)local bJ=math.clamp((bI+0.2)/1.2,0,1)local bK=
am+(an-am)*bJ return math.min(bK,bw)end return math.min(an,bw)end,{},{}if bj.
events and(ay or az or aA)then local by,bz=bj.events.dwells or{},bj.events.
skills or{}for bA,bB in ipairs(by)do local bC,bD=bs(bB.pos),bB.dur or 0 if bC<=
0.8 or bC>=bq-0.8 then bD=aG end bw[bA]={arc=bC,dur=bD,facing=bB.facing,skills={
},pos=bB.pos}end if aG>0 and(#bw==0 or bw[1].arc>0.8)then table.insert(bw,1,{arc
=0,dur=aG,facing=bj.events and bj.events.startFacing or nil,skills={},pos=bj.
startPos or bo[1]})end for bA,bB in ipairs(bz)do local bC=(ay and bB.dw>0 and bw
[bB.dw])and bw[bB.dw]or nil if bC then table.insert(bC.skills,{tOff=bB.dwT or 0,
facing=bB.facing,key=bB.key})else table.insert(bx,{arc=bs(bB.pos),facing=bB.
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
'boss'end local bI=a3(bn)if not bI then task.wait(0.08)continue end local bJ=bs(
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
IsBossActive()and bk>0 then bn+=1 if bn>=aQ then ad.Notify('Path Record',string.
format('Exceeded %d deaths in Room %d. Retrying dungeon...',aQ,bk),3)bn=0 ae.
RetryNow()end end end task.wait(0.25)continue end if bm then bm=false end if ab.
IsInLobby()then aU=false aT=false break end if ab.IsBossActive()and not aV then
task.wait(0.25)continue end local bo=ab.GetCurrentRoomIndex()if bo<=0 then task.
wait(0.1)continue end if bo~=bk then bk=bo bn=0 bl=false aW=0 aX=0 aY=0 end
local bp=ac.GetRoomSegment(a_,bo)if not bp then task.wait(0.1)continue end if bl
then task.wait(0.1)continue end local bq,br=bj(bp,bo,aV)bi()if bq then bl=true
aW=aX aY=100 else if br=='dead'then if not bm then bm=true if aO and not aV and
not ab.IsBossActive()and bo>0 then bn+=1 if bn>=aQ then ad.Notify('Path Record',
string.format('Exceeded %d deaths in Room %d. Retrying dungeon...',aQ,bo),3)bn=0
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
end return ax end function a.U()local aa,ab,ac,ad,ae,af,ag=a.load'e',a.load'f',a
.load'Q',a.load'R',a.load'T',a.load'b',game:GetService'Workspace'local ah,ai,aj,
ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG=aa.RunService,{},
'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.fromRGB(255,60,60),
Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.fromRGB(0,220,110),
Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.fromRGB(255,190,30),
Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),Color3.fromRGB(255,210,60
),0.35,0.55,2.5,3,0.35,true,true,true,true local aH,aI,aJ,aK,aL,aM,aN,aO,aQ,aR,
aS=av,true,0,{},{},{},{},{}local aT,aU,aV,aW,aX,aY,aZ,a_=function()if aQ and aQ.
Parent and aR and aR.Parent then return aR end ai.Clear()local aT=Instance.new
'Folder'aT.Name=aj aT.Parent=ag local aU=Instance.new'Part'aU.Name=ak aU.
Anchored=true aU.CanCollide=false aU.CanQuery=false aU.CanTouch=false aU.
Transparency=1 aU.Size=Vector3.new(1,1,1)aU.CFrame=CFrame.new(0,0,0)aU.Parent=aT
aQ=aT aR=aU table.clear(aK)table.clear(aL)table.clear(aM)table.clear(aN)table.
clear(aO)return aR end,function(aT,aU)local aV=aK[aT]if not aV or not aV.Parent
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
MaxDistance=180 aX.LightInfluence=0 aX.Parent=aQ local aY=Instance.new'Frame'aY.
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
)a1:Destroy()end)end aQ=nil aR=nil end function ai.Destroy()if aS then aS:
Disconnect()aS=nil end ai.Clear()end ai.Clear()a0()af.Register(function()ai.
Destroy()end)return ai end function a.V()local aa,ab,ac=a.load'e',a.load'f',a.
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
,aN,aO=ab.GetTrackedEnemyData(),aJ.Position,ak*ak,{},aC()for aQ,aR in ipairs(aK)
do local aS,aT,aU=aR.Model,aR.Root,aR.Humanoid if aS and aS.Parent and aT and aT
.Parent and aU and aU.Health>0 then local aV,aW=aT.Position.X-aL.X,aT.Position.Z
-aL.Z if(aV*aV+aW*aW)<=aM then aN[aS]=true end end end for aQ,aR in pairs(av)do
if not aN[aQ]or not aQ.Parent then pcall(function()aR:Destroy()end)av[aQ]=nil
end end for aQ in pairs(aN)do if not av[aQ]or not av[aQ].Parent then local aR=aQ
:FindFirstChild(as)local aS=(aR and aR:IsA'Highlight')and aR or Instance.new
'Highlight'aS.Name=as aS.Adornee=aQ aS.FillColor=aO aS.FillTransparency=0.35 aS.
OutlineColor=Color3.fromRGB(255,255,255)aS.OutlineTransparency=0.1 aS.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop aS.Parent=aQ av[aQ]=aS else local aR=av[aQ]
if aR.FillColor~=aO then aR.FillColor=aO end if not aR.Enabled then aR.Enabled=
true end end end end local aL=function()if not aj then return end local aL=aF()
if not aL then if ax then ax.Visible=false end if ay then ay.Visible=false end
if next(av)~=nil then aG()end aA=nil return end local aM=2.6 local aN=Vector3.
new(aL.Position.X,aL.Position.Y-aM,aL.Position.Z)local aO=CFrame.new(aN)*CFrame.
Angles(math.rad(90),0,0)local aQ=aL.CFrame:ToObjectSpace(aO)if not ax or not ax.
Parent or aL~=aA then aA=aL aJ(aL)else if ax.Adornee~=aL then ax.Adornee=aL end
ax.CFrame=aQ if not ax.Visible then ax.Visible=true end if am then if not ay or
not ay.Parent then aJ(aL)else if ay.Adornee~=aL then ay.Adornee=aL end ay.CFrame
=aQ if not ay.Visible then ay.Visible=true end end elseif ay and ay.Visible then
ay.Visible=false end end local aR=os.clock()if aR-au>=at then au=aR aK(aL)end
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
false)aH()end)return ah end function a.W()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
,al,am,an,ao=a.load'e',a.load'f',a.load'b',a.load'h',a.load'c',a.load'B',a.load
'g',a.load'Q',a.load'R',a.load'T',a.load'U',a.load'V',{},false,{}local ap,aq,ar=
function(ap)local aq=ai.GetStatus()local ar={recording=ai.IsRecording(),playing=
aj.IsPlaying(),resume=aj.ResumeWanted(),autoPlayWanted=an,inLobby=ab.IsInLobby()
,map=ab.GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.
IsBossActive(),recordedMaps=ah.Count(),pointCount=ai.IsRecording()and aq.
pointCount or 0,reason=ap}for as,at in ipairs(ao)do pcall(at,ar)end end,true,
true function am.IsTimelineCaptureEnabled()return aq end function am.
SetTimelineCapture(as)aq=as and true or false ai.SetCapture(aq)ap'timeline'end
function am.IsTimelineReplayEnabled()return ar end function am.SetTimelineReplay
(as)ar=as and true or false aj.SetReplayTimeline(ar)ap'timeline'end function am.
IsSpeedMatchEnabled()return aj.IsSpeedMatchEnabled()end function am.
SetSpeedMatch(as)aj.SetSpeedMatch(as and true or false)ap'speedmatch'end
function am.IsUseFastSpeedEnabled()return aj.IsUseFastSpeedEnabled()end function
am.SetUseFastSpeed(as)aj.SetUseFastSpeed(as and true or false)ap'usefastspeed'
end function am.IsAutoRetryOnDeathLimitEnabled()return aj.
IsAutoRetryOnDeathLimitEnabled()end function am.SetAutoRetryOnDeathLimit(as)aj.
SetAutoRetryOnDeathLimit(as and true or false)ap'retryondeath'end function am.
GetPreAimTime()return aj.GetPreAimTime()end function am.SetPreAimTime(as)aj.
SetPreAimTime(as)ap'preaim'end function am.GetSkillFaceHold()return aj.
GetSkillFaceHold()end function am.SetSkillFaceHold(as)aj.SetSkillFaceHold(as)ap
'facehold'end function am.GetDoubleClickDelay()return aj.GetDoubleClickDelay()
end function am.SetDoubleClickDelay(as)aj.SetDoubleClickDelay(as)ap'doubleclick'
end function am.GetStartPauseTime()return aj.GetStartPauseTime()end function am.
SetStartPauseTime(as)aj.SetStartPauseTime(as)ap'startpause'end function am.
IsAimSkillQEnabled()return aj.IsAimSkillQEnabled()end function am.SetAimSkillQ(
as)aj.SetAimSkillQ(as and true or false)ap'aimskillq'end function am.
IsAimSkillEEnabled()return aj.IsAimSkillEEnabled()end function am.SetAimSkillE(
as)aj.SetAimSkillE(as and true or false)ap'aimskille'end function am.
ToggleRecord(as)if as then if not ag.IsDungeon()then ae.Notify('Path Record',
'Cannot record in Lobby!',3)return false end if ai.IsRecording()then return true
end if aj.IsPlaying()then aj.Stop()end local at,au=ai.Start()if not at then ae.
Notify('Path Record','Failed to start record: '..tostring(au),3)end ap()return
at else local at=ai.IsRecording()ai.Stop()ap()return at end end function am.
IsRecording()return ai.IsRecording()end function am.CurrentRoomHasRecord()return
ah.HasSegmentOrMacro(ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex())end
function am.GetMapMode(as)return ah.GetMapMode(as)end function am.SetMapMode(as,
at)if ah.SetMapMode(as,at)then ap'mode'end end function am.IsAutoPlayWanted()
return an end function am.TogglePlay(as)an=as and true or false if an then if aj
.IsPlaying()then ap'already_playing'return true end if ai.IsRecording()then ai.
Stop()end if not ag.IsDungeon()then ap'armed_lobby'return true end local at,au=
ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if not at or#at==0 or au<=0
then ap'armed_waiting'return true end if ab.IsBossActive()and ah.GetMapMode(at)
~='full'then ap'armed_boss'return true end if ah.HasSegmentOrMacro(at,au)then ad
.EnableExclusive'PathRecord'aj.Start()end ap'play_started'return true else local
at=aj.IsPlaying()aj.Stop()ap'play_stopped'return at end end function am.
IsPlaying()return aj.IsPlaying()end function am.IsEnabled()return aj.IsPlaying()
end function am.SetRangeVisual(as)al.SetEnabled(as)ap'rangevisual'end function
am.IsRangeVisualEnabled()return al.IsEnabled()end function am.
SetRangeVisualRadius(as)al.SetRadius(as)ap'rangeradius'end function am.
GetRangeVisualRadius()return al.GetRadius()end function am.SetRangeVisualFill(as
)al.SetFillEnabled(as)ap'rangefill'end function am.IsRangeVisualFillEnabled()
return al.IsFillEnabled()end function am.SetHighlightInRange(as)al.
SetHighlightInRange(as)ap'rangehighlight'end function am.
IsHighlightInRangeEnabled()return al.IsHighlightInRangeEnabled()end function am.
GetRangeColorNames()return al.GetColorNames()end function am.
GetSelectedCircleColor()return al.GetSelectedCircleColor()end function am.
SetCircleColor(as)al.SetCircleColor(as)ap'circlecolor'end function am.
GetSelectedHighlightColor()return al.GetSelectedHighlightColor()end function am.
SetHighlightColor(as)al.SetHighlightColor(as)ap'highlightcolor'end function am.
SetVisualEnabled(as)ak.SetEnabled(as)ap'visual'end function am.IsVisualEnabled()
return ak.IsEnabled()end function am.SetVisualShowLines(as)ak.SetShowLines(as)ap
'visuallines'end function am.IsVisualShowLinesEnabled()return ak.
IsShowLinesEnabled()end function am.SetVisualNodeRadius(as)ak.SetNodeRadius(as)
ap'visualradius'end function am.GetVisualNodeRadius()return ak.GetNodeRadius()
end function am.SetVisualAlwaysOnTop(as)ak.SetAlwaysOnTop(as)ap'visualontop'end
function am.IsVisualAlwaysOnTopEnabled()return ak.IsAlwaysOnTopEnabled()end
function am.SetVisualShowEvents(as)ak.SetShowEvents(as)ap'visualevents'end
function am.IsVisualShowEventsEnabled()return ak.IsShowEventsEnabled()end
function am.SetVisualShowFacing(as)ak.SetShowFacingRays(as)ap'visualfacing'end
function am.IsVisualShowFacingEnabled()return ak.IsShowFacingRaysEnabled()end
function am.GetMaps()return ah.GetMaps()end function am.GetMacro(as)return ah.
GetMap(as)end function am.RemoveMap(as)ah.RemoveMap(as)ap'removed'end function
am.ClearAll()ah.ClearAll()ap'cleared'end function am.ReloadFromDisk()ah.
ReloadFromDisk()ap'reloaded'end function am.GetStatus()local as,at=ai.GetStatus(
),aj.GetStatus()return{recording=ai.IsRecording(),playing=aj.IsPlaying(),resume=
aj.ResumeWanted(),autoPlayWanted=an,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=ah.Count(),pointCount=as.pointCount,dwellCount=as.dwellCount or 0,
skillCount=as.skillCount or 0,progressPercent=at.progressPercent or 0,
progressStuds=at.progressStuds or 0,totalStuds=at.totalStuds or 0}end function
am.OnStatusChanged(as)if type(as)~='function'then return function()end end table
.insert(ao,as)return function()for at,au in ipairs(ao)do if au==as then table.
remove(ao,at)break end end end end bossConnection=ab.OnBossActiveChanged(
function(as)local at=aj.GetActiveMap()or ab.GetCurrentDungeonName()local au=at
and ah.GetMapMode(at)=='full'if as then if au then if aj.ResumeWanted()or an
then local av=ab.GetCurrentRoomIndex()if av>0 and ah.HasSegmentOrMacro(at,av)
then ad.EnableExclusive'PathRecord'aj.Start()ap'boss'end elseif aj.IsPlaying()
then ad.EnableExclusive'PathRecord'end return end if aj.IsPlaying()or aj.
ResumeWanted()or an then aj.PauseForExclusive()if af.IsAutoBossCombatEnabled()
then af.Toggle(true,true)ae.Notify('Path Record',
[[Boss Room: Combat Master enabled (Auto Farm + Dodge + Skill)]],3)else ae.
Notify('Path Record','Boss Room: Paused, using Hazard Scanner',3)end ap'boss'end
else if not au then if af.IsAutoTriggeredByBoss()then af.Toggle(false)ae.Notify(
'Path Record','Boss Defeated: Combat Master disabled',3)end if an or aj.
ResumeWanted()then task.delay(0.5,function()if not an and not aj.ResumeWanted()
then return end if aj.IsPlaying()or ai.IsRecording()then return end local av,ax=
ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if av and ax>0 and ah.
HasSegmentOrMacro(av,ax)then ad.EnableExclusive'PathRecord'aj.Start()ap'resumed'
end end)end end end end)storageUnsub=ah.OnChanged(function()ap'storage'end)
roomUnsub=ab.OnRoomIndexChanged(function(as)if not ab.IsBossActive()and(af.
IsAutoTriggeredByBoss()or af.IsEnabled())then af.Toggle(false)end if not an and
not aj.ResumeWanted()then return end local at=as or ab.GetCurrentRoomIndex()if
at<=0 or ab.IsInLobby()or ab.IsDead()then return end local au=ab.
GetCurrentDungeonName()if not au or#au==0 then return end if aj.GetActiveMap()
and aj.GetActiveMap()~=au then return end if ab.IsBossActive()and ah.GetMapMode(
au)~='full'then return end if not ah.HasSegmentOrMacro(au,at)then return end if
not aj.IsPlaying()then ad.EnableExclusive'PathRecord'aj.Start()ap'resumed'end
end)mapUnsub=ab.OnDungeonNameChanged(function(as)if af.IsAutoTriggeredByBoss()or
af.IsEnabled()then af.Toggle(false)end if ai.IsRecording()then ai.Stop
'map change'end if aj.IsPlaying()or aj.ResumeWanted()then local at=aj.
GetActiveMap()if at and at~=as then aj.Stop()end end if an and as and#as>0 then
task.delay(0.3,function()if not an or aj.IsPlaying()or ai.IsRecording()then
return end local at=ab.GetCurrentRoomIndex()if at>0 and ah.HasSegmentOrMacro(as,
at)then if not(ab.IsBossActive()and ah.GetMapMode(as)~='full')then ad.
EnableExclusive'PathRecord'aj.Start()ap'map_autoplay'end end end)end ap'map'end)
ai.SetCapture(aq)aj.SetReplayTimeline(ar)ad.Register('PathRecord',function(as)if
not as then aj.PauseForExclusive()end ap'disabled'end,am.IsEnabled)task.delay(1,
function()if an and not aj.IsPlaying()and not ai.IsRecording()then local as=ab.
GetCurrentDungeonName()if as and#as>0 and not ab.IsInLobby()then if ah.
HasSegmentOrMacro(as,ab.GetCurrentRoomIndex())then am.TogglePlay(true)end end
end end)ag.Register{Name='PathRecord',Zone='Dungeon',OnLeave=function()if ai.
IsRecording()then ai.Cancel()end if aj.IsPlaying()then aj.Stop()end ak.Clear()ap
'zone_leave'end}ac.Register(function()aj.Stop()ai.Cancel()ak.Clear()if
bossConnection then bossConnection()bossConnection=nil end if roomUnsub then
roomUnsub()roomUnsub=nil end if mapUnsub then mapUnsub()mapUnsub=nil end if
storageUnsub then storageUnsub()storageUnsub=nil end end)return am end function
a.X()local aa,ab,ac,ad,ae,af=a.load'e',a.load'b',a.load'W',a.load'd',a.load'C',a
.load'c'local ag=aa.RunService return function(ah,ai)local aj=ai:Section{Side=
'Left'}aj:Header{Name='Macro Controls'}aj:Label{Text=
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
Maximum=0.5,DisplayMethod='Value',Precision=3,Callback=ad.Wrap(function(aF)ac.
SetDoubleClickDelay(aF)end),onInputComplete=function(aF)ad.SaveNow()af.Notify(
'Path Record',('Saved Double Click Delay = %ss'):format(tostring(aF)),2)end},
'Slider_PR_DoubleClickDelay'))ae.PatchSliderLoadCallback(aC:Slider({Name=
'Start / Finish Pause Time (s)',Default=ac.GetStartPauseTime(),Minimum=0,Maximum
=5,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aF)ac.
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
{Side='Right'}aO:Header{Name='Status Monitor & Live HUD'}local aQ,aR,aS,aT,aU,aV
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
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aQ:UpdateName(
'State: '..be)end)if ba.playing then local bf,bg=a7(ba.progressPercent),(
'(%.1f / %.1f studs)'):format(ba.progressStuds or 0,ba.totalStuds or 0)pcall(
function()aR:UpdateName('Progress: '..bf..' '..bg)end)elseif ba.recording then
pcall(function()aR:UpdateName(
[[Progress: <font color='rgb(255,90,90)'>Recording Segment...</font> (]]..
tostring(ba.pointCount or 0)..' pts)')end)else pcall(function()aR:UpdateName
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
aq(ac.GetStatus())end end function a.Y()local aa,ab,ac,ad,ae,af=a.load'e',a.load
'c',a.load'N',a.load'f',a.load'b',a.load'g'local ag,ah,ai,aj,ak,al,am,an,ao,ap,
aq,ar=aa.player.Name,false,false,false,'Desert Temple','Easy',false,true,false,3
,{[77649408247578]=true,[3220968688]=true,[2414851778]=true},{}local as,at,au=
function()return aq[game.PlaceId]==true end,function()for as,at in ipairs(ar)do
pcall(at,ak,ac.GetAllowedDifficulties(ak))end end,function()if not af.IsLobby()
then return end if ai then return end ai=true aj=false task.spawn(function()
local as,at=pcall(function()local as=game:GetService'ReplicatedStorage':
WaitForChild('remotes',15)if not as then error'remotes not found'end local at=ac
.GetLevelReq(ak,al)pcall(function()as:WaitForChild('createLobby',10):
InvokeServer(ak,al,at,am,an,ao)end)if aj or not af.IsLobby()then return end task
.wait(ap)if aj or not af.IsLobby()then return end if an then pcall(function()as:
WaitForChild('addPlayerToWhitelist',10):FireServer(ag)end)if aj or not af.
IsLobby()then return end task.wait(ap)if aj or not af.IsLobby()then return end
end local au=0 while au<10 do local av=workspace:FindFirstChild'games'and
workspace.games:FindFirstChild'inLobby'if av then break end task.wait(0.5)au=au+
0.5 if aj or not af.IsLobby()then return end end if aj or not af.IsLobby()then
return end task.wait(ap)if aj or not af.IsLobby()then return end pcall(function(
)as:WaitForChild('startDungeon',10):FireServer()end)end)ai=false if aj or not af
.IsLobby()then return end if as then ab.Notify('Auto Join','Joined: '..ak,3)else
ab.Notify('Auto Join','Join failed: '..tostring(at),4)end end)end local av,ax=
function()while ae.IsActive()do task.wait(0.5)if ah and not ai and as()and af.
IsLobby()then au()end end end,{}function ax.Toggle(ay)ah=ay if ah then ab.
Notify('Auto Join','Enabled',2)else aj=true ab.Notify('Auto Join','Stopped',2)
end end function ax.SetDungeon(ay)if type(ay)~='string'or#ay==0 then return end
ak=ay if not ac.IsDifficultyAllowed(ak,al)then local az=ac.
GetAllowedDifficulties(ak)if#az>0 then al=az[1]end end at()end function ax.
SetDifficulty(ay)if type(ay)~='string'then return end if ac.IsDifficultyAllowed(
ak,ay)then al=ay end end function ax.SetHardcore(ay)am=ay end function ax.
SetPrivate(ay)an=ay end function ax.SetWaveDefence(ay)ao=ay end function ax.
SetDelay(ay)ap=ay end function ax.GetSelectedDungeon()return ak end function ax.
GetSelectedDifficulty()return al end function ax.GetAllowedDifficulties()return
ac.GetAllowedDifficulties(ak)end function ax.OnDungeonChanged(ay)if type(ay)==
'function'then table.insert(ar,ay)end end ax.JoinNow=function()if not af.
IsLobby()then ab.Notify('Auto Join','Only available in Lobby!',3)return end task
.spawn(function()au()end)end af.Register{Name='AutoJoin',Zone='Lobby',OnLeave=
function()aj=true ai=false end}task.spawn(av)ae.Register(function()ax.Toggle(
false)end)return ax end function a.Z()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load
'f',a.load'c',a.load'b',a.load'g',{[77649408247578]=true,[115445507767090]=true,
[3220968688]=true,[2414851778]=true},false,false,false,3,
[[game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("changeStartValue"):FireServer()]]
local ak,al,am=function()return ad.IsDungeon()and not ae[game.PlaceId]end,pcall(
loadstring,aj)if al and type(am)=='function'then autoStartCommandFn=am end local
an,ao={},{}function an.OnStart(ap)if type(ap)~='function'then return function()
end end table.insert(ao,ap)return function()for aq,ar in ipairs(ao)do if ar==ap
then table.remove(ao,aq)break end end end end function an.Start()if ag then
return end ag=true ah=false task.spawn(function()while af and ac.IsActive()do
local ap,aq=pcall(ak)local ar=ap and aq==true if ar and not ah then ah=true
local as=0 while as<ai and af and ad.IsDungeon()do task.wait(0.1)as=as+0.1 end
if not af or not ad.IsDungeon()then ah=false break end if autoStartCommandFn
then local at,au=pcall(autoStartCommandFn)if at then ab.Notify('Auto Start',
'Game started!',3)for av=#ao,1,-1 do pcall(ao[av])end else ab.Notify(
'Auto Start','Trigger failed: '..tostring(au),3)end else ab.Notify('Auto Start',
'Remote command invalid',3)end end if not af then break end task.wait(1)end ag=
false end)end function an.Stop()af=false end function an.SetDelay(ap)ai=
tonumber(ap)or 3 end function an.GetDelay()return ai end function an.Toggle(ap)
af=ap if ap then an.Start()else an.Stop()end end ad.Register{Name='AutoStart',
Zone='Dungeon',OnLeave=function()ah=false end}ac.Register(function()an.Stop()end
)return an end function a._()local aa,ab,ac=a.load'b',a.load'g',{[77649408247578
]=true,[115445507767090]=true,[3220968688]=true,[2414851778]=true}local ad,ae,af
,ag,ah=function()return ac[game.PlaceId]==true end,false,game:GetService
'VirtualInputManager',game:GetService'GuiService',function()local ad=game:
GetService'Players'.LocalPlayer if not ad then return nil end local ae=ad:
FindFirstChild'PlayerGui'if not ae then return nil end local af=ae:
FindFirstChild'introGui'if not af or not af:IsA'ScreenGui'or not af.Enabled then
return nil end local ag=af:FindFirstChild'title'if not ag then return nil end
local ah=ag:FindFirstChild'Frame'if not ah then return nil end local ai=ah:
FindFirstChild'TextButton'if not ai or not ai:IsA'TextButton'or not ai.Visible
then return nil end local aj=''if ai.Text and type(ai.Text)=='string'then aj=ai.
Text end if not string.find(string.lower(aj),'play')then return nil end return
ai end local ai=function(ai)pcall(function()ag.SelectedObject=ai end)task.wait(
0.1)af:SendKeyEvent(true,Enum.KeyCode.Return,false,game)task.wait()af:
SendKeyEvent(false,Enum.KeyCode.Return,false,game)task.wait(0.1)pcall(function()
ag.SelectedObject=nil end)end local aj,ak=function()task.spawn(function()local
aj=false while ae and aa.IsActive()do if not ab.IsLobby()or not ad()then task.
wait(1)continue end local ak=ah()if ak then ai(ak)aj=true elseif aj then print
'[AutoStartLobby] Pressed Start'break end if not ae then break end task.wait(0.2
)end end)end,{}function ak.Toggle(al)ae=al if ae then aj()end end ab.Register{
Name='AutoStartLobby',Zone='Lobby',OnLeave=function()ae=false end}aa.Register(
function()ae=false end)return ak end function a.aa()local aa,ab,ac,ad,ae,af,ag,
ah=a.load'C',a.load'Y',a.load'Z',a.load'_',a.load'S',a.load'd',a.load'N',a.load
'g'return function(ai,aj)local ak,al,am=aj:Section{Side='Left'},aj:Section{Side=
'Right'},function(ak,al)for am,an in ipairs(ak)do if an==al then return am end
end return nil end ak:Header{Name='Auto Join Dungeon (Lobby)'}al:Header{Name=
'Dungeon Run Automation'}local an=ak:Label({Text='Current Zone: '..(ah.IsLobby()
and'Lobby'or'Dungeon')},'Label_DungeonTabZone')ah.OnZoneChanged(function(ao)
pcall(function()an:UpdateName('Current Zone: '..ao)end)end)ak:Toggle({Name=
'Auto Join Dungeon',Default=false,Callback=af.Wrap(function(ao)ab.Toggle(ao)end)
},'Toggle_AutoJoin')local ao=ag.GetDungeons()local ap=aa.PatchDropdownRestore(ak
:Dropdown({Name='Dungeon',Options=ao,Default=am(ao,ab.GetSelectedDungeon())or 1,
Required=true,Callback=af.Wrap(function(ap)ab.SetDungeon(ap)end)},
'Dropdown_Dungeon'),true)ak:Button{Name='Refresh Map List',Callback=function()
task.spawn(function()local aq=ag.RefreshDungeons()if not aq or#aq==0 then return
end pcall(function()ap:ClearOptions()ap:InsertOptions(aq)end)local ar=ab.
GetSelectedDungeon()if not table.find(aq,ar)then ab.SetDungeon(aq[1])end pcall(
function()ap:UpdateSelection(ab.GetSelectedDungeon())end)end)end}local aq=ak:
Label({Text='Recommended Level: ...'},'Label_RecommendedLevel')local ar=function
()pcall(function()local ar=ag.GetLevelReq(ab.GetSelectedDungeon(),ab.
GetSelectedDifficulty())aq:UpdateName('Recommended Level: '..tostring(ar))end)
end ar()local as=ab.GetAllowedDifficulties()local at=aa.PatchDropdownRestore(ak:
Dropdown({Name='Difficulty',Options=as,Default=am(as,ab.GetSelectedDifficulty())
or 1,Required=true,Callback=af.Wrap(function(at)ab.SetDifficulty(at)ar()end)},
'Dropdown_Difficulty'),true)ak:Toggle({Name='Hardcore',Default=false,Callback=af
.Wrap(function(au)ab.SetHardcore(au)end)},'Toggle_HardcoreAJ')ak:Toggle({Name=
'Private Room',Default=true,Callback=af.Wrap(function(au)ab.SetPrivate(au)end)},
'Toggle_PrivateAJ')ak:Toggle({Name='Wave Defence',Default=false,Callback=af.
Wrap(function(au)ab.SetWaveDefence(au)end)},'Toggle_WaveDefenceAJ')aa.
PatchSliderLoadCallback(ak:Slider({Name='Join Delay (s)',Default=3,Minimum=0,
Maximum=15,DisplayMethod='Value',Precision=1,Callback=af.Wrap(function(au)ab.
SetDelay(au)end)},'Slider_JoinDelay'))ak:Button{Name='Join Now',Callback=
function()ab.JoinNow()end}al:Toggle({Name='Auto Start',Default=false,Callback=af
.Wrap(function(au)ac.Toggle(au)end)},'Toggle_AutoStart')aa.
PatchSliderLoadCallback(al:Slider({Name='Start Delay (s)',Default=ac.GetDelay(),
Minimum=0,Maximum=15,DisplayMethod='Value',Precision=1,Callback=af.Wrap(function
(au)ac.SetDelay(au)end)},'Slider_AutoStartDelay'))al:Toggle({Name=
'Auto Start Lobby',Default=false,Callback=af.Wrap(function(au)ad.Toggle(au)end)}
,'Toggle_AutoStartLobby')al:Toggle({Name='Auto Retry',Default=false,Callback=af.
Wrap(function(au)ae.Toggle(au)end)},'Toggle_AutoRetry')al:Button{Name=
'Manual Retry',Callback=function()task.spawn(function()ae.RetryNow()end)end}al:
Toggle({Name='Retry on Time Low',Default=ae.GetTimeRetryEnabled(),Callback=af.
Wrap(function(au)ae.SetTimeRetryEnabled(au)end)},'Toggle_RetryTimeLow')aa.
PatchSliderLoadCallback(al:Slider({Name='Retry Time Threshold (s)',Default=ae.
GetTimeRetryThreshold(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=af.Wrap(function(au)ae.SetTimeRetryThreshold(au)end)},
'Slider_RetryTimeThreshold'))ab.OnDungeonChanged(function(au,av)pcall(function()
at:ClearOptions()at:InsertOptions(av)at:UpdateSelection(ab.
GetSelectedDifficulty())end)ar()end)end end function a.ab()local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as=a.load'b',a.load'c',a.load'f',a.load
'g',{},false,false,true,{},{},{},'None',false,{weapons='Weapons',helmets=
'Helmets',chests='Chests',abilities='Abilities'},{'Common','Uncommon','Rare',
'Epic','Legendary','Mythic'},{'1','5','10','15','20','25','30','35','40','45',
'50','55','60','65','70','75','80','85','90','95','100','105','110','115','120',
'125','130','135','140','145','150','155','160','165','170','175','180','185',
'190','195','200','205','210','215','220','225','230','235','240','245','250',
'255','260','265','270','275','280','285','290','295','300'},{'None','Below',
'Above'},{Common=0,Uncommon=1,Rare=2,Epic=3,Legendary=4,Mythic=5},{}for at,au in
ipairs(ao)do as[au]=true end local at={}for au,av in ipairs(ao)do at[string.
lower(av)]=av end local au,av=function(au)if type(au)~='string'then return nil
end return at[string.lower(au)]end,function(au)local av pcall(function()av=game:
GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'sellItemEvent',5)end)if not av then return false,0 end local ax={}for ay,az in
pairs(au)do if type(az)=='table'and#az>0 then ax[ay]=az end end if next(ax)==nil
then return false,0 end local ay=pcall(function()av:FireServer(ax)end)if not ay
then return false,0 end return true,0 end local ax=av function ae.SetSellAction(
ay)if type(ay)=='function'then ax=ay end end local ay=function()local ay,az=
pcall(function()return game:GetService'ReplicatedStorage':WaitForChild('remotes'
,5):WaitForChild('reloadInvy',5)end)if not ay or not az then return nil,
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
aO,aQ in pairs(aK)do if an[aO]then aJ(aQ,aO,nil,nil)elseif type(aQ)=='table'and
aG(aQ)then local aR,aS=aH(aO)aJ(aQ,aL,aR,aS)else aJ(aQ,aL,aM,aN)end end end aJ(
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
total=#az,matching=aB,byCategory=aC}end local az=function()return ad.IsDungeon()
end function ae.IsDungeon()return ad.IsDungeon()end function ae.SellItems(aA)if
not aA and not az()then return{sold=0,skipped=0,gold=0,error=
'AutoSell is only available inside Dungeons.'}end if am then return nil end am=
true local aB,aC,aF={sold=0,skipped=0,gold=0,error=nil},ay()if not aC then aB.
error=aF or'Error reading inventory'am=false return aB end local aG={}for aH,aI
in ipairs(aC)do if ae.ShouldSellItem(aI)then if aI.Index then aB.sold+=1 local
aJ=aI.Category or aI.Type aG[aJ]=aG[aJ]or{}table.insert(aG[aJ],aI.Index)end else
aB.skipped+=1 end end local aH,aI=pcall(ax,aG)if aH and aI and type(aI)==
'number'then aB.gold=aI end am=false return aB end function ae.SetLevelReqMode(
aA)if aA=='Below'or aA=='Above'then al=aA else al='None'end end function ae.
GetLevelReqMode()return al end function ae.SetExcludeEquipped(aA)ah=aA end
function ae.GetExcludeEquipped()return ah end function ae.SetRarityFilter(aA)ai=
{}if type(aA)=='table'then for aB,aC in pairs(aA)do if aC==true and type(aB)==
'string'then local aF=au(aB)or aB ai[aF]=true elseif type(aC)=='string'then
local aF=au(aC)or aC ai[aF]=true end end elseif type(aA)=='string'then local aB=
au(aA)or aA ai[aB]=true end end function ae.GetRarityFilter()local aA={}for aB
in pairs(ai)do table.insert(aA,aB)end return aA end function ae.SetTypeFilter(aA
)aj={}if type(aA)=='table'then for aB,aC in pairs(aA)do if aC==true and type(aB)
=='string'then aj[aB]=true elseif type(aC)=='string'then aj[aC]=true end end
elseif type(aA)=='string'then aj[aA]=true end end function ae.GetTypeFilter()
local aA={}for aB in pairs(aj)do table.insert(aA,aB)end return aA end function
ae.SetLevelReqExactFilter(aA)ak={}if type(aA)=='table'then for aB,aC in pairs(aA
)do if aC==true then local aF=tonumber(aB)if aF then ak[aF]=true end else local
aF=tonumber(aC)if aF then ak[aF]=true end end end elseif type(aA)=='string'or
type(aA)=='number'then local aB=tonumber(aA)if aB then ak[aB]=true end end end
function ae.GetLevelReqExactFilter()local aA={}for aB in pairs(ak)do table.
insert(aA,tostring(aB))end return aA end local aA=function()if not af then
return end if ag then return end if not az()then return end if not ae.
HasAnyFilter()then return end ag=true task.spawn(function()task.wait(2.5)if not
af or not az()then return end local aA=ae.SellItems()if aA and aA.sold and aA.
sold>0 then ab.Notify('AutoSell',('Auto-sold %d item(s) on dungeon start.'):
format(aA.sold),3)end end)end function ae.Toggle(aB)af=aB and true or false if
af and az()and not ag then aA()end end function ae.IsEnabled()return af end ad.
Register{Name='AutoSell',Zone='Dungeon',OnEnter=function()ag=false aA()end,
OnLeave=function()ag=false end}ac.OnDungeonNameChanged(function(aB)if aB and ad.
IsDungeon()then ag=false aA()end end)task.spawn(function()while aa.IsActive()do
task.wait(1.5)if af and ad.IsDungeon()and not ag then aA()end end end)aa.
Register(function()af=false ad.Unregister'AutoSell'end)ae.LEVEL_REQ_OPTIONS=ap
ae.LEVEL_REQ_MODE_OPTIONS=aq return ae end function a.ac()local aa,ab,ac=a.load
'd',a.load'ab',a.load'c'return function(ad,ae)local af=ae:Section{Side='Left'}af
:Header{Name='AutoSell'}local ag=ae:Section{Side='Right'}ag:Header{Name=
'Filter Summary'}local ah,ai,aj,ak,al,am,an,ao=ag:Label{Text='Status: --'},ag:
Label{Text='Location: --'},ag:Label{Text='Safety: --'},ag:Label{Text=
[[Trigger: <font color='rgb(200,200,255)'>In-Dungeon Only (On Start)</font>]]},
ag:Label{Text='Rarities: --'},ag:Label{Text='Item Types: --'},ag:Label{Text=
'Level Req: --'},ag:Label{Text='Exclude Equipped: --'}local ap=function()local
ap=ab.IsEnabled()local aq,ar=ap and'0, 255, 0'or'255, 80, 80',ap and'Enabled'or
'Disabled'pcall(function()ah:UpdateName("Status: <font color='rgb("..aq..")'>"..
ar..'</font>')end)local as=ab.IsDungeon()local at,au=as and'0, 255, 0'or
'255, 160, 80',as and'Inside Dungeon (Active)'or'In Lobby (Paused)'pcall(
function()ai:UpdateName("Location: <font color='rgb("..at..")'>"..au..'</font>')
end)local av=ab.HasAnyFilter()local ax,ay=av and'0, 255, 0'or'255, 80, 80',av
and'\u{2713} Active (Configured)'or'\u{26a0} NO filter selected'pcall(function()
aj:UpdateName("Safety: <font color='rgb("..ax..")'>"..ay..'</font>')end)local az
=ab.GetRarityFilter()local aA,aB=#az>0 and table.concat(az,', ')or
'All (No filter)',#az>0 and'255, 220, 120'or'160, 160, 160'pcall(function()al:
UpdateName("Rarities: <font color='rgb("..aB..")'>"..aA..'</font>')end)local aC=
ab.GetTypeFilter()local aF,aG=#aC>0 and table.concat(aC,', ')or'All (No filter)'
,#aC>0 and'255, 220, 120'or'160, 160, 160'pcall(function()am:UpdateName(
"Item Types: <font color='rgb("..aG..")'>"..aF..'</font>')end)local aH,aI=ab.
GetLevelReqMode(),ab.GetLevelReqExactFilter()table.sort(aI,function(aJ,aK)return
(tonumber(aJ)or 0)<(tonumber(aK)or 0)end)local aJ,aK='1 (Safe Fallback)',
'255, 160, 80'if#aI>0 then aK='255, 220, 120'if aH=='Below'then aJ=
'Below (\u{2264} '..aI[#aI]..')'elseif aH=='Above'then aJ='Above (\u{2265} '..aI
[1]..')'else aJ='Exact ('..table.concat(aI,', ')..')'end end pcall(function()an:
UpdateName("Level Req: <font color='rgb("..aK..")'>"..aJ..'</font>')end)local aL
=ab.GetExcludeEquipped()local aM,aN=aL and'0, 255, 0'or'255, 80, 80',aL and
'Yes (Protected)'or'No (May Sell)'pcall(function()ao:UpdateName(
"Exclude Equipped: <font color='rgb("..aM..")'>"..aN..'</font>')end)end af:
Toggle({Name='Auto Sell on Dungeon Start',Default=ab.IsEnabled(),Callback=aa.
Wrap(function(aq)ab.Toggle(aq)ap()end)},'Toggle_AutoSellEnabled')local aq,ar={
'Common','Uncommon','Rare','Epic','Legendary','Mythic'},{'Weapons','Helmets',
'Chests','Abilities'}af:Dropdown({Name='Rarity Filter',Options=aq,Default=ab.
GetRarityFilter(),Multi=true,Required=false,Callback=aa.Wrap(function(as)ab.
SetRarityFilter(as)ap()end)},'Dropdown_AutoSellRarity')af:Dropdown({Name=
'Item Type Filter',Options=ar,Default=ab.GetTypeFilter(),Multi=true,Required=
false,Callback=aa.Wrap(function(as)ab.SetTypeFilter(as)ap()end)},
'Dropdown_AutoSellType')local as,at=(ab.GetLevelReqMode())local au=table.find(ab
.LEVEL_REQ_MODE_OPTIONS,as)or 1 af:Dropdown({Name='Level Req Mode',Options=ab.
LEVEL_REQ_MODE_OPTIONS,Default=au,Multi=false,Required=true,Callback=aa.Wrap(
function(av)ab.SetLevelReqMode(av)if at then local ax=(av=='None')at.Settings.
Multi=ax at.Settings.Required=not ax local ay=ab.GetLevelReqExactFilter()if#ay>0
then if not ax and#ay>1 then at:UpdateSelection(ay[1])else at:UpdateSelection(ay
)end end end ap()end)},'Dropdown_AutoSellLevelReqMode')at=af:Dropdown({Name=
'Level Req Filter',Options=ab.LEVEL_REQ_OPTIONS,Default=ab.
GetLevelReqExactFilter(),Multi=as=='None',Required=as~='None',Search=true,
Callback=aa.Wrap(function(av)ab.SetLevelReqExactFilter(av)ap()end)},
'Dropdown_AutoSellLevelReq')af:Toggle({Name='Exclude Equipped Items',Default=ab.
GetExcludeEquipped(),Callback=aa.Wrap(function(av)ab.SetExcludeEquipped(av)ap()
end)},'Toggle_AutoSellExcludeEquipped')local av=af:Label({Text=
'No search made yet.'},'Label_AutoSellResult')af:Button{Name='Search',Callback=
function()task.spawn(function()pcall(function()av:UpdateName
'Reading inventory...'end)local ax=ab.CountMatches()if not ax then return end if
ax.error then pcall(function()av:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..ax.error..'</font>')end)return end local
ay,az=(
[[Found <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching items.
]]
):format(ax.matching,ax.total),true for aA,aB in ipairs{'Weapons','Helmets',
'Chests','Abilities'}do local aC=ax.byCategory and ax.byCategory[aB]if aC then
if az then ay..=aB..': '..aC else ay..=' \u{2022} '..aB..': '..aC end az=false
end end pcall(function()av:UpdateName(ay)end)end)end}af:Button{Name='Sell Now',
Callback=function()task.spawn(function()if not ab.IsDungeon()then ac.Notify(
'AutoSell','AutoSell is only available inside Dungeons.',3)pcall(function()av:
UpdateName
[[<font color='rgb(255,80,80)'>AutoSell is only available inside Dungeons.</font>]]
end)return end pcall(function()av:UpdateName'Reading inventory...'end)local ax=
ab.CountMatches()if not ax then pcall(function()av:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if ax.error then pcall(function()av:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..ax.error..'</font>')end)return end local
ay,az=ab.HasAnyFilter(),''if not ay then az=
'\n\n<font color="rgb(255,80,80)"><b>\u{26a0} NO filter selected!</b> This will sell the ENTIRE inventory (except equipped items).</font>'
end local aA=(
[[Sell <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching item(s) with current filters.]]
):format(ax.matching,ax.total)aA=aA..az..'\n\nAre you sure?'ad:Dialog{Title=
'Confirm Sale',Description=aA,Buttons={{Name='Confirm',Callback=function()task.
spawn(function()pcall(function()av:UpdateName'Reading inventory...'end)ac.
Notify('AutoSell','Selling...',2)local aB=ab.SellItems()if not aB then pcall(
function()av:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if aB.error then pcall(function()av:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..aB.error..'</font>')end)return end local
aC=(
[[Done: <font color='rgb(0,255,0)'>%d</font> sold, <font color='rgb(255,200,0)'>%d</font> skipped, <font color='rgb(255,220,120)'>%s</font> gold earned.]]
):format(aB.sold,aB.skipped,tostring(aB.gold))pcall(function()av:UpdateName(aC)
end)end)end},{Name='Cancel'}}}end)end}ap()end end function a.ad()local aa,ab,ac,
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
=aC aO.SurfaceTransparency=0.8 aO.Parent=aN end local aO,aQ=function()if not aH
then return end local aO=game:GetService'Workspace'for aQ,aR in ipairs(aO:
GetChildren())do if aR:IsA'BasePart'then aN(aR)end for aS,aT in ipairs(aR:
GetDescendants())do if aT:IsA'BasePart'then aN(aT)end end end end,function()if
aJ then task.cancel(aJ)aJ=nil end local aO=game:GetService'Workspace'for aQ,aR
in ipairs(aO:GetDescendants())do local aS=aR:FindFirstChild(aF)if aS then aS:
Destroy()end end end function ac.ToggleSkillHitbox(aR)if aR==aI then return end
aI=aR if aI then if aJ then task.cancel(aJ)aJ=nil end aJ=task.spawn(function()
while aI do local aS,aT=pcall(aO)if not aS and os.clock()-(ac.lastSkillWarnH or
0)>5 then ac.lastSkillWarnH=os.clock()warn('[SkillHitbox] error:',tostring(aT))
end task.wait(aj)end end)else aQ()end end function ac.IsSkillHitboxEnabled()
return aI end return ac end function a.ae()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,
ak,al,am=a.load'e',a.load'f',a.load'b',a.load'g',{},Color3.fromRGB(255,170,0),
0.55,'Enemy_ESP',0.5,{Orange=Color3.fromRGB(255,170,0),Red=Color3.fromRGB(255,0,
0),Yellow=Color3.fromRGB(255,255,0),Green=Color3.fromRGB(0,255,0),Cyan=Color3.
fromRGB(0,255,255),Blue=Color3.fromRGB(0,120,255),Magenta=Color3.fromRGB(255,0,
255),White=Color3.fromRGB(255,255,255)},false,'Orange'local an=function()return
aj[al]or af end local ao,ap,aq=function(ao)if not ao or not ao:IsA'Model'then
return end if not ao:FindFirstChild(ah)then local ap=Instance.new'Highlight'ap.
Name=ah ap.Adornee=ao ap.FillColor=an()ap.FillTransparency=ag ap.OutlineColor=
an()ap.OutlineTransparency=1 ap.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop ap
.Parent=ao end end,function()local ao=an()for ap,aq in ipairs(game:GetService
'Workspace':GetDescendants())do local ar=aq:FindFirstChild(ah)if ar and ar:IsA
'Highlight'then ar.FillColor=ao ar.OutlineColor=ao end end end,function()for ao,
ap in ipairs(game:GetService'Workspace':GetDescendants())do local aq=ap:
FindFirstChild(ah)if aq then aq:Destroy()end end for ao,ap in ipairs(aa.Players:
GetPlayers())do local aq=ap.Character if aq then for ar,as in ipairs(aq:
GetDescendants())do if as.Name==ah then as:Destroy()end end end end end function
ae.Toggle(ar)if ar==ak then return end ak=ar if ak then if am then task.cancel(
am)am=nil end am=task.spawn(function()while ak and ac.IsActive()do if not ad.
IsDungeon()then task.wait(1)continue end local as,at=pcall(function()for as,at
in ipairs(ab.GetTrackedEnemyData())do if at.Model and at.Model.Parent then ao(at
.Model)end end end)if not as then if os.clock()-(ae.lastWarn or 0)>5 then ae.
lastWarn=os.clock()warn('[EnemyESP] error:',tostring(at))end end task.wait(ai)
end end)else if am then task.cancel(am)am=nil end local as=pcall(aq)if not as
then warn'[EnemyESP] cleanup error'end end end function ae.IsEnabled()return ak
end function ae.GetColorNames()local ar={}for as in pairs(aj)do table.insert(ar,
as)end table.sort(ar)return ar end function ae.GetSelectedColor()return al end
function ae.SetSelectedColor(ar)if not aj[ar]then return end if ar==al then
return end al=ar local as=pcall(ap)if not as then warn'[EnemyESP] recolor error'
end end ad.Register{Name='EnemyESP',Zone='Dungeon',OnLeave=function()pcall(aq)
end}ac.Register(function()ae.Toggle(false)end)return ae end function a.af()local
aa,ab,ac,ad,ae,af,ag,ah=a.load'e',a.load'b',{},false,{},{},{},2 local ai={[
'meshes/ice3']=true,['meshes/snow']=true,['invisible platform']=true,part=true}
local aj,ak,al=function(aj)if not aj then return true end if aj:IsA'Model'or aj:
IsA'Folder'then return true end local ak=aj.Name:lower()if ai[ak]or aj.Name==
'Meshes/Ice3'or aj.Name=='Meshes/Snow'or aj.Name=='Invisible platform'or aj.Name
=='Part'then return true end return false end,function()if not ad then return
end local aj=workspace:FindFirstChild'Map'if not aj then return end for ak,al in
ipairs(aj:GetDescendants())do if(al:IsA'Model'or al:IsA'Folder')and al.Name:
lower():find'border'then for am,an in ipairs(al:GetChildren())do pcall(function(
)an:Destroy()end)end end end end,function()if not ad then return end local aj=
workspace:FindFirstChild'Map'if not aj then return end for ak,al in ipairs(aj:
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
function()ac.Toggle(false)end)return ac end function a.ag()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'ad',a.load'ae',a.load'af',a.load'C',{'Custom Hitbox',
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
function a.ah()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'f',a.load'b',game
:GetService'HttpService'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av
,ax=aa.Folder..'/settings/webhook.json',{},'',false,false,false,'',{'Tier6'},
true,{},false,{common=9807270,uncommon=43520,rare=3447003,epic=10181046,
legendary=16766720,secret=15158332,ultimate=15158332,mythic=15158332},{common=1,
uncommon=2,rare=3,epic=4,legendary=5,secret=6,ultimate=6,mythic=6},10181046,{{
match='northen',prefix='Valhalla'},{match='northern',prefix='Valhalla'}},
16766720 local ay,az=function()local ay=ac.GetCurrentDungeonName()if not ay or
ay==''then return nil end local az=string.lower(ay)for aA,aB in ipairs(at)do if
string.find(az,aB.match,1,true)then return aB.prefix end end return nil end,{
legendary=true,secret=true,ultimate=true,mythic=true}local aA,aB,aC,aF=function(
aA)if not aA then return false end if az[tostring(aA.rarity or''):lower()]then
return true end local aB=ay()if aB and aB~=''then local aC=tostring(aA.itemName
or'')return string.sub(aC,1,#aB)==aB end return false end,{'Tier1','Tier2',
'Tier3','Tier4','Tier5','Tier6'},function(aA)local aB=tonumber(tostring(aA or'')
:match'Tier(%d+)')return aB or 6 end local aG,aH=function()if aF then return aF
end aF={}for aG,aH in ipairs(am)do aF[aC(aH)]=true end return aF end,{uncommon=1
,common=2,rare=3,epic=4,legendary=5,secret=6}local aI,aJ,aK,aL=function(aI)if
not aI then return nil end local aJ=tonumber(tostring(aI.tier or''):match
'tier(%d+)')if aJ then return aJ end if aI.secret==true then return 6 end return
aH[string.lower(tostring(aI.rarity or''))]end,function()local aI=game:GetService
'Players'.LocalPlayer if not aI then return'?'end if aI.Name and aI.Name~=''then
return aI.Name end return aI.DisplayName or'?'end,function()local aI=game:
GetService'Players'.LocalPlayer if not aI then return nil end local aJ=aI:
FindFirstChild'XP'if aJ and aJ:IsA'IntValue'then return aJ.Value end return nil
end local function aM(aN,aO,aQ)aQ=aQ or 12 if aQ<0 then return nil end local aR=
aN:FindFirstChild(aO)if aR then return aR end for aS,aT in ipairs(aN:
GetChildren())do local aU=aM(aT,aO,aQ-1)if aU then return aU end end return nil
end local aN local aO,aQ=function()if ac and type(ac.GetRealPlayerLevel)==
'function'then local aO=ac.GetRealPlayerLevel()if aO then local aQ=tonumber(
tostring(aO):match'%d+')if aQ and aQ>0 then aN=tostring(aQ)return aN end end end
local aO=_G.RealPlayerLevel or(type(getgenv)=='function'and getgenv().
RealPlayerLevel)if aO then local aQ=tonumber(tostring(aO):match'%d+')if aQ and
aQ>0 then aN=tostring(aQ)return aN end end local aQ=game:GetService'Players'.
LocalPlayer if not aQ then return aN or'?'end local aR=aQ:FindFirstChild
'leaderstats'if aR then for aS,aT in ipairs(aR:GetChildren())do local aU=string.
lower(aT.Name)if string.find(aU,'level')or string.find(aU,'lvl')then local aV=
tonumber(tostring(aT.Value):match'%d+')if aV and aV>0 then aN=tostring(aV)if ac
and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end
end end for aS,aT in ipairs(aQ:GetChildren())do local aU=string.lower(aT.Name)if
aU=='level'or aU=='lvl'or string.find(aU,'level')then if aT:IsA'ValueBase'then
local aV=tonumber(tostring(aT.Value):match'%d+')if aV and aV>0 then aN=tostring(
aV)if ac and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN
end end end end for aS,aT in pairs(aQ:GetAttributes())do local aU=string.lower(
aS)if string.find(aU,'level')or string.find(aU,'lvl')then local aV=tonumber(
tostring(aT):match'%d+')if aV and aV>0 then aN=tostring(aV)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end end if aQ
:FindFirstChild'PlayerGui'then local aS=aQ.PlayerGui:FindFirstChild
'playerStatus'if aS then local aT=aM(aS,'levelBorder')if aT then local aU=aT:
FindFirstChild'level'if aU and aU:IsA'TextLabel'then local aV=aU:GetAttribute
'RealLevel'or aU:GetAttribute'OriginalText'if aV then local aW=tonumber(
tostring(aV):match'%d+')if aW and aW>0 then aN=tostring(aW)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end local aW=
aU.Text local aX=tonumber(tostring(aW):match'%d+')if aX and aX>0 then aN=
tostring(aX)if ac and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end
return aN end end end end end return aN or'?'end,false local aR,aS,aT=function()
if aL~=nil or aQ then return end aQ=true task.spawn(function()local aR=os.clock(
)+8 while aL==nil and os.clock()<aR do aL=aK()if aL~=nil then break end task.
wait(0.25)end aQ=false end)end,function()local aR,aS=pcall(function()return game
:GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'reloadInvy',5)end)if not aR or not aS or not aS:IsA'RemoteFunction'then return
nil end local aT,aU=pcall(function()return aS:InvokeServer()end)if not aT or aU
==nil then return nil end if type(aU)=='table'and aU['1']and type(aU['1'])==
'table'then return aU['1']end return aU end,function(aR)return type(aR)=='table'
and(aR.sellPrice~=nil or aR.UniqueItemID~=nil or aR.rarity~=nil or aR.name~=nil)
end local aU=function(aU)if type(aU)~='table'then return{}end local aV,aW={},{}
local function aX(aY,aZ)if type(aY)~='table'or aW[aY]then return end aW[aY]=true
if aT(aY)then local a_=(aY.UniqueItemID and tostring(aY.UniqueItemID))or(aY.
uniqueItemNum and tostring(aY.uniqueItemNum))or nil table.insert(aV,{category=aZ
,raw=aY,id=a_,name=tostring(aY.name or aY.itemName or''),rarity=tostring(aY.
rarity or''):lower()})return end for a_,a0 in pairs(aY)do if type(a0)=='table'
then local a1=aZ if a_=='weapons'or a_=='weapon'then a1='weapon'elseif a_==
'helmets'or a_=='helmet'then a1='helmet'elseif a_=='chests'or a_=='chest'then a1
='chest'elseif a_=='abilities'or a_=='ability'then a1='ability'end aX(a0,a1)end
end end aX(aU,nil)return aV end local aV=function()if not an or ap then return
end ap=true task.spawn(function()local aV=aS()if aV then local aW,aX=aU(aV),{}
for aY,aZ in ipairs(aW)do if aZ.id then aX[aZ.id]=true end end ao=aX end ap=
false end)end local aW,aX=function()aL=aK()if aL==nil then aR()end ac.
SetDungeonStartTime(nil)if an then aV()end end,function()if not ac.
GetDungeonStartTime()then ac.SetDungeonStartTime(os.clock())end if aL==nil then
aR()end if an then aV()end end local aY,aZ,a_,a0=function()if ax then return end
local aY=function(aY)if aY then aW()else aX()end end aY(ac.IsInLobby())ax=ac.
OnLobbyChanged(aY)end,function(aY)aY=math.max(0,math.floor(aY or 0))local aZ,a_=
math.floor(aY/60),aY%60 return string.format('%d:%02d',aZ,a_)end,function(aY)if
not aY then return'0'end local aZ,a_=(tostring(math.floor(aY)))while true do aZ,
a_=string.gsub(aZ,'^(-?%d+)(%d%d%d)','%1,%2')if a_==0 then break end end return
aZ end,function(aY)if not aY then return 0,0 end local aZ=string.gsub(tostring(
aY),',','')local a_,a0=string.match(aZ,'(%d+)%s*/%s*(%d+)')if a_ and a0 then
return tonumber(a_)or 0,tonumber(a0)or 0 end local a1=tonumber(string.match(aZ,
'^%s*([%d.-]+)'))return 0,a1 or 0 end local a1,a2,a3,a4,a5=function(a1)if not an
or not a1 or type(a1.items)~='table'or#a1.items==0 then return end local a2=aS()
if not a2 then return end local a3=aU(a2)if#a3==0 then return end local a4={}for
a5,a6 in ipairs(a3)do if a6.id and not ao[a6.id]then table.insert(a4,a6)end end
local a5,a6=(#a4>0)and a4 or a3,{}for a7,a8 in ipairs(a1.items)do local a9=
tostring(a8.itemType or''):lower()if a9=='ability'or a9=='gold'or a8.itemName==
'gold'then continue end local b,ba=(tostring(a8.itemName or''):lower())for bb,bc
in ipairs(a5)do if not a6[bb]then local bd=bc.name:lower()if bd==b or string.
find(bd,b,1,true)or string.find(b,bd,1,true)then a6[bb]=true ba=bc break end end
end if ba then local bb=ba.raw local bc,bd,be,bf,bg=tostring(bb.name or bb.
itemName or a8.itemName or''),ba.category or a9,bb.totalUpgrades or bb.
maxUpgrades or bb.totalUpgrade or bb.maxUpgrade or bb.upgradesTotal or bb.
upgradesMax or bb.upgradeTotal or bb.upgradeLimit or bb.availableUpgrades,0,0 if
be~=nil then bg=tonumber(be)or 0 end if bb.curUpgrades~=nil or bb.
currentUpgrades~=nil then bf=tonumber(bb.curUpgrades or bb.currentUpgrades)or 0
end if bb.upgrades~=nil then if type(bb.upgrades)=='string'then local bh,bi=a0(
bb.upgrades)bf=bf~=0 and bf or bh bg=bg~=0 and bg or bi elseif type(bb.upgrades)
=='number'then bf=bf~=0 and bf or bb.upgrades elseif type(bb.upgrades)=='table'
then local bh,bi=bb.upgrades.cur or bb.upgrades.current or bb.upgrades[1],bb.
upgrades.max or bb.upgrades.total or bb.upgrades.totalUpgrades or bb.upgrades[2]
if bh~=nil then bf=bf~=0 and bf or(tonumber(bh)or 0)end if bi~=nil then bg=bg~=0
and bg or(tonumber(bi)or 0)end end end local bh,bi,bj,bk,bl,bm=tonumber(bb.
physicalDamage or bb.physicalPower or 0)or 0,tonumber(bb.spellPower or 0)or 0,
tonumber(bb.health or 0)or 0,'',0,''if bd=='weapon'or string.find(bd,'weapon')
then if bi>bh then bk='Spell'bl=bi bm='\u{1f52e}'else bk='Phys'bl=bh bm=
'\u{2694}\u{fe0f}'end else local bn=bc:lower()if string.find(bn,'guardian')then
bk='HP'bl=bj bm='\u{1f6e1}\u{fe0f}'elseif string.find(bn,'mage')then bk='Spell'
bl=bi bm='\u{1f52e}'elseif string.find(bn,'warrior')then bk='Phys'bl=bh bm=
'\u{2694}\u{fe0f}'else if bj>10000 and bj>(bh*10)then bk='HP'bl=bj bm=
'\u{1f6e1}\u{fe0f}'elseif bi>bh then bk='Spell'bl=bi bm='\u{1f52e}'else bk=
'Phys'bl=bh bm='\u{2694}\u{fe0f}'end end end local bn=math.max(0,bg-bf)local bo=
bl+(bn*10)if bl>0 or bg>0 then a8.potentialInfo={statName=bk,statVal=bl,
maxPotential=bo,curUpgrades=bf,maxUpgrades=bg,icon=bm}end end end local a7={}for
a8,a9 in ipairs(a3)do if a9.id then a7[a9.id]=true end end ao=a7 end,function()
if not(isfile and isfile(af))then return end local a1,a2=pcall(function()return
ae:JSONDecode(readfile(af))end)if a1 and type(a2)=='table'then ah=type(a2.url)==
'string'and a2.url or''ai=a2.enabled==true ak=a2.pingEnabled==true al=type(a2.
pingMention)=='string'and a2.pingMention or''if a2.showPotential~=nil then an=a2
.showPotential==true end local a3=a2.pingTiers if type(a3)=='string'then a3={a3}
end if type(a3)=='table'then local a4={}for a5,a6 in ipairs(a3)do if table.find(
aB,a6)and not table.find(a4,a6)then table.insert(a4,a6)end end if#a4>0 then am=
a4 end end aF=nil end end,function()if not(isfile and writefile)then return end
pcall(function()writefile(af,ae:JSONEncode{url=ah,enabled=ai,pingEnabled=ak,
pingMention=al,pingTiers=am,showPotential=an})end)end,function(a1)local a2={}for
a3,a4 in ipairs(a1 or{})do local a5,a6=a4.itemName or'Unknown',aA(a4)if a6 then
a5='\u{2b50} '..a5 end local a7={}if a4.itemType and a4.itemType~='gold'then
table.insert(a7,a4.itemType)end if a4.rarity then table.insert(a7,a4.rarity)end
local a8=''if#a7>0 then a8=string.format('%s (%s)',tostring(a5),table.concat(a7,
', '))else a8=tostring(a5)end if an and a4.potentialInfo then local a9=a4.
potentialInfo local b=(a9.icon and a9.icon~='')and(a9.icon..' ')or''local ba=
string.format('  \u{2514} %sMaxPot: %s',b,a_(a9.maxPotential))table.insert(a2,a8
..'\n'..ba)else table.insert(a2,a8)end end return table.concat(a2,'\n')end,
function(a1)if not a1 then return false end local a2=aI(a1)if not a2 then return
false end return aG()[a2]==true end local a6=function(a6)if not ak or al==''then
return false end for a7,a8 in ipairs(a6 or{})do if a5(a8)then return true end
end return false end local a7=function(a7,a8)local a9,b=tonumber(a7.gold)or 0,{}
for ba,bb in ipairs(a7.items or{})do if bb.itemName and bb.itemName~='gold'then
table.insert(b,bb)end end local ba,bb,bc,bd,be=as,false,function(ba,bb)if ba==
nil then return bb end if bb==nil then return ba end return(ar[ba]or 0)>=(ar[bb]
or 0)and ba or bb end for bf,bg in ipairs(b)do local bh=tostring(bg.rarity or'')
:lower()if aA(bg)then bb=true bd=bc(bd,bh)end if aq[bh]~=nil then be=bc(be,bh)
end end if bb then ba=bd and(aq[bd]or au)or au elseif be then ba=aq[be]end a8=a8
or{}local bf=tostring(a8.level or'?')if bf=='???'or bf=='?'or bf==''or not bf:
match'%d+'then bf=aO()end if bf=='???'or not bf:match'%d+'then bf='?'end local
bg=tonumber(a8.expGained)local bh,bi,bj=bg and string.format('+%s XP',tostring(
bg))or'?',aZ(a8.duration),{}if bg then table.insert(bj,bh)end if a9>0 then table
.insert(bj,string.format('+%s gold',tostring(a9)))end local bk,bl=#bj>0 and
table.concat(bj,'  ')or'',#b>0 and a4(b)or'None'local bm=bl if bk~=''then bm=bk
..(bl~='None'and('\n'..bl)or'')end local bn,bo={{name='Player',value=string.
format('||%s|| (lv %s)',aJ(),bf),inline=true},{name='Map',value=ac.
GetCurrentDungeonName()or'Unknown',inline=true},{name='Time',value=bi,inline=
true},{name='Rewards',value=bm,inline=false}},
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
Connect(function(bb)if not ai then return end aR()local bc=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local bd,be=(aK())if aL~=nil and bd~=nil then be=math.max(0,bd-aL)end
if an then pcall(a1,bb)end local bf,bg=a8(bb,{level=aO(),expGained=be,duration=
bc})if not bf then ab.Notify('Webhook WIN','Send failed: '..tostring(bg),4)end
end)end)aj=true ab.Notify('Webhook','Webhook notifications ready',2)aY()if an
then aV()end end a2()ad.Register(function()if av then av:Disconnect()av=nil end
if ax then ax()ax=nil end aj=false end)return ag end function a.ai()local aa=a.
load'ah'return function(ab,ac)local ad=ac:Section{Side='Right'}ad:Header{Name=
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
}end end function a.aj()local aa={}function aa.Apply(ab,ac,ad)for ae,af in
pairs(ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=
af end)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af
,{__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local
ai,aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.ak()local aa,ab,ac,ad,ae,af=a.load'aj',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.al()local
aa,ab,ac,ad,ae,af,ag=a.load'a',a.load'b',a.load'aj',a.load'f',game:GetService
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
aO for aQ,aR in ipairs(aH)do local aS,aT=string.find(aJ,string.lower(aR),aL,true
)if aS then if aM==nil or aS<aM or(aS==aM and#aR>#aO)then aM=aS aN=aT aO=aR end
end end if not aM then table.insert(aK,string.sub(aG,aL))break end if aM>aL then
table.insert(aK,string.sub(aG,aL,aM-1))end table.insert(aK,aI)aL=aN+1 end return
table.concat(aK)end local aK,aL,aM=function(aK,aL,aM)if#aK==0 or#aL==0 then
return aK end if not string.find(aK,'<')or not string.find(aK,'>')then return
aJ(aK,aL,aM)end local aN,aO={},1 while aO<=#aK do local aQ,aR=string.find(aK,
'<[^>]->',aO)if not aQ then local aS=string.sub(aK,aO)table.insert(aN,aJ(aS,aL,
aM))break end if aQ>aO then local aS=string.sub(aK,aO,aQ-1)table.insert(aN,aJ(aS
,aL,aM))end table.insert(aN,string.sub(aK,aQ,aR))aO=aR+1 end return table.
concat(aN)end,function(aK)return aK:IsA'TextLabel'or aK:IsA'TextButton'or aK:IsA
'TextBox'end,function()local aK={}pcall(function()if typeof(gethui)=='function'
then local aL=gethui()if aL and aL~=game:GetService'CoreGui'then table.insert(aK
,aL)end end end)pcall(function()local aL=game:GetService'CoreGui'if aL then
table.insert(aK,aL)end end)return aK end local aN=function(aN)if not aL(aN)then
return end if aN:IsA'TextBox'and aN:IsFocused()then return end local aO=aI()if#
aO==0 then return end local aQ=aq[aN]if aQ then local aR=aN.Text local aS=aK(aR,
aO,am)if aS~=aR then aQ.original=aR an=true aN.Text=aS an=false end return end
local aR=aN.Text local aS,aT=aK(aR,aO,am),{original=aR,conns={}}if aS~=aR then
an=true aN.Text=aS an=false end local aU=aN:GetPropertyChangedSignal'Text':
Connect(function()if an then return end if not al then return end local aU,aV=aN
.Text,aI()local aW=aK(aU,aV,am)if aW~=aU then aT.original=aU an=true aN.Text=aW
an=false else aT.original=aU end end)table.insert(aT.conns,aU)if aN:IsA'TextBox'
then local aV=aN.FocusLost:Connect(function()if not al then return end local aV,
aW=aN.Text,aI()local aX=aK(aV,aW,am)if aX~=aV then aT.original=aV an=true aN.
Text=aX an=false end end)table.insert(aT.conns,aV)end local aV aV=aN.
AncestryChanged:Connect(function(aW,aX)if not aX then for aY,aZ in ipairs(aT.
conns)do pcall(function()aZ:Disconnect()end)end aq[aN]=nil end end)table.insert(
aT.conns,aV)aq[aN]=aT end local aO,aQ,aR,aS=function(aO)if not aO then return
end pcall(function()for aQ,aR in ipairs(aO:GetDescendants())do if aL(aR)then aN(
aR)end end end)end,function(aO)if not aO then return end local aQ,aR=pcall(
function()return aO.DescendantAdded:Connect(function(aQ)if not al then return
end task.spawn(aN,aQ)end)end)if aQ and aR then table.insert(ar,aR)end end,
function()local aO=aI()for aQ,aR in pairs(aq)do for aS,aT in ipairs(aR.conns)do
pcall(function()aT:Disconnect()end)end pcall(function()if aQ and aQ.Parent and
aR.original then local aS,aT=aQ.Text,aK(aR.original,aO,am)if aS==aT then an=true
aQ.Text=aR.original an=false end end end)end table.clear(aq)end,function()if aB
and typeof(aB.SetUserInfoState)=='function'then pcall(function()aB:
SetUserInfoState(not ak)end)end end function aj.Start()ak=true aH()if al then
return end al=true local aT=az()if aT then local aU=aT:FindFirstChild'PlayerGui'
if aU then aO(aU)aQ(aU)else local aV aV=aT.ChildAdded:Connect(function(aW)if aW.
Name=='PlayerGui'then if aV then aV:Disconnect()end if al then aO(aW)aQ(aW)end
end end)table.insert(ar,aV)end if aT.Character then aO(aT.Character)aQ(aT.
Character)end local aV=aT.CharacterAdded:Connect(function(aV)if not al then
return end task.wait(0.2)if not al then return end aO(aV)aQ(aV)end)table.insert(
ar,aV)end pcall(function()local aU=workspace.DescendantAdded:Connect(function(aU
)if not al then return end if aU:IsA'BillboardGui'or aU:IsA'SurfaceGui'then for
aV,aW in ipairs(aU:GetDescendants())do aN(aW)end local aV=aU.DescendantAdded:
Connect(function(aV)if not al then return end aN(aV)end)table.insert(ar,aV)end
end)table.insert(ar,aU)end)for aU,aV in ipairs(aM())do aO(aV)aQ(aV)end aS()task.
spawn(function()for aU,aV in ipairs{0.3,0.8,1.5,3}do task.wait(aV)if not al then
break end local aW=az()if aW then local aX=aW:FindFirstChild'PlayerGui'if aX
then aO(aX)end if aW.Character then aO(aW.Character)end end for aX,aY in ipairs(
aM())do aO(aY)end end end)if aC then pcall(task.cancel,aC)end aC=task.spawn(
function()while al do task.wait(0.5)if not al then break end local aU=az()if aU
then local aV=aU:FindFirstChild'PlayerGui'if aV then aO(aV)end if aU.Character
then aO(aU.Character)end end for aV,aW in ipairs(aM())do aO(aW)end end end)end
function aj.Stop()ak=false aH()if not al then return end al=false if aC then
pcall(task.cancel,aC)aC=nil end for aT,aU in ipairs(ar)do pcall(function()aU:
Disconnect()end)end table.clear(ar)aR()aS()end function aj.IsEnabled()return ak
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
=function(a9)aj.SetMaskStats(a9)end}))end function a.am()local aa,ab,ac,ad=a.
load'd',a.load'C',a.load'ak',a.load'al'return function(ae,af)local ag=af:Section
{Side='Left'}ag:Header{Name='Anti AFK'}ag:Toggle({Name='Anti AFK',Default=ac.
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
function a.an()return function(aa,ab)a.load'ag'(aa,ab)a.load'ai'(aa,ab)a.load
'am'(aa,ab)end end function a.ao()local aa,ab,ac=a.load'a',a.load'c',game:
GetService'HttpService'local ad,ae,af,ag=aa.Folder..'/settings/autohide.json',{}
,false local ah,ai=function()if not(isfile and isfile(ad))then return end local
ah,ai=pcall(function()return ac:JSONDecode(readfile(ad))end)if ah and type(ai)==
'table'then af=ai.enabled==true end end,function()if not(isfile and writefile)
then return end pcall(function()writefile(ad,ac:JSONEncode{enabled=af})end)end
function ae.SetWindow(aj)ag=aj end function ae.SetEnabled(aj)af=aj==true ai()end
function ae.IsEnabled()return af end function ae.Hide()if not af or not ag then
return end local aj=pcall(function()ag:SetState(false)end)if not aj then warn
'[AutoHide] Kh\u{f4}ng \u{1ea9}n \u{111}\u{1b0}\u{1ee3}c window'end end function
ae.Execute()if not af then return end task.spawn(function()task.wait(0.5)ae.
Hide()end)end ah()return ae end function a.ap()local aa,ab,ac,ad=a.load'a',a.
load'd',a.load'ao',a.load'h'return function(ae,af)local ag=aa.Folder local ah=ag
..'/settings/autoload.txt'local ai,aj,ak=function()if isfile and isfile(ah)then
local ai,aj=pcall(readfile,ah)if ai and type(aj)=='string'then aj=string.gsub(aj
,'[\r\n%s]+','')if#aj>0 then return aj end end end return nil end,function(ai)ab
.SetActive(ai)local aj=a.load'q'aj.LoadData(aa.contextData)if autoloadLabel then
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
'Press RightControl to show the window again.'}end end function a.aq()local aa,
ab,ac,ad,ae,af=a.load'f',a.load'S','Boss Active','Boss','Dungeon','Time Left'
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
end end end}end end function a.ar()return function(aa,ab)a.load'ap'(aa,ab)a.load
'aq'(aa,ab)end end function a.as()local aa,ab,ac,ad,ae,af,ag=a.load'b',a.load'e'
,{},{'inventory','inspectGui','sellShop','tradingGui','blacksmith'},{'armorMain'
,'weaponMain'},10,{warrior={className='Warrior',primaryStat='physicalDamage'},
mage={className='Mage',primaryStat='spellPower'},guardian={className='Guardian',
primaryStat='health'}}local ah,ai=function(ah)if not ah then return nil,nil end
local ai=string.lower(ah)for aj,ak in pairs(ag)do if string.find(ai,aj)then
return ak.className,ak.primaryStat end end return nil,nil end,function(ah)if not
ah then return nil end local ai=string.match(ah,'^%s*([%d,.-]+)')if not ai then
return nil end local aj=string.gsub(ai,',','')return tonumber(aj)end local aj,ak
,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB=function(aj)if not aj then
return 0,0 end local ak=string.gsub(aj,',','')local al,am=string.match(ak,
'(%d+)%s*/%s*(%d+)')if al and am then return tonumber(al)or 0,tonumber(am)or 0
end local an=ai(ak)return 0,an or 0 end,function(aj)if not aj then return''end
local ak=string.match(aj,'^([^\n\r]+)')local al=ak or aj local am=string.match(
al,'^(.-)%s*[%(\\[]')if am and am~=''then return string.gsub(am,'%s+$','')end
return string.gsub(al,'%s+$','')end,function(aj)if not aj then return false end
if string.find(aj,'[\n\r]%s*[%(\\[].-[%)\\]]')then return true end return string
.find(aj,'%s*[%(\\[].-[%)\\]]%s*$')~=nil end,true,{},'',false,{},{},{},{},{},{},
{},{}local aC=function(aC)local aF=aq[aC]if aF and aC and aC.Parent then ap=true
pcall(function()aC.Text=aF.text end)ap=false end aq[aC]=nil end local aF,aG=
function()for aF,aG in pairs(aq)do aC(aF)end table.clear(aq)end,function(aF,aG)
local aH,aI=string.lower(aG),aF:FindFirstChild(aG)if aI then if aI:IsA
'TextLabel'then return aI elseif aI:IsA'GuiObject'then for aJ,aK in ipairs{
'valueText','ValueText','value','Value','amount','Amount','text','label'}do
local aL=aI:FindFirstChild(aK)if aL and aL:IsA'TextLabel'then return aL end end
local aJ=aI:FindFirstChildOfClass'TextLabel'if aJ then return aJ end end end for
aJ,aK in ipairs(aF:GetDescendants())do if aK:IsA'TextLabel'then local aL=string.
lower(aK.Name)if aL==aH then return aK end if(aL=='valuetext'or aL=='value'or aL
=='amount')and aK.Parent then local aM=string.lower(aK.Parent.Name)if string.
find(aM,aH)then return aK end end end end if aH=='upgrades'then for aJ,aK in
ipairs(aF:GetDescendants())do if aK:IsA'TextLabel'and not string.find(string.
lower(aK.Name),'title')then if string.find(aK.Text,'%d+%s*/%s*%d+')then return
aK end end end end return nil end local aH=function(aH)if not am then return end
if not aH or not aH:IsA'GuiObject'or not aH.Visible then return end local aI=aH.
Parent if aI and aI:IsA'GuiObject'and not aI.Visible then return end if ap then
return end local aJ,aK=aH.Name,{}local aL={aJ}for aM,aN in ipairs(aH:
GetDescendants())do local aO=string.lower(aN.Name)if not string.find(aO,'title')
then if aN:IsA'TextLabel'then local aQ,aR=(aN.Parent~=aH and aN.Parent.Name..'/'
..aN.Name)or aN.Name,ak(aN.Text)table.insert(aK,{name=aN.Name,value=aR,kind=
'TextLabel',path=aQ,instance=aN})table.insert(aL,aQ..'='..aR)elseif aN:IsA
'ValueBase'then local aQ,aR=tostring(aN.Value),(aN.Parent~=aH and aN.Parent.Name
..'/'..aN.Name)or aN.Name table.insert(aK,{name=aN.Name,value=aQ,kind=
'ValueBase',path=aR})table.insert(aL,aR..'='..aQ)end end end local aM=aG(aH,
'name')local aN=(aM and ak(aM.Text))or nil if not aN then for aO,aQ in ipairs(aK
)do if string.lower(aQ.name)=='name'then aN=aQ.value break end end end local aO=
aG(aH,'upgrades')local aQ=(aO and ak(aO.Text))or nil if not aQ then for aR,aS in
ipairs(aK)do if string.lower(aS.name)=='upgrades'or string.find(aS.value,
'%d+%s*/%s*%d+')then aQ=aS.value break end end end local aR,aS,aT=aG(aH,
'physicalDamage')or aG(aH,'physicalPower'),aG(aH,'spellPower'),aG(aH,'health')
local aU,aV,aW,aX,aY,aZ=aR and ai(ak(aR.Text)),aS and ai(ak(aS.Text)),aT and ai(
ak(aT.Text))if aJ=='weaponMain'then if(aV or 0)>(aU or 0)then aX='Mage'aY=
'spellPower'aZ=aS else aX='Warrior'aY='physicalDamage'aZ=aR end else aX,aY=ah(aN
)if aX=='Warrior'then aZ=aR elseif aX=='Mage'then aZ=aS elseif aX=='Guardian'
then aZ=aT else if(aW or 0)>10000 and(aW or 0)>((aU or 0)*10)then aX='Guardian'
aY='health'aZ=aT elseif(aV or 0)>(aU or 0)then aX='Mage'aY='spellPower'aZ=aS
else aX='Warrior'aY='physicalDamage'aZ=aR end end end local a_,a0=aj(aQ)local a1
=math.max(0,a0-a_)if aZ and aZ:IsA'TextLabel'and a0>0 then local a2=ak(aZ.Text)
local a3=ai(a2)if a3 then local a4=a3+(a1*af)local a5=string.format('%s\n(%s)',
a2,tostring(a4))for a6,a7 in ipairs(aK)do if a7.instance==aZ or a7.name==aY then
a7.isPrimaryStat=true a7.calculatedTotal=a4 a7.remainingUpgrades=a1 a7.
curUpgrades=a_ a7.maxUpgrades=a0 end end table.insert(aL,'calc='..tostring(a4))
if aZ.Text~=a5 then if not aq[aZ]then aq[aZ]={text=aZ.Text}end ap=true pcall(
function()aZ.Text=a5 aZ.ClipsDescendants=false end)ap=false end end end local a2
={name=1,levelReq=2,physicalDamage=3,spellPower=4,health=5,upgrades=6,sellPrice=
7,description=8}table.sort(aK,function(a3,a4)local a5,a6=a2[a3.name]or 99,a2[a4.
name]or 99 if a5~=a6 then return a5<a6 end return a3.path<a4.path end)local a3=
table.concat(aL,'|')if a3~=ao then ao=a3 aA=aJ an=aK aB=aX for a4,a5 in ipairs(
ay)do pcall(a5,aA,an,aB)end end end local aI=function(aI,aJ)if at[aJ]then return
end at[aJ]=true local aK=aJ:GetPropertyChangedSignal'Text':Connect(function()if
not am or ap then return end if aI.Visible and not al(aJ.Text)then aH(aI)end end
)table.insert(ar,aK)end local aJ=function(aJ)if as[aJ]then return end as[aJ]=
true local aK=aJ:GetPropertyChangedSignal'Visible':Connect(function()if not am
then return end if aJ.Visible then aH(aJ)else aF()ao=''aA=nil an={}aB=nil for aK
,aL in ipairs(ay)do pcall(aL,nil,{},nil)end end end)table.insert(ar,aK)for aL,aM
in ipairs(aJ:GetDescendants())do if aM:IsA'TextLabel'then aI(aJ,aM)end end local
aL=aJ.DescendantAdded:Connect(function(aL)if aL:IsA'TextLabel'then aI(aJ,aL)if
aJ.Visible then task.defer(function()aH(aJ)end)end end end)table.insert(ar,aL)if
aJ.Visible then task.defer(function()aH(aJ)end)end end local aK=function(aK)if
not aK or not aK:IsA'GuiObject'or au[aK]then return end au[aK]=true local aL=aK:
GetPropertyChangedSignal'Visible':Connect(function()if not am then return end if
not aK.Visible then aF()if aA~=nil then aA=nil an={}aB=nil ao=''for aL,aM in
ipairs(ay)do pcall(aM,nil,{},nil)end end end end)table.insert(ar,aL)for aM,aN in
ipairs(ae)do local aO=aK:FindFirstChild(aN)if aO and aO:IsA'GuiObject'then aJ(aO
)if aO.Visible and aK.Visible then aH(aO)end end end local aM=aK.ChildAdded:
Connect(function(aM)if aM:IsA'GuiObject'then for aN,aO in ipairs(ae)do if aM.
Name==aO then aJ(aM)if aM.Visible and aK.Visible then aH(aM)end end end end end)
table.insert(ar,aM)end local aL=function(aL)if not aL or av[aL]then return end
av[aL]=true local aM=aL:FindFirstChild'itemStatFrame'if aM and aM:IsA'GuiObject'
then aK(aM)end local aN=aL.ChildAdded:Connect(function(aN)if aN.Name==
'itemStatFrame'and aN:IsA'GuiObject'then aK(aN)end end)table.insert(ar,aN)local
aO=aL.AncestryChanged:Connect(function(aO,aQ)if not aQ then av[aL]=nil aF()end
end)table.insert(ar,aO)end local aM,aN=function()local aM=ab.player or ab.
Players.LocalPlayer if not aM then return end local aN=aM:FindFirstChild
'PlayerGui'if not aN then return end for aO,aQ in ipairs(ad)do local aR=aN:
FindFirstChild(aQ)if not aR then for aS,aT in ipairs(aN:GetChildren())do if
string.lower(aT.Name)==string.lower(aQ)then aR=aT break end end end if aR then
aL(aR)end end local aO=aN.ChildAdded:Connect(function(aO)for aQ,aR in ipairs(ad)
do if string.lower(aO.Name)==string.lower(aR)then aL(aO)end end end)table.
insert(ar,aO)end,function()if az then task.cancel(az)az=nil end for aM,aN in
ipairs(ar)do pcall(function()aN:Disconnect()end)end table.clear(ar)table.clear(
as)table.clear(at)table.clear(au)table.clear(av)aF()aA=nil an={}aB=nil ao=''for
aM,aN in ipairs(ay)do pcall(aN,nil,{},nil)end end local aO=function()if az then
return end aM()az=task.spawn(function()while am do task.wait(1.5)if not am then
break end local aO,aQ=false,ab.player or ab.Players.LocalPlayer if aQ then local
aR=aQ:FindFirstChild'PlayerGui'if aR then for aS,aT in ipairs(ad)do local aU=aR:
FindFirstChild(aT)if not aU then for aV,aW in ipairs(aR:GetChildren())do if
string.lower(aW.Name)==string.lower(aT)then aU=aW break end end end if aU then
if not av[aU]then aL(aU)end local aV=aU:FindFirstChild'itemStatFrame'if aV and
aV:IsA'GuiObject'then if not au[aV]then aK(aV)end if aV.Visible then for aW,aX
in ipairs(ae)do local aY=aV:FindFirstChild(aX)if aY and aY:IsA'GuiObject'then if
not as[aY]then aJ(aY)end if aY.Visible then aO=true aH(aY)end end end end end
end end end end if not aO and next(aq)~=nil then aF()if aA~=nil then aA=nil an={
}aB=nil ao=''for aR,aS in ipairs(ay)do pcall(aS,nil,{},nil)end end end end az=
nil end)end function ac.IsEnabled()return am end function ac.GetActiveInspector(
)return aA,an,aB end function ac.SetEnabled(aQ)local aR=aQ and true or false if
am==aR then return end am=aR if am then aO()else aN()end for aS,aT in ipairs(ax)
do pcall(aT,am)end end function ac.OnChanged(aQ)if type(aQ)=='function'then
table.insert(ax,aQ)end end function ac.OnInspectorChanged(aQ)if type(aQ)==
'function'then table.insert(ay,aQ)end end function ac.GetActiveFrame()local aQ
for aR,aS in ipairs(an)do if aS.name=='name'and aS.value~=''then aQ=aS.value
break end end return aA,aQ end function ac.OnFrameChanged(aQ)if type(aQ)==
'function'then table.insert(ay,function(aR,aS,aT)local aU for aV,aW in ipairs(aS
)do if aW.name=='name'and aW.value~=''then aU=aW.value break end end pcall(aQ,aR
,aU)end)end end function ac.Init()if not am then am=true end aO()end aa.
Register(function()am=false aN()table.clear(ax)table.clear(ay)end)aO()return ac
end function a.at()local aa=function(aa)local ab=Instance.new'Frame'ab.Name=
'sortBarFrame'ab.Size=UDim2.new(0,50,0,0)ab.AutomaticSize=Enum.AutomaticSize.Y
ab.AnchorPoint=Vector2.new(0,1)ab.Position=UDim2.new(1,30,1,15)ab.
BackgroundColor3=Color3.fromRGB(18,20,26)ab.BackgroundTransparency=0.15 ab.
BorderSizePixel=0 ab.LayoutOrder=0 ab.ZIndex=2 ab.Visible=true ab.Parent=aa
local ac=Instance.new'UICorner'ac.CornerRadius=UDim.new(0,8)ac.Parent=ab local
ad=Instance.new'UIStroke'ad.Name='DockStroke'ad.Thickness=1.2 ad.Color=Color3.
fromRGB(65,72,90)ad.Transparency=0.3 ad.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border ad.Parent=ab local ae=Instance.new'UIPadding'ae.PaddingTop=UDim.new(0,5)
ae.PaddingBottom=UDim.new(0,5)ae.PaddingLeft=UDim.new(0,5)ae.PaddingRight=UDim.
new(0,5)ae.Parent=ab local af=Instance.new'UIScale'af.Name='SortBarUIScale'af.
Scale=0.75 af.Parent=ab local ag=Instance.new'UIListLayout'ag.Name=
'UIListLayout'ag.Padding=UDim.new(0,6)ag.FillDirection=Enum.FillDirection.
Vertical ag.HorizontalAlignment=Enum.HorizontalAlignment.Center ag.
VerticalAlignment=Enum.VerticalAlignment.Top ag.SortOrder=Enum.SortOrder.
LayoutOrder ag.Parent=ab local ah=function(ah,ai,aj,ak)local al=Instance.new
'ImageButton'al.Name=ah al.Size=UDim2.new(0,40,0,40)al.Position=UDim2.new(0,0,0,
0)al.AnchorPoint=Vector2.new(0,0)al.BackgroundColor3=Color3.fromRGB(25,28,36)al.
BackgroundTransparency=0.65 al.BorderSizePixel=0 al.LayoutOrder=ai al.ZIndex=2
al.Visible=true al.Image=''al.AutoButtonColor=false al.Parent=ab local am=
Instance.new'UICorner'am.CornerRadius=UDim.new(0,6)am.Parent=al local an=
Instance.new'UIStroke'an.Thickness=1.2 an.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border an.Transparency=0.85 an.Color=Color3.fromRGB(60,66,82)an.Parent=al local
ao=Instance.new'UIPadding'ao.PaddingTop=UDim.new(0,7)ao.PaddingBottom=UDim.new(0
,7)ao.PaddingLeft=UDim.new(0,7)ao.PaddingRight=UDim.new(0,7)ao.Parent=al local
ap=Instance.new'ImageLabel'ap.Name=aj ap.Size=UDim2.new(1,0,1,0)ap.Position=
UDim2.new(0.5,0,0.5,0)ap.AnchorPoint=Vector2.new(0.5,0.5)ap.BackgroundColor3=
Color3.fromRGB(255,255,255)ap.BackgroundTransparency=1 ap.BorderSizePixel=0 ap.
LayoutOrder=0 ap.ZIndex=2 ap.Visible=true ap.Image=ak ap.ImageColor3=Color3.
fromRGB(255,255,255)ap.ImageTransparency=0.35 ap.ScaleType=Enum.ScaleType.Fit ap
.Parent=al return al end ah('IBmainFilter',1,'imageSort',
'rbxassetid://73746166761985')ah('IBrarity',2,'imageRarity',
'rbxassetid://105634041692696')ah('IBphysic',3,'imagePhysic',
'rbxassetid://121406454377051')ah('IBspell',4,'imageSpell',
'rbxassetid://125012650497883')ah('IBhealth',5,'imageHealth',
'rbxassetid://88525382655929')ah('IBability',6,'imageAbility',
'rbxassetid://109718589733073')return ab end return aa end function a.au()local
aa,ab,ac,ad,ae=a.load'b',a.load'e',a.load'c',a.load'at',a.load'a'local af,ag,ah,
ai,aj,ak,al,am,an,ao,ap=ab.TweenService or game:GetService'TweenService',ab.
HttpService or game:GetService'HttpService',{},'None',false,false,true,1.25,
function()local af='EsclipseHub'pcall(function()if ae and ae.Folder then af=ae.
Folder end end)return af end local aq,ar=function()return an()..
'/settings/inventory_sort.json'end,function()if not(makefolder and isfolder)then
return end pcall(function()local aq=an()if not isfolder(aq)then makefolder(aq)
end local ar=aq..'/settings'if not isfolder(ar)then makefolder(ar)end end)end
local as,at=function()if not(isfile and readfile)then return end local as=aq()if
not isfile(as)then return end local at,au=pcall(function()local at=readfile(as)
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
writefile(as,ag:JSONEncode(at))end)end)end local function au(av)if not av or not
av.Parent then return end local ax=av.Parent if not ax:IsA'GuiObject'then return
end local ay=ax.AbsoluteSize.Y if ay<=10 then task.defer(function()if av and av.
Parent then au(av)end end)return end local az=workspace.CurrentCamera local aA=
az and az.ViewportSize or Vector2.new(1920,1080)local aB,aC,aF=aA.X,ab.player or
ab.Players.LocalPlayer local aG=aC and aC:FindFirstChild'PlayerGui'if aG then
for aH,aI in ipairs(aG:GetChildren())do if aI:IsA'ScreenGui'and aI.Enabled then
for aJ,aK in ipairs(aI:GetDescendants())do if aK:IsA'GuiObject'and aK.Visible
and aK.AbsoluteSize.Y>20 then local aL=string.lower(aK.Name)if string.find(aL,
'bosskey')or string.find(aL,'keyframe')or string.find(aL,'keysframe')or string.
find(aL,'keysholder')or string.find(aL,'keyholder')then local aM=aK.
AbsolutePosition.Y+aK.AbsoluteSize.Y if not aF or aM>aF then aF=aM end end end
end end end end local aH=ax.AbsolutePosition.Y local aI,aJ,aK=aH+ay,280,1.25 if
aF and aF>aH and aF<aI then local aL=(aI-aF)-10 if aL>30 then aK=math.min(aK,aL/
aJ)end else if ay<440 then local aL=math.clamp(ay/440,0.35,1)local aM=0.38+(aL*
0.32)aK=math.min(aK,(ay*aM)/aJ)end end local aL=440 local aM=(ay/aL)*1.25 local
aN,aO=math.clamp(math.min(aM,aK),0.28,1.25),av:FindFirstChildOfClass'UIScale'if
not aO then aO=Instance.new'UIScale'aO.Name='SortBarUIScale'aO.Parent=av end aO.
Scale=aN local aQ=aN/1.25 local aR,aS,aT=math.clamp(math.round(30*aQ),8,30),math
.clamp(math.round(15*aQ),0,15),ax.AbsolutePosition.X local aU,aV=aT+ax.
AbsoluteSize.X,50*aN+aR local aW,aX=(aU+aV)<=(aB-4),(aT-aV)>=4 if not aW and aX
then av.AnchorPoint=Vector2.new(1,1)av.Position=UDim2.new(0,-aR,1,aS)else av.
AnchorPoint=Vector2.new(0,1)av.Position=UDim2.new(1,aR,1,aS)end end local av,ax,
ay,az,aA,aB,aC,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO=0,30,6,false,{common=1,uncommon=2,
rare=3,epic=4,legendary=5,ultimate=6,mythic=7},{weapon='weapons',chest='chests',
helmet='helmets',ability='abilities'},{None='rbxassetid://73746166761985',
Descending='rbxassetid://130494621181478',Ascending=
'rbxassetid://140381370510884'},{TweenDuration=0.16,EasingStyle=Enum.EasingStyle
.Quad,EasingDirection=Enum.EasingDirection.Out,Inactive={BackgroundTransparency=
0.2,BackgroundColor3=Color3.fromRGB(28,31,40),ElementTransparency=0,
ElementColor3=Color3.fromRGB(235,240,252),StrokeTransparency=0.4,StrokeColor3=
Color3.fromRGB(65,72,90)},Hovered={BackgroundTransparency=0.1,BackgroundColor3=
Color3.fromRGB(45,52,68),ElementTransparency=0,ElementColor3=Color3.fromRGB(255,
255,255),StrokeTransparency=0.15,StrokeColor3=Color3.fromRGB(150,165,195)},
Active={BackgroundTransparency=0.1,BackgroundColor3=Color3.fromRGB(30,55,85),
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
fromRGB(215,125,255)}},{},false,{},{},{},{},{},{}local aQ,aR=function(aQ)local
aR={}if type(aQ)~='table'then return aR end for aS,aT in pairs(aQ)do if type(aT)
=='table'then local aU=aB[aS]or aS for aV,aW in pairs(aT)do local aX=tostring(aV
)aR[aX]=aW local aY=string.match(aX,'_(%d+)$')if aY then aR[aS..'_'..aY]=aW aR[
aU..'_'..aY]=aW local aZ=string.match(aX,'^(.-)_')if aZ then aR[aZ..'_'..aY]=aW
end end end end end return aR end,function(aQ)local aR=os.clock()if not aQ and
cachedInventoryData and(aR-av)<ax then return cachedInventoryData end if
cachedInventoryData and(aR-av)<ay then return cachedInventoryData end if(aR-av)<
3 then return cachedInventoryData end if az then return cachedInventoryData end
az=true local aS,aT=pcall(function()local aS=ab.ReplicatedStorage or game:
GetService'ReplicatedStorage'local aT=aS and aS:FindFirstChild'remotes'if not aT
then return nil end local aU=aT:FindFirstChild'reloadInvy'if not aU or not aU:
IsA'RemoteFunction'then return nil end return aU:InvokeServer()end)az=false av=
os.clock()if aS and aT then if type(aT)=='table'and aT['1']and type(aT['1'])==
'table'then cachedInventoryData=aT['1']else cachedInventoryData=aT end
cachedLookupMap=nil return cachedInventoryData end return cachedInventoryData
end local aS,aT,aU=function(aS,aT,aU)if not aS or type(aS)~='table'then return
nil end if not cachedLookupMap then cachedLookupMap=aQ(aS)end return
cachedLookupMap[aT..'_'..aU]end,false,function(aS)if not aS then return 0,0 end
local aT=string.gsub(tostring(aS),',','')local aU,aV=string.match(aT,
'(%d+)%s*/%s*(%d+)')if aU and aV then return tonumber(aU)or 0,tonumber(aV)or 0
end local aW=tonumber(string.match(aT,'^%s*([%d.-]+)'))return 0,aW or 0 end
local aV=function(aV,aW)if not aV or type(aV)~='table'then return 0,0 end if not
aT then aT=true local aX={}for aY,aZ in pairs(aV)do table.insert(aX,string.
format('%s=%s',tostring(aY),tostring(aZ)))end print(string.format(
'[InventorySort:ItemDump] %s (%s): %s',tostring(aV.name or'Unknown'),tostring(aV
.rarity or'Common'),table.concat(aX,', ')))end local aX,aY,aZ=aV.totalUpgrades
or aV.maxUpgrades or aV.totalUpgrade or aV.maxUpgrade or aV.upgradesTotal or aV.
upgradesMax or aV.upgradeTotal or aV.upgradeLimit or aV.availableUpgrades if aX
~=nil then aZ=tonumber(aX)end local a_=aV.curUpgrades or aV.currentUpgrades or
aV.currentUpgrade or aV.upgradesCur if a_~=nil then aY=tonumber(a_)end if aV.
upgrades~=nil then if type(aV.upgrades)=='string'then local a0,a1=aU(aV.upgrades
)aY=aY or a0 aZ=aZ or a1 elseif type(aV.upgrades)=='number'then aY=aY or aV.
upgrades elseif type(aV.upgrades)=='table'then local a0,a1=aV.upgrades.cur or aV
.upgrades.current or aV.upgrades[1],aV.upgrades.max or aV.upgrades.total or aV.
upgrades.totalUpgrades or aV.upgrades[2]if a0~=nil then aY=aY or tonumber(a0)end
if a1~=nil then aZ=aZ or tonumber(a1)end end end if(not aZ or aZ==0)and aW and
aW:IsA'GuiObject'then for a0,a1 in ipairs{'totalUpgrades','maxUpgrades',
'upgrades','totalUpgrade'}do local a2=aW:FindFirstChild(a1)if not a2 then local
a3=aW:FindFirstChild'itemType'if a3 then a2=a3:FindFirstChild(a1)end end if a2
and a2:IsA'ValueBase'then local a3=tonumber(a2.Value)if a3 and a3>0 then aZ=a3
break end end end end return aY or 0,aZ or 0 end local aW=function(aW,aX,aY,aZ,
a_,a0,a1)if not aW or type(aW)~='table'then local a2=math.max(aY,aZ,a_)return aY
,aZ,a_,a2 end local a2,a3=aV(aW,a1)local a4=math.max(0,a3-a2)local a5,a6,a7,a8,
a9=a4*10,aY,aZ,a_,string.lower(aX or'')local b=(a9=='weapon'or a9=='weapons'or
string.find(a9,'weapon')~=nil)if b then if aZ>aY then a7=aZ+a5 else a6=aY+a5 end
else local ba=string.lower(a0 or'')if string.find(ba,'guardian')then a8=a_+a5
elseif string.find(ba,'mage')then a7=aZ+a5 elseif string.find(ba,'warrior')then
a6=aY+a5 else if a_>10000 and a_>(aY*10)then a8=a_+a5 elseif aZ>aY then a7=aZ+a5
else a6=aY+a5 end end end local ba=math.max(a6,a7,a8)return a6,a7,a8,ba end
local aX,aY=function(aX,aY,aZ)if not aX:IsA'GuiObject'then return nil end local
a_=aX:FindFirstChild'itemType'if not a_ then return nil end local a0,a1,a2=
tostring(a_.Value or''),'',a_:FindFirstChild'uniqueItemNum'if a2 then a1=
tostring(a2.Value or'')end local a3,a4,a5,a6,a7,a8,a9,b=aS(aY,a0,a1),tonumber(aX
.Name)or aZ,0,0,0,0,0,''if a3 and type(a3)=='table'then a5=tonumber(a3.
physicalDamage or a3.physicalPower or 0)or 0 a6=tonumber(a3.spellPower or 0)or 0
a7=tonumber(a3.health or 0)or 0 local ba=string.lower(tostring(a3.rarity or
'common'))a8=aA[ba]or 0 a9=tonumber(a3.levelReq or 0)or 0 b=tostring(a3.name or
'')end local ba,bb,bc,bd=aW(a3,a0,a5,a6,a7,b,aX)return{slot=aX,originalOrder=a4,
category=string.lower(a0),physical=a5,spell=a6,health=a7,maxPhysical=ba,maxSpell
=bb,maxHealth=bc,maxPot=bd,rarityScore=a8,levelReq=a9,name=b}end,function(aX)
local aY=string.lower(aX)if aY=='weapon'or aY=='weapons'then return 1 elseif aY
=='chest'or aY=='chests'or aY=='helmet'or aY=='helmets'or aY=='armor'then return
2 elseif aY=='ability'or aY=='abilities'then return 3 end return 4 end local aZ,
a_,a0=function(aZ,a_)if ai=='None'and not ak then return aZ.originalOrder<a_.
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
nil then local a3,a4=0,0 if ao=='Physical Damage'then a3=aZ.maxPhysical a4=a_.
maxPhysical elseif ao=='Spell Power'then a3=aZ.maxSpell a4=a_.maxSpell elseif ao
=='Health'then a3=aZ.maxHealth a4=a_.maxHealth end if a3~=a4 then if a0 then
return a3>a4 else return a3<a4 end end end if aj then if aZ.rarityScore~=a_.
rarityScore then if a0 then return aZ.rarityScore>a_.rarityScore else return aZ.
rarityScore<a_.rarityScore end end end if ao==nil and not aj then local a3,a4=aZ
.maxPot,a_.maxPot if a3~=a4 then if a0 then return a3>a4 else return a3<a4 end
end end if aZ.levelReq~=a_.levelReq then if a0 then return aZ.levelReq>a_.
levelReq else return aZ.levelReq<a_.levelReq end end if aj then local a3,a4=aZ.
maxPot,a_.maxPot if a3~=a4 then if a0 then return a3>a4 else return a3<a4 end
end end if ao~=nil then local a3,a4=aZ.maxPot,a_.maxPot if a3~=a4 then return a3
>a4 end end if aZ.name~=a_.name then return aZ.name<a_.name end if aZ.category~=
a_.category then local a3,a4=(aZ.category=='chest'or aZ.category=='chests'),(a_.
category=='chest'or a_.category=='chests')if a3~=a4 then return a3 end end
return aZ.originalOrder<a_.originalOrder end,function()local aZ=ab.player or ab.
Players.LocalPlayer if not aZ then return nil,nil end local a_=aZ:FindFirstChild
'PlayerGui'if not a_ then return nil,nil end local a0=a_:FindFirstChild
'inventory'if not a0 then return nil,nil end local a1=a0:FindFirstChild
'mainBackground'if not a1 or not a1.Visible then return nil,nil end local a2=a1:
FindFirstChild'innerBackground'if not a2 then return nil,nil end local a3=a2:
FindFirstChild'rightSideFrame'if not a3 then return nil,nil end local a4=a3:
FindFirstChild'ScrollingFrame'if not a4 or not a4:IsA'ScrollingFrame'then return
nil,nil end local a5=a4:FindFirstChildOfClass'UIGridLayout'return a4,a5 end
function ah.RequestSort(a1)if not al then return end if ai=='None'and not ak
then return end if a0 then task.cancel(a0)a0=nil end local a2=a1 or 0.15 a0=task
.delay(a2,function()a0=nil ah.ApplySort()end)end function ah.ApplySort()if aI
then return end local a1,a2=a_()if not a1 then return end aI=true local a3,a4=
pcall(function()if a2 and a2.SortOrder~=Enum.SortOrder.LayoutOrder then a2.
SortOrder=Enum.SortOrder.LayoutOrder end local a3,a4,a5=aR(),{},0 for a6,a7 in
ipairs(a1:GetChildren())do if a7:IsA'GuiObject'and a7.Name~='UIGridLayout'then
a5=a5+1 local a8=aX(a7,a3,a5)if a8 then table.insert(a4,a8)end end end if#a4==0
then return end table.sort(a4,function(a6,a7)return aZ(a6,a7)end)for a6,a7 in
ipairs(a4)do if a7.slot.LayoutOrder~=a6 then a7.slot.LayoutOrder=a6 end end end)
aI=false if not a3 and a4 then warn(
'[InventorySort] L\u{1ed7}i khi s\u{1eaf}p x\u{1ebf}p kho \u{111}\u{1ed3}:',a4)
end end local a1=function(a1,a2,a3)local a4,a5=aF[a2]or aF.Inactive,aG[a1.Name]
local a6,a7,a8,a9,b,ba=a4.BackgroundTransparency,a4.BackgroundColor3,a4.
ElementTransparency,a4.ElementColor3,a4.StrokeTransparency,a4.StrokeColor3 if a2
=='Active'and a5 then a6=0.12 a7=a5.ActiveBg b=0 ba=a5.ActiveStroke elseif a2==
'ActiveHovered'and a5 then a6=0.05 a7=a5.ActiveHoverBg b=0 ba=a5.
ActiveHoverStroke end local bb=TweenInfo.new(aF.TweenDuration,aF.EasingStyle,aF.
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
a2 or not a2.Parent then return end local a4=(aJ[a2]==true)if a2.Name==
'IBmainFilter'then local a5,a6=(ai~='None'),aC[ai]or aC.None if a5 then a1(a2,a4
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
local a6=function(a6)if aK[a6]then return end aK[a6]=true table.insert(aM,a6)if
a6:IsA'ImageButton'or a6:IsA'TextButton'then a6.AutoButtonColor=false end if not
a6:FindFirstChildOfClass'UICorner'then local a7=Instance.new'UICorner'a7.
CornerRadius=UDim.new(0,6)a7.Parent=a6 end if not a6:FindFirstChildOfClass
'UIStroke'then local a7=Instance.new'UIStroke'a7.Thickness=1.2 a7.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border a7.Transparency=aF.Inactive.
StrokeTransparency a7.Color=aF.Inactive.StrokeColor3 a7.Parent=a6 end if not a6:
FindFirstChildOfClass'UIPadding'then local a7=Instance.new'UIPadding'a7.
PaddingTop=UDim.new(0,7)a7.PaddingBottom=UDim.new(0,7)a7.PaddingLeft=UDim.new(0,
7)a7.PaddingRight=UDim.new(0,7)a7.Parent=a6 end for a7,a8 in ipairs(a6:
GetChildren())do if a8:IsA'ImageLabel'then a8.AnchorPoint=Vector2.new(0.5,0.5)a8
.Position=UDim2.new(0.5,0,0.5,0)a8.Size=UDim2.new(1,0,1,0)a8.ScaleType=Enum.
ScaleType.Fit elseif a8:IsA'UIListLayout'then a8:Destroy()end end aJ[a6]=false
local a7=a6.MouseEnter:Connect(function()aJ[a6]=true a2(a6,true)end)table.
insert(aH,a7)local a8=a6.MouseLeave:Connect(function()aJ[a6]=false a2(a6,true)
end)table.insert(aH,a8)if a6:IsA'GuiButton'then local a9=a6.Activated:Connect(
function()if a6.Name=='IBmainFilter'then if ai=='None'then ai='Descending'ac.
Notify('Main Filter','Descending (Power High -> Low)',1.5)elseif ai==
'Descending'then ai='Ascending'ac.Notify('Main Filter',
'Ascending (Power Low -> High)',1.5)else ai='None'ac.Notify('Main Filter',
'Deselected (Restore Default Inventory)',1.5)end a3(true)a5()if al then ah.
RequestSort(0.05)end at()elseif a6.Name=='IBrarity'then aj=not aj if aj then ao=
nil ak=false if ai=='None'then ai='Descending'end ac.Notify('Filter',
'Mode: Rarity',1.5)else ac.Notify('Filter','Rarity Filter Disabled',1.5)end a3(
true)a5()if al then ah.RequestSort(0.05)end at()elseif a6.Name=='IBphysic'or a6.
Name=='IBspell'or a6.Name=='IBhealth'then local a9=(a6.Name=='IBphysic'and
'Physical Damage')or(a6.Name=='IBspell'and'Spell Power')or'Health'if ao==a9 then
ao=nil ac.Notify('Filter','Deselected '..a9,1.5)else ao=a9 aj=false ak=false if
ai=='None'then ai='Descending'end ac.Notify('Filter','Selected Stat: '..a9,1.5)
end a3(true)a5()if al then ah.RequestSort(0.05)end at()elseif a6.Name==
'IBability'then ak=not ak if ak then aj=false ao=nil if ai=='None'then ai=
'Descending'end ac.Notify('Filter','Sort: Ability',1.5)else ac.Notify('Filter',
'Deselected Ability',1.5)end a3(true)a5()if al then ah.RequestSort(0.05)end at()
end end)table.insert(aH,a9)end a2(a6,false)end function hookSortBar(a7)if aL[a7]
then return end aL[a7]=true pcall(function()a7.BackgroundColor3=Color3.fromRGB(
18,20,26)a7.BackgroundTransparency=0.15 a7.BorderSizePixel=0 if not a7:
FindFirstChildOfClass'UICorner'then local a8=Instance.new'UICorner'a8.
CornerRadius=UDim.new(0,8)a8.Parent=a7 end local a8=a7:FindFirstChild
'DockStroke'or a7:FindFirstChildOfClass'UIStroke'if not a8 then a8=Instance.new
'UIStroke'a8.Name='DockStroke'a8.Thickness=1.2 a8.Color=Color3.fromRGB(65,72,90)
a8.Transparency=0.3 a8.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a8.Parent=a7
end if not a7:FindFirstChildOfClass'UIPadding'then local a9=Instance.new
'UIPadding'a9.PaddingTop=UDim.new(0,5)a9.PaddingBottom=UDim.new(0,5)a9.
PaddingLeft=UDim.new(0,5)a9.PaddingRight=UDim.new(0,5)a9.Parent=a7 end end)local
a8=a7:FindFirstChildOfClass'UIListLayout'if a8 then a8.Padding=UDim.new(0,6)end
local a9={IBmainFilter=true,IBrarity=true,IBphysic=true,IBspell=true,IBhealth=
true,IBability=true}for b,ba in ipairs(a7:GetChildren())do if ba:IsA'GuiObject'
and a9[ba.Name]then a6(ba)end end local b=a7.ChildAdded:Connect(function(b)if b:
IsA'GuiObject'and a9[b.Name]then a6(b)end end)table.insert(aH,b)local ba=a7.
Parent if ba and ba:IsA'GuiObject'then local bb=ba:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()au(a7)end)table.insert(aH,bb)local bc=ba:
GetPropertyChangedSignal'AbsolutePosition':Connect(function()au(a7)end)table.
insert(aH,bc)end local bb=workspace.CurrentCamera if bb then local bc=bb:
GetPropertyChangedSignal'ViewportSize':Connect(function()au(a7)end)table.insert(
aH,bc)end au(a7)a3(false)end function ensureSortBar()local a7=ab.player or ab.
Players.LocalPlayer if not a7 then return nil end local a8=a7:FindFirstChild
'PlayerGui'if not a8 then return nil end local a9=a8:FindFirstChild'inventory'if
not a9 then return nil end local b=a9:FindFirstChild'mainBackground'if not b
then return nil end local ba=b:FindFirstChild'innerBackground'if not ba then
return nil end if ba:IsA'GuiObject'then ba.ClipsDescendants=false end if b:IsA
'GuiObject'then b.ClipsDescendants=false end local bb=(ba:FindFirstChild
'sortBarFrame')if not bb and typeof(ad)=='function'then local bc,bd=pcall(ad,ba)
if bc and bd then bb=bd injectedSortBar=bd end end if bb and typeof(hookSortBar)
=='function'and not aL[bb]then hookSortBar(bb)end return bb end function ah.
GetScale()return am end function ah.GetMainFilterMode()return ai end function ah
.SetMainFilterMode(a7)if ai==a7 then return end ai=a7 a3(true)a5()if al then ah.
RequestSort(0.05)end at()end function ah.IsRarityEnabled()return aj end function
ah.SetRarityEnabled(a7)local a8=a7 and true or false if aj==a8 then return end
aj=a8 if aj then ao=nil ak=false if ai=='None'then ai='Descending'end end a3(
true)a5()if al then ah.RequestSort(0.05)end at()end function ah.GetStatFilter()
return ao end function ah.SetStatFilter(a7)if ao==a7 then return end ao=a7 if ao
then aj=false ak=false if ai=='None'then ai='Descending'end end a3(true)a5()if
al then ah.RequestSort(0.05)end at()end function ah.IsAbilityEnabled()return ak
end function ah.SetAbilityEnabled(a7)local a8=a7 and true or false if ak==a8
then return end ak=a8 if ak then aj=false ao=nil if ai=='None'then ai=
'Descending'end end a3(true)a5()if al then ah.RequestSort(0.05)end at()end
function ah.SetSortCriteria(a7)if not a7 or type(a7)~='string'then return end
local a8=ah.GetSortCriteria()if a7=='None'then if ai=='None'and not aj and not
ao and not ak then return end ai='None'aj=false ao=nil ak=false elseif a7==
'Rarity'then if aj and not ak and ao==nil then return end aj=true ao=nil ak=
false if ai=='None'then ai='Descending'end elseif a7=='Ability'then if ak then
return end ak=true aj=false ao=nil if ai=='None'then ai='Descending'end elseif
a7=='Physical Damage'or a7=='Spell Power'or a7=='Health'then if ao==a7 and not
ak and not aj then return end ao=a7 aj=false ak=false if ai=='None'then ai=
'Descending'end elseif a7=='Power'then if ai~='None'and not aj and ao==nil and
not ak then return end if ai=='None'then ai='Descending'end aj=false ao=nil ak=
false else return end if ah.GetSortCriteria()==a8 then return end a3(true)a5()if
al then ah.RequestSort(0.05)end at()end function ah.GetSortCriteria()if ak then
return'Ability'end if aj then return'Rarity'end if ao then return ao end if ai~=
'None'then return'Power'end return'None'end function ah.SetSortDirection(a7)if
not a7 or type(a7)~='string'then return end local a8='None'if a7=='Ascending'or
string.find(a7,'Ascending')then a8='Ascending'elseif a7=='Descending'or string.
find(a7,'Descending')then a8='Descending'else a8='None'end if ai==a8 then return
end ai=a8 a3(true)a5()if al then ah.RequestSort(0.05)end at()end function ah.
GetSortDirection()if ai=='Ascending'then return'Ascending'elseif ai==
'Descending'then return'Descending'else return'None'end end function ah.
OnCriteriaChanged(a7)if type(a7)=='function'then table.insert(aN,a7)end end
function ah.OnDirectionChanged(a7)if type(a7)=='function'then table.insert(aO,a7
)end end function ah.SetAutoSort(a7)local a8=a7 and true or false if al==a8 then
return end al=a8 at()end function ah.IsAutoSort()return al end function ah.Init(
)for a7,a8 in ipairs(aH)do pcall(function()a8:Disconnect()end)end table.clear(aH
)table.clear(aK)table.clear(aL)table.clear(aM)table.clear(aJ)as()a5()local a7=ab
.ReplicatedStorage or game:GetService'ReplicatedStorage'local a8=a7 and a7:
FindFirstChild'remotes'if a8 then local a9=a8:FindFirstChild'reloadInventory'if
a9 and a9:IsA'RemoteEvent'then local b=a9.OnClientEvent:Connect(function()local
b=os.clock()if(b-av)>=ay then cachedInventoryData=nil end ah.RequestSort(0.35)
end)table.insert(aH,b)end end local a9=function()local a9=ab.player or ab.
Players.LocalPlayer if not a9 then return end local b=a9:WaitForChild(
'PlayerGui',15)if not b then return end local ba=b:WaitForChild('inventory',15)
if not ba then return end local bb=ba:WaitForChild('mainBackground',15)if not bb
then return end local bc=bb:WaitForChild('innerBackground',15)if not bc then
return end ensureSortBar()if bb.Visible and al and(ai~='None'or ak)then ah.
RequestSort(0.2)end local bd=bb:GetPropertyChangedSignal'Visible':Connect(
function()if bb.Visible then local bd=ensureSortBar()if bd then au(bd)end ah.
RequestSort(0.15)end end)table.insert(aH,bd)local be=bc.ChildAdded:Connect(
function(be)if be.Name=='sortBarFrame'and be:IsA'GuiObject'then hookSortBar(be)
end end)table.insert(aH,be)local bf=bc:WaitForChild('rightSideFrame',10)local bg
=bf and bf:WaitForChild('ScrollingFrame',10)if bg then local bh=bg.ChildAdded:
Connect(function(bh)if bh:IsA'GuiObject'and al and(ai~='None'or ak)then ah.
RequestSort(0.3)end end)table.insert(aH,bh)end end task.spawn(a9)local b=ab.
player or ab.Players.LocalPlayer if b then local ba=b.CharacterAdded:Connect(
function()task.delay(1,a9)end)table.insert(aH,ba)end end aa.Register(function()
if a0 then task.cancel(a0)a0=nil end if ap then task.cancel(ap)ap=nil pcall(
function()ar()local a7,a8=aq(),{mainFilterMode=ai,rarityEnabled=aj,
selectedStatFilter=ao,abilityEnabled=ak,autoSortEnabled=al}writefile(a7,ag:
JSONEncode(a8))end)end for a7,a8 in ipairs(aH)do pcall(function()a8:Disconnect()
end)end table.clear(aH)table.clear(aK)table.clear(aL)table.clear(aM)table.clear(
aJ)table.clear(aN)table.clear(aO)cachedInventoryData=nil ai='None'aj=false ao=
nil ak=false if injectedSortBar and injectedSortBar.Parent then pcall(function()
injectedSortBar:Destroy()end)injectedSortBar=nil end end)ah.Init()return ah end
function a.av()return function(aa)pcall(function()local ab=setthreadidentity or
set_thread_identity or setidentity or(syn and syn.set_thread_identity)if ab then
local ac=pcall(ab,7)if not ac then pcall(ab,8)end end end)local ab,ac=game:
GetService'Players',os.clock()+15 while not ab.LocalPlayer do if os.clock()>ac
then break end task.wait(0.1)end local ad=ab.LocalPlayer if not ad then return
warn
[[[DungeonQuest] Failed to retrieve LocalPlayer, aborting script initialization.]]
end local ae,af,ag,ah=a.load'a',a.load'b',a.load'd',a.load'g'ag.Suspend()local
ai,aj=ae:Window{Title='DungeonQuest',Subtitle='EsclipseHub',Size=UDim2.
fromOffset(1000,600),SidebarWidth=300,DragStyle=1,DisabledWindowControls={},
ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,AcrylicBlur=true},a.load'c'
aj:SetWindow(ai)_G.ScriptHub_UI=ai _G.ScriptHub_Cleanup=function()af.Cleanup()
end ai.onUnloaded(function()af.Cleanup()if _G.ScriptHub_UI==ai then _G.
ScriptHub_UI=nil end end)local ak=ai:TabGroup()local al={Combat=ak:Tab{Name=
'Combat',Image='rbxassetid://10734975692'},PathRecord=ak:Tab{Name='Macro',Image=
'rbxassetid://10734950309'},Dungeon=ak:Tab{Name='Dungeon',Image=
'rbxassetid://10734886202'},Inventory=ak:Tab{Name='Inventory',Image=
'rbxassetid://10709769841'},Utilities=ak:Tab{Name='Utilities',Image=
'rbxassetid://10747383470'},Configs=ak:Tab{Name='Configs',Image=
'rbxassetid://10734950309'}}ae:SetFolder'EsclipseHub'local am,an,ao,ap,aq,ar=a.
load'P',a.load'X',a.load'aa',a.load'ac',a.load'an',a.load'ar'am(ai,al.Combat)an(
ai,al.PathRecord)ao(ai,al.Dungeon)ap(ai,al.Inventory)aq(ai,al.Utilities)ar(ai,al
.Configs)local as=a.load'D'as.Init()local at=a.load'ah'at.Init()a.load'ae'a.load
'as'a.load'au'local au=a.load'ao'au.SetWindow(ai)au.Execute()local av=a.load'al'
av.SetWindow(ai)av.Init()al.Combat:Select()local ax=a.load'h'ax.SetLocked(true)
if ae.Elevate then ae.Elevate()end local ay,az=pcall(function()ae:
LoadAutoLoadConfig()end)if not ay then warn(
'[DungeonQuest] Error during LoadAutoLoadConfig:',az)end local aA=function()
local aA=ae.Folder..'/settings/autoload.txt'if isfile and isfile(aA)then local
aB,aC=pcall(readfile,aA)if aB and type(aC)=='string'then aC=string.gsub(aC,
'[\r\n%s]+','')if#aC>0 then ag.SetActive(aC)return end end end if not ag.
GetActive()then local aB=ae.Folder..'/settings/Default.json'if isfile and
isfile(aB)then ag.SetActive'Default'end end end aA()local aB=a.load'q'aB.
LoadData(ae.contextData)task.delay(0.3,function()ax.SetLocked(false)end)task.
delay(1.5,function()ag.Resume()end)end end function a.aw()local aa={}function aa
:Export()local ab={}for ac,ad in pairs(self)do if typeof(ad)=='Instance'or type(
ad)=='table'then local ae,af=pcall(function()end)if ae and af~=nil then ab[ac]=
af end end end return ab end function aa:Import(ab)for ac,ad in pairs(ab)do
local ae=self[ac]if ae and ae.Value~=nil then local af=pcall(function()end)if
not af then warn(`Failed to import value for flag "{ac}"`)end end end end
function aa:Reset()for ab in pairs(self)do self[ab]=nil end end return aa end
function a.ax()local aa,ab=a.load'aj',{}function ab:Window(ac)ac=ac or{}print
'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.ay()local aa,ab=a.load'aj',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.az()local aa,ab,
ac=a.load'aw',a.load'ax',a.load'ay'local ad=ab:Window{Visible=true}return{Flags=
aa,Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)
end,Settings=function(ae)end,Config=function(ae)end}}end function a.aA()local aa
={}function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.aB()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.aC()return function(aa)local ab,ac,
ad=a.load'az',a.load'aA',a.load'aB'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab
.Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do
local al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end
do local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah
.Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'av',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.
load'aC',Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and
game.PlaceId~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.
Places then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:
Load()end end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae
:Load()end end