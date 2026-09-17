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
.b()local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,ae
)ae=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description=
ad,Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.c()local aa,ab,ac,ad,ae,af,ag=a.load'a',a.load'b',{},
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
return ai end return function(...)ai(...)ac.Save()end end return ac end function
a.d()local aa,ab,ac,ad=game:GetService'Players',game:GetService
'UserInputService',game:GetService'RunService',game:GetService
'VirtualInputManager'local ae=aa.LocalPlayer if not ae then local af=os.clock()+
5 repeat ae=aa.LocalPlayer if ae then break end task.wait(0.1)until os.clock()>
af end return{Players=aa,UserInputService=ab,RunService=ac,VirtualInputManager=
ad,player=ae}end function a.e()local aa={cleaned=false,callbacks={}}function aa.
Register(ab)if type(ab)~='function'then return function()end end if aa.cleaned
then pcall(ab)return function()end end table.insert(aa.callbacks,ab)return
function()for ac,ad in ipairs(aa.callbacks)do if ad==ab then table.remove(aa.
callbacks,ac)break end end end end function aa.Cleanup()if aa.cleaned then
return end aa.cleaned=true for ab=#aa.callbacks,1,-1 do pcall(aa.callbacks[ab])
end table.clear(aa.callbacks)end function aa.IsActive()return not aa.cleaned end
aa.OnCleanup=aa.Register return aa end function a.f()local aa,ab=a.load'd',a.
load'e'local ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,
ay=aa.player,0.05,'enemyProjectiles',0.5,{},false,16,16,true,false,false,{},0,{}
,0,{},{},{},{},{},{},0,{}local az,aA,aB,aC,aD,aE,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,
aP,aQ,aR=function()for az=#ay,1,-1 do pcall(ay[az])end end,{},'unknown',true,{},
{},{},0,4,false local aS=function(aS)if aS then table.insert(aF,aS)end return aS
end function ag.OnRespawn(aT)table.insert(aE,aT)end function ag.
GetLastRespawnTime()return aG end function ag.GetRespawnProtectionDuration()
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
end end end local a9 aO=function()if not am or aP~=nil then return end for b,ba
in pairs(at)do if ba and ba.Root and ba.Root.Parent then local bb=false if ba.
Room and type(ba.Room.Name)=='string'and string.find(string.lower(ba.Room.Name),
'boss')then bb=true elseif string.find(string.lower(b.Name),'boss')then bb=true
elseif b.Parent and string.find(string.lower(b.Parent.Name),'boss')then bb=true
end if bb then aP=ba.Root.Position return end end end for b,ba in pairs(at)do if
ba and ba.Root and ba.Root.Parent then aP=ba.Root.Position return end end end
local b=function(b)if am==b then return end am=b if b then ao+=1 aP=nil a4()aO()
for ba=#ap,1,-1 do pcall(ap[ba],ao)end else aP=nil end for ba=#an,1,-1 do pcall(
an[ba],am)end aN()end function ag.GetBossSpawnPosition()if aP then return aP end
aO()return aP end function ag.SetBossSpawnPosition(ba)aP=ba end local function
ba()if not ac then return end local bb=ac:FindFirstChild'PlayerGui'if not bb
then a9=nil b(false)return end local bc=bb:FindFirstChild('bossHealth',true)if
bc then if bc~=a9 then a9=bc if a9:IsA'ScreenGui'then aS(a9:
GetPropertyChangedSignal'Enabled':Connect(ba))elseif a9:IsA'GuiObject'then aS(a9
:GetPropertyChangedSignal'Visible':Connect(ba))end end local bd=if bc:IsA
'ScreenGui'then bc.Enabled elseif bc:IsA'GuiObject'then bc.Visible else true b(
bd)else a9=nil b(false)end end task.spawn(function()if not ac then return end
local bb=ac:WaitForChild('PlayerGui',30)if not bb then return end aS(bb.
DescendantAdded:Connect(ba))aS(bb.DescendantRemoving:Connect(ba))ba()while ab.
IsActive()and task.wait(0.5)do ba()end end)local bb,bc={}local bd=function()if
bc then return bc end pcall(function()local bd=ac or game:GetService'Players'.
LocalPlayer local be=bd and bd:FindFirstChild'PlayerScripts'local bf=be and be:
FindFirstChild'PlayerModule'if bf then bc=require(bf):GetControls()end end)
return bc end function ag.DisableControls(be)be=be or'default'bb[be]=true local
bf=bd()if bf and type(bf.Disable)=='function'then pcall(function()bf:Disable()
end)end end function ag.EnableControls(be)be=be or'default'bb[be]=nil if next(bb
)~=nil then return end local bf=bd()if bf and type(bf.Enable)=='function'then
pcall(function()bf:Enable()end)end end ab.Register(function()if aQ then aQ:
Disconnect()aQ=nil end for be,bf in ipairs(aF)do pcall(function()bf:Disconnect()
end)end table.clear(aF)table.clear(bb)local be=bd()if be and type(be.Enable)==
'function'then pcall(function()be:Enable()end)end aM()end)return ag end function
a.g()local aa,ab,ac={},{},false function aa.SetLocked(ad)ac=ad and true or false
end function aa.IsLocked()return ac end function aa.Register(ad,ae,af)if type(ad
)~='string'or type(ae)~='function'or type(af)~='function'then return end ab[ad]=
{setEnabled=ae,isEnabled=af}end function aa.EnableExclusive(ad)if ac then return
end for ae,af in pairs(ab)do if ae~=ad and af.isEnabled()then pcall(af.
setEnabled,false)end end end function aa.IsEnabled(ad)local ae=ab[ad]return ae~=
nil and ae.isEnabled()end return aa end function a.h()local aa,ab=a.load'd',a.
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
ac end function a.k()local aa=a.load'd'local ab,ac=aa.player,{}local ad=function
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
],6,60),math.clamp(aE[3],8,80)local aH,aI=aF/2+az,aG/2+az return{half=Vector3.
new(aH,0,aI),cframe=av.CFrame,isBigSpike=true}end if aw or(av:IsA'Part'and(av.
Shape==Enum.PartType.Ball or av.Shape==Enum.PartType.Cylinder))then return{
radius=math.max(ay.X,ay.Y,ay.Z)/2}end local aC=Vector3.new(math.max(ay.X,0)/2+az
,0,math.max(ay.Z,0)/2+az)return{half=aC,cframe=av.CFrame}end,function(av,aw,ax,
ay)if not aw then return false end if aw.expireTime and os.clock()>aw.expireTime
then return false end local az,aA=av.X,av.Z ax=ax or 0 local aB=(ay or aw.
isTrajectory)and ad or ac if aw.radius then local aC,aD=(aw.part and aw.part.
Parent)and aw.part.Position,aw.isSecondBossChain==true local aE,aF=(aD and aw.cx
)or(aC and aC.X)or aw.cx or 0,(aD and aw.cz)or(aC and aC.Z)or aw.cz or 0 local
aG,aH,aI=az-aE,aA-aF,aw.radius+aB+ax return(aG*aG+aH*aH)<=(aI*aI)end local aC=(
aw.part and aw.part.Parent)and aw.part.CFrame or aw.cframe if aC then local aD,
aE,aF=aC:PointToObjectSpace(av),aw.half.X,aw.half.Z if ax<=0 then return math.
abs(aD.X)<=aE and math.abs(aD.Z)<=aF else local aG,aH=math.max(0,math.abs(aD.X)-
aE),math.max(0,math.abs(aD.Z)-aF)return(aG*aG+aH*aH)<=(ax*ax)end end return
false end,function(av,aw)local ax=(aw and aw.CFrame)or(av:IsA'Model'and av:
GetPivot())if ax then local ay=ax.LookVector local az=Vector3.new(-ay.X,0,-ay.Z)
if az.Magnitude>0.05 then return az.Unit end end local ay=services.player or
game:GetService'Players'.LocalPlayer local az=ay and ay.Character local aA=az
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
={aI.X,aI.Y,aI.Z}table.sort(aK)local aL,aM=math.clamp(aK[2],6,60),math.clamp(aK[
3],8,80)local aN,aO=aL/2+aE,aM/2+aE local aP={half=Vector3.new(aN,0,aO),cframe=
aG.CFrame,part=aG,cx=aH.X,cz=aH.Z,isTrajectory=aD,isBigSpike=true}return{zones={
aP},center=Vector3.new(aH.X,0,aH.Z),boundingRadius=math.sqrt(aN*aN+aO*aO)}end if
aA:IsA'BasePart'then if not av(aA)then return nil end aF={aA}else aF={}for aG,aH
in ipairs(aA:GetDescendants())do if#aF>=af then break end if aH:IsA'BasePart'and
av(aH)and aH.Parent then aF[#aF+1]=aH end end if#aF==0 then return nil end end
local aG,aH,aI,aJ,aK={},math.huge,-math.huge,math.huge,-math.huge for aL,aM in
ipairs(aF)do local aN,aO=aM.Position,aM.Size local aP=math.max(aO.X,aO.Y,aO.Z)/2
+aE aH=math.min(aH,aN.X-aP)aI=math.max(aI,aN.X+aP)aJ=math.min(aJ,aN.Z-aP)aK=math
.max(aK,aN.Z+aP)local aQ=aw(aM,aC,aD)if aQ then aQ.part=aM aQ.isTrajectory=aD aG
[#aG+1]=aQ end end if#aG==0 then return nil end local aL,aM,aN,aO=(aH+aI)/2,(aJ+
aK)/2,(aI-aH)/2,(aK-aJ)/2 return{zones=aG,center=Vector3.new(aL,0,aM),
boundingRadius=math.sqrt(aN*aN+aO*aO)}end local aA=function(aA)local aB=aA and
aA.HazardZones if not aB then aB=az(aA)if aB and aA then aA.HazardZones=aB end
end return aB end function aa.GetHazardZones(aB)return aA(aB)end function aa.
GetNearbyHazards(aB,aC)local aD=ag if not aD then return{}end aC=aC or 65 local
aE,aF,aG={},aB.X,aB.Z for aH,aI in pairs(aD.GetActiveHazardsMap())do local aJ,aK
=aI.Instance,aA(aI)if aK then local aL,aM=aK.center.X,aK.center.Z if aJ and aJ.
Parent then local aN=aJ:IsA'BasePart'and aJ or aJ.PrimaryPart or aJ:
FindFirstChildWhichIsA'BasePart'if aN then aL=aN.Position.X aM=aN.Position.Z end
end local aN,aO=aF-aL,aG-aM local aP,aQ=aN*aN+aO*aO,aC+aK.boundingRadius if aP<=
aQ*aQ then table.insert(aE,aI)end end end return aE end function aa.
IsPointInAnyHazard(aB,aC,aD,aE)local aF=ag if not aF then return false,nil,nil
end aD=aD or 0 local aG,aH,aI,aJ=math.huge,aE or aF.GetActiveHazardsMap()for aK,
aL in pairs(aH)do local aM=aL.Instance or(typeof(aK)=='Instance'and aK)if aC and
(aC==aM or(aM and aC.Name==aM.Name))then continue end local aN=aL.Name or(aM and
aM.Name)or''if ap(aN)or as(aN)then continue end local aO=aA(aL)if not aO then
continue end local aP,aQ=aO.center.X,aO.center.Z if aM and aM.Parent then local
aR=aM:IsA'BasePart'and aM or aM.PrimaryPart or aM:FindFirstChildWhichIsA
'BasePart'if aR then aP=aR.Position.X aQ=aR.Position.Z end end local aR,aS=aB.X-
aP,aB.Z-aQ local aT,aU=aR*aR+aS*aS,aO.boundingRadius+aD if aT>aU*aU then
continue end local aV=aL.IsTrajectory==true for aW=1,#aO.zones do local aX=aO.
zones[aW]if av(aX.part)and ax(aB,aX,aD,aV or aX.isTrajectory)then local aY=(aB-
aX.part.Position).Magnitude if aY<aG then aG=aY aI=aL aJ=aX.part end break end
end end return aJ~=nil,aI,aJ end return aa end function a.m()local aa,ab,ac=a.
load'd',a.load'e',a.load'l'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=aa.
RunService or game:GetService'RunService',aa.player,{},false,{},0.85,Color3.
fromRGB(255,45,45),Color3.fromRGB(0,160,255),0.55,0.25 local ap=function()local
ap=ae and ae.Character if not ap then return nil end local aq=ap:FindFirstChild
'HumanoidRootPart'or ap.PrimaryPart if not aq then return nil end return aq.
Position.Y-2.5 end function af.BindDetection(aq)an=aq or nil end local aq
function af.BindTrajectory(ar)aq=ar or nil end function af.IsEnabled()return ag
end local ar=function(ar,as)local at,au,av=ar.ad,ar.zone,ar.part local aw=ar.
anchorPart or av if not at or not at.Parent or not aw or not aw.Parent then
return end local ax=au and(au.isSecondBossChain or(ar.hazardInfo and ar.
hazardInfo.IsSyntheticChain))local ay=(ax and au.cx and au.cz and Vector3.new(au
.cx,0,au.cz))or(av and av.Parent and av.Position)or((au and au.cx and au.cz)and
Vector3.new(au.cx,0,au.cz))if not ay then return end local az=Vector3.new(ay.X,
as or ay.Y,ay.Z)if ar.isCircle then local aA=CFrame.new(az)*CFrame.Angles(math.
rad(90),0,0)at.CFrame=(aw==workspace.Terrain)and aA or aw.CFrame:ToObjectSpace(
aA)else local aA if au and(au.isMovingBeam or au.isBigSpike)then local aB=aq and
aq.GetHazardDirection and aq.GetHazardDirection(ar.hazardInfo)if aB and aB.
Magnitude>0.01 then aA=CFrame.lookAt(az,az+aB)else local aC=(av and av.Parent)
and av.CFrame or CFrame.identity local aD,aE,aF=aC:ToOrientation()aA=CFrame.new(
az)*CFrame.Angles(0,aE,0)end else local aB=(av and av.Parent)and av.CFrame or
CFrame.identity local aC,aE,aF=aB:ToOrientation()aA=CFrame.new(az)*CFrame.
Angles(0,aE,0)end at.CFrame=(aw==workspace.Terrain)and aA or aw.CFrame:
ToObjectSpace(aA)end end local as=function()if not ag then return end local as,
at,au=false,ap(),os.clock()for av,aw in pairs(ah)do local ax,ay=av.
IsSyntheticChain or(av.MaxExpireTime and au<av.MaxExpireTime),av.Instance and av
.Instance.Parent if not ay and not ax then af.DetachZoneVisuals(av)else if aw.
items then local az={}for aA,aB in ipairs(aw.items)do local aE=aB.zone if aE and
aE.expireTime and au>aE.expireTime then if aB.ad and aB.ad.Parent then pcall(
function()aB.ad:Destroy()end)end elseif aB.ad and aB.ad.Parent then table.
insert(az,aB)ar(aB,at)end end aw.items=az if#az>0 then as=true else af.
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
GetTrajectoryMargin()or 0 for aA,aB in ipairs(aw.items)do local aE,aF,aG=aB.ad,
aB.zone,aB.part if aE and aE.Parent and aF and aG and aG.Parent then aE.Color3=
ay if aB.isCircle and aF.radius then aE.Radius=aF.radius+az elseif aF.half then
local aH,aI=aF.half.X,aF.half.Z aE.Size=Vector3.new(aH*2,am,aI*2)end end end end
function af.AttachZoneVisuals(au)if not ag or not au then return end if ah[au]
then af.DetachZoneVisuals(au)end local av=ac.GetHazardZones(au)if not av or not
av.zones then return end local aw=au.IsTrajectory==true local ax,ay,az,aA,aB,aE,
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
,aP)table.insert(aB,aO)if(not aJ and not aK)and aI then local aQ=aI:
GetPropertyChangedSignal'Transparency':Connect(function()if aI.Parent and aI.
Transparency>ai then pcall(function()aO:Destroy()end)end end)table.insert(aE,aQ)
end end end end if#aB>0 then ah[au]={items=aA,adornments=aB,connections=aE}at()
end end function af.ClearAll()if ao then ao:Disconnect()ao=nil end for au in
pairs(ah)do af.DetachZoneVisuals(au)end table.clear(ah)end function af.
RefreshAll()af.ClearAll()if not ag or not an then return end for au,av in pairs(
an.GetActiveHazardsMap())do af.AttachZoneVisuals(av)end end function af.
SetEnabled(au)ag=au and true or false if ag then af.RefreshAll()else af.
ClearAll()end end ac.OnPaddingChanged(function()if ag then af.RefreshAll()end
end)ab.Register(function()af.ClearAll()end)return af end function a.n()local aa,
ab,ac=a.load'd',a.load'e',a.load'l'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,
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
end for aB,aE in ipairs(az:GetDescendants())do if aE:IsA'BasePart'and ay(aE)then
return aE end end else for aA,aB in ipairs(az:GetDescendants())do if aB:IsA
'BasePart'and ay(aB)then return aB end end end return nil end,function(az)local
aA,aB=az and az.IsTrajectory==true,az and az.Name or'Hazard'local aE,aF=ag.
IsChasingProjectile(aB),ag.IsEnemyProjectile(aB)local aG=not aA or aE if aE then
local aH,aI=an,'220,100,255'return'C',aH,aI,true elseif aF then local aH,aI=aA
and am or al,aA and'255,160,50'or'0,210,255'return'P',aH,aI,aG else local aH,aI=
aA and am or ak,aA and'255,160,50'or'255,80,80'return'N',aH,aI,aG end end local
aB=function(aB,aE)if not aB or not aB.items or not aE then return end local aF,
aG,aH,aI=aA(aE)local aJ,aK=aE.Name or'Hazard',''if aI then local aL=aE.
SpawnClock or os.clock()local aM=math.max(0,os.clock()-aL)aK=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>]]
):format(aH,aF,aJ,aM)else aK=(
[[<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>]]
):format(aH,aF,aJ)end for aL,aM in ipairs(aB.items)do if aM.label and aM.label.
Parent then aM.label.Text=aK end if aM.stroke and aM.stroke.Parent and aM.stroke
.Color~=aG then aM.stroke.Color=aG end end end local aE=function()if not ah then
return end local aE=false for aF,aG in pairs(ai)do local aH=aF.Instance if not
aH or not aH.Parent then ag.DetachTimerVisual(aF)else if aG.items then for aI=#
aG.items,1,-1 do local aJ=aG.items[aI]local aK=aJ.part if not ay(aK)then if aJ.
billboard and aJ.billboard.Parent then pcall(function()aJ.billboard:Destroy()end
)end table.remove(aG.items,aI)else if aJ.billboard and aJ.billboard.Parent then
aJ.billboard.StudsOffset=Vector3.new(0,ax(aK),0)end end end if#aG.items==0 then
ag.DetachTimerVisual(aF)else aE=true aB(aG,aF)end else ag.DetachTimerVisual(aF)
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
return ag end function a.o()local aa,ab,ac,ad=a.load'd',a.load'e',a.load'l',a.
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
GetPivot().Position)if aB then local aE,aF=35,aw(ay.Name,ay)and'big_spike'or
'seeking_spike'for aG,aH in ipairs(workspace:GetChildren())do local aI=aH.Name:
lower()if as(aI)or string.find(aI,'beampart',1,true)then if at(aH)==aF then
local aJ=aH:IsA'BasePart'and aH.Position or(aH:IsA'Model'and aH:GetPivot().
Position)if aJ then local aK=(aJ-aB).Magnitude if aK<aE then aE=aK aA=aH end end
end end end end end if not aA then return nil,nil,nil,nil end local aB=aA:
FindFirstChild('Attachment2',true)if not aB or not aB:IsA'Attachment'then for aE
,aF in ipairs(aA:GetDescendants())do if aF:IsA'Attachment'and aF.Name~=
'Attachment0'and aF.Name~='Attachment1'then aB=aF break end end end local aE,aF=
aA.Position,aB and aB.WorldPosition if aF and aE then local aG=aF-aE local aH=
Vector3.new(aG.X,0,aG.Z)local aI=aH.Magnitude if aI>5 then local aJ=aH.Unit
return aI,aJ,aE,aF end end return nil,nil,nil,nil end local aA=function(aA)if
not aA then return nil end local aB,aE,aF,aG=0,0,0,{}if aA:IsA'BasePart'then
table.insert(aG,aA)else for aH,aI in ipairs(aA:GetDescendants())do if aI:IsA
'BasePart'then table.insert(aG,aI)end end end for aH,aI in ipairs(aG)do local aJ
,aK=aI.Size,aI:FindFirstChildWhichIsA('SpecialMesh',true)if aK then aJ=Vector3.
new(aJ.X*math.abs(aK.Scale.X),aJ.Y*math.abs(aK.Scale.Y),aJ.Z*math.abs(aK.Scale.Z
))end aB=math.max(aB,aJ.X)aE=math.max(aE,aJ.Y)aF=math.max(aF,aJ.Z)end if aB<=0
and aE<=0 and aF<=0 then return nil end local aH={aB,aE,aF}table.sort(aH)local
aI=aH[2]if aI<2 then aI=math.max(aH[1],aH[2])end return aI end local aB,aE=
function(aB)if ak.firstbossbigspike then return ak.firstbossbigspike end if
cachedBigSpikeWidth then return cachedBigSpikeWidth end if aB and not as(aB.Name
)then local aE=aA(aB)if aE and aE>=4 then cachedBigSpikeWidth=math.clamp(aE,8,60
)return cachedBigSpikeWidth end end for aE,aF in ipairs(workspace:GetChildren())
do local aG=aF.Name:lower()if string.find(aG,'firstbossbigspike',1,true)or(
string.find(aG,'bigspike',1,true)and not string.find(aG,'seekingspike',1,true)
and not as(aG))then local aH=aA(aF)if aH and aH>=4 then cachedBigSpikeWidth=math
.clamp(aH,8,60)return cachedBigSpikeWidth end end end local aE=game:GetService
'ReplicatedStorage'local aF=aE:FindFirstChild'enemyProjectiles'local aG=aF and
aF:FindFirstChild'firstBossBigSpike'if aG then local aH=aA(aG)if aH and aH>=4
then cachedBigSpikeWidth=math.clamp(aH,8,60)return cachedBigSpikeWidth end end
return 28 end local aF=function(aF)if ak.firstbossseekingspikes then return ak.
firstbossseekingspikes end if aE then return aE end if aF and not as(aF.Name)
then local aG=aA(aF)if aG and aG>=2 then aE=math.clamp(aG,4,40)return aE end end
for aG,aH in ipairs(workspace:GetChildren())do local aI=aH.Name:lower():gsub(
'%s+','')if string.find(aI,'seekingspike',1,true)and not as(aI)then local aJ=aA(
aH)if aJ and aJ>=2 then aE=math.clamp(aJ,4,40)return aE end end end local aG=
game:GetService'ReplicatedStorage'local aH=aG:FindFirstChild'enemyProjectiles'
local aI=aH and aH:FindFirstChild'firstBossSeekingSpikes'if aI then local aJ=aA(
aI)if aJ and aJ>=2 then aE=math.clamp(aJ,4,40)return aE end end return 10 end
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
GetFirstBossSeekingSpikeWidth()return ak.firstbossseekingspikes or(aE or 10)end
function ag.SetFirstBossSeekingSpikeWidth(aL)if type(aL)=='number'and aL>0 then
ak.firstbossseekingspikes=math.clamp(aL,4,40)else ak.firstbossseekingspikes=nil
end aE=nil ag.RefreshAll()end function ag.GetCustomWidth(aL)if not aL then
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
load'c',a.load'f',{},{Mob={Min=15,Max=35,BossArea=false,BossAreaRadius=80,
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
load'd',a.load'f',a.load'e',a.load'l',a.load'm',a.load'o',a.load'n',a.load'p',
game:GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage'local al,am,an,ao,ap,aq,ar,as,at,au,av,aw,ax,ay,az,aA,aB,aE,
aF,aG,aH,aI=aa.player,{},false,false,true,false,false,'',false,{},0,{},{},0,0,2,
{'abilities','projectiles'},false,{},{firstbossbeamparticles=true}local aJ,aK,aL
,aM,aN,aO,aP,aQ=function()if aE then return end aE=true for aJ,aK in ipairs(aB)
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
local ba=os.clock()if ba-ay<6 then a4(a7,
'V\u{f2}ng con c\u{1ee7}a chu\u{1ed7}i secondBossCricleHitbox (\u{111}\u{e3} d\u{1ef1}ng tr\u{1b0}\u{1edb}c 10 v\u{f2}ng)'
)return false end ay=ba end local ba=aW(a7)local bb,bc,bd={Instance=a7,Name=a7.
Name,Class=a7.ClassName,Distance=ba,Boxes={},Connections={},SpawnClock=os.clock(
)},{},{}if ap and not a9 and not b then bd=a0(a8,bc)end bb.Boxes=bd bb.
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
Connections)end end else for a9,b in pairs(au)do if b.Boxes then for ba,bb in
ipairs(b.Boxes)do pcall(function()bb:Destroy()end)end table.clear(b.Boxes)end
end end end function am.IsSelectionBoxesEnabled()return ap end function am.
SetLogHazards(a8)aq=a8 and true or false end function am.IsLogHazardsEnabled()
return aq end function am.SetLogFailed(a8)ar=a8 and true or false end function
am.IsLogFailedEnabled()return ar end function am.SetInspectTarget(a8)as=type(a8)
=='string'and a8 or''end function am.GetInspectTarget()return as end function am
.SetInspectEnabled(a8)at=a8 and true or false end function am.IsInspectEnabled()
return at end function am.GetHazardCount()return av end function am.
GetActiveHazards()local a8={}for a9,b in pairs(au)do if a9 and a9.Parent==aj
then a8[#a8+1]=b end end return a8 end function am.GetActiveHazardsMap()return
au end function am.GetLastHazardInfo()return aH end function am.OnHazardChanged(
a8)if type(a8)~='function'then return end table.insert(aw,a8)end ac.Register(
function()am.StopScan()am.ClearAllHazards'Shutdown'end)return am end function a.
r()local aa,ab,ac,ad,ae=a.load'd',a.load'e',a.load'l',a.load'o',a.load'p'local
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,aw=aa.RunService or game:
GetService'RunService',aa.player,{},true,false,{},1.8,Color3.fromRGB(0,255,170),
Color3.fromRGB(255,35,35),0.45,0.2,0.2,(game:GetService'Players')local ax,ay,az,
aA=function()local ax=ag or ar.LocalPlayer if not ax then return nil end local
ay=ax.Character if not ay or not ay.Parent then return nil end local az=ay:
FindFirstChildOfClass'Humanoid'if az and az.Health<=0 then return nil end return
ay:FindFirstChild'HumanoidRootPart'or ay.PrimaryPart end,function(ax)if not ax
then return 0 end return ax.Position.Y-2.5 end,function(ax)if av then if av.
Parent~=ax or not av:IsDescendantOf(workspace)then pcall(function()av:Destroy()
end)av=nil else if av.Adornee~=ax then av.Adornee=ax end return av end end if
not ax or not ax.Parent then return nil end local ay=Instance.new
'CylinderHandleAdornment'ay.Name='Player_2D_HitboxVisual'ay.Adornee=ax ay.Radius
=al ay.Height=aq ay.Color3=aj and an or am ay.Transparency=aj and ap or ao ay.
ZIndex=5 ay.AlwaysOnTop=false ay.Visible=ai ay.Parent=ax av=ay return ay end,
function(ax)if not av or not av.Parent then return end av.Color3=ax and an or am
av.Transparency=ax and ap or ao end local aB=function()local aB=ax()if not aB or
not aB.Parent then if av and av.Parent then av.Visible=false end if aj then aj=
false as=nil at=nil for aE,aF in ipairs(ak)do pcall(aF,false,nil,nil)end end
return end local aE=az(aB)if aE and aE.Parent then aE.Visible=ai aE.Radius=al
local aF=ay(aB)local aG=CFrame.new(Vector3.new(aB.Position.X,aF,aB.Position.Z))*
CFrame.Angles(math.rad(90),0,0)aE.CFrame=aB.CFrame:ToObjectSpace(aG)end if ae.
IsActiveHazardScannerEnabled and not ae.IsActiveHazardScannerEnabled()then if aj
then aj=false as=nil at=nil aA(false)for aF,aG in ipairs(ak)do pcall(aG,false,
nil,nil)end end return end local aF=Vector3.new(aB.Position.X,0,aB.Position.Z)
local aG,aH,aI=ac.IsPointInAnyHazard(aF,nil,al)local aJ,aK=false if not aG and
ad.IsPointInAnyTrajectory then aJ,aK=ad.IsPointInAnyTrajectory(aF,al)end local
aL,aM,aN=(aG or aJ),aH or aK,aG and'Ground Zone'or(aJ and'Trajectory Corridor'or
nil)if aL~=aj or aM~=as then aj=aL as=aM at=aN aA(aL)for aO,aP in ipairs(ak)do
pcall(aP,aL,aM,aN)end end end local aE=function()if not au then au=af.Heartbeat:
Connect(aB)end end function ah.Cleanup()if au then au:Disconnect()au=nil end if
av then pcall(function()av:Destroy()end)av=nil end aj=false as=nil at=nil end
function ah.IsPlayerInDanger()return aj,as,at end function ah.GetCurrentThreat()
return as,at end function ah.OnDangerStatusChanged(aF)if type(aF)=='function'
then table.insert(ak,aF)end end function ah.SetVisualEnabled(aF)ai=aF and true
or false if av then av.Visible=ai end end function ah.IsVisualEnabled()return ai
end function ah.SetRadius(aF)if type(aF)=='number'and aF>=0.1 then al=aF if av
and av.Parent then av.Radius=al end end end function ah.GetRadius()return al end
local aF=function()local aF=ag or ar.LocalPlayer if not aF then return end local
aG=function(aG)if av then pcall(function()av:Destroy()end)av=nil end task.spawn(
function()local aH=aG:WaitForChild('Humanoid',3)if aH then aH.Died:Connect(
function()if av then av.Visible=false end end)end end)end aw=aF.CharacterAdded:
Connect(aG)if aF.Character then aG(aF.Character)end end aF()aE()ab.Register(
function()if aw then aw:Disconnect()aw=nil end ah.Cleanup()end)return ah end
function a.s()local aa,ab,ac={},{},8 for ad=1,ac do local ae=(ad-1)*(2*math.pi/
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
then table.insert(ao,{pos=aA,isSafe=aB,isChosen=false})end if aB then local aE=
aA if am and al>0 then local aF=aA+az*al if an(aF)then aE=aF end end local aF=(
aE-ai).Magnitude if aF<aq then aq=aF au=aE ar=az ax=true end end end if ax and
au then as=true break end end return au,as,aq,ar end return aa end function a.t(
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
local aE=CFrame.new(ay)*CFrame.Angles(math.rad(90),0,0)ax.dot.CFrame=ap.CFrame:
ToObjectSpace(aE)ax.dot.Color3=aA ax.dot.Transparency=aB ax.dot.Radius=aw.isSafe
and 0.3 or 0.2 ax.dot.Visible=true end if ax.line and ax.line.Parent then local
aE=az-au local aF=aE.Magnitude if aF>0.2 then ax.line.CFrame=CFrame.lookAt(au,az
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
local aB=aA-az local aE=aB.Magnitude if aE>0.3 then am.CFrame=CFrame.new(az)am.
Length=aE am.CFrame=CFrame.lookAt(az,aA)am.Visible=true else am.Visible=false
end end ap(aq,as,at,av)end function ai.Cleanup()if ak then pcall(function()ak:
Destroy()end)ak=nil end if al then pcall(function()al:Destroy()end)al=nil end if
am then pcall(function()am:Destroy()end)am=nil end for aq,ar in ipairs(aj)do if
ar.dot then pcall(function()ar.dot:Destroy()end)end if ar.line then pcall(
function()ar.line:Destroy()end)end end table.clear(aj)end return ai end function
a.u()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'd',a.load'f',a.load'e',a.load'l',a.
load'o',a.load'r',a.load's',a.load't',a.load'p'local aj,ak,al,am,an,ao,ap,aq,ar,
as,at,au,av,aw,ax,ay,az,aA,aB,aE=aa.RunService or game:GetService'RunService',
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
.Heartbeat:Connect(aI)end if not aE and af.OnDangerStatusChanged then aE=af.
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
function a.v()local aa,ab,ac,ad,ae,af=a.load'd',a.load'f',a.load'e',a.load'r',a.
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
local aB,aE,aF=aq()aA(aE,aF)for aG,aH in ipairs(an)do pcall(aH,false,nil,0)end
end return end local aB,aE,aF=aq()if not aB or not aE or not aF then if am or ao
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
)aA(aE,aF)local aS=ao ao=nil if am then am=false for aT,aU in ipairs(an)do
pcall(aU,false,aS,aN)end end else if not am then am=true ar()av()for aO,aP in
ipairs(an)do pcall(aP,true,ao,aN)end end ay(ao)end else if am or ao then ao=nil
am=false aA(aE,aF)for aL,aM in ipairs(an)do pcall(aM,false,nil,0)end end end end
local aE=function()if not ap then ap=ag.Heartbeat:Connect(aB)end end function aj
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
aj.Clear()end)end aE()ac.Register(function()aj.Cleanup()end)return aj end
function a.w()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'e',a.load'q',a.load'l',
a.load'm',a.load'o',a.load'r',a.load'u',a.load'v',a.load'n',{}ac.BindDetection(
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
,ab,ac,ad=a.load'd',a.load'f',a.load'e',a.load'j'local ae,af,ag,ah,ai,aj,ak,al,
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
if aB:IsA'Tool'then local aE=aB:FindFirstChild'abilitySlot'if aE and string.
lower(tostring(aE.Value))=='q'then return aB end end end end return nil end
local ay=function()local ay=ax()if ay then local az=ay:FindFirstChild'cooldown'
if az and typeof(az.Value)=='number'then return az.Value end end return nil end
local az,aA,aB,aE=function(az)local aA=ay()if aA~=nil then if aA>(ar+0.5)or(ar<=
0.2 and aA>0.5)then aq=az end ar=aA end end,function()if at then return end
pcall(function()local az=aa.ReplicatedStorage or game:GetService
'ReplicatedStorage'local aA=az and az:FindFirstChild'remotes'local aB=aA and aA:
FindFirstChild'abilityCast'if aB and aB:IsA'RemoteEvent'then at=aB.OnClientEvent
:Connect(function(aE,aF)local aG=ag or game:GetService'Players'.LocalPlayer if
aE==aG then local aH=ax()if(aH and aH.Name==aF)or(not aH)then aq=os.clock()end
end end)end end)end,function()if at then pcall(function()at:Disconnect()end)at=
nil end end,function()local az=ag or game:GetService'Players'.LocalPlayer local
aA=az and az.Character local aB=aA and(aA:FindFirstChild'HumanoidRootPart'or aA.
PrimaryPart)if aB and aB.Parent then return aB end return nil end local aF=
function()local aF=aE()if not aF then return nil,math.huge,false end local aG,aH
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
then return end local aG=aE()if not aG then return end local aH=aG.Parent local
aI=aH and aH:FindFirstChildOfClass'Humanoid'if aI and aI.Health<=0 then return
end local aJ,aK,aL=aF()local aM=os.clock()az(aM)if(aM-am>=ak)and not ao then if
aL then local aN=ay()local aO=(aN==nil)or(aN<=0.2)if aO then am=aM ah.
CastSkillQ()if aN==nil and not ah.IsBuffActive()then aq=aM end end end end if(aM
-an>=ak)and not ap then if aJ and aK<=aj then local aN=ah.IsBuffActive()if aN
then an=aM ah.CastSkillE()end end end end au=function()if not as then as=ae.
Heartbeat:Connect(aG)end aA()end av=function()if as then as:Disconnect()as=nil
end aB()ao=false ap=false ar=0 aq=-math.huge end function ah.Step(aH,aI,aJ)end
ac.Register(function()ah.SetEnabled(false)end)return ah end function a.y()local
aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.load'd',a.load'f',a.load'e',a.load'g',a.load
'h',a.load'i',a.load'j',a.load'k',a.load'w',a.load'x',a.load'p'local al,am,an,ao
,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aE,aF=aa.RunService,aa.player,{NO_TARGET=
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
then a3.Visible=false end end end if not aE or not aY or not bu or not br or not
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
false end end end function ao.IsBlockerRayVisualEnabled()return aE end function
ao.SetBlockerRayVisual(bu)aE=bu==true if not aE then if a4 then a4.Visible=false
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
'e',a.load'y',a.load'w',a.load'g',a.load'b',{},false,true,false,{}local ak=
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
function a.A()local aa,ab,ac,ad,ae,af,ag,ah={'Easy','Medium','Hard','Insane',
'Nightmare'},{'Desert Temple','Winter Outpost','Pirate Island',"King's Castle",
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
end function a.B()local aa={}function aa.PatchSliderLoadCallback(ab)if not ab or
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
ad(ae,af)end return ab end return aa end end local aa,ab,ac,ad,ae,af,ag,ah,ai=a.
load'c',a.load'y',a.load'z',a.load'p',a.load'A',a.load'f',a.load'd',a.load'B',a.
load'e'local aj=ag.RunService return function(ak,al)local am=al:Section{Side=
'Left'}am:Header{Name='Auto Farm'}local an=am:Toggle({Name='Enable Auto Farm',
Default=ab.IsEnabled(),Callback=aa.Wrap(function(an)ab.Toggle(an)end)},
'Toggle_AutoFarm')ah.PatchSliderLoadCallback(am:Slider({Name=
'Rescan Interval (s)',Default=ab.GetScanInterval(),Minimum=0.5,Maximum=5,
Precision=1,Callback=aa.Wrap(function(ao)ab.SetScanInterval(ao)end)},
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
aB=az.velocity or 0 local aE=aB>=12 and'0,255,120'or(aB>=10 and'255,200,0'or
'255,80,80')at:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"
):format(aE,aB))end)pcall(function()if az.hasTarget and az.blocker then if az.
blocker.directBlocked then au:UpdateName((
[[Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>]]):
format(az.blocker.blockerName,az.blocker.blockerDist))else au:UpdateName
[[Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>]]
end else au:UpdateName"Blocker: <font color='rgb(160,160,160)'>None</font>"end
end)pcall(function()local aB=az.destMode if az.nodeIndex then aB=(
'%s (Node #%d)'):format(az.destMode,az.nodeIndex)end local aE=az.destMode==
'Direct'and'0,255,255'or(az.destMode=='Waypoint'and'255,200,0'or(az.destMode==
'Hold'and'255,200,0'or'255,80,80'))av:UpdateName((
"Destination Mode: <font color='rgb(%s)'>%s</font>"):format(aE,aB))end)pcall(
function()ax:UpdateName((
[[Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>]]):format(az.
waypointCount))end)end,0 ay=aj.Heartbeat:Connect(function()local aB=os.clock()if
aB-aA>=0.25 then aA=aB az()end end)ai.Register(function()if ay then ay:
Disconnect()ay=nil end end)local aB=al:Section{Side='Right'}aB:Header{Name=
'Contextual Combat Distance'}local aE,aF=aB:Label{Text='Active: -'},ae.
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
aN.." | <font color='rgb(255,160,50)'>No Scanner</font>"end pcall(function()aE:
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
Register(function()pcall(a0)pcall(a1)pcall(a2)pcall(a3)end)aS()end