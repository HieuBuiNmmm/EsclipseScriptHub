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
end break end end end return aK~=nil,aJ,aK end return aa end function a.n()local
aa,ab,ac=a.load'e',a.load'b',a.load'm'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,
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
return ag end function a.p()local aa,ab,ac,ad=a.load'e',a.load'b',a.load'm',a.
load'o'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av=aa.RunService
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
local a2=a.load'n'if a2 and a2.UpdateHazardVisualColor then pcall(a2.
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
bb=a.load'n'if bb and bb.UpdateHazardVisualColor then pcall(bb.
UpdateHazardVisualColor,aP,true)end local bc=a.load'o'if bc and bc.
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
return false,nil,nil,nil,nil end function ag.GetActiveTrajectoriesList()local aP
={}for aQ,aS in pairs(al)do if aS and aS.isMoving and aS.dir and aS.mainPart and
aS.mainPart.Parent then local aT,aU=aL(aQ,aS.dir)if aT and aU then local aV,aW=
aH(aQ),(aS.velocity and aS.velocity.Magnitude)or 0 table.insert(aP,{name=aQ.Name
or(aS.mainPart and aS.mainPart.Name)or'Trajectory',originX=aT.X,originZ=aT.Z,
dirX=aS.dir.X,dirZ=aS.dir.Z,length=aV,width=aU,speed=aW})end end end return aP
end function ag.SetEnabled(aP)ah=aP and true or false if ah then ag.RefreshAll()
else ag.ClearAll()end end ac.OnPaddingChanged(function()if ah then ag.
RefreshAll()end end)ab.Register(function()ag.ClearAll()end)return ag end
function a.q()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'a',a.load'd',a.load'f',{},
{Mob={Min=15,Max=35,BossArea=false,BossAreaRadius=80,InnerDeadzone=false,
InnerDeadzoneRadius=25,DisableDodge=false,EnableHazardScanner=true},Boss1={Min=
25,Max=50,BossArea=false,BossAreaRadius=80,InnerDeadzone=false,
InnerDeadzoneRadius=25,DisableDodge=false,EnableHazardScanner=true},Boss2={Min=
25,Max=50,BossArea=false,BossAreaRadius=80,InnerDeadzone=false,
InnerDeadzoneRadius=25,DisableDodge=false,EnableHazardScanner=true},Boss3={Min=
25,Max=50,BossArea=false,BossAreaRadius=80,InnerDeadzone=false,
InnerDeadzoneRadius=25,DisableDodge=false,EnableHazardScanner=true}},{Normal=
'Mob',['Boss 1']='Boss1',['Boss 2']='Boss2',['Boss 3']='Boss3'},{Mob='Normal',
Boss1='Boss 1',Boss2='Boss 2',Boss3='Boss 3'},{},{}function ad.GetTargetDisplay(
aj)return ag[aj]or'Normal'end function ad.GetTargetKey(aj)return af[aj]or'Mob'
end function ad.GetTargetOptions()return{'Normal','Boss 1','Boss 2','Boss 3'}end
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
ah[ak][an].BossAreaRadius=am aj()end function ad.GetInnerDeadzone(ak,al)local am
=al or'Mob'if am=='Mob'then return false,25 end local an=ae[am]or ae.Boss1 if
type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao=ah[ak][am]local
ap,aq=ao.InnerDeadzone==true,(type(ao.InnerDeadzoneRadius)=='number'and ao.
InnerDeadzoneRadius>0)and ao.InnerDeadzoneRadius or(an.InnerDeadzoneRadius or 25
)return ap,aq end return an.InnerDeadzone or false,an.InnerDeadzoneRadius or 25
end function ad.SetInnerDeadzoneEnabled(ak,al,am)if not(type(ak)=='string'and#ak
>0)then return end local an=al or'Mob'if an=='Mob'then return end ah[ak]=ah[ak]
or{}ah[ak][an]=ah[ak][an]or{}ah[ak][an].InnerDeadzone=am and true or false aj()
end function ad.SetInnerDeadzoneRadius(ak,al,am)if not(type(ak)=='string'and#ak>
0)then return end local an=al or'Mob'if an=='Mob'then return end if type(am)~=
'number'or am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak
][an].InnerDeadzoneRadius=am aj()end function ad.GetActiveBossArea(ak)local al,
am,an=ac.GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and ac.
IsBossActive()then an=true am=ac.GetCombatTargetKey()elseif ak then if ak.Room
and type(ak.Room.Name)=='string'and string.find(string.lower(ak.Room.Name),
'boss')then an=true elseif ak.Model then local ao=string.lower(ak.Model.Name)if
string.find(ao,'boss')then an=true else local ap=ak.Model.Parent if ap and
string.find(string.lower(ap.Name),'boss')then an=true end end end if an then
local ao=ac.GetCurrentBossIndex and ac.GetCurrentBossIndex()or 1 am='Boss'..
tostring(math.clamp(ao,1,3))end end if not an or am=='Mob'then return false,0,
nil,false,0 end local ao,ap=ad.GetBossArea(al,am)if not ao then return false,ap,
nil,false,0 end local aq=ac.GetBossSpawnPosition and ac.GetBossSpawnPosition()if
not aq and ak and ak.Root then aq=ak.Root.Position if ac.SetBossSpawnPosition
then ac.SetBossSpawnPosition(aq)end end local ar,as=ad.GetInnerDeadzone(al,am)
return ao,ap,aq,ar,as end function ad.GetDisableDodge(ak,al)local am=al or'Mob'
local an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]
then local ao=ah[ak][am]if ao.DisableDodge~=nil then return ao.DisableDodge==
true end end return an.DisableDodge or false end function ad.SetDisableDodge(ak,
al,am)if not(type(ak)=='string'and#ak>0)then return end local an=al or'Mob'ah[ak
]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][an].DisableDodge=am and true or
false aj()end function ad.GetEnableHazardScanner(ak,al)local am=al or'Mob'local
an=ae[am]or ae.Mob if type(ak)=='string'and#ak>0 and ah[ak]and ah[ak][am]then
local ao=ah[ak][am]if ao.EnableHazardScanner~=nil then return ao.
EnableHazardScanner==true end end return an.EnableHazardScanner~=false end
function ad.SetEnableHazardScanner(ak,al,am)if not(type(ak)=='string'and#ak>0)
then return end local an=al or'Mob'ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[
ak][an].EnableHazardScanner=am and true or false aj()end function ad.
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
end end return ad end function a.r()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.
load'e',a.load'f',a.load'b',a.load'm',a.load'n',a.load'p',a.load'o',a.load'q',
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
'Shutdown'end)return am end function a.s()local aa,ab,ac,ad,ae=a.load'e',a.load
'b',a.load'm',a.load'p',a.load'q'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as
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
aw:Disconnect()aw=nil end ah.Cleanup()end)return ah end function a.t()local aa,
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
end end return au,as,aq,ar end return aa end function a.u()local aa,ab,ac,ad,ae,
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
a.v()local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'e',a.load'f',a.load'b',a.load'm',a.
load'p',a.load's',a.load't',a.load'u',a.load'q'local aj,ak,al,am,an,ao,ap,aq,ar,
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
function a.x()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=a.load'b',a.load'g',a.load
'r',a.load'm',a.load'n',a.load'p',a.load's',a.load'v',a.load'w',a.load'o',{}ad.
BindDetection(ac)ae.BindDetection(ac)ae.BindTrajectory(af)af.BindDetection(ac)aj
.BindDetection(ac)ak.IsPointInAnyHazard=ad.IsPointInAnyHazard ak.
GetHazardPadding=ad.GetHazardPadding ak.SetHazardPadding=ad.SetHazardPadding ak.
GetHitboxPadding=ad.GetHazardPadding ak.SetHitboxPadding=ad.SetHazardPadding ak.
GetTrajectoryMargin=ad.GetTrajectoryMargin ak.SetTrajectoryMargin=ad.
SetTrajectoryMargin ak.GetHazardZones=ad.GetHazardZones ak.GetNearbyHazards=ad.
GetNearbyHazards ak.AddForceCircleName=ad.AddForceCircleName ak.
GetForceCircleNames=ad.GetForceCircleNames ak.IsForceCircle=ad.IsForceCircle ak.
IsSecondBossCircleChain=ad.IsSecondBossCircleChain ak.
GetSecondBossCircleDuration=ad.GetSecondBossCircleDuration ak.
SetSecondBossCircleDuration=ad.SetSecondBossCircleDuration ak.IsPlayerInDanger=
ag.IsPlayerInDanger ak.GetPlayerThreat=ag.GetCurrentThreat ak.
OnPlayerDangerChanged=ag.OnDangerStatusChanged ak.SetPlayerVisualEnabled=ag.
SetVisualEnabled ak.IsPlayerVisualEnabled=ag.IsVisualEnabled ak.
SetPlayerHitboxRadius=ag.SetRadius ak.GetPlayerHitboxRadius=ag.GetRadius ak.
FindNearestSafeSpot=ah.FindNearestSafeSpot ak.IsPointSafe=ah.IsPointSafe ak.
GetLastSafeSpot=ah.GetLastSafeSpot ak.OnSafeSpotChanged=ah.OnSafeSpotChanged ak.
SetSafeSpotVisualEnabled=ah.SetVisualEnabled ak.IsSafeSpotVisualEnabled=ah.
IsVisualEnabled ak.SetSafeSpotEnabled=ah.SetEnabled ak.IsSafeSpotEnabled=ah.
IsEnabled ak.SetSafeSpotBuffer=ah.SetSafetyBuffer ak.GetSafeSpotBuffer=ah.
GetSafetyBuffer ak.SetShowCandidates=ah.SetShowCandidates ak.IsShowCandidates=ah
.IsShowCandidates ak.SetFinePassEnabled=ah.SetFinePassEnabled ak.
IsFinePassEnabled=ah.IsFinePassEnabled ak.SetFallbackPassEnabled=ah.
SetFallbackPassEnabled ak.IsFallbackPassEnabled=ah.IsFallbackPassEnabled ak.
ClearSafeSpot=ah.Clear ak.SetAutoDodgeEnabled=ai.SetEnabled ak.
IsAutoDodgeEnabled=ai.IsEnabled ak.SetDodgeSnapDistance=ai.SetSnapDistance ak.
GetDodgeSnapDistance=ai.GetSnapDistance ak.IsCurrentlyDodging=ai.IsDodging ak.
OnDodgeStateChanged=ai.OnDodgeStateChanged ak.ClearDodge=ai.Clear ak.
SetVisualizerEnabled=ae.SetEnabled ak.IsVisualizerEnabled=ae.IsEnabled ak.
RefreshVisuals=ae.RefreshAll ak.SetTrajectoryEnabled=af.SetEnabled ak.
IsTrajectoryEnabled=af.IsEnabled ak.SetTrajectoryLength=af.SetPredictionLength
ak.GetTrajectoryLength=af.GetPredictionLength ak.GetHazardTrajectoryLength=af.
GetHazardPredictionLength ak.GetCustomTrajectoryLength=af.GetCustomLength ak.
SetCustomTrajectoryLength=af.SetCustomLength ak.GetSecondBossBeamLength=af.
GetSecondBossBeamLength ak.SetSecondBossBeamLength=af.SetSecondBossBeamLength ak
.GetFirstBossBigSpikeWidth=af.GetFirstBossBigSpikeWidth ak.
SetFirstBossBigSpikeWidth=af.SetFirstBossBigSpikeWidth ak.
GetFirstBossSeekingSpikeWidth=af.GetFirstBossSeekingSpikeWidth ak.
SetFirstBossSeekingSpikeWidth=af.SetFirstBossSeekingSpikeWidth ak.
GetCustomTrajectoryWidth=af.GetCustomWidth ak.SetCustomTrajectoryWidth=af.
SetCustomWidth ak.RefreshTrajectory=af.RefreshAll ak.IsPointInAnyTrajectory=af.
IsPointInAnyTrajectory ak.GetNearbyTrajectories=af.GetNearbyTrajectories ak.
SetSelectionBoxesEnabled=ac.SetSelectionBoxesEnabled ak.IsSelectionBoxesEnabled=
ac.IsSelectionBoxesEnabled ak.SetTimerVisualEnabled=aj.SetEnabled ak.
IsTimerVisualEnabled=aj.IsEnabled ak.RefreshTimerVisuals=aj.RefreshAll ak.
StartDetection=ac.StartScan ak.StopDetection=ac.StopScan ak.IsDetectionEnabled=
ac.IsEnabled ak.SetDetectionEnabled=ac.SetEnabled ak.SetLogHazards=ac.
SetLogHazards ak.IsLogHazardsEnabled=ac.IsLogHazardsEnabled ak.SetLogThreats=ak.
SetLogHazards ak.IsLogThreatsEnabled=ak.IsLogHazardsEnabled ak.SetLogFailed=ac.
SetLogFailed ak.IsLogFailedEnabled=ac.IsLogFailedEnabled ak.SetInspectTarget=ac.
SetInspectTarget ak.GetInspectTarget=ac.GetInspectTarget ak.SetInspectEnabled=ac
.SetInspectEnabled ak.IsInspectEnabled=ac.IsInspectEnabled ak.GetHazardCount=ac.
GetHazardCount ak.GetActiveHazards=ac.GetActiveHazards ak.GetActiveHazardsMap=ac
.GetActiveHazardsMap ak.GetActiveTrajectoriesList=af.GetActiveTrajectoriesList
ak.GetLastHazardInfo=ac.GetLastHazardInfo ak.OnHazardChanged=ac.OnHazardChanged
ak.ClearAllHazards=ac.ClearAllHazards ak.TriggerRoomTransition=ac.
TriggerRoomTransition ak.IsRoomTransitioning=ac.IsRoomTransitioning function ak.
StartScan()if not ab.IsDungeon()then return end ac.StartScan()end function ak.
StopScan()ac.StopScan()end function ak.Toggle(al)if al then ak.StartScan()else
ak.StopScan()end end function ak.IsEnabled()return ac.IsEnabled()end ab.Register
{Name='HazardScanner',Zone='Dungeon',OnLeave=function()ac.StopScan()end,OnEnter=
function()if ac.IsEnabled()then ac.StartScan()end end}aa.Register(function()ac.
StopScan()end)return ak end function a.y()local aa,ab,ac,ad,ae,af,ag,ah=game:
GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage',a.load'e',{},{},{groundaura=true,genericneonball=true,
genericattachpart=true,berserk=true,demonspikeone=true,demonspiketwo=true,
demonspikethree=true,groundslam=true,guardianblessingball=true,holybarrier=true,
holycircle=true,innervate=true,lightningstrike=true,overcharge=true,
overchargedeffects=true,pulsefire=true,pulsewaveswave=true,redemption=true,
starfallstar=true,starbarrage=true,taunt=true,tsunami=true,voidspherespawn=true,
vortex=true,whirlwind=true,chainedenergyblasts=true,orbofdestruction=true,
orbofdestructionholder=true,explosivepunchcone=true,explosivepunchring=true,
arrowrain=true,arrowrainarrow=true,phantomflames=true,infernalblastcylinder=true
,chainlightning=true,mightyleapslamcircle=true,arrowbarrage=true,moltenball=true
,smallmoltenball=true,electricgrinder=true,demoniccurse=true,twinslash=true,
aquaticsmitecast=true,aquaticsmitehit=true,icecrash=true,fungalpoison=true,
fungalpoisonparticles=true,agonyorbsmainorb=true,agonyorbssmall=true,
agonyorbsstarexplosion=true,lightningburst=true,piercingroots=true,
crystalinecannonblast=true,crystalinecannonspiral=true,concussiveblasttrail=true
,concussiveblastexplosion=true,concussiveblastring=true,windblast=true,
revitalize=true,flamestrike=true,frostcone=true,souldrain=true,
souldrainparticles=true,geyser=true,flameshuriken=true,galebarrage=true,
solarbeam=true,godspearmodel=true,godspearexplosioncylinder=true,
godspeardebrisring=true,godspeardebris=true,bladebarragesword=true,
bladefallsword=true,amethystbeamorb=true,amethystbeamgroundparticles=true,
amethystbeambeam=true,amethystblast=true,jaderoller=true,jaderaincircle=true,
jaderaincrystal=true,carrotbarrage=true,carrotbarragecarrot=true,eggbomb=true,
phaseball=true,bigphaseball=true,phasering=true,phasebeammodel=true,moltenshard=
true,lavabeam=true,lavabarrageslash=true,lavabarrageball=true,spearstrike=true,
spearstriring=true,spearstrikerng=true},function(aa)if typeof(aa)~='string'then
return''end return aa:lower():gsub('%s+',''):gsub('%d+',''):gsub('%(clone%)','')
:gsub('_',''):gsub('%-','')end local ai=function(ai)local aj=ah(ai)if#aj>0 then
af[aj]=true end end local aj=function(aj)if not aj then return end for ak,al in
ipairs(aj:GetChildren())do ai(al.Name)for am,an in ipairs(al:GetDescendants())do
ai(an.Name)end end end local ak=function()local ak={'abilities','projectiles'}
for al,am in ipairs(ak)do local an=ac:FindFirstChild(am)if an then aj(an)an.
ChildAdded:Connect(function(ao)ai(ao.Name)ao.DescendantAdded:Connect(function(ap
)ai(ap.Name)end)end)end end end ak()task.spawn(function()local al={'abilities',
'projectiles'}for am,an in ipairs(al)do local ao=ac:FindFirstChild(an)if not ao
then ao=ac:WaitForChild(an,10)if ao then aj(ao)ao.ChildAdded:Connect(function(ap
)ai(ap.Name)ap.DescendantAdded:Connect(function(aq)ai(aq.Name)end)end)end end
end end)local al={'largeicespikes','mediumicespikes','smallicespikes',
'icespikes'}function ae.IsIceSpikes(am)if not am then return false end local an=
typeof(am)=='Instance'and am.Name or tostring(am)local ao=an:lower():gsub('%s+',
'')if#ao==0 then return false end for ap,aq in ipairs(al)do if string.find(ao,aq
,1,true)then return true end end return false end function ae.
IsFirstBossBigSpike(am)if not am then return false end local an=typeof(am)==
'Instance'and am.Name or tostring(am)local ao=an:lower():gsub('%s+','')if#ao==0
or string.find(ao,'seekingspike',1,true)then return false end return string.
find(ao,'firstbossbigspike',1,true)~=nil or string.find(ao,'bigspike',1,true)~=
nil end function ae.IsPlayerCharacter(am)if not am then return true end if aa:
GetPlayerFromCharacter(am)then return true end if aa:FindFirstChild(am.Name)then
return true end for an,ao in ipairs(aa:GetPlayers())do if ao.Character and(am==
ao.Character or am:IsDescendantOf(ao.Character))then return true end end local
an=ad.player or aa.LocalPlayer local ao=an and an.Character if ao and(am==ao or
am:IsDescendantOf(ao))then return true end return false end function ae.
IsEnemyModel(am)if not am then return false end if am:IsA'Model'and am:
FindFirstChildOfClass'Humanoid'then return true end if am.Parent and am.Parent:
IsA'Model'and am.Parent:FindFirstChildOfClass'Humanoid'then return true end
return false end function ae.IsPlayerAbility(am)if not am then return false end
if ae.IsMultiRing(am)or ae.IsIceSpikes(am)or ae.IsSweepingFlames(am)or ae.
IsMemoryModel(am)or ae.IsFirstBossBigSpike(am)or ae.IsBouncingOrb(am)then return
false end if am:FindFirstChild'creator'or am:FindFirstChild'owner'or am:
FindFirstChild'player'then return true end if am:GetAttribute'Owner'or am:
GetAttribute'Creator'or am:GetAttribute'Player'then return true end local an=am
while an and an~=ab and an~=game do local ao=an.Name if typeof(ao)=='string'then
local ap=ah(ao)if#ap>0 then if af[ap]or ag[ap]then return true end for aq,ar in
pairs(ag)do if#aq>=6 and string.find(ap,aq,1,true)then return true end end end
local aq=ac:FindFirstChild'projectiles'if aq and aq:FindFirstChild(ao)then ai(ao
)return true end local ar=ac:FindFirstChild'abilities'if ar and ar:
FindFirstChild(ao)then ai(ao)return true end end an=an.Parent end return false
end function ae.IsValidLevel1WorkspaceChild(am)if not am or not am.Parent then
return false end if am.Parent~=ab then return false end if am:IsA'Folder'or am:
IsA'Terrain'or am:IsA'Camera'then return false end if not(am:IsA'BasePart'or am:
IsA'Model')then return false end if ae.IsPlayerCharacter(am)then return false
end if ae.IsEnemyModel(am)then return false end if ae.IsPlayerAbility(am)then
return false end return true end function ae.IsMultiRing(am)if not am then
return false end local an=typeof(am)=='Instance'and am.Name or tostring(am)local
ao=an:lower():gsub('%s+','')return string.find(ao,'thirdbossmultirings',1,true)
~=nil or string.find(ao,'multiring',1,true)~=nil end function ae.
IsSweepingFlames(am)if not am then return false end local an=typeof(am)==
'Instance'and am.Name or tostring(am)local ao=an:lower():gsub('%s+','')return
string.find(ao,'bonusbosssweepingflames',1,true)~=nil or string.find(ao,
'sweepingflames',1,true)~=nil end function ae.IsMemoryModel(am)if not am then
return false end local an=typeof(am)=='Instance'and am.Name or tostring(am)local
ao=an:lower():gsub('%s+','')return string.find(ao,'bonusbossmemorymodel',1,true)
~=nil or string.find(ao,'memorymodel',1,true)~=nil end function ae.IsBouncingOrb
(am)if not am then return false end local an=typeof(am)=='Instance'and am.Name
or tostring(am)local ao=an:lower():gsub('%s+','')return string.find(ao,
'bouncingorb',1,true)~=nil end function ae.IsHazardPart(am,an)if not am or not
am:IsA'BasePart'or not am.Parent then return false end if am.Name=='PrimaryPart'
then return false end if ae.IsPlayerCharacter(am)or(an and ae.IsPlayerCharacter(
an))then return false end if ae.IsPlayerAbility(am)or(an and ae.IsPlayerAbility(
an))then return false end if ae.IsMultiRing(am)or(am.Parent and ae.IsMultiRing(
am.Parent))or(an and ae.IsMultiRing(an))then local ao=am.Name:lower()if ao==
'center'or ao:find'multiring'then return true end return false end local ao=ae.
IsIceSpikes(am)or(am.Parent and ae.IsIceSpikes(am.Parent))or(an and ae.
IsIceSpikes(an))if ao then local ap=am.Name:lower()if ap=='precast'or ap:find
'precast'then return true end return false end local ap=ae.IsSweepingFlames(am)
or(am.Parent and ae.IsSweepingFlames(am.Parent))or(am.Parent and am.Parent.
Parent and ae.IsSweepingFlames(am.Parent.Parent))or(an and ae.IsSweepingFlames(
an))if ap then local aq=am.Name:lower()if aq=='precast'then if am.Transparency<=
0.85 then return true end local ar=am:FindFirstChildWhichIsA'ParticleEmitter'if
ar and ar.Enabled then return true end return false end return false end local
aq=ae.IsMemoryModel(am)or(am.Parent and ae.IsMemoryModel(am.Parent))or(an and ae
.IsMemoryModel(an))if aq then local ar=am.Name:lower()if ar=='primarypart'then
return false end if ar:find'precast'or ar:find'hitbox'then if am.Transparency<=
0.85 then return true end local as=am:FindFirstChildWhichIsA'ParticleEmitter'if
as and as.Enabled then return true end return false end return false end local
ar=ae.IsFirstBossBigSpike(am)or(am.Parent and ae.IsFirstBossBigSpike(am.Parent))
or(an and ae.IsFirstBossBigSpike(an))if ar then local as=am.Name:lower()if as==
'primarypart'then return false end return true end local as=ae.IsBouncingOrb(am)
or(am.Parent and ae.IsBouncingOrb(am.Parent))or(an and ae.IsBouncingOrb(an))if
as then local at=am.Name:lower()if at=='primarypart'then return false end if am.
Transparency<=0.85 then return true end return false end if am.Transparency>0.85
then return false end if am.Material==Enum.Material.Neon then return true end
return false end ae.IsNeonHazardPart=ae.IsHazardPart function ae.
FindHazardPartsInLevel1Child(am)local an={}if not ae.
IsValidLevel1WorkspaceChild(am)then return an end if ae.IsPlayerAbility(am)or ae
.IsPlayerCharacter(am)then return an end if am:IsA'BasePart'then if ae.
IsHazardPart(am,am)then table.insert(an,am)end elseif am:IsA'Model'then if ae.
IsMultiRing(am)then local ao=am:FindFirstChild('center',true)or am:
FindFirstChildWhichIsA'BasePart'if ao and ao.Name~='PrimaryPart'then table.
insert(an,ao)return an end end if ae.IsFirstBossBigSpike(am)then local ao=am.
PrimaryPart or am:FindFirstChildWhichIsA'BasePart'if ao and ae.IsHazardPart(ao,
am)then table.insert(an,ao)return an end end if ae.IsIceSpikes(am)then local ao=
am:FindFirstChild('precast',true)if ao and ao:IsA'BasePart'then table.insert(an,
ao)return an end for ap,aq in ipairs(am:GetDescendants())do if aq:IsA'BasePart'
and aq.Name:lower():find'precast'then table.insert(an,aq)return an end end
return an end for ao,ap in ipairs(am:GetDescendants())do if ap:IsA'BasePart'and
ae.IsHazardPart(ap,am)then table.insert(an,ap)end end end return an end ae.
FindNeonPartsInLevel1Child=ae.FindHazardPartsInLevel1Child return ae end
function a.z()local aa,ab,ac,ad,ae,af=a.load'y',a.load'e',game:GetService
'Players',{},true,{}local ag,ah,ai=function()local ag=(ab and ab.player)or ac.
LocalPlayer local ah=ag and ag.Character local ai=ah and(ah:FindFirstChild
'HumanoidRootPart'or ah.PrimaryPart)return ai and ai.Position or nil end,{
firstbossbigspike={name='Boss 1 Big Spike',length=120,width=28,mode=
'look_vector'},firstbossseekingspikes={name='Boss 1 Seeking Spikes',length=85,
width=10,mode='look_vector'},firstbosscrisscross={name='Boss 1 Criss Cross',
length=80,width=8,mode='look_vector'},secondbossmovingbeam={name=
'Boss 2 Moving Beam',length=80,width=35,mode='heading_or_look'},
secondbossgreenorb={name='Boss 2 Green Orb',length=25,width=10,mode=
'homing_player'},secondbossyelloworb={name='Boss 2 Yellow Orb',length=25,width=
10,mode='homing_player'},secondbossredorb={name='Boss 2 Red Orb',length=25,width
=10,mode='homing_player'},thirdbossmissile={name='Boss 3 Missile',length=90,
width=8,mode='heading_or_look'},thirdbossbouncingorb={name='Boss 3 Bouncing Orb'
,length=30,width=10,mode='bouncing'},bonusbossbouncingorbbad={name=
'Bonus Boss Bouncing Orb Bad',length=30,width=10,mode='bouncing'},
bonusbossbouncingorb={name='Bonus Boss Bouncing Orb',length=30,width=10,mode=
'bouncing'}},function(ag)if not ag then return''end return tostring(ag):lower():
gsub('%s+','')end function ad.GetConfig(aj)if not aj then return nil end local
ak=typeof(aj)=='Instance'and aj.Name or tostring(aj)local al=ai(ak)if#al>0 then
for am,an in pairs(ah)do if string.find(al,am,1,true)then return an,am end end
end if typeof(aj)=='Instance'then local am=aj.Parent while am and am~=workspace
and am~=game do local an=ai(am.Name)if#an>0 then for ao,ap in pairs(ah)do if
string.find(an,ao,1,true)then return ap,ao end end end am=am.Parent end end
return nil end function ad.IsCorridorSkill(aj)return ad.GetConfig(aj)~=nil end
function ad.RegisterSkill(aj,ak)if not aj or type(ak)~='table'then return end
local al=ai(aj)ah[al]={name=ak.name or aj,length=ak.length or 60,width=ak.width
or 10,mode=ak.mode or'look_vector'}end function ad.UnregisterSkill(aj)if not aj
then return end local ak=ai(aj)ah[ak]=nil end function ad.GetConfigMap()return
ah end function ad.SetEnabled(aj)ae=aj and true or false end function ad.
IsEnabled()return ae end function ad.RemoveRecord(aj)if aj then af[aj]=nil end
end function ad.ClearAll()table.clear(af)end local aj,ak,al=function(aj)if not
aj then return nil end local ak=aj:IsA'Model'and aj or aj.Parent while ak and ak
~=workspace and ak~=game do local al=ai(ak.Name)if(al:find('movingbeam',1,true)
or al:find('secondbossmovingbeam',1,true))and ak:IsA'Model'then return ak end ak
=ak.Parent end return nil end,function(aj)if not aj then return nil end if aj.
PrimaryPart and aa.IsHazardPart(aj.PrimaryPart,aj)then return aj.PrimaryPart end
for ak,al in ipairs(aj:GetDescendants())do if al:IsA'BasePart'and aa.
IsHazardPart(al,aj)then return al end end return aj.PrimaryPart or aj:
FindFirstChildWhichIsA'BasePart'end,function(aj,ak,al)local am,an=(ak and ak.
width)or 10,0 if aj then if aj.radius and aj.radius>0 then an=aj.radius*2 elseif
aj.halfWidth and aj.halfWidth>0 then an=aj.halfWidth*2 elseif aj.halfX and aj.
halfX>0 then an=aj.halfX*2 elseif aj.maxRadius and aj.maxRadius>0 then an=aj.
maxRadius*2 elseif aj.coreRadius and aj.coreRadius>0 then an=aj.coreRadius*2 end
end if al then local ao=math.max(al.X,al.Z)if ao>an then an=ao end end return
math.clamp(math.max(am,an),am,120)end local am=function(am,an,ao,ap,aq)local ar,
as,at=pcall(function()return am:GetBoundingBox()end)if not ar or not as or not
at then as=an.CFrame at=an.Size end local au,av,ax,ay,az,aA=as.Position.X,as.
Position.Z,(af[am])if ax and ax.locked then ay=ax.fwd2D az=ax.right2D aA=ax.yaw
if not ax.velocityConfirmed and ap and ap.speed and ap.speed>=1 and ap.
headingDir and ap.headingDir.Magnitude>0.1 then ay=Vector3.new(ap.headingDir.X,0
,ap.headingDir.Z).Unit az=Vector3.new(-ay.Z,0,ay.X)aA=math.deg(math.atan2(ay.X,-
ay.Z))ax.fwd2D=ay ax.right2D=az ax.yaw=aA ax.velocityConfirmed=true end else if
ap and ap.speed and ap.speed>=1 and ap.headingDir and ap.headingDir.Magnitude>
0.1 then ay=Vector3.new(ap.headingDir.X,0,ap.headingDir.Z).Unit az=Vector3.new(-
ay.Z,0,ay.X)aA=math.deg(math.atan2(ay.X,-ay.Z))ax={fwd2D=ay,right2D=az,yaw=aA,
velocityConfirmed=true,locked=true}elseif ao and ao.fwd2D and ao.right2D and ao.
fwd2D.Magnitude>0.1 then ay=ao.fwd2D.Unit az=ao.right2D.Unit aA=ao.yaw or math.
deg(math.atan2(ay.X,-ay.Z))ax={fwd2D=ay,right2D=az,yaw=aA,velocityConfirmed=
false,locked=true}else local aB=as.LookVector local aC=Vector3.new(aB.X,0,aB.Z)
if aC.Magnitude>0.01 then ay=aC.Unit else ay=Vector3.new(0,0,-1)end az=Vector3.
new(-ay.Z,0,ay.X)aA=math.deg(math.atan2(ay.X,-ay.Z))ax={fwd2D=ay,right2D=az,yaw=
aA,velocityConfirmed=false,locked=true}end af[am]=ax end local aB,aC=al(ao,aq,at
),aq.length or 80 local aF=aC/2 local aG,aH,aI,aJ=au+ay.X*aF,av+ay.Z*aF,au+ay.X*
aC,av+ay.Z*aC return{skillKey=ai(am.Name),name=aq.name or'Boss 2 Moving Beam',
length=aC,width=aB,fwd2D=ay,right2D=az,startX=au,startZ=av,centerX=aG,centerZ=aH
,endX=aI,endZ=aJ,yaw=aA,isModelCorridor=true,model=am}end function ad.
ComputeCorridor(an,ao,ap)if not ae or not an or not an:IsA'BasePart'or not ao
then return nil end local aq=ad.GetConfig(an)if not aq then return nil end local
ar=aj(an)if ar then local as=ak(ar)if an~=as then return nil end return am(ar,as
,ao,ap,aq)end if aq.mode=='homing_player'then local as=ag()if as then local at=
Vector3.new(as.X-ao.x,0,as.Z-ao.z)if at.Magnitude>0.5 then fwd2D=at.Unit end end
if not fwd2D then if ap and ap.headingDir and ap.headingDir.Magnitude>0.1 then
fwd2D=Vector3.new(ap.headingDir.X,0,ap.headingDir.Z).Unit else local at=an.
CFrame.LookVector local au=Vector3.new(at.X,0,at.Z)fwd2D=au.Magnitude>0.01 and
au.Unit or Vector3.new(0,0,-1)end end right2D=Vector3.new(-fwd2D.Z,0,fwd2D.X)yaw
=math.deg(math.atan2(fwd2D.X,-fwd2D.Z))af[an]={fwd2D=fwd2D,right2D=right2D,yaw=
yaw,velocityConfirmed=true,locked=false}local at,au,av,ax=aq.length or 25,al(ao,
aq),ao.x,ao.z local ay=at/2 local az,aA,aB,aC=av+fwd2D.X*ay,ax+fwd2D.Z*ay,av+
fwd2D.X*at,ax+fwd2D.Z*at return{skillKey=ai(an.Name),name=aq.name,length=at,
width=au,fwd2D=fwd2D,right2D=right2D,startX=av,startZ=ax,centerX=az,centerZ=aA,
endX=aB,endZ=aC,yaw=yaw}end local as,at,au,av=(af[an])if as and as.locked then
at=as.fwd2D au=as.right2D av=as.yaw if ap and ap.speed and ap.speed>=1 and ap.
headingDir and ap.headingDir.Magnitude>0.1 then if at:Dot(ap.headingDir)<-0.3
then at=Vector3.new(ap.headingDir.X,0,ap.headingDir.Z).Unit au=Vector3.new(-at.Z
,0,at.X)av=math.deg(math.atan2(at.X,-at.Z))as.fwd2D=at as.right2D=au as.yaw=av
as.velocityConfirmed=true elseif not as.velocityConfirmed then at=Vector3.new(ap
.headingDir.X,0,ap.headingDir.Z).Unit au=Vector3.new(-at.Z,0,at.X)av=math.deg(
math.atan2(at.X,-at.Z))as.fwd2D=at as.right2D=au as.yaw=av as.velocityConfirmed=
true end end if aq.mode=='bouncing'and ap and ap.speed and ap.speed>=1 and ap.
headingDir and ap.headingDir.Magnitude>0.1 then local ax,ay,az=Vector3.new(ap.
headingDir.X,0,ap.headingDir.Z).Unit,os.clock(),as.lastBounceTime or 0 if at:
Dot(ax)<0.7 and(ay-az)>0.2 then at=ax au=Vector3.new(-at.Z,0,at.X)av=math.deg(
math.atan2(at.X,-at.Z))as.fwd2D=at as.right2D=au as.yaw=av as.lastBounceTime=ay
as.velocityConfirmed=true end end else if ap and ap.speed and ap.speed>=1 and ap
.headingDir and ap.headingDir.Magnitude>0.1 then at=Vector3.new(ap.headingDir.X,
0,ap.headingDir.Z).Unit as={fwd2D=at,right2D=Vector3.new(-at.Z,0,at.X),yaw=math.
deg(math.atan2(at.X,-at.Z)),velocityConfirmed=true,locked=true}elseif ao.fwd2D
and ao.right2D and ao.fwd2D.Magnitude>0.1 then at=ao.fwd2D.Unit au=ao.right2D.
Unit as={fwd2D=at,right2D=au,yaw=ao.yaw or math.deg(math.atan2(at.X,-at.Z)),
velocityConfirmed=false,locked=true}else local ax=an.CFrame local ay=ax.
LookVector local az=Vector3.new(ay.X,0,ay.Z)if az.Magnitude>0.01 then at=az.Unit
elseif ap and ap.headingDir and ap.headingDir.Magnitude>0.1 then at=Vector3.new(
ap.headingDir.X,0,ap.headingDir.Z).Unit else at=Vector3.new(0,0,-1)end as={fwd2D
=at,right2D=Vector3.new(-at.Z,0,at.X),yaw=math.deg(math.atan2(at.X,-at.Z)),
velocityConfirmed=false,locked=true}end au=as.right2D av=as.yaw af[an]=as end
local ax,ay,az,aA=aq.length or 60,al(ao,aq),ao.x,ao.z local aB=ax/2 local aC,aF,
aG,aH=az+at.X*aB,aA+at.Z*aB,az+at.X*ax,aA+at.Z*ax return{skillKey=ai(an.Name),
name=aq.name,length=ax,width=ay,fwd2D=at,right2D=au,startX=az,startZ=aA,centerX=
aC,centerZ=aF,endX=aG,endZ=aH,yaw=av}end local an={firstbossbigspike=28,
firstbossseekingspikes=32,firstbosscrisscross=30,secondbossmovingbeam=18,
secondbossgreenorb=22,secondbossyelloworb=22,secondbossredorb=22,
thirdbossmissile=35,thirdbossbouncingorb=25,bonusbossbouncingorb=25,
bonusbossbouncingorbbad=25}function ad.GetProjectileSpeed(ao,ap)if ap and ap.
speed and ap.speed>=3 then return ap.speed end if ao and ao.skillKey then for aq
,ar in pairs(an)do if string.find(ao.skillKey,aq,1,true)then return ar end end
end return 28 end function ad.GetThreatMetrics(ao,ap,aq,ar)if not ao or not ap
then return false,0,0,999,false,Vector3.zero,0 end ar=ar or 0 local as,at=ao.X,
ao.Z local au,av,ax,ay,az=as-ap.startX,at-ap.startZ,ap.fwd2D,ap.right2D,(ap.
width/2)+ar local aA,aB,aC,aF=au*ax.X+av*ax.Z,au*ay.X+av*ay.Z,-2.5,ap.length+ar
local aG=(aA>=aC and aA<=aF and math.abs(aB)<=az)if not aG and ar>0 then local
aH=0 if aA<aC then aH=aC-aA elseif aA>aF then aH=aA-aF end local aI=math.max(0,
math.abs(aB)-(ap.width/2))if(aH*aH+aI*aI)<=(ar*ar)then aG=true end end local aH,
aI=ad.GetProjectileSpeed(ap,aq),math.max(0,aA)local aJ,aK=(aH>0.1)and(aI/aH)or
999,math.max(0,(ap.width/2)-math.abs(aB))local aL,aM=(aK+2.5)if aB>=0 then aM=ay
else aM=-ay end local aN=aL/18 local aO=math.clamp(aN+0.35,0.85,1.4)local aP=
math.max(22,aH*aO)local aQ=aG and(aA>=aC)and(aJ<=aO or aA<=aP)return aG,aA,aB,aJ
,aQ,aM,aL end function ad.IsThreatImminent(ao,ap,aq,ar)local as,at,au,av,ax=ad.
GetThreatMetrics(ao,ap,aq,ar)return ax end function ad.IsPointInThreatPath(ao,ap
,aq)if not ao or not ap then return false end aq=aq or 0 local ar,av=ao.X,ao.Z
local ax,ay,az,aA,aB=ar-ap.startX,av-ap.startZ,ap.fwd2D,ap.right2D,(ap.width/2)+
aq local aC,aF,aG,aH=ax*az.X+ay*az.Z,ax*aA.X+ay*aA.Z,-2.5,ap.length+aq if aq<=0
then return(aC>=aG and aC<=aH and math.abs(aF)<=aB)else local aI=0 if aC<aG then
aI=aG-aC elseif aC>aH then aI=aC-aH end local aJ=math.max(0,math.abs(aF)-(ap.
width/2))return(aI*aI+aJ*aJ)<=(aq*aq)end end function ad.IsPointInCorridor(ao,ap
,aq)if not ao or not ap then return false end aq=aq or 0 local ar,av=ao.X,ao.Z
local ax,ay,az,aA,aB=ar-ap.startX,av-ap.startZ,ap.fwd2D,ap.right2D,ap.width/2
local aC,aF,aG,aH=ax*az.X+ay*az.Z,ax*aA.X+ay*aA.Z,-2.5,ap.length if aq<=0 then
return(aC>=aG and aC<=aH and math.abs(aF)<=aB)else local aI=0 if aC<aG then aI=
aG-aC elseif aC>aH then aI=aC-aH end local aJ=math.max(0,math.abs(aF)-aB)return(
aI*aI+aJ*aJ)<=(aq*aq)end end return ad end function a.A()local aa,ab,ac,ad,ae,af
,ag,ah=a.load'y',a.load'z',{},function(aa)if not aa then return'#ff2a55'end
local ab,ac,ad=math.clamp(math.floor(aa.R*255),0,255),math.clamp(math.floor(aa.G
*255),0,255),math.clamp(math.floor(aa.B*255),0,255)return string.format(
'#%02x%02x%02x',ab,ac,ad)end,function(aa)if not aa then return 0 end local ab=aa
.LookVector if not ab or ab.Magnitude<0.001 then return 0 end return math.deg(
math.atan2(ab.X,-ab.Z))end,{coreRadius=12.5,maxRadius=105,rings={{rIn=12.5,rOut=
25,yawOffset=180,side=1},{rIn=25,rOut=37.5,yawOffset=0,side=0},{rIn=37.5,rOut=50
,yawOffset=180,side=1},{rIn=50,rOut=62.5,yawOffset=0,side=0},{rIn=62.5,rOut=75,
yawOffset=180,side=1},{rIn=75,rOut=87.5,yawOffset=0,side=0},{rIn=87.5,rOut=105,
yawOffset=180,side=1}}},function(aa,ab,ac,ad,ae,af,ag)ag=ag or 12 local ah,ai={}
,(af or 180)/2 local aj,ak=ae-ai,ae+ai local al,am=math.rad(aj),math.rad(ak)
local an=am-al for ao=0,ag do local ap=al+(an*(ao/ag))local aq,ar=aa+math.sin(ap
)*ad,ab-math.cos(ap)*ad table.insert(ah,{x=aq,z=ar})end for ao=ag,0,-1 do local
ap=al+(an*(ao/ag))local aq,ar=aa+math.sin(ap)*ac,ab-math.cos(ap)*ac table.
insert(ah,{x=aq,z=ar})end return ah end,function(aa,ab,ac,ad)ad=ad or 16 local
ae={}for af=0,ad-1 do local ag=(math.pi*2)*(af/ad)local ah,ai=aa+math.sin(ag)*ac
,ab-math.cos(ag)*ac table.insert(ae,{x=ah,z=ai})end return ae end local ai=
function(ai,aj)if not ai or not ai:IsA'BasePart'or not ai.Parent then return nil
end local ak,al=ai.Size,ai.CFrame local am,an,ao=al.Position,ae(al),ad(ai.Color)
if aa.IsSweepingFlames(ai)or(ai.Parent and aa.IsSweepingFlames(ai.Parent))or(ai.
Parent and ai.Parent.Parent and aa.IsSweepingFlames(ai.Parent.Parent))then ao=
'#ff6b22'end if aa.IsMemoryModel(ai)or(ai.Parent and aa.IsMemoryModel(ai.Parent)
)then local ap=ai.Name:lower()if ap:find'good'then ao='#22ff88'else ao='#ff2a55'
end end local ap=ai:FindFirstChildWhichIsA('SpecialMesh',true)if ap then local
aq,ar,av=math.abs(ap.Scale.X),math.abs(ap.Scale.Y),math.abs(ap.Scale.Z)ak=
Vector3.new(ak.X*aq,ak.Y*ar,ak.Z*av)end local aq,ar=ai.Name:lower(),(ai.Parent
and ai.Parent.Name:lower())or''local av=aa.IsMultiRing(ai)or aa.IsMultiRing(ai.
Parent)or(aq=='center'and string.find(ar,'ring')~=nil)if av then local ax,ay,az=
am,ai,(ai.Parent and ai.Parent:IsA'Model')and ai.Parent or nil if az then local
aA=az:FindFirstChild('center',true)if aA and aA:IsA'BasePart'then ax=aA.Position
ay=aA end end local aA=an if ay and ay.CFrame then aA=(ae(ay.CFrame)+180)%360
end local aB,aC={},{}table.insert(aC,ah(ax.X,ax.Z,af.coreRadius,16))for aF,aG in
ipairs(af.rings)do local aH=(aA+aG.yawOffset)%360 local aI=ag(ax.X,ax.Z,aG.rIn,
aG.rOut,aH,180,12)table.insert(aB,{rIn=aG.rIn,rOut=aG.rOut,yaw=aH,yawOffset=aG.
yawOffset,span=180,side=aG.side,polygon=aI})table.insert(aC,aI)end return{shape=
'compound_multiring',x=ax.X,y=ax.Y,z=ax.Z,yaw=aA,color='#3cd0d0',transparency=ai
.Transparency or 0.5,coreRadius=af.coreRadius,maxRadius=af.maxRadius,rings=aB,
polygons=aC,part=ai}end local ax=aa.IsIceSpikes(ai)or(ai.Parent and aa.
IsIceSpikes(ai.Parent))if ax then local ay={ak.X,ak.Y,ak.Z}table.sort(ay)local
az=math.max(ay[2],ay[3])/2 if az<2 then az=4 end return{shape='circle',x=am.X,y=
am.Y,z=am.Z,radius=az,color=ao,transparency=ai.Transparency,part=ai}end local ay
=aa.IsFirstBossBigSpike(ai)or(ai.Parent and aa.IsFirstBossBigSpike(ai.Parent))if
ay then local az={ak.X,ak.Y,ak.Z}table.sort(az)local aA=math.max(az[2],az[3])
local aB=math.clamp(aA/2,10,35)if aB<12 then aB=14 end return{shape='circle',x=
am.X,y=am.Y,z=am.Z,radius=aB,color=ao,transparency=ai.Transparency,part=ai}end
local az=aa.IsBouncingOrb(ai)or(ai.Parent and aa.IsBouncingOrb(ai.Parent))if az
then local aA={ak.X,ak.Y,ak.Z}table.sort(aA)local aB=math.max(aA[2],aA[3])/2 if
aB<2 then aB=4 end return{shape='circle',x=am.X,y=am.Y,z=am.Z,radius=aB,color=ao
,transparency=ai.Transparency,part=ai}end if ai:IsA'Part'and ai.Shape==Enum.
PartType.Ball then local aA=math.max(ak.X,ak.Y,ak.Z)/2 return{shape='circle',x=
am.X,y=am.Y,z=am.Z,radius=aA,color=ao,transparency=ai.Transparency,part=ai}end
if ai:IsA'Part'and ai.Shape==Enum.PartType.Cylinder then if math.abs(al.
RightVector.Y)>0.75 then local aA=math.max(ak.Y,ak.Z)/2 return{shape='circle',x=
am.X,y=am.Y,z=am.Z,radius=aA,color=ao,transparency=ai.Transparency,part=ai}end
end local aA,aB=math.max(ak.X,ak.Z),math.min(ak.X,ak.Z)if aB>0 and(aA/aB)<=1.15
and not ai:IsA'WedgePart'and ak.Y<=math.min(ak.X,ak.Z)then return{shape='circle'
,x=am.X,y=am.Y,z=am.Z,radius=aA/2,color=ao,transparency=ai.Transparency,part=ai}
end local aC,aF,aG,aH,aI,aJ,aK=(ai:IsA'Part'and ai.Shape==Enum.PartType.Cylinder
),(aq:find'movingbeam'~=nil)or(ar:find'movingbeam'~=nil),(aq:find'missile'~=nil)
or(ar:find'missile'~=nil)if aF then aJ=math.max(ak.X,ak.Z)/2 aK=math.max(2,math.
min(ak.X,math.max(ak.Y,ak.Z))/2)local aL=Vector3.new(al.RightVector.X,0,al.
RightVector.Z)if aL.Magnitude>0.01 then aI=aL.Unit else aI=Vector3.new(1,0,0)end
aH=Vector3.new(-aI.Z,0,aI.X)if aj and aj.headingDir and aj.headingDir.Magnitude>
0.1 then if aH:Dot(aj.headingDir)<0 then aH=-aH aI=-aI end end elseif aG then
local aL,aM=math.max(ak.X,math.max(ak.Y,ak.Z)),math.min(ak.X,math.min(ak.Y,ak.Z)
)aK=math.max(0.5,aL/2)aJ=math.max(1.5,aM/2)if aj and aj.speed and aj.speed>=1
and aj.headingDir and aj.headingDir.Magnitude>0.1 then aH=Vector3.new(aj.
headingDir.X,0,aj.headingDir.Z).Unit aI=Vector3.new(-aH.Z,0,aH.X)else local aN=
al.LookVector local aO=Vector3.new(aN.X,0,aN.Z)if aO.Magnitude>0.01 then aH=aO.
Unit else aH=Vector3.new(0,0,-1)end aI=Vector3.new(-aH.Z,0,aH.X)end if aj and aj
.headingDir and aj.headingDir.Magnitude>0.1 and aj.speed and aj.speed>=1 then if
aH:Dot(aj.headingDir)<0 then aH=-aH aI=-aI end end elseif aC then local aL=al.
RightVector local aM=Vector3.new(aL.X,0,aL.Z)if aM.Magnitude>0.01 then aH=aM.
Unit else aH=Vector3.new(0,0,-1)end aI=Vector3.new(-aH.Z,0,aH.X)aK=math.max(0.5,
ak.X/2)aJ=math.max(0.5,math.max(ak.Y,ak.Z)/2)else local aL,aM=math.max(0.5,ak.X/
2),math.max(0.5,ak.Z/2)aJ=aL aK=aM local aN=al.LookVector local aO=Vector3.new(
aN.X,0,aN.Z)if aO.Magnitude>0.01 then aH=aO.Unit else aH=Vector3.new(0,0,-1)end
aI=Vector3.new(-aH.Z,0,aH.X)end local aL,aM,aN=math.deg(math.atan2(aH.X,-aH.Z)),
am.X,am.Z local aO,aP,aQ,aS=Vector3.new(aM,am.Y,aN)+aI*aJ+aH*aK,Vector3.new(aM,
am.Y,aN)-aI*aJ+aH*aK,Vector3.new(aM,am.Y,aN)-aI*aJ-aH*aK,Vector3.new(aM,am.Y,aN)
+aI*aJ-aH*aK local aT={{x=aO.X,z=aO.Z},{x=aP.X,z=aP.Z},{x=aQ.X,z=aQ.Z},{x=aS.X,z
=aS.Z}}return{shape='box',x=am.X,y=am.Y,z=am.Z,halfX=aJ,halfZ=aK,halfWidth=aJ,
halfLength=aK,fwd2D=aH,right2D=aI,yaw=aL,vertices=aT,color=ao,transparency=ai.
Transparency,part=ai}end function ac.AnalyzeHazardPart(aj,ak)local al=ai(aj,ak)
if al and ab.IsCorridorSkill(aj)then al.corridor=ab.ComputeCorridor(aj,al,ak)end
return al end ac.AnalyzeNeonPart=ac.AnalyzeHazardPart return ac end function a.B
()local aa,ab,ac,ad,ae,af=a.load'e',game:GetService'Players',{},{},2,15 local ag
=function()local ag=aa.player or ab.LocalPlayer local ah=ag and ag.Character
local ai=ah and(ah:FindFirstChild'HumanoidRootPart'or ah.PrimaryPart)return ai
and ai.Position or nil end function ac.UpdateRecord(ah,ai,aj)if not ah or not ai
then return nil end local ak,al=os.clock(),ad[ah]if not al then al={part=ah,
lastPos=ai,lastYaw=aj or 0,lastTime=ak,velocity=Vector3.zero,speed=0,angularVel=
0,headingDir=Vector3.zero,motionType='STATIC',spawnTime=ak}ad[ah]=al return al
end local am=ak-al.lastTime if am>=0.015 then local an=ai-al.lastPos local ao=
Vector3.new(an.X,0,an.Z)local ap,aq,ar=ao.Magnitude/am,ao/am,(aj or 0)-al.
lastYaw while ar>180 do ar-=360 end while ar<-180 do ar+=360 end local av=ar/am
al.speed=al.speed*0.4+ap*0.6 al.velocity=al.velocity*0.4+aq*0.6 al.angularVel=al
.angularVel*0.4+av*0.6 if al.speed>0.1 then al.headingDir=al.velocity.Unit end
if al.speed>=ae then local ax=ag()if ax and(ax-ai).Magnitude<100 then local ay=(
ax-ai).Unit local az=al.headingDir:Dot(ay)if az>0.85 then al.motionType='HOMING'
else al.motionType='LINEAR'end else al.motionType='LINEAR'end al.angularVel=0
elseif math.abs(al.angularVel)>=af then al.motionType='SPINNING'else al.
motionType='STATIC'end al.lastPos=ai al.lastYaw=aj or 0 al.lastTime=ak end
return al end function ac.GetRecord(ah)return ad[ah]end function ac.
GetTrajectoryProjection(ah,ai)local aj=ad[ah]if not aj or aj.motionType==
'STATIC'then return nil end ai=ai or 1.5 local ak,al={},5 local am=ai/al for an=
1,al do local ao=an*am if aj.motionType=='SPINNING'then local ap=aj.lastYaw+(aj.
angularVel*ao)table.insert(ak,{time=ao,x=aj.lastPos.X,z=aj.lastPos.Z,yaw=ap})
else local ap=aj.lastPos+(aj.velocity*ao)table.insert(ak,{time=ao,x=ap.X,z=ap.Z,
yaw=aj.lastYaw})end end return{motionType=aj.motionType,speed=aj.speed,
angularVel=aj.angularVel,dirX=aj.headingDir.X,dirZ=aj.headingDir.Z,futurePoints=
ak}end function ac.RemoveRecord(ah)ad[ah]=nil end function ac.ClearAll()table.
clear(ad)end return ac end function a.C()local aa,ab,ac=a.load'f',a.load'q',{}
local ad,ae,af=function()if not aa.GetTrackedEnemyData then return nil end local
ad=aa.GetTrackedEnemyData()for ae,af in ipairs(ad)do if af and af.Model and af.
Humanoid and af.Humanoid.Health>0 then local ag=af.Model.Name:lower()local ah=
string.find(ag,'boss')~=nil or(af.Room and string.find(af.Room.Name:lower(),
'boss')~=nil)or(af.Model.Parent and string.find(af.Model.Parent.Name:lower(),
'boss')~=nil)if ah or(aa.IsBossActive and aa.IsBossActive())then return af.Model
,af.Humanoid,af.Root end end end return nil,nil,nil end,function(ad)local ae={}
if not ad then return ae end local af,ag=ad:FindFirstChildOfClass'Animator'or ad
,{}pcall(function()ag=af:GetPlayingAnimationTracks()end)for ah,ai in ipairs(ag)
do if ai and ai.IsPlaying and ai.WeightCurrent>0.1 then local aj=''if ai.
Animation then aj=ai.Animation.AnimationId or''end local ak=math.max(0.1,ai.
Length)local al=math.clamp(ai.TimePosition/ak,0,1)table.insert(ae,{name=ai.Name
or'Anim',animId=aj,speed=ai.Speed,length=ak,timePos=ai.TimePosition,progress=al,
weight=ai.WeightCurrent})end end return ae end,function(ad)if not ad or ad.
Magnitude<0.001 then return 0 end return math.deg(math.atan2(ad.X,-ad.Z))end
function ac.GetBossTelegraphData()local ag,ah,ai=ad()local aj,ak,al,am,an,ao,ap=
(aa.IsBossActive and aa.IsBossActive())or(ag~=nil),(aa.GetCurrentBossIndex and
aa.GetCurrentBossIndex())or 0,ab.GetActiveBossArea()if not ag or not ai or not
ah then return{active=false,bossIndex=ak,name='None',x=0,y=0,z=0,health=0,
maxHealth=100,healthPercent=100,yaw=0,isCasting=false,activeAnimations={},
arenaActive=al or false,arenaCenterX=(an and an.X)or 0,arenaCenterZ=(an and an.Z
)or 0,arenaRadius=am or 80,innerDeadzoneActive=ao or false,innerDeadzoneRadius=
ap or 0}end local aq=ae(ah)local ar,av=#aq>0,aq[1]or nil return{active=true,
bossIndex=ak,name=ag.Name,x=ai.Position.X,y=ai.Position.Y,z=ai.Position.Z,health
=math.max(0,ah.Health),maxHealth=math.max(1,ah.MaxHealth),healthPercent=math.
clamp((ah.Health/ah.MaxHealth)*100,0,100),yaw=af(ai.CFrame.LookVector),isCasting
=ar,activeAnimations=aq,primaryAnimation=av,arenaActive=al or false,arenaCenterX
=(an and an.X)or 0,arenaCenterZ=(an and an.Z)or 0,arenaRadius=am or 80,
innerDeadzoneActive=ao or false,innerDeadzoneRadius=ap or 0}end ac.FindBossModel
=ad return ac end function a.D()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=
game:GetService'Workspace',a.load'y',{},false,{},0,'IDLE',0,0,0.25 local an,ao=
function(an)if not an or not an:IsA'BasePart'or not an:IsDescendantOf(aa)then
return false end if an.Transparency<=0.85 then return true end local ao=an:
FindFirstChildWhichIsA'ParticleEmitter'if ao and ao.Enabled then return true end
return false end,function()for an,ao in ipairs(aa:GetChildren())do if ab.
IsMemoryModel(ao)and ao:IsA'Model'then return ao end end return nil end function
ac.Reset()ad=false table.clear(ae)af=0 ag='IDLE'ak=nil ah=0 ai=0 al=nil am=nil
end function ac.Update(ap)local aq=ao()if not aq then if ad then ac.Reset()end
return end if not ad then ad=true ai=ap table.clear(ae)af=0 ag='HINT'end local
ar,av,ax,ay,az,aA=aq:FindFirstChild'leftPrecast',aq:FindFirstChild'rightPrecast'
,aq:FindFirstChild'leftHitbox',aq:FindFirstChild'rightHitbox',aq:FindFirstChild
'leftPrecastGood',aq:FindFirstChild'rightPrecastGood'local aB,aC,aF,aG=an(ar)or
an(az),an(av)or an(aA),an(ax),an(ay)local aH=aF or aG if aH and ag~='EXECUTION'
then ag='EXECUTION'af=1 ak=nil ah=0 end if ag=='HINT'then local aI if aB and not
aC then aI='LEFT'elseif aC and not aB then aI='RIGHT'end if aI and aI~=ak and(ap
-ah>aj)then table.insert(ae,aI)ak=aI ah=ap elseif not aI and ak and(ap-ah>aj)
then ak=nil end elseif ag=='EXECUTION'then local aI if aF then aI='LEFT'elseif
aG then aI='RIGHT'end al=aI if aI=='LEFT'then am='RIGHT'elseif aI=='RIGHT'then
am='LEFT'else local aJ=math.clamp(af,1,math.max(1,#ae))am=ae[aJ]or nil end if aI
and aI~=ak and(ap-ah>aj)then ak=aI ah=ap elseif not aI and ak and(ap-ah>aj)then
af=math.min(#ae,af+1)ak=nil end end end function ac.GetMemoryTelemetry()if not
ad and#ae==0 then return nil end local ap='Waiting...'if ag=='HINT'then ap=
string.format('\u{1f9e0} Phase 1: Recorded %d steps',#ae)elseif ag=='EXECUTION'
then local aq,ar=math.clamp(af,1,math.max(1,#ae)),math.max(1,#ae)if am then
local av=(am=='LEFT')and'RIGHT'or'LEFT'ap=string.format(
'\u{1f7e2} SAFE: %s | \u{1f534} DANGER: %s (Step %d/%d)',am,av,aq,ar)else ap=
string.format('\u{26a1} Preparing Strike (Step %d/%d)',aq,ar)end end return{
active=ad,phase=ag,sequence=ae,currentStep=math.clamp(af,1,math.max(1,#ae)),
totalSteps=#ae,currentAttackSide=al,safeSide=am,hintText=ap}end return ac end
function a.E()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av=
game:GetService'Workspace',game:GetService'RunService',game:GetService'Players',
a.load'e',{},false,false,false,{},0.22,0.85,0.48,Color3.fromRGB(255,220,20),
Color3.fromRGB(34,255,136),Color3.fromRGB(255,140,0),0.6,0.2 local ax,ay,az=
function(ax)if ax and ax.color=='#22ff88'then return an end return am end,
function(ax)local ay=ad.player or ac.LocalPlayer local az=ay and ay.Character
local aA,aB=az and(az:FindFirstChild'HumanoidRootPart'or az.PrimaryPart),az and
az:FindFirstChildOfClass'Humanoid'if aA then local aC,aF=(aA.Size and aA.Size.Y>
0)and(aA.Size.Y/2)or 1,(aB and aB.HipHeight and aB.HipHeight>0)and aB.HipHeight
or 1.8 return aA.Position.Y-(aF+aC)+0.1 end return(ax and(ax.Y-1.5)or 0)+0.1 end
,function()if av and av.Parent then return av end local ax=aa.Terrain:
FindFirstChild'HazardVisualizerV2'if ax then av=ax return av end local ay=
Instance.new'Folder'ay.Name='HazardVisualizerV2'ay.Parent=aa.Terrain av=ay
return ay end function ae.Detach(aA)if not aA then return end local aB=ai[aA]if
not aB then return end if aB.adornments then for aC,aF in ipairs(aB.adornments)
do pcall(function()aF:Destroy()end)end table.clear(aB.adornments)end if aB.
corridorAdornment then pcall(function()aB.corridorAdornment:Destroy()end)aB.
corridorAdornment=nil end ai[aA]=nil end function ae.ClearAll()for aA,aB in
pairs(ai)do ae.Detach(aA)end table.clear(ai)if av then pcall(function()av:
ClearAllChildren()end)end end function ae.Update(aA,aB)if not af or not aA or
not aA.Parent or not aB then return end if aA.Transparency>ak then ae.Detach(aA)
return end local aC=aB.shape if not aC then return end local aF=Vector3.new(aC.x
,aC.y,aC.z)local aG,aH,aI,aJ=ay(aF),ax(aC),az(),ai[aA]if not aJ then aJ={part=aA
,adornments={},shapeType=aC.shape,lastFloorY=aG}ai[aA]=aJ else aJ.lastFloorY=aG
if aJ.shapeType~=aC.shape then for aK,aL in ipairs(aJ.adornments)do pcall(
function()aL:Destroy()end)end table.clear(aJ.adornments)aJ.shapeType=aC.shape
end end if ag then if aC.shape=='circle'then local aK=aJ.adornments[1]if not aK
or not aK.Parent or not aK:IsA'CylinderHandleAdornment'then if aK then pcall(
function()aK:Destroy()end)end aK=Instance.new'CylinderHandleAdornment'aK.Name=
'GroundCircle_'..aA.Name aK.Adornee=aa.Terrain aK.AlwaysOnTop=true aK.ZIndex=2
aK.Transparency=al aK.Parent=aI aJ.adornments[1]=aK end aK.Radius=aC.radius or 5
aK.Height=aj aK.Color3=aH aK.CFrame=CFrame.new(aC.x,aG,aC.z)*CFrame.Angles(math.
rad(90),0,0)elseif aC.shape=='box'then local aK=aJ.adornments[1]if not aK or not
aK.Parent or not aK:IsA'BoxHandleAdornment'then if aK then pcall(function()aK:
Destroy()end)end aK=Instance.new'BoxHandleAdornment'aK.Name='GroundBox_'..aA.
Name aK.Adornee=aa.Terrain aK.AlwaysOnTop=true aK.ZIndex=2 aK.Transparency=al aK
.Parent=aI aJ.adornments[1]=aK end local aL,aM,aN=aC.halfWidth or aC.halfX or 2,
aC.halfLength or aC.halfZ or 2,aC.fwd2D or Vector3.new(0,0,-1)if aN.Magnitude<
0.001 then aN=Vector3.new(0,0,-1)else aN=aN.Unit end local aO=aC.right2D if not
aO or aO.Magnitude<0.001 then aO=Vector3.new(-aN.Z,0,aN.X)else aO=aO.Unit end aK
.Size=Vector3.new(aL*2,aj,aM*2)aK.Color3=aH local aP,aQ=pcall(function()return
CFrame.fromMatrix(Vector3.new(aC.x,aG,aC.z),aO,Vector3.yAxis,-aN)end)if aP and
aQ then aK.CFrame=aQ else aK.CFrame=CFrame.new(aC.x,aG,aC.z)end elseif aC.shape
=='compound_multiring'then local aK=aJ.adornments[1]if not aK or not aK.Parent
or not aK:IsA'CylinderHandleAdornment'then if aK then pcall(function()aK:
Destroy()end)end aK=Instance.new'CylinderHandleAdornment'aK.Name='MultiRingCore'
aK.Adornee=aa.Terrain aK.AlwaysOnTop=true aK.ZIndex=3 aK.Transparency=0.45 aK.
Color3=Color3.fromRGB(255,235,60)aK.Parent=aI aJ.adornments[1]=aK end aK.Radius=
aC.coreRadius or 12.5 aK.Height=aj aK.CFrame=CFrame.new(aC.x,aG,aC.z)*CFrame.
Angles(math.rad(90),0,0)local aL,aM,aN=aC.rings or{},2,14 for aO,aP in ipairs(aL
)do local aQ,aS=aP.rIn or 12.5,aP.rOut or 25 local aT,aU,aV,aW=(aQ+aS)/2,aS-aQ,
aP.yaw or 0,math.pi local aX,aY=aW/aN,math.rad(aV-90)local aZ=aT*aX*1.04 for a_=
1,aN do local a0=aY+(a_-0.5)*aX local a1,a2,a3,a4,a5=aC.x+math.sin(a0)*aT,aC.z-
math.cos(a0)*aT,Vector3.new(math.cos(a0),0,math.sin(a0)),Vector3.new(math.sin(a0
),0,-math.cos(a0)),aJ.adornments[aM]if not a5 or not a5.Parent or not a5:IsA
'BoxHandleAdornment'then if a5 then pcall(function()a5:Destroy()end)end a5=
Instance.new'BoxHandleAdornment'a5.Name='RingArcSeg'a5.Adornee=aa.Terrain a5.
AlwaysOnTop=true a5.ZIndex=2 a5.Transparency=0.55 a5.Color3=am a5.Parent=aI aJ.
adornments[aM]=a5 end a5.Size=Vector3.new(aU,aj,aZ)local a6,a7=pcall(function()
return CFrame.fromMatrix(Vector3.new(a1,aG,a2),a4,Vector3.yAxis,-a3)end)if a6
and a7 then a5.CFrame=a7 else a5.CFrame=CFrame.new(a1,aG,a2)end aM+=1 end end
for aO=aM,#aJ.adornments do if aJ.adornments[aO]then pcall(function()aJ.
adornments[aO]:Destroy()end)aJ.adornments[aO]=nil end end end else if aJ and aJ.
adornments and#aJ.adornments>0 then for aK,aL in ipairs(aJ.adornments)do pcall(
function()aL:Destroy()end)end table.clear(aJ.adornments)end end if ah and aC.
corridor then local aK,aL=aC.corridor,aJ.corridorAdornment if not aL or not aL.
Parent or not aL:IsA'BoxHandleAdornment'then if aL then pcall(function()aL:
Destroy()end)end aL=Instance.new'BoxHandleAdornment'aL.Name='ThreatCorridor_'..(
aK.model and aK.model.Name or aA.Name)aL.Adornee=aa.Terrain aL.AlwaysOnTop=true
aL.ZIndex=1 aL.Transparency=ap aL.Color3=ao aL.Parent=aI aJ.corridorAdornment=aL
end aL.Size=Vector3.new(aK.width,aq,aK.length)local aM=aG if aK.isModelCorridor
then aM=ay(Vector3.new(aK.centerX,aF.Y,aK.centerZ))end local aN=Vector3.new(aK.
centerX,aM,aK.centerZ)local aO=aN+Vector3.new(aK.fwd2D.X,0,aK.fwd2D.Z)local aP,
aQ=pcall(function()return CFrame.lookAt(aN,aO)end)if aP and aQ then aL.CFrame=aQ
else aL.CFrame=CFrame.new(aN)end if not aL.Visible then aL.Visible=true end else
if aJ.corridorAdornment and aJ.corridorAdornment.Visible then aJ.
corridorAdornment.Visible=false end end end local aA=function()if not af then
return end local aA={}for aB,aC in pairs(ai)do if not aB or not aB:
IsDescendantOf(aa)or aB.Transparency>ak then table.insert(aA,aB)end end for aB,
aC in ipairs(aA)do ae.Detach(aC)end end local aB=function()local aB=ag or ah if
af==aB then return end af=aB if af then ae.ClearAll()if not ar then ar=ab.
Heartbeat:Connect(aA)end else if ar then ar:Disconnect()ar=nil end ae.ClearAll()
end end function ae.SetEnabled(aC)ag=aC and true or false aB()if not ag then for
aF,aG in pairs(ai)do if aG.adornments then for aH,aI in ipairs(aG.adornments)do
pcall(function()aI:Destroy()end)end table.clear(aG.adornments)end end end end
function ae.IsEnabled()return ag end function ae.SetCorridorEnabled(aC)ah=aC and
true or false aB()if not ah then for aF,aG in pairs(ai)do if aG.
corridorAdornment then pcall(function()aG.corridorAdornment:Destroy()end)aG.
corridorAdornment=nil end end end end function ae.IsCorridorEnabled()return ah
end return ae end function a.F()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,
ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,aF=game:GetService'RunService',game:GetService
'Workspace',game:GetService'Players',a.load'e',a.load'f',a.load'q',a.load'z',{},
false,true,'Disc',1.8,2.5,2.5,false,{},Color3.fromRGB(0,255,170),Color3.fromRGB(
255,35,35),0.45,0.2,0.2 local aG,aH,aI,aJ,aK,aL,aM,aN,aO,aP=function()local aG=(
ad and ad.player)or ac.LocalPlayer local aH=aG and aG.Character if not aH or not
aH.Parent then return nil end local aI=aH:FindFirstChildOfClass'Humanoid'if aI
and aI.Health<=0 then return nil end return aH:FindFirstChild'HumanoidRootPart'
or aH.PrimaryPart end,function(aG)if not aG then return 0 end return aG.Position
.Y-2.5 end,function(aG)if not aG then return Vector3.new(0,0,-1),Vector3.new(1,0
,0)end local aH=aG.CFrame.LookVector local aI=Vector3.new(aH.X,0,aH.Z)local aJ=(
aI.Magnitude>0.001)and aI.Unit or Vector3.new(0,0,-1)local aK=Vector3.new(-aJ.Z,
0,aJ.X)return aJ,aK end,function(aG)local aH=(ak=='Rectangle')and
'BoxHandleAdornment'or'CylinderHandleAdornment'if aF then if not aF:IsA(aH)or aF
.Parent~=aG or not aF:IsDescendantOf(ab)then pcall(function()aF:Destroy()end)aF=
nil else if aF.Adornee~=aG then aF.Adornee=aG end return aF end end if not aG or
not aG.Parent then return nil end if ak=='Rectangle'then local aI=Instance.new
'BoxHandleAdornment'aI.Name='Player_2D_HitboxVisualV2_Box'aI.Adornee=aG aI.Size=
Vector3.new(am,ay,an)aI.Color3=ao and ar or aq aI.Transparency=ao and ax or av
aI.ZIndex=5 aI.AlwaysOnTop=false aI.Visible=aj and ai aI.Parent=aG aF=aI return
aI else local aI=Instance.new'CylinderHandleAdornment'aI.Name=
'Player_2D_HitboxVisualV2_Disc'aI.Adornee=aG aI.Radius=al aI.Height=ay aI.Color3
=ao and ar or aq aI.Transparency=ao and ax or av aI.ZIndex=5 aI.AlwaysOnTop=
false aI.Visible=aj and ai aI.Parent=aG aF=aI return aI end end,function(aG)if
not aF or not aF.Parent then return end aF.Color3=aG and ar or aq aF.
Transparency=aG and ax or av end,function(aG,aH,aI,aJ,aK,aL)local aM,aN,aO=aG-aI
,aH-aJ,aK+aL return(aM*aM+aN*aN)<=(aO*aO)end,function(aG,aH,aI,aJ,aK,aL,aM,aN,aO
,aP)local aQ,aS=aG-aJ,aH-aK local aT,aU=aQ*aN.X+aS*aN.Z,aQ*aO.X+aS*aO.Z local aV
,aW,aX=math.max(0,math.abs(aT)-aM),math.max(0,math.abs(aU)-aL),aI+aP return(aV*
aV+aW*aW)<=(aX*aX)end,function(aG,aH,aI,aJ,aK,aL,aM,aN,aO)local aP,aQ=aG-aI,aH-
aJ local aS,aT=aP*aM.X+aQ*aM.Z,aP*aN.X+aQ*aN.Z if aO<=0 then return math.abs(aS)
<=aL and math.abs(aT)<=aK end local aU,aV=math.max(0,math.abs(aS)-aL),math.max(0
,math.abs(aT)-aK)return(aU*aU+aV*aV)<=(aO*aO)end,function(aG,aH,aI,aJ,aK,aL,aM,
aN,aO,aP,aQ,aS,aT)local aU,aV=aM-aG,aN-aH local aW=function(aW,aX)local aY,aZ,a_
=math.abs(aU*aW+aV*aX),aJ*math.abs(aK.X*aW+aK.Z*aX)+aI*math.abs(aL.X*aW+aL.Z*aW)
,aP*math.abs(aQ.X*aW+aQ.Z*aX)+aO*math.abs(aS.X*aW+aS.Z*aX)return aY>(aZ+a_+aT)
end if aW(aK.X,aK.Z)then return false end if aW(aL.X,aL.Z)then return false end
if aW(aQ.X,aQ.Z)then return false end if aW(aS.X,aS.Z)then return false end
return true end,function(aG,aH,aI,aJ)local aK,aL=aI.x,aI.z local aM,aN=aG-aK,aH-
aL local aO,aP=math.sqrt(aM*aM+aN*aN),aI.coreRadius or 12.5 if aO<=(aP+aJ)then
return true end local aQ=aI.rings if not aQ or#aQ==0 then return false end local
aS=math.deg(math.atan2(aM,-aN))for aT,aU in ipairs(aQ)do local aV,aW=aU.rIn or
12.5,aU.rOut or 25 if aO>=(aV-aJ)and aO<=(aW+aJ)then local aX=aU.yaw or 0 local
aY,aZ=(aS-aX+180)%360-180,0 if aO>1 and aJ>0 then aZ=math.deg(math.asin(math.
clamp(aJ/aO,0,1)))end if math.abs(aY)<=(90+aZ)then return true end end end
return false end local aQ,aS,aT=function(aQ,aS,aT,aU,aV,aW,aX,aY)local aZ=aX.
coreRadius or 12.5 if aM(aX.x,aX.z,aZ,aQ,aS,aT,aU,aV,aW,aY)then return true end
local a_=aX.rings if not a_ or#a_==0 then return false end local a0={Vector3.
new(aQ,0,aS),Vector3.new(aQ+aU*aV.X+aT*aW.X,0,aS+aU*aV.Z+aT*aW.Z),Vector3.new(aQ
+aU*aV.X-aT*aW.X,0,aS+aU*aV.Z-aT*aW.Z),Vector3.new(aQ-aU*aV.X+aT*aW.X,0,aS-aU*aV
.Z+aT*aW.Z),Vector3.new(aQ-aU*aV.X-aT*aW.X,0,aS-aU*aV.Z-aT*aW.Z)}for a1,a2 in
ipairs(a0)do local a3,a4=a2.X-aX.x,a2.Z-aX.z local a5=math.sqrt(a3*a3+a4*a4)for
a6,a7 in ipairs(a_)do local a8,a9=a7.rIn or 12.5,a7.rOut or 25 if a5>=(a8-aY)and
a5<=(a9+aY)then local b,ba=a7.yaw or 0,math.deg(math.atan2(a3,-a4))local bb,bc=(
ba-b+180)%360-180,(a5>1 and aY>0)and math.deg(math.asin(math.clamp(aY/a5,0,1)))
or 0 if math.abs(bb)<=(90+bc)then return true end end end end return false end,
function(aQ,aS,aT,aU,aV,aW,aX,aY,aZ,a_)local a0=Vector3.new(aQ,0,aS)if aZ then
if ag.IsThreatImminent(a0,aX,a_,aY)then return true end local a1={Vector3.new(aQ
+aU*aV.X+aT*aW.X,0,aS+aU*aV.Z+aT*aW.Z),Vector3.new(aQ+aU*aV.X-aT*aW.X,0,aS+aU*aV
.Z-aT*aW.Z),Vector3.new(aQ-aU*aV.X+aT*aW.X,0,aS-aU*aV.Z+aT*aW.Z),Vector3.new(aQ-
aU*aV.X-aT*aW.X,0,aS-aU*aV.Z-aT*aW.Z)}for a2,a3 in ipairs(a1)do if ag.
IsThreatImminent(a3,aX,a_,aY)then return true end end return false else if ag.
IsPointInThreatPath(a0,aX,aY)then return true end local a1={Vector3.new(aQ+aU*aV
.X+aT*aW.X,0,aS+aU*aV.Z+aT*aW.Z),Vector3.new(aQ+aU*aV.X-aT*aW.X,0,aS+aU*aV.Z-aT*
aW.Z),Vector3.new(aQ-aU*aV.X+aT*aW.X,0,aS-aU*aV.Z+aT*aW.Z),Vector3.new(aQ-aU*aV.
X-aT*aW.X,0,aS-aU*aV.Z-aT*aW.Z)}for a2,a3 in ipairs(a1)do if ag.
IsPointInThreatPath(a3,aX,aY)then return true end end return false end end,
function(aQ,aS,aT,aU,aV,aW,aX,aY,aZ)if not aT then return false end if aT.color
=='#22ff88'then if aV and aW and aX and aY and aZ then if aT.shape=='circle'and
aT.radius then return aM(aT.x,aT.z,aT.radius,aQ,aS,aW,aX,aY,aZ,0)elseif aT.shape
=='box'and aT.halfWidth and aT.halfLength and aT.fwd2D and aT.right2D then
return aO(aQ,aS,aW,aX,aY,aZ,aT.x,aT.z,aT.halfWidth,aT.halfLength,aT.fwd2D,aT.
right2D,0)end else if aT.shape=='circle'and aT.radius then return aL(aQ,aS,aT.x,
aT.z,aT.radius,0)elseif aT.shape=='box'and aT.halfWidth and aT.halfLength and aT
.fwd2D and aT.right2D then return aN(aQ,aS,aT.x,aT.z,aT.halfWidth,aT.halfLength,
aT.fwd2D,aT.right2D,0)end end end return false end function ah.SetHazardsMap(aU)
aC=aU end function ah.GetActiveHazards()return aC or{}end function ah.
IsPointInDanger(aU,aV,aW,aX)if not aU then return false,nil,nil end local aY=aC
if not aY or next(aY)==nil then return false,nil,nil end local aZ,a_,a0,a1,a2,a3
,a4,a5,a6=aU.X,aU.Z,(ak=='Rectangle'),(aG())if a0 then a2,a3=aI(a1)a4=(am/2)+(aV
or 0)a5=(an/2)+(aV or 0)a6=aV or 0 else a6=al+(aV or 0)end for a7,a8 in pairs(aY
)do if a8.shape and aT(aZ,a_,a8.shape,a6,a0,a4,a5,a2,a3)then return false,nil,
nil end end local a7,a8,a9=(math.huge)for b,ba in pairs(aY)do if aW and(aW==b or
aW==ba)then continue end local bb=ba.shape if not bb then continue end local bc,
bd=bb.x or(b and b.Position.X)or 0,bb.z or(b and b.Position.Z)or 0 local be,bf=
aZ-bc,a_-bd local bg,bh=be*be+bf*bf,false if a0 then if bb.shape=='circle'and bb
.radius then bh=aM(bc,bd,bb.radius,aZ,a_,a4,a5,a2,a3,0)elseif bb.shape=='box'and
bb.halfWidth and bb.halfLength and bb.fwd2D and bb.right2D then bh=aO(aZ,a_,a4,
a5,a2,a3,bc,bd,bb.halfWidth,bb.halfLength,bb.fwd2D,bb.right2D,0)elseif bb.shape
=='compound_multiring'then bh=aQ(aZ,a_,a4,a5,a2,a3,bb,0)end else if bb.shape==
'circle'and bb.radius then bh=aL(aZ,a_,bc,bd,bb.radius,a6)elseif bb.shape=='box'
and bb.halfWidth and bb.halfLength and bb.fwd2D and bb.right2D then bh=aN(aZ,a_,
bc,bd,bb.halfWidth,bb.halfLength,bb.fwd2D,bb.right2D,a6)elseif bb.shape==
'compound_multiring'then bh=aP(aZ,a_,bb,a6)end end if bh then if bg<a7 then a7=
bg a8=ba a9='Ground Zone'end end if bb.corridor then local bi,bj=false,ba.motion
if aX then if a0 then bi=aS(aZ,a_,a4,a5,a2,a3,bb.corridor,aV or 0,true,bj)else
bi=ag.IsThreatImminent(aU,bb.corridor,bj,a6)end else if a0 then bi=aS(aZ,a_,a4,
a5,a2,a3,bb.corridor,aV or 0,false,bj)else bi=ag.IsPointInThreatPath(aU,bb.
corridor,a6)end end if bi then if bg<a7 then a7=bg a8=ba a9='Threat Corridor'end
end end end return(a8~=nil),a8,a9 end function ah.IsPointSafe(aU,aV)if not aU
then return false end local aW,aX,aY,aZ,a_,a0=Vector3.new(aU.X,0,aU.Z),af.
GetActiveBossArea()if aX and aZ and aY and aY>0 then local a1=Vector3.new(aZ.X,0
,aZ.Z)local a2=(aW-a1).Magnitude if a2>aY then return false end if a_ and a0 and
a0>0 then if a2<a0 then return false end end end local a1=ah.IsPointInDanger(aW,
aV,nil,false)return not a1 end function ah.IsPlayerInDanger()local aU=aG()if not
aU then return false,nil,nil end if ae.IsInvulnerable and ae.IsInvulnerable()
then return false,nil,nil end if af.IsActiveDodgeDisabled and af.
IsActiveDodgeDisabled()then return false,nil,nil end if af.
IsActiveHazardScannerEnabled and not af.IsActiveHazardScannerEnabled()then
return false,nil,nil end return ah.IsPointInDanger(aU.Position,0,nil,true)end
function ah.GetRelevantHazards(aU,aV)local aW,aX={},aC if not aX then return aW
end local aY,aZ,a_=aU.X,aU.Z,aV or 75 local a0=a_*a_ for a1,a2 in pairs(aX)do
local a3=a2.shape if a3 then local a4,a5=a3.x or 0,a3.z or 0 local a6=(aY-a4)*(
aY-a4)+(aZ-a5)*(aZ-a5)if a6<=a0 then table.insert(aW,a2)end end end return aW
end function ah.GetStatus()return ao,az,aA end function ah.OnDangerChanged(aU)if
type(aU)=='function'then table.insert(ap,aU)end end function ah.SetVisualEnabled
(aU)aj=aU and true or false if aF and aF.Parent then aF.Visible=aj and ai end
end function ah.IsVisualEnabled()return aj end function ah.GetShapeMode()return
ak end function ah.SetShapeMode(aU)if aU=='Rectangle'or aU=='Disc'then if ak~=aU
then ak=aU if aF then pcall(function()aF:Destroy()end)aF=nil end local aV=aG()if
aV and ai then aJ(aV)end end end end function ah.GetPlayerRadius()return al end
function ah.SetPlayerRadius(aU)if type(aU)=='number'and aU>0 then al=aU if ak==
'Disc'and aF and aF.Parent and aF:IsA'CylinderHandleAdornment'then aF.Radius=aU
end end end function ah.GetPlayerWidth()return am end function ah.SetPlayerWidth
(aU)if type(aU)=='number'and aU>0 then am=aU if ak=='Rectangle'and aF and aF.
Parent and aF:IsA'BoxHandleAdornment'then aF.Size=Vector3.new(am,ay,an)end end
end function ah.GetPlayerLength()return an end function ah.SetPlayerLength(aU)if
type(aU)=='number'and aU>0 then an=aU if ak=='Rectangle'and aF and aF.Parent and
aF:IsA'BoxHandleAdornment'then aF.Size=Vector3.new(am,ay,an)end end end local aU
=function()local aU=aG()if not aU or not aU.Parent then if aF and aF.Parent then
aF.Visible=false end if ao then ao=false az=nil aA=nil for aV,aW in ipairs(ap)do
pcall(aW,false,nil,nil)end end return end local aV=aJ(aU)if aV and aV.Parent
then aV.Visible=aj and ai local aW=aH(aU)local aX=Vector3.new(aU.Position.X,aW,
aU.Position.Z)if ak=='Rectangle'then aV.Size=Vector3.new(am,ay,an)local aY=aI(aU
)local aZ=CFrame.lookAt(aX,aX+aY)aV.CFrame=aU.CFrame:ToObjectSpace(aZ)else aV.
Radius=al local aY=CFrame.new(aX)*CFrame.Angles(math.rad(90),0,0)aV.CFrame=aU.
CFrame:ToObjectSpace(aY)end end if not ai then if ao then ao=false az=nil aA=nil
aK(false)for aW,aX in ipairs(ap)do pcall(aX,false,nil,nil)end end return end
local aW,aX,aY=ah.IsPlayerInDanger()if aW~=ao or aX~=az then ao=aW az=aX aA=aY
aK(aW)for aZ,a_ in ipairs(ap)do pcall(a_,aW,aX,aY)end end end function ah.
SetEnabled(aV)local aW=aV and true or false if ai==aW then return end ai=aW if
ai then if not aB then aB=aa.Heartbeat:Connect(aU)end else if aB then aB:
Disconnect()aB=nil end ao=false az=nil aA=nil aK(false)if aF and aF.Parent then
aF.Visible=false end for aX,aY in ipairs(ap)do pcall(aY,false,nil,nil)end end
end function ah.IsEnabled()return ai end function ah.Clear()ah.SetEnabled(false)
if aF then pcall(function()aF:Destroy()end)aF=nil end end return ah end function
a.G()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=game:GetService'Players',a.load'e',a.
load'B',{},{SweepingFlames=3.2,CrissCross=2.5,Memory=2,GroundCircle=1.8,
DefaultAoE=2},true,true,true,true,function(aa)if not aa then return'DefaultAoE'
end if string.find(aa,'SweepingFlames')then return'SweepingFlames'elseif string.
find(aa,'CrissCross')then return'CrissCross'elseif string.find(aa,'Memory')then
return'Memory'elseif string.find(aa,'Circle')or string.find(aa,'Cylinder')then
return'GroundCircle'end local ab=string.find(aa,'/')if ab then return string.
sub(aa,1,ab-1)end return aa end function ad.GetPlayerWalkSpeed()local ak=(ab and
ab.player)or aa.LocalPlayer local al=ak and ak.Character local am=al and al:
FindFirstChildOfClass'Humanoid'if am and am.Health>0 and am.WalkSpeed and am.
WalkSpeed>=8 then return am.WalkSpeed end return 20 end function ad.
OnHazardUnregistered(ak,al)if not al or not al.spawnTime then return end local
am=os.clock()local an=am-al.spawnTime if an>=0.4 and an<=12 then local ao=aj(al.
name)local ap=ae[ao]if ap then ae[ao]=ap*0.6+an*0.4 else ae[ao]=an end end end
function ad.GetEstimatedLifespan(ak,al)local am=aj(ak)if ae[am]then return ae[am
]end return ae.DefaultAoE or 2 end function ad.GetTimeToImpact(ak,al)if not ak
or not ak.spawnTime then return 1.8 end local am=al or os.clock()local an,ao=am-
ak.spawnTime,ad.GetEstimatedLifespan(ak.name,ak.shape)return math.max(0.05,ao-an
)end function ad.GetThreatUrgency(ak,al)if not al then return'LOW',999 end local
am=os.clock()local an=ad.GetTimeToImpact(al,am)if an<=0.4 then return'CRITICAL',
an elseif an<=0.85 then return'HIGH',an elseif an<=1.5 then return'NORMAL',an
else return'LOW',an end end local ak=function(ak,al,am,an,ao,ap)local aq,ar=ak-
am,al-an if ao.shape=='circle'and ao.radius then local av=ao.radius+ap return(aq
*aq+ar*ar)<=(av*av)elseif ao.shape=='box'and ao.halfWidth and ao.halfLength and
ao.fwd2D and ao.right2D then local av,ax=math.abs(aq*ao.fwd2D.X+ar*ao.fwd2D.Z),
math.abs(aq*ao.right2D.X+ar*ao.right2D.Z)return(ax<=ao.halfWidth+ap)and(av<=ao.
halfLength+ap)end local av=6+ap return(aq*aq+ar*ar)<=(av*av)end function ad.
EvaluateCandidateTemporal(al,am,an,ao,ap,aq)if not af or not ag then return 0,
false,false,false,0 end local ar,av=os.clock(),math.max(10,ao or 20)local ax,ay,
az,aA,aB,aC,aF,aG,aH=an/av,al.X+am.X*an,al.Z+am.Z*an,0,false,false,false,ad.
GetThreatUrgency(ap,aq)if aG=='CRITICAL'then if an<=4 then aA+=10 else aA-=(an-4
)*2.5 end elseif aG=='LOW'then aA+=math.min(6,an*0.4)end if not ap or next(ap)==
nil then return aA,false,false,false,ax end if ah then for aI,aJ in pairs(ap)do
local aK=aJ.shape if not aK then continue end local aL,aM,aN=aK.x or 0,aK.z or 0
,aJ.motion or ac.GetRecord(aI)if aN and aN.speed and aN.speed>=2 and aN.velocity
then local aO,aP=aL+aN.velocity.X*ax,aM+aN.velocity.Z*ax if ak(ay,az,aO,aP,aK,
1.5)then aB=true aA-=38 end local aQ=3 for aS=1,aQ do local aT,aU,aV=(aS/aQ)*ax,
al.X+am.X*(an*(aS/aQ)),al.Z+am.Z*(an*(aS/aQ))local aW,aX=aL+aN.velocity.X*aT,aM+
aN.velocity.Z*aT local aY,aZ=(aU-aW)^2+(aV-aX)^2,(aK.radius or 5)+2 if aY<=(aZ*
aZ)then aC=true aA-=32 break end end end if ai and aq and aJ~=aq then local aO=
ad.GetTimeToImpact(aJ,ar)if ak(ay,az,aL,aM,aK,0)then if aO+0.15<ax then aF=true
aA+=14 else aA-=25 end end end end end return aA,aB,aC,aF,ax end function ad.
SetEnabled(al)af=al and true or false end function ad.IsEnabled()return af end
function ad.SetFuturePrediction(al)ah=al and true or false end function ad.
IsFuturePrediction()return ah end function ad.SetPhaseThrough(al)ai=al and true
or false end function ad.IsPhaseThrough()return ai end function ad.
GetLearnedLifespans()return ae end return ad end function a.H()local aa,ab,ac,ad
,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI,aJ,
aK,aL,aM,aN,aO,aP,aQ,aS,aT,aU,aV,aW,aX,aY,aZ,a_,a0,a1,a2,a3,a4,a5,a6=game:
GetService'Workspace',game:GetService'RunService',game:GetService'Players',a.
load'e',a.load'f',a.load'q',a.load'b',a.load'F',a.load'G',a.load'z',{},true,24,
75,0.8,true,true,false,true,true,0.75,6,48,0.25,1,1,0.75,0.2,0.1,0.5,0.62,0.3,3,
0.06,Color3.fromRGB(0,255,140),Color3.fromRGB(255,55,65),Color3.fromRGB(255,215,
0),Color3.fromRGB(255,175,40),Color3.fromRGB(0,230,255),Color3.fromRGB(0,220,255
),Color3.fromRGB(0,255,140),false,false,false,0,0,0,{},false,{},0,{},{}local a7=
aa:FindFirstChild'HazardScannerV2_SafeSpotVisuals'if a7 then pcall(function()a7:
Destroy()end)end local a8,a9,b=function()local a8=(ad and ad.player)or ac.
LocalPlayer local a9=a8 and a8.Character if not a9 or not a9.Parent then return
nil,nil,nil end local b=a9:FindFirstChildOfClass'Humanoid'if b and b.Health<=0
then return nil,nil,nil end local ba=a9:FindFirstChild'HumanoidRootPart'or a9.
PrimaryPart if not ba then return nil,nil,nil end local bb=ba.Position.Y-2.5
return ba.Position,b,bb,ba end,function(a8,a9)if a9 and a9.Health>0 then local b
=a9.MoveDirection if b and b.Magnitude>0.1 then return Vector3.new(b.X,0,b.Z).
Unit end end if a8 and a8.Parent then local b=Vector3.zero pcall(function()b=a8.
AssemblyLinearVelocity or a8.Velocity or Vector3.zero end)local ba=Vector3.new(b
.X,0,b.Z)if ba.Magnitude>=1.5 then return ba.Unit end end return nil end,
RaycastParams.new()b.FilterType=Enum.RaycastFilterType.Exclude b.IgnoreWater=
true local ba,bb,bc={},0,function(ba)if not ba then return true end if not ba.
Parent then return true end for bb,bc in ipairs(ac:GetPlayers())do if bc.
Character and(ba==bc.Character or ba:IsDescendantOf(bc.Character))then return
true end end local bb=ah.GetActiveHazards()if bb then for bc,bd in pairs(bb)do
if ba==bc or ba:IsDescendantOf(bc)then return true end if bd.level1Parent and bd
.level1Parent.Parent and bd.level1Parent~=aa then if ba==bd.level1Parent or ba:
IsDescendantOf(bd.level1Parent)then return true end end end end local bc=aa:
FindFirstChild'effects'if bc and(ba==bc or ba:IsDescendantOf(bc))then return
true end local bd=aa:FindFirstChild'drops'if bd and(ba==bd or ba:IsDescendantOf(
bd))then return true end local be=aa:FindFirstChild'RaycastIgnore'if be and(ba==
be or ba:IsDescendantOf(be))then return true end if visualFolder and(ba==
visualFolder or ba:IsDescendantOf(visualFolder))then return true end return
false end local bd=function()local bd=os.clock()if bd-bb<0.25 then return end bb
=bd table.clear(ba)local be=(ad and ad.player)or ac.LocalPlayer if be and be.
Character then table.insert(ba,be.Character)end for bf,bg in ipairs(ac:
GetPlayers())do if bg~=be and bg.Character then table.insert(ba,bg.Character)end
end local bf=aa:FindFirstChild'RaycastIgnore'if bf then table.insert(ba,bf)end
local bg=aa:FindFirstChild'effects'if bg then table.insert(ba,bg)end local bh=aa
:FindFirstChild'drops'if bh then table.insert(ba,bh)end if visualFolder and
visualFolder.Parent then table.insert(ba,visualFolder)end local bi=ae.
GetTrackedEnemyData and ae.GetTrackedEnemyData()if bi then for bj,bk in ipairs(
bi)do if bk and bk.Model and bk.Model.Parent then table.insert(ba,bk.Model)end
end end local bj=ah.GetActiveHazards()if bj then for bk,bl in pairs(bj)do if bk
and bk.Parent then table.insert(ba,bk)end if bl.level1Parent and bl.level1Parent
.Parent and bl.level1Parent~=aa then table.insert(ba,bl.level1Parent)end end end
b.FilterDescendantsInstances=ba end local be,bf=function(be,bf,bg)bd()local bh,
bi=Vector3.new(be.X,be.Y+1.2,be.Z),bg local bj,bk=bh,0 for bl=1,6 do local bm=aa
:Raycast(bj,bf*bi,b)if not bm then return nil end local bn=(bm.Position-bj).
Magnitude bk+=bn local bo=bm.Instance if bo and not bc(bo)then if(bo:IsA
'Terrain'or bo.CanCollide)and(bo.CanQuery~=false)then if bm.Normal.Y<=0.65 then
return bk end end end table.insert(ba,bm.Instance)b.FilterDescendantsInstances=
ba bi=bg-bk if bi<=0.5 then break end bj=bm.Position+bf*0.15 end return nil end,
function(be,bf)return ah.IsPointSafe(be,bf)end local bg,bh,bi,bj,bk=function(bg,
bh,bi,bj)local bk=Vector3.new(bg.X+bh.X*bi,bg.Y,bg.Z+bh.Z*bi)return bf(bk,bj)end
,function(bg,bh,bi,bj,bk)local bl,bm=bi,bj for bn=1,az do local bo=(bl+bm)*0.5
local bp=Vector3.new(bg.X+bh.X*bo,bg.Y,bg.Z+bh.Z*bo)if bf(bp,bk)then bm=bo else
bl=bo end end return bm end,function(bg)if bg<8 then return ay elseif bg<20 then
return ay*2 elseif bg<45 then return ay*4 end return ay*6 end,function(bg)return
math.atan2(bg.Z,bg.X)end,function(bg,bh)return Vector3.new(bg.X*math.cos(bh)-bg.
Z*math.sin(bh),0,bg.X*math.sin(bh)+bg.Z*math.cos(bh))end local bl,bm,bn,bo,bp,bq
=function(bl,bm)local bn,bo={},bm and bj(bm)or nil for bp=0,bl-1 do local bq=(bp
/bl)*math.pi*2 if bo and aJ>0 then bq=bq-aJ*math.sin(bq-bo)end bn[bp+1]=Vector3.
new(math.cos(bq),0,math.sin(bq))end return bn end,function(bl,bm,bn,bo)local bp,
bq={},function(bp,bq)local br,bs=bj(bp),bj(bq)local bt=math.abs(br-bs)if bt>math
.pi then bt=math.pi*2-bt end return bt<aN end for br,bs in ipairs(bm)do local bt
=bn+((br<=bo)and 1 or 0)if bt>0 then local bu={}if bt==1 then bu[1]=-aL*0.6 else
for bv=1,bt do bu[bv]=(bv/(bt+1)-0.5)*2*aL end end for bv,bw in ipairs(bu)do
local bx,by=bk(bs,bw),0 while by<3 do local bz=false for bA,bB in ipairs(bl)do
if bq(bB,bx)then bz=true break end end for bA,bB in ipairs(bp)do if bq(bB,bx)
then bz=true break end end if bz then bw=bw+aN*1.2 bx=bk(bs,bw)by+=1 else break
end end table.insert(bp,bx)end end end return bp end,function(bl,bm)if bm<=0
then return 0,0 end local bn=math.floor(bl/bm)local bo=bl-bn*bm return bn,bo end
,function(bl,bm)local bn={}for bo,bp in ipairs(bl)do table.insert(bn,bp)end
table.sort(bn,function(bo,bp)if ax and bo.score and bp.score then if math.abs(bo
.score-bp.score)>0.1 then return bo.score>bp.score end return bo.found<bp.found
else if math.abs(bo.found-bp.found)>aG then return bo.found<bp.found end return(
bo.tie or 0)>(bp.tie or 0)end end)local bo={}for bp=1,math.min(bm,#bn)do table.
insert(bo,bn[bp].dir)end return bo end,function(bl,bm,bn,bo)local bp=be(bl,bm,an
)local bq,br,bs,bt=bp and math.max(0.5,bp-0.8)or an,af.GetActiveBossArea()if br
and bt and bs and bs>0 then local bu,bv=Vector3.new(bt.X,0,bt.Z),Vector3.new(bl.
X,0,bl.Z)local bw=bu-bv local bx=bw.X*bm.X+bw.Z*bm.Z local by=(bw.X*bw.X+bw.Z*bw
.Z)-(bx*bx)if by<(bs*bs)then local bz=math.sqrt(bs*bs-by)local bA=bx+bz if bA>0
and bA<bq then bq=math.max(0.5,bA-0.5)end end end if bn and bn>=ay and bn<=bq
then if bg(bl,bm,bn,bo)then local bu=math.max(0,bn-ay)while bu>0 do if not bg(bl
,bm,bu,bo)then local bv=bh(bl,bm,bu,bn,bo)if bv<=bq then return bv,bv,'safe',bp
end break end bu-=ay end local bv=bh(bl,bm,0,bn,bo)if bv<=bq then return bv,bv,
'safe',bp end end end local bu,bv=0,bi(0)while bv<=bq do if bg(bl,bm,bv,bo)then
local bw=bh(bl,bm,bu,bv,bo)if bw<=bq then return bw,bw,'safe',bp end return nil,
bp or bq,'wall',bp end bu=bv bv+=bi(bv)end if bp and bp<an then return nil,bp,
'wall',bp end return nil,an,'blocked',bp end,function()if visualFolder and
visualFolder.Parent then return visualFolder end visualFolder=Instance.new
'Folder'visualFolder.Name='HazardScannerV2_SafeSpotVisuals'visualFolder.Parent=
aa return visualFolder end local br,bs,bt,bu,bv=function(br)local bs,bt=bq(),
Instance.new'Part'bt.Name='HS2_RayBeam_'..tostring(br)bt.Material=Enum.Material.
Neon bt.Color=aP bt.Shape=Enum.PartType.Block bt.Size=Vector3.new(0.05,0.05,an)
bt.Transparency=1 bt.Anchored=true bt.CanCollide=false bt.CanQuery=false bt.
CanTouch=false bt.CastShadow=false bt.Massless=true bt.Parent=bs local bu=
Instance.new'Part'bu.Name='HS2_RayTip_'..tostring(br)bu.Material=Enum.Material.
Neon bu.Color=aP bu.Shape=Enum.PartType.Ball bu.Size=Vector3.new(0.4,0.4,0.4)bu.
Transparency=1 bu.Anchored=true bu.CanCollide=false bu.CanQuery=false bu.
CanTouch=false bu.CastShadow=false bu.Massless=true bu.Parent=bs local bv=
Instance.new'BillboardGui'bv.Name='HS2_RayBadge_'..tostring(br)bv.AlwaysOnTop=
true bv.Size=UDim2.fromOffset(26,16)bv.StudsOffset=Vector3.new(0,0.75,0)bv.
Adornee=bu bv.Enabled=false bv.Parent=bs local bw=Instance.new'Frame'bw.Name=
'Badge'bw.Size=UDim2.fromScale(1,1)bw.BackgroundColor3=Color3.fromRGB(12,18,24)
bw.BackgroundTransparency=0.25 bw.BorderSizePixel=0 bw.Parent=bv local bx=
Instance.new'UICorner'bx.CornerRadius=UDim.new(0,4)bx.Parent=bw local by=
Instance.new'UIStroke'by.Name='Stroke'by.Color=aP by.Thickness=1 by.Transparency
=0.3 by.Parent=bw local bz=Instance.new'TextLabel'bz.Name='Num'bz.Size=UDim2.
fromScale(1,1)bz.BackgroundTransparency=1 bz.Font=Enum.Font.GothamBold bz.
TextSize=10 bz.Text=tostring(br)bz.TextColor3=Color3.fromRGB(255,255,255)bz.
Parent=bw return{beam=bt,tip=bu,label=bv}end,function(br,bs,bt,bu,bv,bw,bx,by,bz
,bA,bB)if not bB then br.beam.Transparency=1 br.tip.Transparency=1 if br.label
then br.label.Enabled=false end return end local bC=math.max(0.1,bu)local bD=bs+
bt*bC br.beam.Color=bv br.beam.Transparency=by br.beam.Size=Vector3.new(bw,bx,bC
)br.beam.CFrame=CFrame.lookAt((bs+bD)*0.5,bD)br.tip.Color=bv br.tip.Transparency
=bA br.tip.Size=Vector3.new(bz,bz,bz)br.tip.CFrame=CFrame.new(bD)if br.label
then if ap and ar then br.label.Enabled=true local bE=br.label:FindFirstChild
'Badge'if bE then local bF=bE:FindFirstChild'Stroke'if bF and bF:IsA'UIStroke'
then bF.Color=bv end local bG=bE:FindFirstChild'Num'if bG and bG:IsA'TextLabel'
then bG.TextColor3=bv end end else br.label.Enabled=false end end end,function()
local br=bq()if not originDot or not originDot.Parent then originDot=Instance.
new'Part'originDot.Name='HS2_OriginDot'originDot.Material=Enum.Material.Neon
originDot.Color=aU originDot.Shape=Enum.PartType.Ball originDot.Size=Vector3.
new(0.65,0.65,0.65)originDot.Transparency=0.05 originDot.Anchored=true originDot
.CanCollide=false originDot.CanQuery=false originDot.CanTouch=false originDot.
CastShadow=false originDot.Massless=true originDot.Parent=br end end,function()
local br=bq()if not markerHalo or not markerHalo.Parent then markerHalo=Instance
.new'Part'markerHalo.Name='HS2_MarkerHalo'markerHalo.Material=Enum.Material.Neon
markerHalo.Color=aV markerHalo.Shape=Enum.PartType.Cylinder markerHalo.Size=
Vector3.new(0.06,3.8,3.8)markerHalo.Transparency=0.35 markerHalo.Anchored=true
markerHalo.CanCollide=false markerHalo.CanQuery=false markerHalo.CanTouch=false
markerHalo.CastShadow=false markerHalo.Massless=true markerHalo.Parent=br end if
not markerBeacon or not markerBeacon.Parent then markerBeacon=Instance.new'Part'
markerBeacon.Name='HS2_MarkerBeacon'markerBeacon.Material=Enum.Material.Neon
markerBeacon.Color=aV markerBeacon.Shape=Enum.PartType.Block markerBeacon.Size=
Vector3.new(0.45,18,0.45)markerBeacon.Transparency=0.55 markerBeacon.Anchored=
true markerBeacon.CanCollide=false markerBeacon.CanQuery=false markerBeacon.
CanTouch=false markerBeacon.CastShadow=false markerBeacon.Massless=true
markerBeacon.Parent=br end if not markerLabel or not markerLabel.Parent then
markerLabel=Instance.new'BillboardGui'markerLabel.Name='HS2_MarkerLabel'
markerLabel.AlwaysOnTop=true markerLabel.Size=UDim2.fromOffset(190,42)
markerLabel.StudsOffsetWorldSpace=Vector3.new(0,2.6,0)markerLabel.Adornee=
markerHalo markerLabel.Parent=markerHalo local bs=Instance.new'Frame'bs.Name=
'Container'bs.Size=UDim2.fromScale(1,1)bs.BackgroundColor3=Color3.fromRGB(15,22,
28)bs.BackgroundTransparency=0.25 bs.BorderSizePixel=0 bs.Parent=markerLabel
local bt=Instance.new'UICorner'bt.CornerRadius=UDim.new(0,8)bt.Parent=bs local
bu=Instance.new'UIStroke'bu.Color=aV bu.Thickness=1.5 bu.Transparency=0.25 bu.
Parent=bs local bv=Instance.new'TextLabel'bv.Name='Text'bv.Size=UDim2.new(1,-12,
1,-8)bv.Position=UDim2.fromOffset(6,4)bv.BackgroundTransparency=1 bv.Font=Enum.
Font.GothamBold bv.Text='SAFE'bv.TextColor3=aV bv.TextStrokeTransparency=0.6 bv.
TextScaled=true bv.RichText=true bv.Parent=bs end end,function()if markerHalo
then markerHalo.Transparency=1 end if markerBeacon then markerBeacon.
Transparency=1 end if markerLabel then markerLabel.Enabled=false end end local
bw,bx=function()if not aq or not safeSpotPos then bv()return end bu()if not
markerHalo or not markerBeacon or not markerLabel then return end local bw=ah.
GetPlayerRadius()local bx,by=math.max(0.4,bw*2),(scanFloorY~=nil)and scanFloorY
or(safeSpotPos.Y-2.5)bd()local bz=Vector3.new(safeSpotPos.X,by+2.5,safeSpotPos.Z
)local bA=aa:Raycast(bz,Vector3.new(0,-5,0),b)if bA and bA.Instance and(bA.
Instance:IsA'Terrain'or bA.Instance.CanCollide)then by=bA.Position.Y end local
bB=aX and aS or(aY and aT or aV)markerHalo.Size=Vector3.new(0.06,bx,bx)
markerHalo.Color=bB markerHalo.Transparency=0.35 markerHalo.CFrame=CFrame.new(
safeSpotPos.X,by+0.03,safeSpotPos.Z)*CFrame.Angles(0,0,math.rad(90))markerBeacon
.Color=bB markerBeacon.Transparency=0.55 markerBeacon.CFrame=CFrame.new(
safeSpotPos.X,by+9,safeSpotPos.Z)local bC=markerLabel:FindFirstChild'Container'
if bC then local bD=bC:FindFirstChildOfClass'UIStroke'if bD then bD.Color=bB end
local bE=bC:FindFirstChild'Text'if bE and bE:IsA'TextLabel'then local bF=
currentThreatName and(' | '..currentThreatName)or''if aX then bE.Text=string.
format(
"<b>\u{26a0}\u{fe0f} ESCAPE</b> <font color='rgb(255,255,255)'>(%.1fm)</font><font color='rgb(255,200,80)'>%s</font>"
,aZ,bF)bE.TextColor3=aS elseif aY then bE.Text=string.format(
"<b>\u{26a1} PHASE-THROUGH</b> <font color='rgb(255,255,255)'>(%.1fm)</font><font color='rgb(255,200,80)'>%s</font>"
,aZ,bF)bE.TextColor3=aT else bE.Text=string.format(
"<b>\u{1f3af} SAFE</b> <font color='rgb(255,255,255)'>(%.1fm)</font><font color='rgb(255,200,80)'>%s</font>"
,aZ,bF)bE.TextColor3=aV end end end markerLabel.Enabled=true end,function()for
bw,bx in pairs(a6)do if bx.beam then bx.beam.Transparency=1 end if bx.tip then
bx.tip.Transparency=1 end if bx.label then bx.label.Enabled=false end end if
originDot then originDot.Transparency=1 end bv()end local by,bz=function()local
by=#a1 if not rayResults or not scanOrigin or by==0 then bx()return end local bz
=Vector3.new(scanOrigin.X,(scanFloorY or 0)+aB,scanOrigin.Z)if ap then local bA=
aZ>0 and aZ or an for bB=1,by do local bC=a6[bB]if not bC then bC=br(bB)a6[bB]=
bC end local bD=rayResults[bB]if bD then local bE,bF=(bB-1)==chosenRayIndex,bB<=
a4 local bG,bH,bI,bJ,bK,bL,bM=bE and(aX and aS or aQ)or(bD.status=='found'and aO
)or aP,bE and bA or bD.length if bE then bI=0.28 bJ=0.08 bK=0 bL=1.25 bM=0
elseif bD.status=='found'then bI=bF and 0.12 or 0.07 bJ=bF and 0.06 or 0.05 bK=
bF and 0.08 or 0.18 bL=bF and 0.65 or 0.5 bM=bF and 0.1 or 0.2 else bI=0.04 bJ=
0.04 bK=0.65 bL=(bD.blockedReason=='wall')and 0.4 or 0.25 bM=0.5 end bs(bC,bz,bD
.dir,bH,bG,bI,bJ,bK,bL,bM,true)else bs(bC,bz,Vector3.zero,0,aP,0,0,1,0,1,false)
end end for bB=by+1,aA do local bC=a6[bB]if bC then bC.beam.Transparency=1 bC.
tip.Transparency=1 if bC.label then bC.label.Enabled=false end end end bt()if
originDot then originDot.Transparency=0.05 originDot.CFrame=CFrame.new(bz)end
else for bA,bB in pairs(a6)do if bB.beam then bB.beam.Transparency=1 end if bB.
tip then bB.tip.Transparency=1 end if bB.label then bB.label.Enabled=false end
end if originDot then originDot.Transparency=1 end end if safeSpotPos then bw()
else bv()end end,function(by,bz,bA,bB,bC,bD)for bE,bF in ipairs(a5)do pcall(bF,
by,bz,bA,bB,bC,bD)end end local bA,bB=function()aW=false aX=false aY=false
currentThreatName=nil safeSpotPos=nil aZ=0 chosenRayIndex=nil scanOrigin=nil
scanFloorY=nil rayResults=nil a1={}a2=false table.clear(a3)a4=0 bx()bz(false,nil
,nil,0,nil,false)end,function(bA,bB,bC)local bD,bE=bC.x or 0,bC.z or 0 local bF,
bG=bA-bD,bB-bE if bC.shape=='circle'and bC.radius then local bH=math.sqrt(bF*bF+
bG*bG)return bH-bC.radius elseif bC.shape=='box'and bC.halfWidth and bC.
halfLength and bC.fwd2D and bC.right2D then local bH,bI=math.abs(bF*bC.fwd2D.X+
bG*bC.fwd2D.Z),math.abs(bF*bC.right2D.X+bG*bC.right2D.Z)local bJ,bK=math.max(0,
bI-bC.halfWidth),math.max(0,bH-bC.halfLength)if bI<=bC.halfWidth and bH<=bC.
halfLength then return-math.min(bC.halfWidth-bI,bC.halfLength-bH)end return math
.sqrt(bJ*bJ+bK*bK)elseif bC.shape=='compound_multiring'then local bH,bI=math.
sqrt(bF*bF+bG*bG),bC.maxRadius or 40 return bH-bI end local bH=math.sqrt(bF*bF+
bG*bG)return bH-5 end local bC=function(bC,bD,bE)if not bE or next(bE)==nil then
return 999,0 end local bF,bG,bH=999,0,625 for bI,bJ in pairs(bE)do local bK=bJ.
shape if bK then local bL,bM=bK.x or 0,bK.z or 0 local bN=(bC-bL)^2+(bD-bM)^2 if
bN<=bH then bG+=1 end local bO=bB(bC,bD,bK)if bO<bF then bF=bO end end end
return bF,bG end local bD=function(bD,bE,bF,bG,bH,bI,bJ,bK,bL,bM,bN,bO,bP,bQ,bR,
bS)local bT,bU,bV=bD.X+bE.X*bF,bD.Z+bE.Z*bF,-bF*1.2 local bW,bX=bC(bT,bU,bJ)
local bY=0 if bW<1.2 then bY=-14 elseif bW<2.5 then bY=-5 elseif bW>=6 then bY=7
else bY=(bW-2.5)*3 end local bZ,b_,b0=-bX*2.5,(bG or an)-bF,0 if b_<1.5 then b0=
-28 elseif b_<3 then b0=-14 elseif b_<5 then b0=-4 elseif b_>=9 then b0=5 end
local b2,b4=0,bR or a4 if b_<4 and bQ and bP and b4 and b4>2 and bP<=b4 then
local b6,b7=((bP-2)%b4)+1,(bP%b4)+1 local b8,b9=bQ[b6],bQ[b7]local c,ca=b8 and(
b8.blockedReason=='wall'or(b8.length and b8.length<6)),b9 and(b9.blockedReason==
'wall'or(b9.length and b9.length<6))if c and ca then b2=-22 end end local b6=0
if bK and bM and bL and bL>0 then local b7,b8=Vector3.new(bM.X,0,bM.Z),Vector3.
new(bT,0,bU)local b9=(b8-b7).Magnitude if bN and bO and bO>0 then if b9<bO then
b6-=35 elseif b9>bL then b6-=35 else local c,ca=(bO+bL)*0.5,(bL-bO)*0.5 local cb
=math.abs(b9-c)if ca>0.5 then b6+=math.max(0,1-(cb/ca))*8 end end else local c=
b9/bL if c>0.88 then b6-=16 elseif c>0.7 then b6-=6 elseif c<0.45 then b6+=6 end
local ca=(b7-Vector3.new(bD.X,0,bD.Z))if ca.Magnitude>0.1 then local cb=bE:Dot(
ca.Unit)b6+=cb*4 end end end local b7=0 if bH then b7+=math.max(0,bE:Dot(bH))*3
end if bI then b7+=math.max(0,bE:Dot(bI))*2 end local b8=0 if bQ and bP and b4
and b4>2 and bP<=b4 then local b9,c=((bP-2)%b4)+1,(bP%b4)+1 if bQ[b9]and bQ[b9].
status=='found'then b8+=2 end if bQ[c]and bQ[c].status=='found'then b8+=2 end
end local b9,c,ca,cb,cd=0,false,false,false,0 if ai and ai.IsEnabled()then local
ce=ai.GetPlayerWalkSpeed()local cf,cg,ch,ci,cj=ai.EvaluateCandidateTemporal(bD,
bE,bF,ce,bJ,bS)b9=cf ca=cg cb=ch c=ci cd=cj end local ce=0 if bS and bS.shape
and bS.shape.corridor then local cf=bS.shape.corridor local cg=bE:Dot(cf.fwd2D)
if cg>0.45 then ce-=cg*16 end local ch=math.abs(bE:Dot(cf.right2D))if ch>0.65
then ce+=ch*6 end end local cf=bV+bY+bZ+b0+b2+b6+b7+b8+b9+ce return cf,c,ca,cb,
cd end function ak.FindNearestSafeSpot(bE,bF)if not al then bA()return nil,false
,0 end local bG,bH,bI,bJ,bK=os.clock(),a8()local bL=bE or bH if not bL then bA()
return nil,false,0 end local bM,bN,bO=ah.IsPlayerInDanger()local bP=bN and(bN.
name or bN.Name)or nil if not bM then if aW then aW=false currentThreatName=nil
bz(false,safeSpotPos,nil,aZ,chosenRayIndex,false)end if safeSpotPos then if not
bf(safeSpotPos,ao)then safeSpotPos=nil aZ=0 chosenRayIndex=nil by()bz(false,nil,
nil,0,nil,false)return nil,false,0 else aZ=(safeSpotPos-bL).Magnitude end end
return safeSpotPos,(safeSpotPos~=nil),aZ end aW=true currentThreatName=bP if not
bF and safeSpotPos and not aX and(bG-a_<aH)then if bf(safeSpotPos,ao)then aZ=(
safeSpotPos-bL).Magnitude by()return safeSpotPos,true,aZ end end a_=bG
scanOrigin=bL scanFloorY=bJ or(bL.Y-2.5)local bQ,bR=(a9(bK,bI))if bO==
'Threat Corridor'and bN and bN.shape and bN.shape.corridor then local bS=bN.
shape.corridor local bT,bU,bV,bW,bX,bY=aj.GetThreatMetrics(bL,bS,bN.motion,0)if
bY and bY.Magnitude>0.1 then if bQ and bQ.Magnitude>0.1 then local bZ=bQ:Dot(bS.
right2D)if bZ>0.15 then bR=bS.right2D elseif bZ<-0.15 then bR=-bS.right2D else
bR=bY end else bR=bY end end elseif bN and bN.shape then local bS=bN.shape local
bX,bY=bS.x or 0,bS.z or 0 local bZ,b_=bL.X-bX,bL.Z-bY if bZ*bZ+b_*b_>0.01 then
bR=Vector3.new(bZ,0,b_).Unit end end local bS,bX=bQ or bR,math.clamp(am,8,aA)
local bY=math.max(6,math.floor(bX*aK))local bZ=bX-bY if not a2 or#a1~=bX then a1
=bl(bY,bS)a4=bY end local b_,b0,b2,b4,b6,b7,b8,b9={},{},ah.GetActiveHazards(),af
.GetActiveBossArea()for c=1,a4 do local ca=a1[c]local cb,cd,ce,cf=bp(bL,ca,a3[c]
,ao)if cb then a3[c]=cb else a3[c]=nil end local cg={i=c-1,dir=ca,found=cb,
length=cb or cd or an,status=cb and'found'or'blocked',blockedReason=ce,wallDist=
cf}b_[c]=cg end for c=1,a4 do local ca=b_[c]if ca.found then local cb=0 if bR
then cb+=math.max(0,ca.dir:Dot(bR))*aC end if bQ then cb+=math.max(0,ca.dir:Dot(
bQ))*aF end local cd,ce,cf,cg,ch=bD(bL,ca.dir,ca.found,ca.wallDist,bR,bQ,b2,b4,
b6,b7,b8,b9,c,b_,a4,bN)table.insert(b0,{i=ca.i,rayIdx=c,dir=ca.dir,found=ca.
found,tie=cb,score=cd,wallDist=ca.wallDist,isPhaseThrough=ce,isFutureColliding=
cf,isPathIntercepted=cg,tArrival=ch})end end if av and bZ>0 and#b0>0 then local
c=bo(b0,aM)local ca,cb=bn(bZ,#c)local cd=bm(a1,c,ca,cb)for ce=1,#cd do local cf=
a4+ce a1[cf]=cd[ce]local cg=cd[ce]local ch,ci,cj,ck=bp(bL,cg,a3[cf],ao)if ch
then a3[cf]=ch else a3[cf]=nil end local cm={i=cf-1,dir=cg,found=ch,length=ch or
ci or an,status=ch and'found'or'blocked',blockedReason=cj,wallDist=ck}b_[cf]=cm
if ch then local co=0 if bR then co+=math.max(0,cg:Dot(bR))*aC end if bQ then co
+=math.max(0,cg:Dot(bQ))*aF end local cp,cq,cr,cs,ct=bD(bL,cg,ch,ck,bR,bQ,b2,b4,
b6,b7,b8,b9,cf,b_,a4,bN)table.insert(b0,{i=cf-1,rayIdx=cf,dir=cg,found=ch,tie=co
,score=cp,wallDist=ck,isPhaseThrough=cq,isFutureColliding=cr,isPathIntercepted=
cs,tArrival=ct})end end end a2=true rayResults=b_ if#b0==0 then local c,ca,cb=-
math.huge,0 for cd,ce in ipairs(b_)do if ce.blockedReason=='wall'and ce.length<3
then continue end local cf=0 cf+=(ce.length/an)*2 if bR then cf+=ce.dir:Dot(bR)*
4 end if bQ then cf+=ce.dir:Dot(bQ)*1.5 end if ce.blockedReason=='wall'then cf-=
4 end if b4 and b7 and b6 and b6>0 then local cg,ch=Vector3.new(b7.X,0,b7.Z),
Vector3.new(bL.X+ce.dir.X*ce.length,0,bL.Z+ce.dir.Z*ce.length)local ci=(ch-cg).
Magnitude if b8 and b9 and b9>0 then if ci<b9 then cf-=20 elseif ci>b6 then cf-=
20 else cf+=4 end else local cj=(cg-Vector3.new(bL.X,0,bL.Z))if cj.Magnitude>0.1
then cf+=ce.dir:Dot(cj.Unit)*3 end end end if cf>c then c=cf cb=ce ca=ce.length
end end if cb and ca>1 then aX=true chosenRayIndex=cb.i aZ=ca safeSpotPos=
Vector3.new(bL.X+cb.dir.X*ca,scanFloorY or bL.Y,bL.Z+cb.dir.Z*ca)by()bz(true,
safeSpotPos,bP,aZ,chosenRayIndex,true)return safeSpotPos,true,aZ end aX=false
safeSpotPos=nil aZ=0 chosenRayIndex=nil by()bz(false,nil,bP,0,nil,false)return
nil,false,0 end aX=false table.sort(b0,function(c,ca)if ax and c.score and ca.
score then if math.abs(c.score-ca.score)>0.1 then return c.score>ca.score end
return c.found<ca.found else if math.abs(c.found-ca.found)>aG then return c.
found<ca.found end return(c.tie or 0)>(ca.tie or 0)end end)local c=b0[1]
chosenRayIndex=c.i aZ=c.found aY=c.isPhaseThrough and true or false safeSpotPos=
Vector3.new(bL.X+c.dir.X*c.found,scanFloorY or bL.Y,bL.Z+c.dir.Z*c.found)by()bz(
true,safeSpotPos,bP,aZ,chosenRayIndex,false)return safeSpotPos,true,aZ end local
bE=function()if not al then return end local bE=os.clock()if bE-a0<aI then
return end a0=bE ak.FindNearestSafeSpot(nil,false)end function ak.SetEnabled(bF)
local bG=bF and true or false if al==bG then return end al=bG if al then if not
heartbeatConn then heartbeatConn=ab.Heartbeat:Connect(bE)end else if
heartbeatConn then heartbeatConn:Disconnect()heartbeatConn=nil end bA()end end
function ak.IsEnabled()return al end function ak.GetSafeSpot()return safeSpotPos
,(safeSpotPos~=nil),aZ end function ak.GetRayResults()return rayResults,
scanOrigin,chosenRayIndex end function ak.IsPointSafe(bF,bG)return bf(bF,bG or
ao)end function ak.SetVisualEnabled(bF)aq=bF and true or false ap=bF and true or
false by()end function ak.IsVisualEnabled()return aq or ap end function ak.
SetShowVectors(bF)ap=bF and true or false by()end function ak.IsShowVectors()
return ap end function ak.SetShowMarker(bF)aq=bF and true or false by()end
function ak.IsShowMarker()return aq end function ak.SetShowVectorNumbers(bF)ar=
bF and true or false by()end function ak.IsShowVectorNumbers()return ar end
function ak.SetRayCount(bF)if type(bF)=='number'and bF>=8 and bF<=aA then am=
math.floor(bF)a2=false table.clear(a3)end end function ak.GetRayCount()return am
end function ak.SetEscapeMargin(bF)if type(bF)=='number'and bF>=0 then ao=bF end
end function ak.GetEscapeMargin()return ao end function ak.SetMaxRadius(bF)if
type(bF)=='number'and bF>=15 and bF<=200 then an=bF a2=false table.clear(a3)end
end function ak.GetMaxRadius()return an end function ak.IsEmergency()return aX
end function ak.SetAdaptive(bF)av=bF and true or false a2=false table.clear(a3)
end function ak.IsAdaptive()return av end function ak.SetEnableScoringV2(bF)ax=
bF and true or false end function ak.IsEnableScoringV2()return ax end function
ak.IsPhaseThrough()return aY end function ak.SetTemporalEnabled(bF)if ai then ai
.SetEnabled(bF)end end function ak.IsTemporalEnabled()return ai and ai.
IsEnabled()or false end function ak.OnSafeSpotChanged(bF)if type(bF)=='function'
then table.insert(a5,bF)end end function ak.FindRepositionSpot(bF,bG,bH,bI)if
not bF or not bG then return nil,false end if ah.IsPlayerInDanger()then return
nil,false end local bJ,bK,bL,bM,bN,bO=ah.GetActiveHazards(),af.
GetActiveBossArea()local bP,bQ=false,999 for bR=0,315,45 do local bS=math.rad(bR
)local bX=Vector3.new(math.cos(bS),0,math.sin(bS))local bY=be(bF,bX,8)if bY and
bY<bQ then bQ=bY end end if bQ<5 then bP=true end if bK and bM and bL and bL>0
then local bR=Vector3.new(bM.X,0,bM.Z)local bS=(Vector3.new(bF.X,0,bF.Z)-bR).
Magnitude if bS>(bL-6)then bP=true elseif bN and bO and bO>0 then if bS<(bO+4)
then bP=true end end end if not bP and bJ and next(bJ)~=nil then local bR=bC(bF.
X,bF.Z,bJ)if bR<4 then bP=true end end if not bP then return nil,false end local
bR=(bH+bI)*0.5 if bK and bM and bN and bO and bO>0 then local bS=(bO+bL)*0.5 bR=
math.clamp(bS,bH+1,bI-1)end local bS,bX=(-math.huge)for bY=0,15 do local bZ=(bY/
16)*(math.pi*2)local b_,b0=bG.X+math.cos(bZ)*bR,bG.Z+math.sin(bZ)*bR local b2=
Vector3.new(b_,bF.Y,b0)if bf(b2,0.8)then local b4=999 for b6=0,315,90 do local
b7=math.rad(b6)local b8=Vector3.new(math.cos(b7),0,math.sin(b7))local b9=be(b2,
b8,12)if b9 and b9<b4 then b4=b9 end end if b4>=3.5 then local b6=(b2-bF).
Magnitude local b7=b4*2-(b6*1.5)if bK and bM and bL and bL>0 then local b8=
Vector3.new(bM.X,0,bM.Z)local b9=(Vector3.new(b_,0,b0)-b8).Magnitude if bN and
bO and bO>0 then local c=(bO+bL)*0.5 local ca=math.abs(b9-c)b7+=math.max(0,10-ca
)end end if b7>bS then bS=b7 bX=b2 end end end end if bX and bS>-100 then return
bX,true end return nil,false end function ak.ClearVisuals()bx()if visualFolder
then pcall(function()visualFolder:Destroy()end)visualFolder=nil end table.clear(
a6)originDot=nil markerHalo=nil markerBeacon=nil markerLabel=nil end function ak
.Clear()ak.SetEnabled(false)bA()ak.ClearVisuals()table.clear(a5)end ah.
OnDangerChanged(function(bF,bG,bH)if not al then return end if bF then ak.
FindNearestSafeSpot(nil,true)else aW=false currentThreatName=nil bz(false,
safeSpotPos,nil,aZ,chosenRayIndex,false)end end)ag.Register(function()ak.Clear()
end)ak.GetWallDistance=be return ak end function a.I()local aa,ab,ac,ad,ae,af,ag
,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax=game:GetService'TweenService',game:
GetService'UserInputService',game:GetService'Players',a.load'e',a.load'b',{},
true,false,Color3.fromRGB(0,255,170),Color3.fromRGB(255,45,45),(Color3.fromRGB(
13,17,23))local ay,az=function()if typeof(gethui)=='function'then local ay,az=
pcall(gethui)if ay and az then return az end end local ay,az=pcall(function()
return game:GetService'CoreGui'end)if ay and az then return az end local aA=(ad
and ad.player)or ac.LocalPlayer if aA then return aA:FindFirstChild'PlayerGui'or
aA:WaitForChild('PlayerGui',5)end return nil end,function(ay)local az,aA,aB,aC=
false ay.InputBegan:Connect(function(aF)if aF.UserInputType==Enum.UserInputType.
MouseButton1 or aF.UserInputType==Enum.UserInputType.Touch then az=true aB=aF.
Position aC=ay.Position local aG aG=aF.Changed:Connect(function()if aF.
UserInputState==Enum.UserInputState.End then az=false if aG then aG:Disconnect()
aG=nil end end end)end end)ay.InputChanged:Connect(function(aF)if aF.
UserInputType==Enum.UserInputType.MouseMovement or aF.UserInputType==Enum.
UserInputType.Touch then aA=aF end end)ab.InputChanged:Connect(function(aF)if aF
==aA and az and aC and aB then local aG=aF.Position-aB ay.Position=UDim2.new(aC.
X.Scale,aC.X.Offset+aG.X,aC.Y.Scale,aC.Y.Offset+aG.Y)end end)end local aA,aB=
function()if am and am.Parent and an and an.Parent then return end local aA=ay()
if not aA then return end local aB=aA:FindFirstChild'HazardScannerV2_HUD'if aB
then pcall(function()aB:Destroy()end)end am=Instance.new'ScreenGui'am.Name=
'HazardScannerV2_HUD'am.ResetOnSpawn=false am.DisplayOrder=1000 am.Enabled=ag am
.Parent=aA an=Instance.new'Frame'an.Name='MainHUD'an.Size=UDim2.fromOffset(108,
30)an.Position=UDim2.new(0.5,-54,0,24)an.BackgroundColor3=ak an.
BackgroundTransparency=0.22 an.BorderSizePixel=0 an.Active=true an.Parent=am
local aC=Instance.new'UICorner'aC.CornerRadius=UDim.new(0,15)aC.Parent=an ar=
Instance.new'UIStroke'ar.Name='BorderStroke'ar.Color=ai ar.Thickness=1.4 ar.
Transparency=0.3 ar.Parent=an ap=Instance.new'Frame'ap.Name='DotGlow'ap.Size=
UDim2.fromOffset(20,20)ap.Position=UDim2.new(0,5,0.5,-10)ap.BackgroundColor3=ai
ap.BackgroundTransparency=0.75 ap.BorderSizePixel=0 ap.Parent=an local aF=
Instance.new'UICorner'aF.CornerRadius=UDim.new(1,0)aF.Parent=ap ao=Instance.new
'Frame'ao.Name='StatusDot'ao.Size=UDim2.fromOffset(12,12)ao.Position=UDim2.new(0
,9,0.5,-6)ao.BackgroundColor3=ai ao.BorderSizePixel=0 ao.Parent=an local aG=
Instance.new'UICorner'aG.CornerRadius=UDim.new(1,0)aG.Parent=ao av=Instance.new
'UIStroke'av.Name='DotStroke'av.Color=ai av.Thickness=1.5 av.Transparency=0.15
av.Parent=ao aq=Instance.new'TextLabel'aq.Name='StatusText'aq.Size=UDim2.new(1,-
26,1,0)aq.Position=UDim2.new(0,26,0,0)aq.BackgroundTransparency=1 aq.Font=Enum.
Font.GothamBold aq.TextSize=11 aq.TextColor3=ai aq.TextXAlignment=Enum.
TextXAlignment.Center aq.TextYAlignment=Enum.TextYAlignment.Center aq.RichText=
true aq.Text='<b>SAFE</b>'aq.Parent=an az(an)end,function(aA)if ax then ax:
Cancel()ax=nil end if not ap then return end if aA then ap.
BackgroundTransparency=0.35 ap.Size=UDim2.fromOffset(18,18)ap.Position=UDim2.
new(0,6,0.5,-9)local aB=TweenInfo.new(0.45,Enum.EasingStyle.Sine,Enum.
EasingDirection.InOut,-1,true)ax=aa:Create(ap,aB,{BackgroundTransparency=0.85,
Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,3,0.5,-12)})ax:Play()else ap.
BackgroundTransparency=0.75 ap.Size=UDim2.fromOffset(20,20)ap.Position=UDim2.
new(0,5,0.5,-10)end end function af.UpdateStatus(aC,aF)ah=aC and true or false
al=aF if not ag then if am then am.Enabled=false end return end aA()if not am or
not an or not ao or not aq or not ar or not av or not ap then return end am.
Enabled=true local aG=ah and aj or ai ao.BackgroundColor3=aG av.Color=aG ar.
Color=aG ap.BackgroundColor3=aG if ah then local aH=aF and(#aF>0)and aF or
'DANGER'if#aH>18 then aH=string.sub(aH,1,16)..'..'end if aF and#aF>0 then an.
Size=UDim2.fromOffset(math.clamp(100+(#aH*6),116,220),30)aq.Text=string.format(
"<b>DANGER</b> <font color='rgb(255,200,80)'>| %s</font>",aH)else an.Size=UDim2.
fromOffset(116,30)aq.Text='<b>IN DANGER</b>'end aq.TextColor3=aj aB(true)else an
.Size=UDim2.fromOffset(100,30)aq.Text='<b>SAFE</b>'aq.TextColor3=ai aB(false)end
end function af.SetEnabled(aC)ag=aC and true or false if am then am.Enabled=ag
end if ag then aA()af.UpdateStatus(ah,al)else aB(false)end end function af.
IsEnabled()return ag end function af.Clear()aB(false)if am then pcall(function()
am:Destroy()end)am=nil end an=nil ao=nil ap=nil aq=nil ar=nil av=nil end ae.
Register(function()af.Clear()end)return af end function a.J()local aa,ab,ac,ad,
ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI=game:
GetService'RunService',game:GetService'Players',game:GetService'Workspace',a.
load'e',a.load'f',a.load'q',a.load'b',a.load'F',a.load'H',a.load'C',{},false,1.2
,false,true,false,'IDLE',0,3,true,true,true,true,14,Vector3.zero,Vector3.zero,
Vector3.zero,os.clock(),{}local aJ,aK,aL,aM,aN=function()local aJ=(ad and ad.
player)or ab.LocalPlayer if not aJ then return nil,nil,nil end local aK=aJ.
Character if not aK or not aK.Parent then return nil,nil,nil end local aL=aK:
FindFirstChildOfClass'Humanoid'if aL and aL.Health<=0 then return nil,nil,nil
end local aM=aK:FindFirstChild'HumanoidRootPart'or aK.PrimaryPart if not aM then
return nil,nil,nil end return aK,aL,aM end,function()if ae.DisableControls then
ae.DisableControls'DodgeV2'end end,function()if ae.EnableControls then ae.
EnableControls'DodgeV2'end end,function(aJ,aK)if not ay or not aJ or not aK then
return end local aL=aj.FindBossModel and aj.FindBossModel()if bossRoot then
faceTargetPos=bossRoot.Position else local aM=ae.GetCombatTarget and ae.
GetCombatTarget()if aM and aM.Root then faceTargetPos=aM.Root.Position end end
if faceTargetPos then local aM=Vector3.new(faceTargetPos.X-aJ.Position.X,0,
faceTargetPos.Z-aJ.Position.Z)if aM.Magnitude>2 then pcall(function()aK.
AutoRotate=false aJ.CFrame=CFrame.lookAt(aJ.Position,Vector3.new(faceTargetPos.X
,aJ.Position.Y,faceTargetPos.Z))end)return end end pcall(function()aK.AutoRotate
=true end)end,function(aJ,aK)local aL=Vector3.new(aK.X-aJ.X,0,aK.Z-aJ.Z)local aM
=aL.Magnitude if aM<=0.1 then return Vector3.zero end local aN=aL.Unit if not az
or aM<=3 then return aN end local aO=aJ+aN*(aM*0.5)if not ah.IsPointSafe(aO,0.5)
then local aP=ah.GetActiveHazards()if aP then for aQ,aS in pairs(aP)do if aS.
shape and aS.shape.x and aS.shape.z then local aT=Vector3.new(aS.shape.x,0,aS.
shape.z)local aU=Vector3.new(aJ.X-aT.X,0,aJ.Z-aT.Z)if aU.Magnitude>0.1 then
local aV=aU.Unit local aW,aX=Vector3.new(-aV.Z,0,aV.X),Vector3.new(aV.Z,0,-aV.X)
local aY=(aW:Dot(aN)>aX:Dot(aN))and aW or aX local aZ=(aN+aY*0.7).Unit return aZ
end end end end end return aN end local aO,aQ,aS,aT=function()if moveDriverConn
then return end local aO=aa.PreSimulation or aa.RenderStepped or aa.Heartbeat aH
=os.clock()moveDriverConn=aO:Connect(function()if not ap or aq=='HOLDING_SAFE'
then return end local aP,aQ,aS=aJ()if not aQ or not aS then return end local aT=
os.clock()local aU=math.clamp(aT-aH,0.001,0.1)aH=aT if ax and aF.Magnitude>0.01
then local aV=math.clamp(aU*aB,0.08,0.4)aG=aG:Lerp(aF,aV)if aG.Magnitude>0.01
then aC=aG.Unit else aC=aF end else aC=aF aG=aF end if aC.Magnitude>0.01 then aQ
:Move(aC,false)end if ay then aM(aS,aQ)end end)end,function()if moveDriverConn
then moveDriverConn:Disconnect()moveDriverConn=nil end aF=Vector3.zero aG=
Vector3.zero aC=Vector3.zero end,function(aO)local aP,aQ,aS=aJ()if not aS or not
aO then aF=Vector3.zero aC=Vector3.zero return end aF=aN(aS.Position,aO)end,
function(aO)if not aO then return end pcall(function()local aQ=aO.
AssemblyLinearVelocity or aO.Velocity if aQ then aO.AssemblyLinearVelocity=
Vector3.new(0,aQ.Y,0)end end)end local aU,aV,aW=function(aU,aV)aF=Vector3.zero
aG=Vector3.zero aC=Vector3.zero aQ()if aU then pcall(function()aU:Move(Vector3.
zero,false)aU.AutoRotate=true end)end if aV then aT(aV)end aL()end,function(aU,
aV,aW,aX)for aY,aZ in ipairs(aI)do pcall(aZ,aU,aV,aW,aX)end end,function(aU,aV)
local aW=ah.GetActiveHazards()if not aW or next(aW)==nil then return false end
local aX=aV*aV for aY,aZ in pairs(aW)do if aZ.shape then local a_,a0=aZ.shape.x
or 0,aZ.shape.z or 0 local a1=(aU.X-a_)^2+(aU.Z-a0)^2 if a1<=aX then return true
end end end return false end function ak.Clear()if ap or activeTargetSpot or aq
~='IDLE'then activeTargetSpot=nil ap=false aq='IDLE'local aX,aY,aZ=aJ()aU(aY,aZ)
aV(false,nil,0,'IDLE')end end local aX=function()if not al then if ap or
activeTargetSpot or aq~='IDLE'then ak.Clear()end return end local aX,aY,aZ=aJ()
if not aX or not aY or not aZ then if ap or activeTargetSpot or aq~='IDLE'then
ak.Clear()end return end if ae.IsInvulnerable and ae.IsInvulnerable()then ak.
Clear()return end if(af.IsActiveDodgeDisabled and af.IsActiveDodgeDisabled())or(
af.IsActiveHazardScannerEnabled and not af.IsActiveHazardScannerEnabled())then
ak.Clear()return end local a_,a0,a1=ah.IsPlayerInDanger()if not a_ and aq==
'IDLE'then if ap or activeTargetSpot then ak.Clear()end return end local a2,a3,
a4,a5,a6=os.clock(),aZ.Position,ai.GetSafeSpot()if a4 then activeTargetSpot=a4
elseif a_ and not activeTargetSpot then local a7=ai.FindNearestSafeSpot(a3,true)
if a7 then activeTargetSpot=a7 end end if activeTargetSpot and not ai.
IsPointSafe(activeTargetSpot,0.5)then local a7=ai.FindNearestSafeSpot(a3,true)if
a7 then activeTargetSpot=a7 end end if a_ or(activeTargetSpot and aq=='DODGING')
then if not activeTargetSpot then return end local a7=Vector3.new(
activeTargetSpot.X-a3.X,0,activeTargetSpot.Z-a3.Z)local a8=a7.Magnitude if a8<=
am or(not a_ and a8<=2)then if an and a8<=am then local a9,b=aZ.CFrame,Vector3.
new(activeTargetSpot.X,a3.Y,activeTargetSpot.Z)aX:PivotTo(CFrame.new(b)*(a9-a9.
Position))end if not a_ and ai.FindRepositionSpot then local a9=aj.FindBossModel
and aj.FindBossModel()local b=bossRoot and bossRoot.Position if not b then local
ba=ae.GetCombatTarget and ae.GetCombatTarget()if ba and ba.Root then b=ba.Root.
Position end end if b then local ba,bb=af.GetActiveCombatDistances()local bc,bd=
ai.FindRepositionSpot(a3,b,ba,bb)if bd and bc and(bc-a3).Magnitude>2 then
activeTargetSpot=bc aq='DODGING'ap=true aS(bc)aV(true,activeTargetSpot,(bc-a3).
Magnitude,'REPOSITIONING')return end end end aT(aZ)aF=Vector3.zero aG=Vector3.
zero aC=Vector3.zero aQ()if aY then pcall(function()aY:Move(Vector3.zero,false)
aY.AutoRotate=true end)end local a9=ao and aW(a3,40)if a9 then aq='HOLDING_SAFE'
ar=a2 ap=true aV(true,activeTargetSpot,a8,'HOLDING_SAFE')else aq='IDLE'ap=false
activeTargetSpot=nil aL()aV(false,nil,0,'IDLE')end else if aq~='DODGING'then aq=
'DODGING'ap=true aK()aO()aV(true,activeTargetSpot,a8,'DODGING')end aS(
activeTargetSpot)end return end if aq=='HOLDING_SAFE'then pcall(function()local
a7=aZ.AssemblyLinearVelocity or aZ.Velocity if a7 and(a7.X*a7.X+a7.Z*a7.Z>1)then
aZ.AssemblyLinearVelocity=Vector3.new(0,a7.Y,0)end end)aC=Vector3.zero if a_
then aq='DODGING'ap=true aK()aO()return end local a7=aW(a3,40)if not a7 or(a2-ar
>=av)then aq='IDLE'ap=false activeTargetSpot=nil aQ()aL()aV(false,nil,0,'IDLE')
end return end if ap or activeTargetSpot or aq~='IDLE'then ak.Clear()end end
local aY=function()if not heartbeatConn then heartbeatConn=aa.Heartbeat:Connect(
aX)end end function ak.Cleanup()if heartbeatConn then heartbeatConn:Disconnect()
heartbeatConn=nil end ak.Clear()table.clear(aI)end function ak.SetEnabled(aZ)al=
aZ and true or false if not al then ak.Clear()end end function ak.IsEnabled()
return al end function ak.IsDodging()return ap end function ak.GetState()return
aq end function ak.GetTargetSpot()return activeTargetSpot end function ak.
SetSnapDistance(aZ)if type(aZ)=='number'and aZ>=0.5 and aZ<=5 then am=aZ end end
function ak.GetSnapDistance()return am end function ak.SetEnableSnap(aZ)an=aZ
and true or false end function ak.IsEnableSnap()return an end function ak.
SetEnableHolding(aZ)ao=aZ and true or false if not ao and aq=='HOLDING_SAFE'then
aq='IDLE'ap=false activeTargetSpot=nil aQ()aL()aV(false,nil,0,'IDLE')end end
function ak.IsEnableHolding()return ao end function ak.OnDodgeStateChanged(aZ)if
type(aZ)=='function'then table.insert(aI,aZ)end end function ak.
SetMomentumBlending(aZ)ax=aZ and true or false end function ak.
IsMomentumBlending()return ax end function ak.SetCombatFacing(aZ)ay=aZ and true
or false end function ak.IsCombatFacing()return ay end function ak.
SetArcStrafing(aZ)az=aZ and true or false end function ak.IsArcStrafing()return
az end function ak.SetFlowState(aZ)aA=aZ and true or false end function ak.
IsFlowState()return aA end function ak.SetTurnSharpness(aZ)if type(aZ)=='number'
and aZ>=2 and aZ<=40 then aB=aZ end end function ak.GetTurnSharpness()return aB
end if ae.OnRoomIndexChanged then ae.OnRoomIndexChanged(function()ak.Clear()end)
end if ae.OnEnemyChanged then ae.OnEnemyChanged(function()if ae.GetEnemyCount
and ae.GetEnemyCount()==0 then ak.Clear()end end)end if ae.OnLobbyChanged then
ae.OnLobbyChanged(function()ak.Clear()end)end if ae.OnBossActiveChanged then ae.
OnBossActiveChanged(function()ak.Clear()end)end aY()ag.Register(function()ak.
Cleanup()end)return ak end function a.K()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,
al,am,an,ao=game:GetService'Workspace',a.load'F',a.load'z',a.load'H',a.load'q',a
.load'f',{},5,6,4,3.5,3,1.5,1,0 local ap=function(ap)local aq=Vector3.new(-ap.Z,
0,ap.X)*an return aq end function ag.SwitchOrbit()local aq=os.clock()if aq-ao>
1.5 then an=-an ao=aq end end local aq=function(aq,ar)if not ab.IsPointSafe(aq,
0.8)then return-999 end local av=999 if ar then for ax,ay in pairs(ar)do if ay.
shape and ay.shape.x and ay.shape.z then local az,aA=aq.X-ay.shape.x,aq.Z-ay.
shape.z local aB=math.sqrt(az*az+aA*aA)local aC=aB-(ay.shape.radius or ay.shape.
halfLength or 15)if aC<av then av=aC end end end end return av end local ar=
function(ar,av,ax,ay)local az,aA=(-math.huge)for aB=0,15 do local aC=(aB/16)*(
math.pi*2)local aF,aG=av.X+math.cos(aC)*ax,av.Z+math.sin(aC)*ax local aH=Vector3
.new(aF,ar.Y,aG)local aI=aq(aH,ay)if aI>0 then local aJ=999 for aK=0,315,90 do
local aL=math.rad(aK)local aM=Vector3.new(math.cos(aL),0,math.sin(aL))local aN=
ad.GetWallDistance and ad.GetWallDistance(aH,aM,15)if aN and aN<aJ then aJ=aN
end end if aJ>=3.5 then local aK=(aH-ar).Magnitude local aL=aI*1.5+aJ*2-(aK*0.8)
if aL>az then az=aL aA=aH end end end end return aA,az end function ag.
EvaluateTacticalFlow(av,ax,ay,az,aA)if not av or not ax then return'HOLD_WAIT',
Vector3.zero,nil,'No Target/Position'end if ab.IsPlayerInDanger()then return
'DODGE_PREEMPT',Vector3.zero,nil,'Emergency Dodge'end local aB,aC,aF,aG,aH,aI=ab
.GetActiveHazards(),ae.GetActiveBossArea(ay)local aJ,aK=0,{}for aL=0,315,45 do
local aM=math.rad(aL)local aN=Vector3.new(math.cos(aM),0,math.sin(aM))local aO=
av+aN*2 if ab.IsPointSafe(aO,0.4)then local aQ=ad.GetWallDistance and ad.
GetWallDistance(av,aN,2.5)if not aQ or aQ>=2 then aJ+=1 table.insert(aK,aN)end
end end if aJ==0 then return'HOLD_WAIT',Vector3.zero,av,
'Pocket Trap (Wait For Hazard)'end local aL,aM=Vector3.zero,Vector3.zero if aB
then for aN,aO in pairs(aB)do if aO.shape and aO.shape.x and aO.shape.z then
local aQ=Vector3.new(aO.shape.x,0,aO.shape.z)local aS=Vector3.new(av.X-aQ.X,0,av
.Z-aQ.Z)local aT,aU=aS.Magnitude,aO.shape.radius or aO.shape.halfLength or 12
local aV=aU+14 if aT<aV and aT>0.1 then local aW=math.clamp((aV-aT)/aV,0,1)aM+=
aS.Unit*(aW*ah)end end if aO.shape and aO.shape.corridor then local aQ=aO.shape.
corridor local aS,aT,aU,aV,aW,aX=ac.GetThreatMetrics(av,aQ,aO.motion,0)if aX and
aX.Magnitude>0.1 then aM+=aX*ai end end end end aL+=aM local aN=Vector3.zero if
ad.GetWallDistance then for aO=0,315,45 do local aQ=math.rad(aO)local aW=Vector3
.new(math.cos(aQ),0,math.sin(aQ))local aX=ad.GetWallDistance(av,aW,8)if aX and
aX<7 then local aY=(7-aX)/7 aN-=aW*(aY*aj)end end end aL+=aN local aO=Vector3.
zero if aC and aG and aF and aF>0 then local aQ,aW=Vector3.new(aG.X,0,aG.Z),
Vector3.new(av.X,0,av.Z)local aX,aY=(aW-aQ).Magnitude,(aQ-aW).Magnitude>0.1 and(
aQ-aW).Unit or Vector3.new(0,0,1)if aH and aI and aI>0 then local aZ=(aI+aF)*0.5
local a_=aX-aZ if a_>4 then aO+=aY*math.clamp(a_/8,0.5,1)*ak elseif a_<-3 then
aO-=aY*math.clamp(math.abs(a_)/6,0.8,1.5)*ak end else if aX>(aF-10)then aO+=aY*
ak end end end aL+=aO local aQ,aW=Vector3.zero,(az+aA)*0.5 if aC and aG and aH
and aI and aI>0 then local aX=(aI+aF)*0.5 aW=math.clamp(aX,az+1,aA-1)end local
aX,aY=ar(av,ax,aW,aB)if aX then local aZ=Vector3.new(aX.X-av.X,0,aX.Z-av.Z)if aZ
.Magnitude>2 then aQ=aZ.Unit*al end end aL+=aQ local aZ=Vector3.new(av.X-ax.X,0,
av.Z-ax.Z)local a_=aZ.Magnitude local a0,a1=a_>0.1 and aZ.Unit or Vector3.new(0,
0,1),Vector3.zero if a_<(az+2)then a1+=a0*3 elseif a_>(aA-2)then a1-=a0*3 else
local a2=ap(-a0)a1+=a2*am end aL+=a1 local a2=aL.Magnitude>0.05 and aL.Unit or
ap(-a0)local a3=av+a2*2 if ab.IsPointSafe(a3,0.4)then local a4=ad.
GetWallDistance and ad.GetWallDistance(av,a2,2.5)if not a4 or a4>=2 then return
'MOVE',a2,aX,'Tactical Flow (Open Space)'end end local a4,a5=(-math.huge)for a6,
a7 in ipairs(aK)do local a8=a7:Dot(a2)if a8>a4 then a4=a8 a5=a7 end end if a5
and a4>-0.5 then return'MOVE',a5,aX,'Tactical Flow (Divert)'end return
'HOLD_WAIT',Vector3.zero,av,'Pocket Trap (Wait For Opening)'end return ag end
function a.L()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax=
game:GetService'Workspace',a.load'e',a.load'b',a.load'y',a.load'A',a.load'B',a.
load'C',a.load'D',a.load'E',a.load'z',a.load'F',a.load'H',a.load'I',a.load'J',a.
load'G',a.load'K',{},false,false,{}ak.SetHazardsMap(ax)ak.OnDangerChanged(
function(ay,az,aA)local aB=az and(az.name or az.Name)or nil am.UpdateStatus(ay,
aB)end)local ay,az,aA,aB,aC={},{},function(ay,az)if not ay or not ay:IsA
'BasePart'then return end if ad.IsPlayerCharacter(ay)or(az and ad.
IsPlayerCharacter(az))then return end if ad.IsPlayerAbility(ay)or(az and ad.
IsPlayerAbility(az))then return end if not ad.IsHazardPart(ay,az)then return end
if ax[ay]then return end local aA=az and az.Name or(ay.Parent and ay.Parent.Name
)or ay.Name local aB=ad.IsMultiRing(aA)or ad.IsMultiRing(ay)or(ay.Parent and ad.
IsMultiRing(ay.Parent.Name))or(az and ad.IsMultiRing(az))if aB then for aC,aF in
pairs(ax)do if aF.level1Parent==az or(az and aC:IsDescendantOf(az))or aC==ay
then return end end end local aC=ad.IsIceSpikes(aA)or ad.IsIceSpikes(ay)or(ay.
Parent and ad.IsIceSpikes(ay.Parent.Name))or(az and ad.IsIceSpikes(az))if aC
then for aF,aG in pairs(ax)do if aG.level1Parent==az or(az and aF:
IsDescendantOf(az))or aF==ay then return end end end local aF=ae.
AnalyzeHazardPart(ay)if not aF then return end local aG,aH=os.clock(),Vector3.
new(aF.x,aF.y,aF.z)local aI,aJ=af.UpdateRecord(ay,aH,aF.yaw or 0),(ay.Name==aA)
and aA or(aA..'/'..ay.Name)if aB then aJ=aA elseif ad.IsSweepingFlames(aA)and ay
.Parent and ay.Parent~=az then aJ=aA..'/'..ay.Parent.Name elseif ad.
IsMemoryModel(aA)then aJ=aA..'/'..ay.Name end local aK={part=ay,level1Parent=az
or ay,name=aJ,spawnTime=aG,shape=aF,motion=aI}ax[ay]=aK if ai.IsEnabled()then ai
.Update(ay,aK)end end,function(ay)local az=ax[ay]if az then ao.
OnHazardUnregistered(ay,az)ai.Detach(ay)ax[ay]=nil af.RemoveRecord(ay)aj.
RemoveRecord(ay)if ay.Parent and ay.Parent:IsA'Model'then aj.RemoveRecord(ay.
Parent)end end end local aF,aG,aH,aI=function(aF)if not ad.
IsValidLevel1WorkspaceChild(aF)then return end if ad.IsPlayerAbility(aF)or ad.
IsPlayerCharacter(aF)then return end local aG=ad.FindHazardPartsInLevel1Child(aF
)for aH,aI in ipairs(aG)do aA(aI,aF)end if aF:IsA'Model'then ay[aF]=aF.
DescendantAdded:Connect(function(aH)if aH:IsA'BasePart'then if ad.
IsPlayerAbility(aH)or ad.IsPlayerAbility(aF)then return end if ad.
IsPlayerCharacter(aH)or ad.IsPlayerCharacter(aF)then return end if ad.
IsMultiRing(aF)or ad.IsIceSpikes(aF)then local aI=false for aJ,aK in pairs(ax)do
if aK.level1Parent==aF or aJ:IsDescendantOf(aF)or aJ==aF then aI=true break end
end if not aI and ad.IsHazardPart(aH,aF)then aA(aH,aF)end elseif ad.
IsHazardPart(aH,aF)then aA(aH,aF)end end end)end end,function(aF)if ay[aF]then
ay[aF]:Disconnect()ay[aF]=nil end local aG={}for aH,aI in pairs(ax)do if aI.
level1Parent==aF or aH==aF or(aF:IsA'Instance'and aH:IsDescendantOf(aF))then
table.insert(aG,aH)end end for aH,aI in ipairs(aG)do aB(aI)end aj.RemoveRecord(
aF)end,function()for aF,aG in ipairs(aa:GetChildren())do if ad.
IsValidLevel1WorkspaceChild(aG)then local aH=ad.FindHazardPartsInLevel1Child(aG)
for aI,aJ in ipairs(aH)do aA(aJ,aG)end end end end,function()if not ar then
return end local aF,aG={},os.clock()ah.Update(aG)for aH,aI in pairs(ax)do if not
aH or not aH:IsDescendantOf(aa)then table.insert(aF,aH)continue end if aI.
level1Parent and not aI.level1Parent:IsDescendantOf(aa)then table.insert(aF,aH)
continue end local aJ,aK,aL,aM=ad.IsMultiRing(aI.name)or ad.IsMultiRing(aH)or(aI
.level1Parent and ad.IsMultiRing(aI.level1Parent)),ad.IsSweepingFlames(aI.name)
or ad.IsSweepingFlames(aH)or(aI.level1Parent and ad.IsSweepingFlames(aI.
level1Parent)),ad.IsMemoryModel(aI.name)or ad.IsMemoryModel(aH)or(aI.
level1Parent and ad.IsMemoryModel(aI.level1Parent)),ad.IsFirstBossBigSpike(aI.
name)or ad.IsFirstBossBigSpike(aH)or(aI.level1Parent and ad.IsFirstBossBigSpike(
aI.level1Parent))if aJ then local aN=aG-aI.spawnTime if aN>4.5 then table.
insert(aF,aH)continue end local aO=(aI.level1Parent and aI.level1Parent:IsA
'Model'and aI.level1Parent)or(aH.Parent and aH.Parent:IsA'Model'and aH.Parent)if
aO then local aQ=false for aW,aX in ipairs(aO:GetDescendants())do if aX:IsA
'BasePart'and aX.Name~='PrimaryPart'then if aX.Transparency<=0.85 then aQ=true
break end end end if not aQ then table.insert(aF,aH)continue end elseif aH.
Transparency>0.85 then table.insert(aF,aH)continue end elseif aK then local aN=
false if aH.Transparency<=0.85 then aN=true else local aO=aH:
FindFirstChildWhichIsA'ParticleEmitter'if aO and aO.Enabled then aN=true end end
local aO=aG-aI.spawnTime if not aN or aO>2 then table.insert(aF,aH)continue end
elseif aL then local aN=false if aH.Transparency<=0.85 then aN=true else local
aO=aH:FindFirstChildWhichIsA'ParticleEmitter'if aO and aO.Enabled then aN=true
end end local aO=aG-aI.spawnTime if not aN or aO>2.5 then table.insert(aF,aH)
continue end elseif aM then local aN=false if aH.Transparency<=0.85 then aN=true
else local aO=aa:FindFirstChild'firstBossBeamPart'if aO then aN=true end end
local aO=aG-aI.spawnTime if not aN or aO>5 then table.insert(aF,aH)continue end
else if aH.Transparency>0.85 then table.insert(aF,aH)continue end end local aN=
af.GetRecord(aH)local aO=ae.AnalyzeHazardPart(aH,aN)if aO then aI.shape=aO local
aQ=Vector3.new(aO.x,aO.y,aO.z)aI.motion=af.UpdateRecord(aH,aQ,aO.yaw or 0)if ai.
IsEnabled()or ai.IsCorridorEnabled()then ai.Update(aH,aI)end else table.insert(
aF,aH)end end for aH,aI in ipairs(aF)do aB(aI)end for aH,aI in ipairs(aa:
GetChildren())do if ad.IsSweepingFlames(aI)and aI:IsA'Model'then for aJ,aK in
ipairs(aI:GetDescendants())do if aK:IsA'BasePart'and aK.Name:lower()=='precast'
and not ax[aK]then if ad.IsHazardPart(aK,aI)then aA(aK,aI)end end end elseif ad.
IsMemoryModel(aI)and aI:IsA'Model'then for aJ,aK in ipairs(aI:GetDescendants())
do if aK:IsA'BasePart'and not ax[aK]then if ad.IsHazardPart(aK,aI)then aA(aK,aI)
end end end elseif ad.IsFirstBossBigSpike(aI)then local aJ=ad.
FindHazardPartsInLevel1Child(aI)for aK,aL in ipairs(aJ)do if not ax[aL]and ad.
IsHazardPart(aL,aI)then aA(aL,aI)end end end end end function aq.StartScan()if
ar then return end ar=true table.clear(ax)table.clear(ay)af.ClearAll()ah.Reset()
table.insert(az,aa.ChildAdded:Connect(aF))table.insert(az,aa.ChildRemoved:
Connect(aG))local aJ=ab.RunService or game:GetService'RunService'aC=aJ.Heartbeat
:Connect(aI)aH()if av then ak.SetEnabled(true)end end function aq.StopScan()if
not ar then return end ar=false if aC then aC:Disconnect()aC=nil end for aJ,aK
in ipairs(az)do if aK and aK.Disconnect then aK:Disconnect()end end table.clear(
az)for aJ,aK in pairs(ay)do if aK and aK.Disconnect then aK:Disconnect()end end
table.clear(ay)ai.ClearAll()table.clear(ax)af.ClearAll()aj.ClearAll()ah.Reset()
ak.SetEnabled(false)ak.Clear()al.ClearVisuals()am.Clear()an.Clear()end function
aq.IsEnabled()return ar end function aq.SetVisualizerEnabled(aJ)if aJ and not aq
.IsEnabled()then aq.StartScan()end ai.SetEnabled(aJ)if ai.IsEnabled()or ai.
IsCorridorEnabled()then for aK,aL in pairs(ax)do ai.Update(aK,aL)end end if not
ai.IsEnabled()and not aj.IsEnabled()and not av then aq.StopScan()end end
function aq.IsVisualizerEnabled()return ai.IsEnabled()end function aq.
SetCorridorEnabled(aJ)if aJ and not aq.IsEnabled()then aq.StartScan()end aj.
SetEnabled(aJ)ai.SetCorridorEnabled(aJ)if ai.IsEnabled()or ai.IsCorridorEnabled(
)then for aK,aL in pairs(ax)do ai.Update(aK,aL)end end if not ai.IsEnabled()and
not aj.IsEnabled()and not av then aq.StopScan()end end function aq.
IsCorridorEnabled()return aj.IsEnabled()and ai.IsCorridorEnabled()end function
aq.SetDangerDetectionEnabled(aJ)av=aJ and true or false if av and not aq.
IsEnabled()then aq.StartScan()end ak.SetEnabled(av)am.SetEnabled(av)if not ai.
IsEnabled()and not aj.IsEnabled()and not av then aq.StopScan()end end function
aq.IsDangerDetectionEnabled()return av end function aq.IsPointInAnyCorridor(aJ,
aK)if not aJ then return false,nil end for aL,aM in pairs(ax)do if aM.shape and
aM.shape.corridor then if aj.IsPointInCorridor(aJ,aM.shape.corridor,aK)then
return true,aM end end end return false,nil end function aq.GetActiveCorridors()
local aJ={}for aK,aL in pairs(ax)do if aL.shape and aL.shape.corridor then table
.insert(aJ,{part=aK,name=aL.name,corridor=aL.shape.corridor})end end return aJ
end aq.Corridor=aj aq.Danger=ak aq.IsPlayerInDanger=ak.IsPlayerInDanger aq.
IsPointInDanger=ak.IsPointInDanger aq.IsPointSafe=ak.IsPointSafe aq.
GetRelevantHazards=ak.GetRelevantHazards aq.SetDangerVisualEnabled=ak.
SetVisualEnabled aq.IsDangerVisualEnabled=ak.IsVisualEnabled aq.OnDangerChanged=
ak.OnDangerChanged aq.SetPlayerHitboxRadius=ak.SetPlayerRadius aq.
GetPlayerHitboxRadius=ak.GetPlayerRadius aq.GetPlayerHitboxShape=ak.GetShapeMode
aq.SetPlayerHitboxShape=ak.SetShapeMode aq.GetPlayerHitboxWidth=ak.
GetPlayerWidth aq.SetPlayerHitboxWidth=ak.SetPlayerWidth aq.
GetPlayerHitboxLength=ak.GetPlayerLength aq.SetPlayerHitboxLength=ak.
SetPlayerLength aq.SafeSpot=al aq.FindNearestSafeSpot=al.FindNearestSafeSpot aq.
GetSafeSpot=al.GetSafeSpot aq.SetSafeSpotEnabled=al.SetEnabled aq.
IsSafeSpotEnabled=al.IsEnabled aq.SetSafeSpotVisualEnabled=al.SetVisualEnabled
aq.IsSafeSpotVisualEnabled=al.IsVisualEnabled aq.SetSafeSpotVectorsEnabled=al.
SetShowVectors aq.IsSafeSpotVectorsEnabled=al.IsShowVectors aq.
SetSafeSpotMarkerEnabled=al.SetShowMarker aq.IsSafeSpotMarkerEnabled=al.
IsShowMarker aq.SetSafeSpotRayCount=al.SetRayCount aq.GetSafeSpotRayCount=al.
GetRayCount aq.SetSafeSpotEscapeMargin=al.SetEscapeMargin aq.
GetSafeSpotEscapeMargin=al.GetEscapeMargin aq.SetSafeSpotMaxRadius=al.
SetMaxRadius aq.GetSafeSpotMaxRadius=al.GetMaxRadius aq.SetSafeSpotAdaptive=al.
SetAdaptive aq.IsSafeSpotAdaptive=al.IsAdaptive aq.IsSafeSpotEmergency=al.
IsEmergency aq.OnSafeSpotChanged=al.OnSafeSpotChanged aq.
SetSafeSpotScoringV2Enabled=al.SetEnableScoringV2 aq.IsSafeSpotScoringV2Enabled=
al.IsEnableScoringV2 aq.Dodge=an function aq.SetAutoDodgeEnabled(aJ)if aJ then
if not aq.IsEnabled()then aq.StartScan()end if not aq.IsDangerDetectionEnabled()
then aq.SetDangerDetectionEnabled(true)end if not al.IsEnabled()then al.
SetEnabled(true)end end an.SetEnabled(aJ)end aq.IsAutoDodgeEnabled=an.IsEnabled
aq.IsCurrentlyDodging=an.IsDodging aq.GetDodgeTarget=an.GetTargetSpot aq.
SetDodgeSnapDistance=an.SetSnapDistance aq.GetDodgeSnapDistance=an.
GetSnapDistance aq.SetDodgeEnableSnap=an.SetEnableSnap aq.IsDodgeEnableSnap=an.
IsEnableSnap aq.SetDodgeEnableHolding=an.SetEnableHolding aq.
IsDodgeEnableHolding=an.IsEnableHolding aq.OnDodgeStateChanged=an.
OnDodgeStateChanged aq.HudIndicator=am aq.SetHudIndicatorEnabled=am.SetEnabled
aq.IsHudIndicatorEnabled=am.IsEnabled aq.Temporal=ao aq.SetTemporalEnabled=ao.
SetEnabled aq.IsTemporalEnabled=ao.IsEnabled aq.SetTemporalFuturePrediction=ao.
SetFuturePrediction aq.IsTemporalFuturePrediction=ao.IsFuturePrediction aq.
SetTemporalPhaseThrough=ao.SetPhaseThrough aq.IsTemporalPhaseThrough=ao.
IsPhaseThrough aq.FindRepositionSpot=al.FindRepositionSpot aq.
SetMomentumBlending=an.SetMomentumBlending aq.IsMomentumBlending=an.
IsMomentumBlending aq.SetCombatFacing=an.SetCombatFacing aq.IsCombatFacing=an.
IsCombatFacing aq.SetArcStrafing=an.SetArcStrafing aq.IsArcStrafing=an.
IsArcStrafing aq.SetFlowState=an.SetFlowState aq.IsFlowState=an.IsFlowState aq.
SetTurnSharpness=an.SetTurnSharpness aq.GetTurnSharpness=an.GetTurnSharpness aq.
TacticalField=ap aq.EvaluateTacticalFlow=ap.EvaluateTacticalFlow function aq.
GetActiveHazardsTelemetry()local aJ,aK={},os.clock()for aL,aM in pairs(ax)do
local aN=aM.shape if not aN then continue end local aO,aQ=af.
GetTrajectoryProjection(aL,1.5),aK-aM.spawnTime if aN.shape==
'compound_multiring'then table.insert(aJ,{id=tostring(aL),name=aM.name,shape=
'compound_multiring',x=aN.x,y=aN.y,z=aN.z,yaw=aN.yaw or 0,coreRadius=aN.
coreRadius or 12.5,maxRadius=aN.maxRadius or 105,rings=aN.rings,polygons=aN.
polygons,color=aN.color or'#3cd0d0',transparency=aN.transparency or 0.5,age=aQ,
motionType=aM.motion and aM.motion.motionType or'STATIC',speed=aM.motion and aM.
motion.speed or 0,angularVel=aM.motion and aM.motion.angularVel or 0,trajectory=
aO,corridor=aN.corridor})elseif aN.shape=='circle'then table.insert(aJ,{id=
tostring(aL),name=aM.name,shape='circle',x=aN.x,y=aN.y,z=aN.z,radius=aN.radius,
color=aN.color or'#ff2a55',age=aQ,motionType=aM.motion and aM.motion.motionType
or'STATIC',speed=aM.motion and aM.motion.speed or 0,angularVel=aM.motion and aM.
motion.angularVel or 0,trajectory=aO,corridor=aN.corridor})elseif aN.shape==
'box'then table.insert(aJ,{id=tostring(aL),name=aM.name,shape='box',x=aN.x,y=aN.
y,z=aN.z,halfX=aN.halfX,halfZ=aN.halfZ,yaw=aN.yaw,vertices=aN.vertices,color=aN.
color or'#ff2a55',age=aQ,motionType=aM.motion and aM.motion.motionType or
'STATIC',speed=aM.motion and aM.motion.speed or 0,angularVel=aM.motion and aM.
motion.angularVel or 0,trajectory=aO,corridor=aN.corridor})elseif aN.shape==
'polygon'then table.insert(aJ,{id=tostring(aL),name=aM.name,shape='polygon',x=aN
.x,y=aN.y,z=aN.z,vertices=aN.vertices,color=aN.color or'#ff2a55',age=aQ,
motionType=aM.motion and aM.motion.motionType or'STATIC',speed=aM.motion and aM.
motion.speed or 0,angularVel=aM.motion and aM.motion.angularVel or 0,trajectory=
aO,corridor=aN.corridor})end end return aJ end function aq.
GetBossTelegraphTelemetry()return ag.GetBossTelegraphData()end function aq.
GetMemoryGameTelemetry()return ah.GetMemoryTelemetry()end ac.Register(function()
aq.StopScan()end)return aq end function a.M()local aa,ab,ac,ad=a.load'e',a.load
'f',a.load'b',a.load'k'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax=aa.
RunService or game:GetService'RunService',aa.VirtualInputManager or game:
GetService'VirtualInputManager',aa.player,{},false,35,0.15,4,0,0,false,false,-
math.huge,0 function ah.IsEnabled()return ai end local ay,az function ah.
SetEnabled(aA)local aB=aA==true if aB==ai then return end ai=aB if ai then ay()
else az()end end ah.IsSkillQEnabled=ah.IsEnabled ah.SetSkillQEnabled=ah.
SetEnabled ah.IsSkillEEnabled=ah.IsEnabled ah.SetSkillEEnabled=ah.SetEnabled
function ah.GetSkillERange()return aj end function ah.SetSkillERange(aA)if type(
aA)=='number'and aA>=2 then aj=aA end end function ah.GetSpamInterval()return ak
end function ah.SetSpamInterval(aA)if type(aA)=='number'and aA>=0.05 then ak=aA
end end function ah.GetBuffDuration()return al end function ah.SetBuffDuration(
aA)if type(aA)=='number'and aA>=0.5 then al=aA end end function ah.IsBuffActive(
)return(os.clock()-aq)<al end function ah.TriggerBuff()aq=os.clock()end function
ah.GetLastBuffTime()return aq end function ah.GetRemainingBuffTime()local aA=al-
(os.clock()-aq)return aA>0 and aA or 0 end local aA=function()local aA=ag or
game:GetService'Players'.LocalPlayer if not aA then return nil end local aB=aA:
FindFirstChild'Backpack'if aB then for aC,aF in ipairs(aB:GetChildren())do local
aG=aF:FindFirstChild'abilitySlot'if aG and string.lower(tostring(aG.Value))=='q'
then return aF end end end local aC=aA.Character if aC then for aF,aG in ipairs(
aC:GetChildren())do if aG:IsA'Tool'then local aH=aG:FindFirstChild'abilitySlot'
if aH and string.lower(tostring(aH.Value))=='q'then return aG end end end end
return nil end local aB=function()local aB=aA()if aB then local aC=aB:
FindFirstChild'cooldown'if aC and typeof(aC.Value)=='number'then return aC.Value
end end return nil end local aC,aF,aG,aH=function(aC)local aF=aB()if aF~=nil
then if aF>(ar+0.5)or(ar<=0.2 and aF>0.5)then aq=aC end ar=aF end end,function()
if ax then return end pcall(function()local aC=aa.ReplicatedStorage or game:
GetService'ReplicatedStorage'local aF=aC and aC:FindFirstChild'remotes'local aG=
aF and aF:FindFirstChild'abilityCast'if aG and aG:IsA'RemoteEvent'then ax=aG.
OnClientEvent:Connect(function(aH,aI)local aJ=ag or game:GetService'Players'.
LocalPlayer if aH==aJ then local aK=aA()if(aK and aK.Name==aI)or(not aK)then aq=
os.clock()end end end)end end)end,function()if ax then pcall(function()ax:
Disconnect()end)ax=nil end end,function()local aC=ag or game:GetService'Players'
.LocalPlayer local aF=aC and aC.Character local aG=aF and(aF:FindFirstChild
'HumanoidRootPart'or aF.PrimaryPart)if aG and aG.Parent then return aG end
return nil end local aI=function()local aI=aH()if not aI then return nil,math.
huge,false end local aJ,aK=aI.Position,ad.GetTarget and ad.GetTarget()if aK and
aK.Root and aK.Root.Parent then local aL=aK.Humanoid or(aK.Model and aK.Model:
FindFirstChildOfClass'Humanoid')if aL and aL.Health>0 then local aM=aK.Root.
Position local aN=Vector3.new(aM.X-aJ.X,0,aM.Z-aJ.Z).Magnitude return aK,aN,true
end end local aL,aM,aN,aO=ab.GetTrackedEnemyData and ab.GetTrackedEnemyData(),
math.huge,false if aL and#aL>0 then for aQ,aW in ipairs(aL)do if aW and aW.Root
and aW.Root.Parent then local aX=aW.Humanoid or(aW.Model and aW.Model:
FindFirstChildOfClass'Humanoid')if aX and aX.Health>0 then aN=true local aY=aW.
Root.Position local aZ,a_=aY.X-aJ.X,aY.Z-aJ.Z local a0=aZ*aZ+a_*a_ if a0<aM then
aM=a0 aO=aW end end end end end local aQ=aM<math.huge and math.sqrt(aM)or math.
huge return aO,aQ,aN end function ah.CastSkillQ()if ao then return end ao=true
task.spawn(function()local aJ=(ab.GetKeyHoldTime and ab.GetKeyHoldTime())or 0.05
pcall(function()af:SendKeyEvent(true,Enum.KeyCode.Q,false,game)end)task.wait(aJ)
pcall(function()af:SendKeyEvent(false,Enum.KeyCode.Q,false,game)end)ao=false end
)end function ah.CastSkillE()if ap then return end ap=true task.spawn(function()
local aJ=(ab.GetKeyHoldTime and ab.GetKeyHoldTime())or 0.05 pcall(function()af:
SendKeyEvent(true,Enum.KeyCode.E,false,game)end)task.wait(aJ)pcall(function()af:
SendKeyEvent(false,Enum.KeyCode.E,false,game)end)ap=false end)end local aJ=
function()if not ai or ab.IsInLobby()then return end local aJ=aH()if not aJ then
return end local aK=aJ.Parent local aL=aK and aK:FindFirstChildOfClass'Humanoid'
if aL and aL.Health<=0 then return end local aM,aN,aO=aI()local aQ=os.clock()aC(
aQ)if(aQ-am>=ak)and not ao then if aO then local aW=aB()local aX=(aW==nil)or(aW
<=0.2)if aX then am=aQ ah.CastSkillQ()if aW==nil and not ah.IsBuffActive()then
aq=aQ end end end end if(aQ-an>=ak)and not ap then if aM and aN<=aj then local
aW=ah.IsBuffActive()if aW then an=aQ ah.CastSkillE()end end end end ay=function(
)if not av then av=ae.Heartbeat:Connect(aJ)end aF()end az=function()if av then
av:Disconnect()av=nil end aG()ao=false ap=false ar=0 aq=-math.huge end function
ah.Step(aK,aL,aM)end ac.Register(function()ah.SetEnabled(false)end)return ah end
function a.N()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=a.load'e',a.load'f',a
.load'b',a.load'h',a.load'g',a.load'i',a.load'j',a.load'k',a.load'l',a.load'x',a
.load'L',a.load'M',a.load'q'local an,ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,aF,aG,aH,
aI,aJ,aK,aL,aM=function()if ak and ak.IsCurrentlyDodging and ak.
IsCurrentlyDodging()then return true end if aj and aj.IsCurrentlyDodging and aj.
IsCurrentlyDodging()then return true end return false end,function(an,ao)if ak
and ak.IsEnabled and ak.IsEnabled()and ak.IsPointSafe then return ak.
IsPointSafe(an,ao)end if aj and aj.IsPointSafe then return aj.IsPointSafe(an,ao)
end return true end,aa.RunService,aa.player,{NO_TARGET='NO_TARGET',
ACQUIRING_TARGET='ACQUIRING_TARGET',TRACKING_TARGET='TRACKING_TARGET',CHASE=
'CHASE',HOLD='HOLD',KITE='KITE',REPOSITION='REPOSITION',TACTICAL_FLOW=
'TACTICAL_FLOW',BLOCKED='BLOCKED',REPATHING='REPATHING'},{},false,false,1.5,15,
35,25,50,true,6,true,true,true,true,true local aN,aO,aQ,aW,aX,aY,aZ,a_,a0,a1,a2,
a3,a4,a5,a6,a7,a8,a9,b,ba,bb,bc,bd,be,bf,bg,bh,bi,bj,bk,bl,bm,bn,bo,bp,bq=ar.
NO_TARGET,'None',0,0,false,false,0,0,false,10,false,{},function()if ab.
DisableControls then ab.DisableControls'AutoFarm'end end,function()if ab.
EnableControls then ab.EnableControls'AutoFarm'end end,(Vector3.zero)local br,bs
,bt,bu,bv,bw,bx,by,bz=function()if bq then return end local br=ap.PreSimulation
or ap.RenderStepped or ap.Heartbeat bq=br:Connect(function()if not ay or a2 then
return end if an()then return end local bs=ab.GetHumanoid()if bs then bs:Move(a6
,false)end end)end,function()if bq then bq:Disconnect()bq=nil end a6=Vector3.
zero end,function(br)if br and br.Magnitude>0.05 then a6=Vector3.new(br.X,0,br.Z
).Unit else a6=Vector3.zero end end,function()a6=Vector3.zero end,function()
local br=aq and aq.Character local bs=br and br:FindFirstChild'HumanoidRootPart'
if bs and bs.Parent then return bs end return nil end,function(br)if not br or
not br.Parent then return nil end local bs,bt=pcall(function()return br.Position
end)if not bs or not bt then return nil end return bt end,function(br)if ab.
IsBossActive and ab.IsBossActive()then return true end if br then if br.Room and
type(br.Room.Name)=='string'and string.find(string.lower(br.Room.Name),'boss')
then return true end if br.Model then local bs=string.lower(br.Model.Name)if
string.find(bs,'boss')then return true end local bt=br.Model.Parent if bt and
string.find(string.lower(bt.Name),'boss')then return true end end end return
false end,function(br)return am.GetActiveCombatDistances(br)end,function(br,bs)
if br==bs then return true end if br and bs and br.Model and bs.Model and br.
Model==bs.Model then return true end return false end local bA=function(bA,bB)
local bC=ah.GetTarget()if bz(bC,bA)then return end ah.SetTarget(bA,nil,nil,bB)a7
=nil aO='None'a8=nil a9=nil aZ=0 if bA then aN=ar.CHASE else aN=ar.NO_TARGET end
end bp=function()if aX or not ax or not ay then return end aW+=1 local bB=aW aX=
true local bC=bv()local bD=bC and bw(bC)if not bD then aX=false return end local
bE=af.Scan()if#bE==0 then if bB==aW and ax and ay then bA(nil,nil)end aX=false
return end local bF,bG,bH,bI=ag.SelectBestTarget(bD,bE,function()return bB~=aW
or not ax or not ay end)if bB==aW and ax and ay then bA(bF,bI)end aX=false end
local bB,bC,bD,bE=function(bB)if not ae.IsDungeon()or not aY then return end
local bC,bD=bv(),ab.GetHumanoid()if not bC or not bD or bD.Health<=0 then return
end local bE=bw(bC)if not bE then return end if an()then a6=Vector3.zero return
end if a2 then a6=Vector3.zero return end local bF=os.clock()if bF-aQ>=az then
aQ=bF if aN~=ar.HOLD and aN~=ar.KITE and aN~=ar.REPOSITION and aN~=ar.
TACTICAL_FLOW then bp()end end local bH=ah.GetTarget()if bH then if not ah.
IsTargetValid()then ah.ClearTarget()aN=ar.NO_TARGET a7=nil aO='None'a9=nil bu()
pcall(function()bD.AutoRotate=true end)bp()return end end if not bH or aN==ar.
NO_TARGET then a7=nil aO='None'a9=nil bu()pcall(function()bD.AutoRotate=true end
)if not aX and bF-aQ>=0.5 then aQ=bF bp()end return end local bI=bH.Root and bw(
bH.Root)if not bI then ah.ClearTarget()aN=ar.NO_TARGET a9=nil bu()pcall(function
()bD.AutoRotate=true end)return end local bJ,bK=by(bH)local bL=Vector3.new(bI.X-
bE.X,0,bI.Z-bE.Z)local bM,bN,bO,bP=bL.Magnitude,am.GetActiveBossArea(bH)local bQ
,bR=false if bN and bP and bO and bO>0 then bR=Vector3.new(bP.X,0,bP.Z)local bS=
(Vector3.new(bE.X,0,bE.Z)-bR).Magnitude if bS>bO then bQ=true end end if bQ and
bR and bP then local bS=Vector3.new(bP.X-bE.X,0,bP.Z-bE.Z)local bX,bY=bS.
Magnitude>0.1 and bS.Unit or Vector3.new(0,0,1),Vector3.new(bP.X,bE.Y,bP.Z)aN=ar
.CHASE aO='Enter Boss Area'a7=bY aZ=0 bt(bX)return end if aG and bM<=(bK+25)then
pcall(function()bD.AutoRotate=false local bS=Vector3.new(bI.X,bC.Position.Y,bI.Z
)if(bS-bC.Position).Magnitude>0.5 then bC.CFrame=CFrame.lookAt(bC.Position,bS)
end end)else pcall(function()bD.AutoRotate=true end)end al.Step(bB,bH,bM)local
bS,bX,bY,bZ=ab.IsInvulnerable and ab.IsInvulnerable(),am.IsActiveDodgeDisabled
and am.IsActiveDodgeDisabled(bH),not(am.IsActiveHazardScannerEnabled and not am.
IsActiveHazardScannerEnabled(bH)),(ak and ak.IsAutoDodgeEnabled and ak.
IsAutoDodgeEnabled())or(aj and aj.IsAutoDodgeEnabled and aj.IsAutoDodgeEnabled()
)local b_=not bS and not bX and bY and bZ if bM<bJ then local b0=Vector3.new(bE.
X-bI.X,0,bE.Z-bI.Z)local b2,b4=b0.Magnitude>0.1 and b0.Unit or Vector3.new(0,0,1
),math.clamp(bJ-bM+6,4,15)local b6=bE+b2*b4 if bR and bO then local b7=Vector3.
new(b6.X,0,b6.Z)if(b7-bR).Magnitude>bO then local b8=bR+(b7-bR).Unit*math.max(1,
bO-2)b6=Vector3.new(b8.X,bE.Y,b8.Z)if(b6-bE).Magnitude<2 then aN=ar.HOLD aO=
'Hold (Boss Area Edge)'a7=nil aZ=0 bu()return end end end local b7=true if b_
then b7=ao(b6,0.5)end if not b7 then aN=ar.HOLD aO='Hold (Danger Behind)'a7=nil
aZ=0 bu()else aN=ar.KITE aO='Kite'aZ=0 a7=b6 bt(b2)end elseif bM<=bK then local
b0,b2,b4,b6=(Vector3.zero)if b_ and ak and ak.EvaluateTacticalFlow then b2,b0,b4
,b6=ak.EvaluateTacticalFlow(bE,bI,bH,bJ,bK)end if b2=='HOLD_WAIT'then aN=ar.HOLD
a7=nil aO=b6 or'Pocket Trap (Wait)'aZ=0 bu()return elseif b2=='MOVE'and b0.
Magnitude>0.05 then aN=ar.TACTICAL_FLOW aO=b6 or'Tactical Flow'a7=b4 aZ=0 bt(b0)
return end aN=ar.HOLD a7=nil aO='Hold'aZ=0 bu()else local b0,b2=bL.Magnitude>0.1
and bL.Unit or Vector3.new(0,0,1),false if b_ then local b4=Vector3.new(-b0.Z,0,
b0.X)*1.2 for b6,b7 in ipairs{3,6,10}do if b7<bM then local b8=bE+b0*b7 local b9
,c=b8+b4,b8-b4 if not ao(b8,0.5)or not ao(b9,0.5)or not ao(c,0.5)then b2=true
break end end end end if b2 then aN=ar.HOLD aO='Hold (Danger Ahead)'a7=nil aZ=0
bu()else aN=ar.CHASE aO='Chase'local b4=Vector3.new(bI.X,bE.Y,bI.Z)a7=b4 bt(b0)
local b6=bI.Y-bE.Y if b6>1.8 and bM<=8 then bD.Jump=true end local b7=bC.
AssemblyLinearVelocity or bC.Velocity local b8,b9=b7 and Vector3.new(b7.X,0,b7.Z
).Magnitude or 0,(type(bB)=='number'and bB>0)and bB or 0.016 if b8<a1 then aZ+=
b9 if a0 and(bF-a_)>=0.4 then bD.Jump=true pcall(function()bD:ChangeState(Enum.
HumanoidStateType.Jumping)end)a_=bF end else aZ=0 end end end end,function()if
bc and bc.Parent then return bc end if bc then pcall(function()bc:Destroy()end)
bc=nil end bc=Instance.new'Highlight'bc.Name='TM_EnemyHighlight_Debug'bc.
FillColor=Color3.fromRGB(255,200,0)bc.FillTransparency=0.5 bc.OutlineColor=
Color3.fromRGB(255,0,0)bc.OutlineTransparency=0 bc.Parent=aa.CoreGui or game:
GetService'CoreGui'return bc end,function()return workspace.Terrain end,function
()for bB,bC in ipairs(a3)do pcall(function()bC:Destroy()end)end table.clear(a3)
bo=nil end local bF,bH=function()if not ae.IsDungeon()then return end local bF,
bH=ah.GetTarget(),bv()local bI,bJ=bH and bw(bH),bD()if not aK or not bF or not
bF.Root then if bc and bc.Parent then bc.Enabled=false end else local bK=bC()if
bF.Model and bF.Model.Parent then bK.Adornee=bF.Model bK.Enabled=true else bK.
Enabled=false end end local bK,bL=ah.GetWaypoints(),ah.GetPathInstance()if not
aI or not bK or#bK==0 or not bJ then bE()else local bM=tostring(bL)..'_'..
tostring(#bK)if bo~=bM then bE()for bN=2,#bK do local bO,bP=bK[bN-1].Position,bK
[bN].Position local bQ=(bP-bO).Magnitude if bQ>0.01 then local bR=Instance.new
'LineHandleAdornment'bR.Name='TM_PathLine_Debug'bR.Adornee=bJ bR.AlwaysOnTop=
true bR.Length=bQ bR.Thickness=2 bR.Transparency=0.3 bR.Color3=Color3.fromRGB(0,
255,120)bR.ZIndex=0 bR.CFrame=CFrame.lookAt(bO,bP)bR.Parent=aa.CoreGui or game:
GetService'CoreGui'a3[#a3+1]=bR end end bo=bM end end if not aJ or not a7 or not
bI or not bJ then if bd then bd.Visible=false end if be then be.Visible=false
end else local bM,bN=bI+Vector3.new(0,0.5,0),a7+Vector3.new(0,0.5,0)local bO=(bN
-bM).Magnitude if bO>=0.3 then if not bd or not bd.Parent then bd=Instance.new
'LineHandleAdornment'bd.Name='TM_ActualPath_Debug'bd.Adornee=bJ bd.AlwaysOnTop=
true bd.Thickness=3.5 bd.Transparency=0.15 bd.Color3=Color3.fromRGB(0,230,255)bd
.ZIndex=2 bd.Parent=aa.CoreGui or game:GetService'CoreGui'end bd.Length=bO bd.
CFrame=CFrame.lookAt(bM,bN)bd.Visible=true if not be or not be.Parent then be=
Instance.new'SphereHandleAdornment'be.Name='TM_ActualMarker_Debug'be.Adornee=bJ
be.AlwaysOnTop=true be.Radius=0.65 be.Transparency=0.2 be.Color3=Color3.fromRGB(
0,230,255)be.ZIndex=3 be.Parent=aa.CoreGui or game:GetService'CoreGui'end be.
CFrame=CFrame.new(bN)be.Visible=true else if bd then bd.Visible=false end if be
then be.Visible=false end end end if not aL or not a9 or not bI or not bF or not
bJ then if bf then bf.Visible=false end if bg then bg.Visible=false end else
local bM,bN,bO=a9.origin or(bI+Vector3.new(0,1.5,0)),a9.directHitPos or a9.
targetPos,a9.directBlocked if bN then local bP=(bN-bM).Magnitude if bP>=0.2 then
if not bf or not bf.Parent then bf=Instance.new'LineHandleAdornment'bf.Name=
'TM_BlockerRay_Debug'bf.Adornee=bJ bf.AlwaysOnTop=true bf.Thickness=3 bf.
Transparency=0.2 bf.ZIndex=3 bf.Parent=aa.CoreGui or game:GetService'CoreGui'end
bf.Length=bP bf.Color3=bO and Color3.fromRGB(255,30,30)or Color3.fromRGB(50,255,
50)bf.CFrame=CFrame.lookAt(bM,bN)bf.Visible=true if bO and a9.directHitPos then
if not bg or not bg.Parent then bg=Instance.new'SphereHandleAdornment'bg.Name=
'TM_BlockerHitMarker_Debug'bg.Adornee=bJ bg.AlwaysOnTop=true bg.Radius=0.5 bg.
Transparency=0.2 bg.Color3=Color3.fromRGB(255,30,30)bg.ZIndex=4 bg.Parent=aa.
CoreGui or game:GetService'CoreGui'end bg.CFrame=CFrame.new(a9.directHitPos)bg.
Visible=true else if bg then bg.Visible=false end end else if bf then bf.Visible
=false end if bg then bg.Visible=false end end end end local bM=bF and bF.Root
if not aM or not bM or not bM.Parent then if bh then bh.Visible=false end if bi
then bi.Visible=false end if bj then bj.Visible=false end if bk then bk.Visible=
false end else local bN=bw(bM)or bM.Position local bO=bI and(bI.Y-2.5)or(bN.Y-
2.5)local bP=Vector3.new(bN.X,bO,bN.Z)local bQ=CFrame.new(bP)*CFrame.Angles(math
.rad(90),0,0)local bR,bS,bX=bM.CFrame:ToObjectSpace(bQ),by(bF)local bY=math.max(
1,bS)local bZ,b_=math.max(bY+0.5,bX),0.35 if not bh or not bh.Parent then bh=
Instance.new'CylinderHandleAdornment'bh.Name='TM_MinDistanceFill_Debug'bh.
AlwaysOnTop=true bh.ZIndex=4 bh.Parent=aa.CoreGui or game:GetService'CoreGui'end
bh.Adornee=bM bh.Height=0.02 bh.InnerRadius=0 bh.Radius=bY bh.Color3=Color3.
fromRGB(255,200,0)bh.Transparency=0.82 bh.CFrame=bR bh.Visible=true if not bi or
not bi.Parent then bi=Instance.new'CylinderHandleAdornment'bi.Name=
'TM_MinDistanceRing_Debug'bi.AlwaysOnTop=true bi.ZIndex=5 bi.Parent=aa.CoreGui
or game:GetService'CoreGui'end bi.Adornee=bM bi.Height=0.05 bi.InnerRadius=math.
max(0.1,bY-b_)bi.Radius=bY bi.Color3=Color3.fromRGB(255,215,20)bi.Transparency=
0.25 bi.CFrame=bR bi.Visible=true if not bj or not bj.Parent then bj=Instance.
new'CylinderHandleAdornment'bj.Name='TM_MaxDistanceFill_Debug'bj.AlwaysOnTop=
true bj.ZIndex=4 bj.Parent=aa.CoreGui or game:GetService'CoreGui'end bj.Adornee=
bM bj.Height=0.02 bj.InnerRadius=bY bj.Radius=bZ bj.Color3=Color3.fromRGB(0,255,
120)bj.Transparency=0.82 bj.CFrame=bR bj.Visible=true if not bk or not bk.Parent
then bk=Instance.new'CylinderHandleAdornment'bk.Name='TM_MaxDistanceRing_Debug'
bk.AlwaysOnTop=true bk.ZIndex=5 bk.Parent=aa.CoreGui or game:GetService'CoreGui'
end bk.Adornee=bM bk.Height=0.05 bk.InnerRadius=math.max(0.1,bZ-b_)bk.Radius=bZ
bk.Color3=Color3.fromRGB(0,255,120)bk.Transparency=0.25 bk.CFrame=bR bk.Visible=
true local b0,b2,b4,b6,b7=am.GetActiveBossArea(bF)if b0 and b4 and b2 and b2>0
then local b8=Vector3.new(b4.X,bO,b4.Z)local b9=CFrame.new(b8)*CFrame.Angles(
math.rad(90),0,0)local c=bM.CFrame:ToObjectSpace(b9)if not bl or not bl.Parent
then bl=Instance.new'CylinderHandleAdornment'bl.Name='TM_BossAreaRing_Debug'bl.
AlwaysOnTop=true bl.ZIndex=5 bl.Parent=aa.CoreGui or game:GetService'CoreGui'end
bl.Adornee=bM bl.Height=0.05 bl.InnerRadius=math.max(0.1,b2-0.45)bl.Radius=b2 bl
.Color3=Color3.fromRGB(0,200,255)bl.Transparency=0.3 bl.CFrame=c bl.Visible=true
if b6 and b7 and b7>0 then if not bm or not bm.Parent then bm=Instance.new
'CylinderHandleAdornment'bm.Name='TM_InnerDeadzoneRing_Debug'bm.AlwaysOnTop=true
bm.ZIndex=5 bm.Parent=aa.CoreGui or game:GetService'CoreGui'end bm.Adornee=bM bm
.Height=0.05 bm.InnerRadius=math.max(0.1,b7-0.45)bm.Radius=b7 bm.Color3=Color3.
fromRGB(255,45,65)bm.Transparency=0.25 bm.CFrame=c bm.Visible=true else if bm
then bm.Visible=false end end if not bn or not bn.Parent then bn=Instance.new
'CylinderHandleAdornment'bn.Name='TM_CenterDot_Debug'bn.AlwaysOnTop=true bn.
ZIndex=6 bn.Parent=aa.CoreGui or game:GetService'CoreGui'end bn.Adornee=bM bn.
Height=0.08 bn.InnerRadius=0 bn.Radius=1.2 bn.Color3=Color3.fromRGB(255,30,50)bn
.Transparency=0.1 bn.CFrame=c bn.Visible=true else if bl then bl.Visible=false
end if bm then bm.Visible=false end if bn then bn.Visible=false end end end end,
function()if bc then pcall(function()bc:Destroy()end)bc=nil end if bd then
pcall(function()bd:Destroy()end)bd=nil end if be then pcall(function()be:
Destroy()end)be=nil end if bf then pcall(function()bf:Destroy()end)bf=nil end if
bg then pcall(function()bg:Destroy()end)bg=nil end if bh then pcall(function()bh
:Destroy()end)bh=nil end if bi then pcall(function()bi:Destroy()end)bi=nil end
if bj then pcall(function()bj:Destroy()end)bj=nil end if bk then pcall(function(
)bk:Destroy()end)bk=nil end if bl then pcall(function()bl:Destroy()end)bl=nil
end if bm then pcall(function()bm:Destroy()end)bm=nil end if bn then pcall(
function()bn:Destroy()end)bn=nil end bE()end function av.IsEnabled()return ax
end function av.IsRunning()return ay end function av.GetState()return aN end
function av.GetScanInterval()return az end function av.SetScanInterval(bI)if
type(bI)=='number'and bI>0.1 then az=bI end end function av.
GetMobMinCombatDistance()return aA end function av.SetMobMinCombatDistance(bI)if
type(bI)=='number'and bI>=1 then aA=bI if aA>aB then aB=aA+5 end end end
function av.GetMobMaxCombatDistance()return aB end function av.
SetMobMaxCombatDistance(bI)if type(bI)=='number'and bI>=2 then aB=bI if aA>aB
then aA=math.max(1,aB-5)end end end function av.GetBossMinCombatDistance()return
aC end function av.SetBossMinCombatDistance(bI)if type(bI)=='number'and bI>=1
then aC=bI if aC>aF then aF=aC+5 end end end function av.
GetBossMaxCombatDistance()return aF end function av.SetBossMaxCombatDistance(bI)
if type(bI)=='number'and bI>=2 then aF=bI if aC>aF then aC=math.max(1,aF-5)end
end end function av.GetMinCombatDistance()return aA end function av.
SetMinCombatDistance(bI)av.SetMobMinCombatDistance(bI)end function av.
GetMaxCombatDistance()return aB end function av.SetMaxCombatDistance(bI)av.
SetMobMaxCombatDistance(bI)end av.IsTargetBoss=bx function av.
IsAutoFaceTargetEnabled()return aG end function av.SetAutoFaceTarget(bI)aG=bI
and true or false if not aG then local bJ=ab.GetHumanoid()if bJ and bJ.Parent
then pcall(function()bJ.AutoRotate=true end)end end end function av.
GetReachDistance()return maxCombatDistance end function av.SetReachDistance(bI)
if type(bI)=='number'and bI>=2 then av.SetMaxCombatDistance(bI)end end function
av.GetRepathDistance()return aH end function av.SetRepathDistance(bI)if type(bI)
=='number'and bI>=1 then aH=bI ah.SetRepathThreshold(bI)end end function av.
SetAutoJumpOnStuck(bI)a0=bI==true end function av.IsAutoJumpOnStuckEnabled()
return a0 end function av.SetStuckVelocityThreshold(bI)if type(bI)=='number'and
bI>0 then a1=bI end end function av.GetStuckVelocityThreshold()return a1 end
function av.SetPaused(bI)local bJ=bI and true or false if bJ==a2 then return end
a2=bJ if a2 then bu()a5()local bK=ab.GetHumanoid()if bK and bK.Parent then
pcall(function()bK.AutoRotate=true if not(aj.IsCurrentlyDodging and aj.
IsCurrentlyDodging())then bK:Move(Vector3.zero,false)end end)end else if ax and
ay then a4()end end end function av.IsPaused()return a2 end function av.
IsAutoSkillEnabled()return al.IsEnabled()end function av.SetAutoSkillEnabled(bI)
al.SetEnabled(bI)end av.IsAutoSkillQEnabled=al.IsSkillQEnabled av.
SetAutoSkillQEnabled=al.SetSkillQEnabled av.IsAutoSkillEEnabled=al.
IsSkillEEnabled av.SetAutoSkillEEnabled=al.SetSkillEEnabled av.GetSkillERange=al
.GetSkillERange av.SetSkillERange=al.SetSkillERange av.GetSkillSpamInterval=al.
GetSpamInterval av.SetSkillSpamInterval=al.SetSkillSpamInterval av.
GetBuffDuration=al.GetBuffDuration av.SetBuffDuration=al.SetBuffDuration av.
IsBuffActive=al.IsBuffActive av.CastSkillQ=al.CastSkillQ av.CastSkillE=al.
CastSkillE function av.IsPlannedPathVisualEnabled()return aI end function av.
SetPlannedPathVisual(bI)aI=bI==true if not aI then bE()end end function av.
IsActualPathVisualEnabled()return aJ end function av.SetActualPathVisual(bI)aJ=
bI==true if not aJ then if bd then bd.Visible=false end if be then be.Visible=
false end end end function av.IsBlockerRayVisualEnabled()return aL end function
av.SetBlockerRayVisual(bI)aL=bI==true if not aL then if bf then bf.Visible=false
end if bg then bg.Visible=false end end end function av.IsTargetVisualEnabled()
return aK end function av.SetTargetVisual(bI)aK=bI==true if not aK then if bc
and bc.Parent then bc.Enabled=false end end end function av.
IsCombatRangeVisualEnabled()return aM end function av.SetCombatRangeVisual(bI)aM
=bI==true if not aM then if bh then bh.Visible=false end if bi then bi.Visible=
false end if bj then bj.Visible=false end if bk then bk.Visible=false end end
end function av.GetDebugInfo()local bI=bv()local bJ,bK,bL,bM,bN,bO=bI and bw(bI)
,ah.GetTarget(),'-',0,0,ah.GetWaypoints()if bK and bK.Model then bL=bK.Model.
Name or'-'local bP=bw(bK.Root)if bP and bJ then bM=(bP-bJ).Magnitude bN=Vector3.
new(bP.X-bJ.X,0,bP.Z-bJ.Z).Magnitude end end local bP={directBlocked=false,
blockerName='None',blockerDist=0}if a9 then bP.directBlocked=a9.directBlocked==
true if a9.directHitPart then bP.blockerName=a9.directHitPart.Name or'Part'end
if a9.directHitPos and bJ then bP.blockerDist=(a9.directHitPos-bJ).Magnitude end
end local bQ,bR=0,0 if bI then local bS=bI.AssemblyLinearVelocity or bI.Velocity
if bS then bQ=Vector3.new(bS.X,0,bS.Z).Magnitude bR=bS.Y end end return{state=aN
,enemyName=bL,enemyDist=bM,enemyFlat=bN,hasTarget=bK~=nil,destMode=aO,nodeIndex=
a8,waypointCount=bO and#bO or 0,hasDestination=a7~=nil,blocker=bP,velocity=bQ,
verticalVelocity=bR,stuckTimer=aZ}end function av.Toggle(bI,bJ)if bI==ax then
return end ax=bI if ax then if not bJ then ad.EnableExclusive'AutoFarm'end if b
then b:Disconnect()b=nil end a4()br()ay=true aW=0 aX=false aQ=0 ah.
SetRepathThreshold(aH)if not ba then ba=ab.OnEnemyChanged(function()if ax and ay
and aN~=ar.HOLD and aN~=ar.REPOSITION and aN~=ar.TACTICAL_FLOW then bp()end end)
end if not bb then bb=ab.OnRespawn(function()ah.ClearTarget()aN=ar.NO_TARGET a9=
nil bp()end)end if not aY then task.spawn(function()if ab.ReadyDungeon()then aY=
true end end)end task.defer(bp)b=ap.Heartbeat:Connect(function(bK)local bL,bM=
pcall(bB,bK)if not bL then warn(('[AutoFarm] Error in stepMovementLoop: %s'):
format(tostring(bM)))end bF()end)else if b then b:Disconnect()b=nil end bs()a5()
ay=false if ba then ba()ba=nil end if bb then bb()bb=nil end bu()local bK=ab.
GetHumanoid()if bK and bK.Parent then pcall(function()bK.AutoRotate=true if not(
aj.IsCurrentlyDodging and aj.IsCurrentlyDodging())then bK:Move(Vector3.zero,
false)end end)end ah.ClearTarget()aN=ar.NO_TARGET a7=nil aO='None'a9=nil aZ=0 aW
+=1 aX=false bH()end end ad.Register('AutoFarm',av.Toggle,av.IsEnabled)ae.
Register{Name='AutoFarm',Zone='Dungeon',OnLeave=function()if ay then av.
SetPaused(true)end bH()end,OnEnter=function()if ax then av.SetPaused(false)end
end}ac.Register(function()av.Toggle(false)bH()end)return av end function a.O()
local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load'b',a.load'N',a.load'x',a.load'h',a.
load'c',{},false,true,false,{}local ak=function()for ak,al in ipairs(aj)do
pcall(al,ag)end end function af.IsEnabled()return ag end function af.Toggle(al,
am)local an=al==true if ag==an then if not an then ai=false end return end ag=an
if am then ai=an elseif not an then ai=false end if an then ad.EnableExclusive
'CombatMaster'ac.Toggle(true)ac.SetAutoDodgeEnabled(true)ab.Toggle(true,true)ab.
SetAutoSkillEnabled(true)else ab.Toggle(false,true)ab.SetAutoSkillEnabled(false)
ac.SetAutoDodgeEnabled(false)ac.Toggle(false)end ak()end function af.
IsAutoTriggeredByBoss()return ai end function af.SetAutoBossCombat(al)ah=al==
true end function af.IsAutoBossCombatEnabled()return ah end function af.
OnStateChanged(al)if type(al)~='function'then return function()end end table.
insert(aj,al)return function()for am,an in ipairs(aj)do if an==al then table.
remove(aj,am)break end end end end ad.Register('CombatMaster',function(al)if not
al then af.Toggle(false)end end,af.IsEnabled)aa.Register(function()af.Toggle(
false)end)return af end function a.P()local aa={}function aa.
PatchSliderLoadCallback(ab)if not ab or type(ab.UpdateValue)~='function'then
return ab end local ac=ab.UpdateValue ab.UpdateValue=function(ad,ae)local af,ag=
ad,ae if ag==nil and(type(af)=='number'or type(af)=='string')then ag=af af=ab
end pcall(ac,af,ag)local ah=af and af.Settings or ab.Settings if ah and ah.
Callback then pcall(ah.Callback,tonumber(ag))end end return ab end function aa.
PatchDropdownRestore(ab,ac)if not ab or type(ab.UpdateSelection)~='function'then
return ab end local ad=ab.UpdateSelection ab.UpdateSelection=function(ae,af)if
type(af)=='string'and af~=''and not ae:IsOption(af)then if ac then pcall(
function()ae:InsertOptions{af}end)else local ag=ae.Settings and ae.Settings.
Options if type(ag)=='table'and#ag>0 then af=ag[1]else local ah=next(ae:
GetOptions())if ah then af=ah end end end end ad(ae,af)end return ab end return
aa end function a.Q()local aa,ab,ac=a.load'e',a.load'f',a.load'b'local ad,ae,af,
ag,ah=aa.UserInputService,aa.VirtualInputManager,{},false function af.
IsMouseComboEnabled()return ag end function af.SetMouseComboEnabled(ai)ag=ai==
true end local ai=function()task.spawn(function()ae:SendKeyEvent(true,Enum.
KeyCode.Q,false,game)ae:SendKeyEvent(true,Enum.KeyCode.E,false,game)task.wait(ab
.GetKeyHoldTime())ae:SendKeyEvent(false,Enum.KeyCode.Q,false,game)ae:
SendKeyEvent(false,Enum.KeyCode.E,false,game)end)end function af.Init()if af.
inited then return end af.inited=true ah=ad.InputBegan:Connect(function(aj,ak)if
aj.UserInputType==Enum.UserInputType.MouseButton2 then if ad:GetFocusedTextBox()
then return end if ag then ai()end end end)end ac.Register(function()if ah then
ah:Disconnect()ah=nil end af.inited=false end)return af end function a.R()local
aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'c',a.load'b',a.load'g'local af,ag,ah,
ai,aj,ak,al,am,an,ao=aa.player,{},false,{[2]=true},0,{},{}for ap=1,15 do table.
insert(al,('Room %d'):format(ap))end local ap,aq=function(ap)if type(ap)==
'number'then return math.clamp(math.floor(ap),1,20)elseif type(ap)=='string'then
local aq=tonumber(ap:match'%d+')if aq then return math.clamp(math.floor(aq),1,20
)end end return nil end,ae.Guard('Dungeon',function()local ap,aq=ab.GetHumanoid(
),af and af.Character if ap and ap.Health>0 then pcall(function()ap.Health=0 end
)pcall(function()ap:ChangeState(Enum.HumanoidStateType.Dead)end)end if aq and aq
.Parent then pcall(function()aq:BreakJoints()end)end end)local ar=function(ar)if
not ah then return end if ab.IsInLobby()or ab.IsDead()then return end if ar<=0
then return end if not ai[ar]then return end if ak[ar]then return end ak[ar]=
true task.spawn(function()if aj>0 then task.wait(aj)end if not ah or ab.
IsInLobby()or ab.IsDead()then return end if ab.GetCurrentRoomIndex()~=ar then
return end ac.Notify('Auto Reset',(
'Reset character at Room %d (Once per room/run)'):format(ar),3)aq()end)end local
av,ax=function()if am then return end am=ab.OnRoomIndexChanged(function(av)if av
<=1 then table.clear(ak)end ar(av)end)an=ab.OnLobbyChanged(function(av)if av
then table.clear(ak)end end)ao=ab.OnDungeonNameChanged(function()table.clear(ak)
end)end,function()if am then am()am=nil end if an then an()an=nil end if ao then
ao()ao=nil end end function ag.Toggle(ay)ah=ay and true or false if ah then
table.clear(ak)av()ar(ab.GetCurrentRoomIndex())else ax()end end function ag.
IsEnabled()return ah end function ag.GetRoomOptions()return al end function ag.
SetTargetRooms(ay)local az={}if type(ay)=='table'then for aA,aB in pairs(ay)do
if aB==true then local aC=ap(aA)if aC then az[aC]=true end else local aC=ap(aB)
if aC then az[aC]=true end end end elseif ay~=nil then local aA=ap(ay)if aA then
az[aA]=true end end ai=az end function ag.GetTargetRooms()local ay={}for az in
pairs(ai)do table.insert(ay,az)end table.sort(ay)local az={}for aA,aB in ipairs(
ay)do table.insert(az,('Room %d'):format(aB))end return az end function ag.
GetTargetRoomNumbers()local ay={}for az in pairs(ai)do table.insert(ay,az)end
table.sort(ay)return ay end function ag.SetTargetRoom(ay)local az=ap(ay)if az
then ai={[az]=true}end end function ag.GetTargetRoom()for ay in pairs(ai)do
return ay end return 2 end function ag.SetDelay(ay)if type(ay)=='number'then aj=
math.clamp(ay,0,15)end end function ag.GetDelay()return aj end function ag.
ResetNow()ac.Notify('Auto Reset','Manual character reset executed',2)aq()end ae.
Register{Name='AutoReset',Zone='Dungeon',OnEnter=function()table.clear(ak)if ah
then av()end end,OnLeave=function()table.clear(ak)ax()end}ad.Register(function()
ax()ah=false table.clear(ak)ae.Unregister'AutoReset'end)return ag end function a
.S()local aa,ab,ac,ad,ae=a.load'f',a.load'P',a.load'd',a.load'Q',a.load'R'return
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
)ae.ResetNow()end}end end function a.T()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,
al,am,an=game:GetService'HttpService',game:GetService'Players',a.load'e',a.load
'f',a.load'q',a.load'L',a.load'b',{},false,'ws://127.0.0.1:8765',30,
'Disconnected',{},function()if typeof(WebSocket)=='table'and typeof(WebSocket.
connect)=='function'then return WebSocket.connect elseif typeof(WebSocket)==
'table'and typeof(WebSocket.Connect)=='function'then return WebSocket.Connect
elseif typeof(websocket)=='table'and typeof(websocket.connect)=='function'then
return websocket.connect elseif typeof(syn)=='table'and typeof(syn.websocket)==
'table'and typeof(syn.websocket.connect)=='function'then return syn.websocket.
connect end return nil end local ao,ap=function(ao)if al==ao then return end al=
ao for ap,aq in ipairs(am)do pcall(aq,al)end end,function(ao)if not ao or ao.
Magnitude<0.001 then return 0 end return math.deg(math.atan2(ao.X,-ao.Z))end
local aq=function()local aq={}if not ad.GetTrackedEnemyData then return aq end
local ar=ad.GetTrackedEnemyData()for av,ax in ipairs(ar)do if ax and ax.Model
and ax.Root and ax.Humanoid and ax.Humanoid.Health>0 then local ay=ax.Model.Name
local az=string.find(ay:lower(),'boss')~=nil table.insert(aq,{name=ay,x=ax.Root.
Position.X,y=ax.Root.Position.Y,z=ax.Root.Position.Z,yaw=ax.Root and ap(ax.Root.
CFrame.LookVector)or 0,health=math.max(0,ax.Humanoid.Health),maxHealth=math.max(
1,ax.Humanoid.MaxHealth),isBoss=az})end end return aq end local ar,av,ax=
function()local ar=ac.player or ab.LocalPlayer local av=ar and ar.Character
local ax,ay=av and(av:FindFirstChild'HumanoidRootPart'or av.PrimaryPart),av and
av:FindFirstChildOfClass'Humanoid'local az,aA,aB,aC,aF=ax and ax.Position or
Vector3.zero,ax and ap(ax.CFrame.LookVector)or 0,ay and ay.MoveDirection or
Vector3.zero,false if ad.IsInvulnerable then aC,aF=ad.IsInvulnerable()end local
aG,aH,aI=af.GetActiveHazardsTelemetry(),af.GetBossTelegraphTelemetry(),af.
GetMemoryGameTelemetry and af.GetMemoryGameTelemetry()or nil local aJ={type=
'TELEMETRY',version='V2',timestamp=os.clock(),dungeon=(ad.GetCurrentDungeonName
and ad.GetCurrentDungeonName())or'Unknown',inLobby=(ad.IsInLobby and ad.
IsInLobby())or false,room=(ad.GetCurrentRoomIndex and ad.GetCurrentRoomIndex())
or 0,player={name=ar and ar.Name or'Player',x=az.X,y=az.Y,z=az.Z,yaw=aA,moveX=aB
.X,moveZ=aB.Z,health=ay and math.max(0,ay.Health)or 100,maxHealth=ay and math.
max(1,ay.MaxHealth)or 100,healthPercent=ay and math.clamp((ay.Health/ay.
MaxHealth)*100,0,100)or 100,isInvulnerable=aC,invulnReason=aF,isDead=(ad.IsDead
and ad.IsDead())or(ay and ay.Health<=0)or false},boss=aH,enemies=aq(),hazards=aG
,memory=aI}return aJ end,function(ar,av)if not ar then return false,
'No websocket instance'end if typeof(ar.Send)=='function'then return pcall(
function()ar:Send(av)end)elseif typeof(ar.send)=='function'then return pcall(
function()ar:send(av)end)end return false,'No Send method on websocket object'
end,function(ar)if not ar then return end if typeof(ar.Close)=='function'then
pcall(function()ar:Close()end)elseif typeof(ar.close)=='function'then pcall(
function()ar:close()end)end end local ay=function()if sendThread then return end
sendThread=task.spawn(function()while ai and wsInstance do local ay,az,aA,aB=1/
math.clamp(ak,5,60),os.clock(),pcall(ar)if aA and aB and wsInstance then local
aC,aF=pcall(function()return aa:JSONEncode(aB)end)if aC and aF and wsInstance
then local aG,aH=av(wsInstance,aF)if not aG then local aI=wsInstance wsInstance=
nil if aI then ax(aI)end af.StopScan()ao'Disconnected'break end end end local aC
=os.clock()-az local aF=math.max(0.01,ay-aC)task.wait(aF)end sendThread=nil end)
end function ah.Connect()if wsInstance then ah.Disconnect()end local az=an()if
not az then ao'Error'return false end ao'Connecting'local aA=aj if not aA or#aA
==0 then aA='ws://127.0.0.1:8765'end local aB,aC=pcall(az,aA)if(not aB or not aC
)and string.find(aA,'localhost')then local aF=string.gsub(aA,'localhost',
'127.0.0.1')aB,aC=pcall(az,aF)end if not aB or not aC then ao'Disconnected'
return false end wsInstance=aC ao'Connected'af.StartScan()pcall(function()if aC.
OnClose and typeof(aC.OnClose.Connect)=='function'then aC.OnClose:Connect(
function()ah.Disconnect()end)elseif typeof(aC.OnClose)=='function'then aC.
OnClose=function()ah.Disconnect()end end end)ay()return true end function ah.
Disconnect()local az=wsInstance wsInstance=nil sendThread=nil if az then ax(az)
end af.StopScan()ao'Disconnected'end local az=function()if reconnectThread then
return end reconnectThread=task.spawn(function()while ai and ag.IsActive()do if
ai and(not wsInstance or al=='Disconnected'or al=='Error')then ah.Connect()end
task.wait(3)end reconnectThread=nil end)end function ah.SetEnabled(aA)ai=aA and
true or false if ai then az()ah.Connect()else if reconnectThread then task.
cancel(reconnectThread)reconnectThread=nil end ah.Disconnect()end end function
ah.IsEnabled()return ai end function ah.SetUrl(aA)if type(aA)=='string'and#aA>0
and aA~=aj then aj=aA if ai then ah.Connect()end end end function ah.GetUrl()
return aj end function ah.SetFps(aA)if type(aA)=='number'and aA>=5 and aA<=60
then ak=math.floor(aA)end end function ah.GetFps()return ak end function ah.
GetStatus()return al end function ah.OnStatusChanged(aA)if type(aA)=='function'
then table.insert(am,aA)end end ag.Register(function()ah.SetEnabled(false)end)
return ah end function a.U()local aa,ab,ac,ad,ae,af,ag=a.load'd',a.load'O',a.
load'x',a.load'L',a.load'T',a.load'f',a.load'P'return function(ah,ai)local aj=ai
:Section{Side='Left'}aj:Header{Name='Hazard Scanner V2'}aj:Toggle({Name=
'Show Ground Visualizer V2 (2D Shadows)',Default=ad.IsVisualizerEnabled(),
Callback=aa.Wrap(function(ak)ad.SetVisualizerEnabled(ak)end)},
'Toggle_HazardGroundVisualizerV2')aj:Toggle({Name=
'Show Threat Corridor V2 (Orange Paths)',Default=ad.IsCorridorEnabled(),Callback
=aa.Wrap(function(ak)ad.SetCorridorEnabled(ak)end)},
'Toggle_HazardThreatCorridorV2')aj:Toggle({Name=
'Enable Danger Detection V2 (Player Hitbox)',Default=ad.
IsDangerDetectionEnabled(),Callback=aa.Wrap(function(ak)ad.
SetDangerDetectionEnabled(ak)end)},'Toggle_HazardDangerDetectionV2')aj:Toggle({
Name='Show Screen Danger HUD (Dot Indicator)',Default=ad.IsHudIndicatorEnabled()
,Callback=aa.Wrap(function(ak)ad.SetHudIndicatorEnabled(ak)end)},
'Toggle_HazardV2HudIndicator')local ak={'Disc','Rectangle'}local al=function(al)
for am,an in ipairs(ak)do if an==al then return am end end return 1 end aj:
Dropdown({Name='Player Hitbox Shape',Options=ak,Default=al(ad.
GetPlayerHitboxShape()),Required=true,Callback=aa.Wrap(function(am)ad.
SetPlayerHitboxShape(am)end)},'Dropdown_HazardV2PlayerHitboxShape')ag.
PatchSliderLoadCallback(aj:Slider({Name='Hitbox Radius (studs) [Disc]',Default=
ad.GetPlayerHitboxRadius(),Minimum=0.5,Maximum=8,DisplayMethod='Value',Precision
=1,Callback=aa.Wrap(function(am)ad.SetPlayerHitboxRadius(am)end)},
'Slider_HazardV2PlayerHitboxRadius'))ag.PatchSliderLoadCallback(aj:Slider({Name=
'Hitbox Width (studs) [Rectangle]',Default=ad.GetPlayerHitboxWidth(),Minimum=0.5
,Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(am)ad.
SetPlayerHitboxWidth(am)end)},'Slider_HazardV2PlayerHitboxWidth'))ag.
PatchSliderLoadCallback(aj:Slider({Name='Hitbox Length (studs) [Rectangle]',
Default=ad.GetPlayerHitboxLength(),Minimum=0.5,Maximum=10,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(am)ad.SetPlayerHitboxLength(am)end)},
'Slider_HazardV2PlayerHitboxLength'))aj:Toggle({Name=
'Enable Safe Spot V2 (Radar & Marker)',Default=ad.IsSafeSpotEnabled(),Callback=
aa.Wrap(function(am)ad.SetSafeSpotEnabled(am)end)},'Toggle_HazardSafeSpotV2')aj:
Toggle({Name='Show Escape Vectors V2 (Beams)',Default=ad.
IsSafeSpotVectorsEnabled(),Callback=aa.Wrap(function(am)ad.
SetSafeSpotVectorsEnabled(am)end)},'Toggle_HazardSafeSpotVectorsV2')ag.
PatchSliderLoadCallback(aj:Slider({Name='Safe Spot Search Range (studs)',Default
=ad.GetSafeSpotMaxRadius(),Minimum=20,Maximum=120,DisplayMethod='Value',
Precision=0,Callback=aa.Wrap(function(am)ad.SetSafeSpotMaxRadius(am)end)},
'Slider_HazardSafeSpotMaxRadiusV2'))ag.PatchSliderLoadCallback(aj:Slider({Name=
'Safe Spot Escape Margin (studs)',Default=ad.GetSafeSpotEscapeMargin(),Minimum=
0.1,Maximum=3,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(am)ad.
SetSafeSpotEscapeMargin(am)end)},'Slider_HazardSafeSpotEscapeMarginV2'))ag.
PatchSliderLoadCallback(aj:Slider({Name='Safe Spot Ray Count (8 - 48)',Default=
ad.GetSafeSpotRayCount(),Minimum=8,Maximum=48,DisplayMethod='Value',Precision=0,
Callback=aa.Wrap(function(am)ad.SetSafeSpotRayCount(am)end)},
'Slider_HazardSafeSpotRayCountV2'))aj:Toggle({Name=
'Tactical Scoring V2 (Anti-Corner / Open Space)',Default=ad.
IsSafeSpotScoringV2Enabled(),Callback=aa.Wrap(function(am)ad.
SetSafeSpotScoringV2Enabled(am)end)},'Toggle_HazardSafeSpotScoringV2')aj:Toggle(
{Name='Temporal Awareness V2 (Kinematics & TTI)',Default=ad.IsTemporalEnabled(),
Callback=aa.Wrap(function(am)ad.SetTemporalEnabled(am)end)},
'Toggle_HazardTemporalV2')aj:Toggle({Name=
'Phase-Through Mode (Step Through Fading Skills)',Default=ad.
IsTemporalPhaseThrough(),Callback=aa.Wrap(function(am)ad.
SetTemporalPhaseThrough(am)end)},'Toggle_HazardTemporalPhaseThroughV2')aj:
Toggle({Name='Enable Auto Dodge V2 (Pure Locomotion)',Default=ad.
IsAutoDodgeEnabled(),Callback=aa.Wrap(function(am)ad.SetAutoDodgeEnabled(am)end)
},'Toggle_HazardAutoDodgeV2')ag.PatchSliderLoadCallback(aj:Slider({Name=
'Dodge Arrival Distance (studs)',Default=ad.GetDodgeSnapDistance(),Minimum=0.5,
Maximum=3,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(am)ad.
SetDodgeSnapDistance(am)end)},'Slider_HazardV2DodgeSnapDistance'))aj:Toggle({
Name='Instant Snap On Arrival',Default=ad.IsDodgeEnableSnap(),Callback=aa.Wrap(
function(am)ad.SetDodgeEnableSnap(am)end)},'Toggle_HazardV2DodgeEnableSnap')aj:
Toggle({Name='Hold Position After Dodge (Anti Ping-Pong)',Default=ad.
IsDodgeEnableHolding(),Callback=aa.Wrap(function(am)ad.SetDodgeEnableHolding(am)
end)},'Toggle_HazardV2DodgeEnableHolding')aj:Header{Name=
'Phase 3: Organic Steering & Strafing'}aj:Toggle({Name=
'Momentum Blending (Vector Slerp)',Default=ad.IsMomentumBlending(),Callback=aa.
Wrap(function(am)ad.SetMomentumBlending(am)end)},
'Toggle_HazardV2MomentumBlending')aj:Toggle({Name=
'Combat Facing (Strafe While Dodging)',Default=ad.IsCombatFacing(),Callback=aa.
Wrap(function(am)ad.SetCombatFacing(am)end)},'Toggle_HazardV2CombatFacing')aj:
Toggle({Name='Arc Strafing (Tangential Contour)',Default=ad.IsArcStrafing(),
Callback=aa.Wrap(function(am)ad.SetArcStrafing(am)end)},
'Toggle_HazardV2ArcStrafing')aj:Toggle({Name=
'Continuous Flow State (Multi-Dodge)',Default=ad.IsFlowState(),Callback=aa.Wrap(
function(am)ad.SetFlowState(am)end)},'Toggle_HazardV2FlowState')ag.
PatchSliderLoadCallback(aj:Slider({Name='Turn Sharpness (Smooth Responsiveness)'
,Default=ad.GetTurnSharpness(),Minimum=4,Maximum=30,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(am)ad.SetTurnSharpness(am)end)},
'Slider_HazardV2TurnSharpness'))local am=ai:Section{Side='Left'}am:Header{Name=
'Hazard Scanner Controls'}local an=ai:Section{Side='Right'}an:Header{Name=
'Real-time Hazard Monitor'}local ao,ap,aq,ar,av,ax=an:Label{Text=
"Detector: <font color='rgb(255,80,80)'>Disabled</font>"},an:Label{Text=
"Player: <font color='rgb(0,255,170)'>SAFE</font>"},an:Label{Text=
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]},an:Label{Text=
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"},an:Label{Text=
"Active Hazards: <font color='rgb(160,160,160)'>0</font>"},an:Label{Text=
"Last Detected: <font color='rgb(160,160,160)'>None</font>"}local ay=function(ay
,az,aA)if ay then local aB,aC=az and(az.Name or az.name)or'Unknown Threat',aA
and(' ['..aA..']')or''pcall(function()ap:UpdateName((
[[Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)]]):format(aB,
aC))end)else pcall(function()ap:UpdateName
"Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>"end)end end ac.
OnPlayerDangerChanged(function(az,aA,aB)ay(az,aA,aB)end)ad.OnDangerChanged(
function(az,aA,aB)if ad.IsDangerDetectionEnabled()then ay(az,aA,aB)end end)ac.
OnSafeSpotChanged(function(az,aA,aB)if az and aA then pcall(function()aq:
UpdateName((
[[Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>]]):
format(aB))end)else pcall(function()aq:UpdateName
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]end)end end)ad.
OnSafeSpotChanged(function(az,aA,aB,aC,aF,aG)if ad.IsSafeSpotEnabled()and ad.
IsDangerDetectionEnabled()then if az and aA then local aH=aG and(
[[Safe Spot V2: <font color='rgb(255,180,50)'><b>Escaping (%.1f studs)</b></font>]]
):format(aC)or(
[[Safe Spot V2: <font color='rgb(0,255,140)'><b>Found (%.1f studs)</b></font>]])
:format(aC)pcall(function()aq:UpdateName(aH)end)else pcall(function()aq:
UpdateName[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]end)
end end end)ac.OnDodgeStateChanged(function(az,aA,aB)if az and aA then pcall(
function()ar:UpdateName((
[[Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>]])
:format(aB))end)else pcall(function()ar:UpdateName
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"end)end end)ad.
OnDodgeStateChanged(function(az,aA,aB,aC)if az and aA then local aF,aG=aC==
'HOLDING_SAFE'and'Holding Safe'or'Dodging',aC=='HOLDING_SAFE'and'rgb(0,255,140)'
or'rgb(0,255,200)'pcall(function()ar:UpdateName(("Auto Dodge V2: <font color='"
..aG.."'><b>"..aF..' (%.1f studs)</b></font>'):format(aB))end)else pcall(
function()ar:UpdateName"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"
end)end end)local az=function(az,aA)az=az or ac.GetHazardCount()aA=aA or ac.
GetLastHazardInfo()local aB=ac.IsEnabled()local aC,aF=aB and'0, 255, 0'or
'255, 80, 80',aB and'Active (Scanning & SelectionBox)'or'Disabled'pcall(function
()ao:UpdateName("Detector: <font color='rgb("..aC..")'>"..aF..'</font>')end)
local aG=az>0 and'255, 60, 60'or'0, 255, 0'pcall(function()av:UpdateName(
"Active Hazards: <font color='rgb("..aG..")'>"..tostring(az)..'</font>')end)if
aA then pcall(function()ax:UpdateName((
[[Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)]]):
format(aA.Name,aA.Class,aA.Distance))end)else pcall(function()ax:UpdateName
"Last Detected: <font color='rgb(160,160,160)'>None</font>"end)end end an:Header
{Name='Specific Skill Inspector'}an:Toggle({Name='Enable Deep Inspector',Default
=ac.IsInspectEnabled(),Callback=aa.Wrap(function(aA)ac.SetInspectEnabled(aA)end)
},'Toggle_HazardDeepInspector')an:Input{Name='Target Skill Name',Placeholder=
'e.g. Meteor, Spike, Flame...',AcceptedCharacters='All',Default=ac.
GetInspectTarget(),Callback=aa.Wrap(function(aA)ac.SetInspectTarget(aA)end)}
local aA=ai:Section{Side='Right'}aA:Header{Name='Custom Trajectory Dimensions'}
ag.PatchSliderLoadCallback(aA:Slider({Name='Second Boss Moving Beam (studs)',
Default=ac.GetSecondBossBeamLength(),Minimum=10,Maximum=250,DisplayMethod=
'Value',Precision=0,Callback=aa.Wrap(function(aB)ac.SetSecondBossBeamLength(aB)
end)},'Slider_HazardSecondBossBeamLength'))ag.PatchSliderLoadCallback(aA:Slider(
{Name='First Boss Big Spike Width (studs)',Default=ac.GetFirstBossBigSpikeWidth(
),Minimum=10,Maximum=60,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(
function(aB)ac.SetFirstBossBigSpikeWidth(aB)end)},
'Slider_HazardFirstBossBigSpikeWidth'))ag.PatchSliderLoadCallback(aA:Slider({
Name='First Boss Seeking Spike Width (studs)',Default=ac.
GetFirstBossSeekingSpikeWidth(),Minimum=4,Maximum=30,DisplayMethod='Value',
Precision=0,Callback=aa.Wrap(function(aB)ac.SetFirstBossSeekingSpikeWidth(aB)end
)},'Slider_HazardFirstBossSeekingSpikeWidth'))ag.PatchSliderLoadCallback(aA:
Slider({Name='Second Boss Circle Chain Lifetime (s)',Default=ac.
GetSecondBossCircleDuration(),Minimum=0.5,Maximum=4,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(aB)ac.SetSecondBossCircleDuration(aB)end)}
,'Slider_HazardSecondBossCircleDuration'))local aB=ai:Section{Side='Right'}aB:
Header{Name='Live 2D Top-Down Radar (WebSocket)'}local aC=aB:Label{Text=
[[Radar Server: <font color='rgb(255,80,80)'>Disconnected</font>]]}local aF=
function(aF)local aG='255,80,80'if aF=='Connected'then aG='0,255,136'elseif aF==
'Connecting'then aG='255,170,0'end pcall(function()aC:UpdateName(
"Radar Server: <font color='rgb("..aG..")'><b>"..tostring(aF)..'</b></font>')end
)end ae.OnStatusChanged(function(aG)aF(aG)end)aB:Toggle({Name=
'Enable Live 2D Radar Stream',Default=ae.IsEnabled(),Callback=aa.Wrap(function(
aG)ae.SetEnabled(aG)aF(ae.GetStatus())end)},'Toggle_LiveRadarEnabled')aB:Input{
Name='WebSocket Server URL',Placeholder='ws://127.0.0.1:8765',AcceptedCharacters
='All',Default=ae.GetUrl(),Callback=aa.Wrap(function(aG)ae.SetUrl(aG)end)}ag.
PatchSliderLoadCallback(aB:Slider({Name='Stream Refresh Rate (FPS)',Default=ae.
GetFps(),Minimum=10,Maximum=60,DisplayMethod='Value',Precision=0,Callback=aa.
Wrap(function(aG)ae.SetFps(aG)end)},'Slider_LiveRadarFps'))ac.OnHazardChanged(
function(aG,aH)az(aG,aH)end)local aG=am:Toggle({Name='Enable Hazard Scanner',
Default=ac.IsEnabled(),Callback=aa.Wrap(function(aG)ac.Toggle(aG)az()end)},
'Toggle_SmartDodgeThreatDetection')am:Toggle({Name=
'Show Player 2D Hitbox (Ground Visual)',Default=ac.IsPlayerVisualEnabled(),
Callback=aa.Wrap(function(aH)ac.SetPlayerVisualEnabled(aH)end)},
'Toggle_HazardPlayer2DVisual')ag.PatchSliderLoadCallback(am:Slider({Name=
'Player 2D Hitbox Radius (studs)',Default=ac.GetPlayerHitboxRadius(),Minimum=0.5
,Maximum=8,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(aH)ac.
SetPlayerHitboxRadius(aH)end)},'Slider_HazardPlayer2DHitboxRadius'))am:Toggle({
Name='Show 3D Selection Boxes (Parts)',Default=ac.IsSelectionBoxesEnabled(),
Callback=aa.Wrap(function(aH)ac.SetSelectionBoxesEnabled(aH)end)},
'Toggle_HazardSelectionBoxes')am:Toggle({Name=
'Show Lifespan Timer (3D Duration)',Default=ac.IsTimerVisualEnabled(),Callback=
aa.Wrap(function(aH)ac.SetTimerVisualEnabled(aH)end)},
'Toggle_HazardLifespanTimer')am:Toggle({Name=
'Show Danger Zones (Ground Visualizer)',Default=ac.IsVisualizerEnabled(),
Callback=aa.Wrap(function(aH)ac.SetVisualizerEnabled(aH)end)},
'Toggle_HazardGroundVisualizer')am:Toggle({Name='Show Trajectory Paths (Orange)'
,Default=ac.IsTrajectoryEnabled(),Callback=aa.Wrap(function(aH)ac.
SetTrajectoryEnabled(aH)end)},'Toggle_HazardTrajectoryVisualizer')am:Toggle({
Name='Show Safe Spot Marker (Green Visual)',Default=ac.IsSafeSpotVisualEnabled()
,Callback=aa.Wrap(function(aH)ac.SetSafeSpotVisualEnabled(aH)end)},
'Toggle_HazardSafeSpotVisual')am:Toggle({Name=
'Show Candidate Points & Rays (Scan Grid)',Default=ac.IsShowCandidates(),
Callback=aa.Wrap(function(aH)ac.SetShowCandidates(aH)end)},
'Toggle_HazardShowCandidates')ag.PatchSliderLoadCallback(am:Slider({Name=
'Safe Spot Safety Margin (studs)',Default=ac.GetSafeSpotBuffer(),Minimum=0,
Maximum=6,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(aH)ac.
SetSafeSpotBuffer(aH)end)},'Slider_HazardSafeSpotBuffer'))local aH=am:Toggle({
Name='Enable Auto Dodge (Move + Snap)',Default=ac.IsAutoDodgeEnabled(),Callback=
aa.Wrap(function(aH)ac.SetAutoDodgeEnabled(aH)end)},
'Toggle_HazardAutoDodgeEnabled')am:Header{Name='Sampling Pass Tiers'}am:Toggle({
Name='Enable Fine Pass (Tier 2 - Max 45s)',Default=ac.IsFinePassEnabled(),
Callback=aa.Wrap(function(aI)ac.SetFinePassEnabled(aI)end)},
'Toggle_HazardFinePassEnabled')am:Toggle({Name=
'Enable Emergency Fallback (Tier 3 - Max 55s)',Default=ac.IsFallbackPassEnabled(
),Callback=aa.Wrap(function(aI)ac.SetFallbackPassEnabled(aI)end)},
'Toggle_HazardFallbackPassEnabled')ab.OnStateChanged(function(aI)pcall(function(
)aG:UpdateState(aI,true)end)pcall(function()aH:UpdateState(aI,true)end)az()end)
ag.PatchSliderLoadCallback(am:Slider({Name='Dodge Snap Distance (studs)',Default
=ac.GetDodgeSnapDistance(),Minimum=0.5,Maximum=5,DisplayMethod='Value',Precision
=1,Callback=aa.Wrap(function(aI)ac.SetDodgeSnapDistance(aI)end)},
'Slider_HazardDodgeSnapDistance'))ag.PatchSliderLoadCallback(am:Slider({Name=
'Respawn Invulnerability Time (s)',Default=af.GetRespawnProtectionDuration(),
Minimum=0.5,Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(
function(aI)af.SetRespawnProtectionDuration(aI)end)},
'Slider_HazardRespawnInvulnerabilityTime'))ag.PatchSliderLoadCallback(am:Slider(
{Name='Trajectory Length (studs)',Default=ac.GetTrajectoryLength(),Minimum=10,
Maximum=150,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(function(aI)ac.
SetTrajectoryLength(aI)end)},'Slider_HazardTrajectoryLength'))am:Toggle({Name=
'Log Hazards (Spawns / Despawns)',Default=ac.IsLogHazardsEnabled(),Callback=aa.
Wrap(function(aI)ac.SetLogHazards(aI)end)},'Toggle_SmartDodgeLogHazards')am:
Toggle({Name='Log Rejected (Unrenderable)',Default=ac.IsLogFailedEnabled(),
Callback=aa.Wrap(function(aI)ac.SetLogFailed(aI)end)},
'Toggle_SmartDodgeLogRejected')ag.PatchSliderLoadCallback(am:Slider({Name=
'Blue Danger Zone Margin (studs)',Default=ac.GetTrajectoryMargin(),Minimum=0,
Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(aI)ac.
SetTrajectoryMargin(aI)end)},'Slider_HazardTrajectoryMargin'))am:Button{Name=
'Clear Console',Callback=function()pcall(function()if rconsoleclear then
rconsoleclear()end end)end}az()end end function a.V()local aa,ab,ac,ad,ae,af,ag,
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
ap then for ar,av in ipairs(aa)do if ap[av]then table.insert(aq,av)end end end
if#aq>0 then return aq end return aa end function ad.IsDifficultyAllowed(an,ao)
if type(ao)~='string'then return false end for ap,aq in ipairs(ad.
GetAllowedDifficulties(an))do if aq==ao then return true end end return false
end function ad.GetLevelReq(an,ao)if type(an)~='string'then return 0 end local
ap=ac[an]if ap then return ap.LevelReq or 0 end local aq=ad.GetDungeonStats(an)
if aq and type(ao)=='string'and aq[ao]then return tonumber(aq[ao].levelReq)or 0
end return 0 end ad.DUNGEONS=ab ad.DIFFICULTIES=aa return ad end function a.W()
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'd',a.load'N',a.load'O',a.load'q',a.load
'V',a.load'f',a.load'e',a.load'P',a.load'b'local aj=ag.RunService return
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
Side='Right'}ap:Header{Name='Auto Farm Monitor'}local aq,ar,av,ax,ay,az,aA,aB=ap
:Label{Text="State: <font color='rgb(160,160,160)'>NO_TARGET</font>"},ap:Label{
Text="Target: <font color='rgb(160,160,160)'>None</font>"},ap:Label{Text=
"Distance: <font color='rgb(160,160,160)'>-</font>"},ap:Label{Text=
"Velocity: <font color='rgb(160,160,160)'>0.0 studs/s</font>"},ap:Label{Text=
"Blocker Detection: <font color='rgb(160,160,160)'>-</font>"},ap:Label{Text=
[[Destination Mode: <font color='rgb(160,160,160)'>None</font>]]},(ap:Label{Text
="Path Nodes: <font color='rgb(160,160,160)'>0</font>"})local aC,aF=function()
local aC,aF=ab.GetDebugInfo(),'160,160,160'if aC.state=='CHASE'then aF=
'0,255,120'elseif aC.state=='HOLD'then aF='255,200,0'elseif aC.state=='BLOCKED'
then aF='255,60,60'elseif aC.state=='REPATHING'or aC.state=='ACQUIRING_TARGET'or
aC.state=='TRACKING_TARGET'then aF='0,200,255'end pcall(function()aq:UpdateName(
("State: <font color='rgb(%s)'>%s</font>"):format(aF,aC.state))end)pcall(
function()if aC.hasTarget then ar:UpdateName((
"Target: <font color='rgb(255,220,120)'>%s</font>"):format(aC.enemyName))av:
UpdateName((
[[Distance: <font color='rgb(0,255,255)'>%.1f studs (flat %.1f)</font>]]):
format(aC.enemyDist,aC.enemyFlat))else ar:UpdateName
"Target: <font color='rgb(160,160,160)'>None</font>"av:UpdateName
"Distance: <font color='rgb(160,160,160)'>-</font>"end end)pcall(function()local
aG=aC.velocity or 0 local aH=aG>=12 and'0,255,120'or(aG>=10 and'255,200,0'or
'255,80,80')ax:UpdateName(("Velocity: <font color='rgb(%s)'>%.1f studs/s</font>"
):format(aH,aG))end)pcall(function()if aC.hasTarget and aC.blocker then if aC.
blocker.directBlocked then ay:UpdateName((
[[Blocker: <font color='rgb(255,60,60)'>BLOCKED by '%s' (%.1fm)</font>]]):
format(aC.blocker.blockerName,aC.blocker.blockerDist))else ay:UpdateName
[[Blocker: <font color='rgb(0,255,120)'>CLEAR (Direct Line to Target)</font>]]
end else ay:UpdateName"Blocker: <font color='rgb(160,160,160)'>None</font>"end
end)pcall(function()local aG=aC.destMode if aC.nodeIndex then aG=(
'%s (Node #%d)'):format(aC.destMode,aC.nodeIndex)end local aH=aC.destMode==
'Direct'and'0,255,255'or(aC.destMode=='Waypoint'and'255,200,0'or(aC.destMode==
'Hold'and'255,200,0'or'255,80,80'))az:UpdateName((
"Destination Mode: <font color='rgb(%s)'>%s</font>"):format(aH,aG))end)pcall(
function()aA:UpdateName((
[[Path Nodes: <font color='rgb(160,255,160)'>%d waypoints</font>]]):format(aC.
waypointCount))end)end,0 aB=aj.Heartbeat:Connect(function()local aG=os.clock()if
aG-aF>=0.25 then aF=aG aC()end end)ai.Register(function()if aB then aB:
Disconnect()aB=nil end end)local aG=al:Section{Side='Right'}aG:Header{Name=
'Contextual Combat Distance'}local aH,aI=aG:Label{Text='Active: -'},ae.
GetDungeons()local aJ,aK,aL,aM,aN,aO,aQ,aW,aX,aY,aZ,a_,a0=af.
GetCurrentDungeonName()or aI[1]or'Desert Temple','Mob',false,function()local aJ,
aK=af.GetCurrentDungeonName(),af.GetCombatTargetKey()local aL,aM=ad.
GetCombatDistances(aJ,aK)local aN,aO,aQ,aW=aJ and(
"<font color='rgb(0,255,255)'>"..aJ..'</font>')or
"<font color='rgb(160,160,160)'>Lobby</font>","<font color='rgb(255,200,0)'>"..
ad.GetTargetDisplay(aK)..'</font>',(
"<font color='rgb(120,255,120)'>%.0f - %.0f studs</font>"):format(aL,aM),''if aK
~='Mob'then local aX,aY=ad.GetBossArea(aJ,aK)local aZ,a_=ad.GetInnerDeadzone(aJ,
aK)local a0=aX and("<font color='rgb(0,255,255)'>Area: %.0f studs</font>"):
format(aY)or"<font color='rgb(160,160,160)'>Area: Off</font>"if aX and aZ then
a0=a0..(" <font color='rgb(255,100,100)'>(Donut: %.0f)</font>"):format(a_)end aW
=' | '..a0 end local aX,aY=ad.GetDisableDodge(aJ,aK),ad.GetEnableHazardScanner(
aJ,aK)if aX then aW=aW.." | <font color='rgb(255,100,100)'>No Dodge</font>"end
if not aY or aX then aW=aW.." | <font color='rgb(255,160,50)'>No Scanner</font>"
end pcall(function()aH:UpdateName(('Active: %s | Target: %s (%s%s)'):format(aN,
aO,aQ,aW))end)end local a1=function()aL=true local a1,a2=ad.GetCombatDistances(
aJ,aK)if aN then pcall(function()aN:UpdateValue(a1)end)end if aO then pcall(
function()aO:UpdateValue(a2)end)end if aQ then pcall(function()aQ:UpdateState(ad
.GetDisableDodge(aJ,aK),true)end)end if aW then pcall(function()aW:UpdateState(
ad.GetEnableHazardScanner(aJ,aK),true)end)end if aK=='Mob'then if aX then pcall(
function()aX:UpdateState(false,true)end)end if aY then pcall(function()aY:
UpdateValue(80)end)end if aZ then pcall(function()aZ:UpdateState(false,true)end)
end if a_ then pcall(function()a_:UpdateValue(25)end)end else local a3,a4=ad.
GetBossArea(aJ,aK)if aX then pcall(function()aX:UpdateState(a3,true)end)end if
aY then pcall(function()aY:UpdateValue(a4)end)end local a5,a6=ad.
GetInnerDeadzone(aJ,aK)if aZ then pcall(function()aZ:UpdateState(a5,true)end)end
if a_ then pcall(function()a_:UpdateValue(a6)end)end end if a0 then pcall(
function()local a3=aK=='Mob'and
" <font color='rgb(160,160,160)'>(Boss Area N/A)</font>"or''a0:UpdateName((
[[Editing: <font color='rgb(0,255,255)'>%s</font> / <font color='rgb(255,200,0)'>%s</font>%s]]
):format(aJ,ad.GetTargetDisplay(aK),a3))end)end aL=false aM()end local a2,a3=aG:
Dropdown{Name='Select Dungeon',Options=aI,Default=aJ,Required=true,Callback=
function(a2)if type(a2)=='string'and#a2>0 then aJ=a2 a1()end end},aG:Dropdown{
Name='Select Target',Options=ad.GetTargetOptions(),Default='Normal',Required=
true,Callback=function(a2)aK=ad.GetTargetKey(a2)a1()end}a0=aG:Label{Text=''}
local a4,a5=ad.GetCombatDistances(aJ,aK)aN=ah.PatchSliderLoadCallback(aG:Slider{
Name='Min Combat Distance (studs)',Default=a4,Minimum=2,Maximum=150,
DisplayMethod='Value',Precision=1,Callback=function(a6)if aL then return end ad.
SetMinCombatDistance(aJ,aK,a6)aM()end})aO=ah.PatchSliderLoadCallback(aG:Slider{
Name='Max Combat Distance (studs)',Default=a5,Minimum=5,Maximum=200,
DisplayMethod='Value',Precision=1,Callback=function(a6)if aL then return end ad.
SetMaxCombatDistance(aJ,aK,a6)aM()end})local a6,a7=ad.GetDisableDodge(aJ,aK),ad.
GetEnableHazardScanner(aJ,aK)aQ=aG:Toggle{Name='Disable Dodge on Target',Default
=a6,Callback=function(a8)if aL then return end ad.SetDisableDodge(aJ,aK,a8)aM()
end}aW=aG:Toggle{Name='Enable Hazard Scanner on Target',Default=a7,Callback=
function(a8)if aL then return end ad.SetEnableHazardScanner(aJ,aK,a8)aM()end}aG:
Header{Name='Boss Area Constraint (Boss Only)'}local a8,a9=ad.GetBossArea(aJ,aK)
aX=aG:Toggle{Name='Enable Boss Area Constraint',Default=a8,Callback=function(b)
if aL then return end if aK=='Mob'then if aX then pcall(function()aX:
UpdateState(false)end)end return end ad.SetBossAreaEnabled(aJ,aK,b)aM()end}aY=ah
.PatchSliderLoadCallback(aG:Slider{Name='Boss Area Radius (studs)',Default=a9,
Minimum=10,Maximum=300,DisplayMethod='Value',Precision=1,Callback=function(b)if
aL then return end if aK=='Mob'then return end ad.SetBossAreaRadius(aJ,aK,b)aM()
end})local b,ba=ad.GetInnerDeadzone(aJ,aK)aZ=aG:Toggle{Name=
'Enable Inner Deadzone (Donut Hole)',Default=b,Callback=function(bb)if aL then
return end if aK=='Mob'then if aZ then pcall(function()aZ:UpdateState(false)end)
end return end ad.SetInnerDeadzoneEnabled(aJ,aK,bb)aM()end}a_=ah.
PatchSliderLoadCallback(aG:Slider{Name='Inner Deadzone Radius (studs)',Default=
ba,Minimum=5,Maximum=150,DisplayMethod='Value',Precision=1,Callback=function(bb)
if aL then return end if aK=='Mob'then return end ad.SetInnerDeadzoneRadius(aJ,
aK,bb)aM()end})aG:Button{Name='Reset Target to Default',Callback=function()ad.
ResetTarget(aJ,aK)a1()end}aG:Button{Name='Reset Dungeon to Default',Callback=
function()ad.ResetDungeon(aJ)a1()end}local bb,bc,bd,be=af.OnDungeonNameChanged(
function(bb)if bb and type(bb)=='string'and#bb>0 then aJ=bb pcall(function()a2:
UpdateSelection(bb)end)end a1()end),af.OnBossActiveChanged(function()aM()end),af
.OnBossIndexChanged(function()aM()end),ad.OnDataChanged(function()a1()end)ai.
Register(function()pcall(bb)pcall(bc)pcall(bd)pcall(be)end)a1()end end function
a.X()local aa,ab,ac,ad,ae=a.load'd',a.load'O',a.load'S',a.load'U',a.load'W'
return function(af,ag)local ah=ag:Section{Side='Left'}ah:Header{Name=
'Combat Master'}local ai=ah:Toggle({Name='Enable Combat Master',Default=ab.
IsEnabled(),Callback=aa.Wrap(function(ai)ab.Toggle(ai)end)},
'Toggle_CombatMaster')ah:Toggle({Name='Auto Boss Combat (Skip Boss Macro)',
Default=ab.IsAutoBossCombatEnabled(),Callback=aa.Wrap(function(aj)ab.
SetAutoBossCombat(aj)end)},'Toggle_AutoBossCombat')ab.OnStateChanged(function(aj
)pcall(function()ai:UpdateState(aj,true)end)end)ac(af,ag)ad(af,ag)ae(af,ag)end
end function a.Y()local aa,ab,ac,ad,ae,af=a.load'e',a.load'c',a.load'V',a.load
'f',a.load'b',a.load'g'local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.player.Name,
false,false,false,'Desert Temple','Easy',false,true,false,3,{[77649408247578]=
true,[3220968688]=true,[2414851778]=true},{}local av,ax,ay=function()return aq[
game.PlaceId]==true end,function()for av,ax in ipairs(ar)do pcall(ax,ak,ac.
GetAllowedDifficulties(ak))end end,function()if not af.IsLobby()then return end
if ai then return end ai=true aj=false task.spawn(function()local av,ax=pcall(
function()local av=game:GetService'ReplicatedStorage':WaitForChild('remotes',15)
if not av then error'remotes not found'end local ax=ac.GetLevelReq(ak,al)pcall(
function()av:WaitForChild('createLobby',10):InvokeServer(ak,al,ax,am,an,ao)end)
if aj or not af.IsLobby()then return end task.wait(ap)if aj or not af.IsLobby()
then return end if an then pcall(function()av:WaitForChild(
'addPlayerToWhitelist',10):FireServer(ag)end)if aj or not af.IsLobby()then
return end task.wait(ap)if aj or not af.IsLobby()then return end end local ay=0
while ay<10 do local az=workspace:FindFirstChild'games'and workspace.games:
FindFirstChild'inLobby'if az then break end task.wait(0.5)ay=ay+0.5 if aj or not
af.IsLobby()then return end end if aj or not af.IsLobby()then return end task.
wait(ap)if aj or not af.IsLobby()then return end pcall(function()av:
WaitForChild('startDungeon',10):FireServer()end)end)ai=false if aj or not af.
IsLobby()then return end if av then ab.Notify('Auto Join','Joined: '..ak,3)else
ab.Notify('Auto Join','Join failed: '..tostring(ax),4)end end)end local az,aA=
function()while ae.IsActive()do task.wait(0.5)if ah and not ai and av()and af.
IsLobby()then ay()end end end,{}function aA.Toggle(aB)ah=aB if ah then ab.
Notify('Auto Join','Enabled',2)else aj=true ab.Notify('Auto Join','Stopped',2)
end end function aA.SetDungeon(aB)if type(aB)~='string'or#aB==0 then return end
ak=aB if not ac.IsDifficultyAllowed(ak,al)then local aC=ac.
GetAllowedDifficulties(ak)if#aC>0 then al=aC[1]end end ax()end function aA.
SetDifficulty(aB)if type(aB)~='string'then return end if ac.IsDifficultyAllowed(
ak,aB)then al=aB end end function aA.SetHardcore(aB)am=aB end function aA.
SetPrivate(aB)an=aB end function aA.SetWaveDefence(aB)ao=aB end function aA.
SetDelay(aB)ap=aB end function aA.GetSelectedDungeon()return ak end function aA.
GetSelectedDifficulty()return al end function aA.GetAllowedDifficulties()return
ac.GetAllowedDifficulties(ak)end function aA.OnDungeonChanged(aB)if type(aB)==
'function'then table.insert(ar,aB)end end aA.JoinNow=function()if not af.
IsLobby()then ab.Notify('Auto Join','Only available in Lobby!',3)return end task
.spawn(function()ay()end)end af.Register{Name='AutoJoin',Zone='Lobby',OnLeave=
function()aj=true ai=false end}task.spawn(az)ae.Register(function()aA.Toggle(
false)end)return aA end function a.Z()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load
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
local av=0 while av<ai and af and ad.IsDungeon()do task.wait(0.1)av=av+0.1 end
if not af or not ad.IsDungeon()then ah=false break end if autoStartCommandFn
then local ax,ay=pcall(autoStartCommandFn)if ax then ab.Notify('Auto Start',
'Game started!',3)for az=#ao,1,-1 do pcall(ao[az])end else ab.Notify(
'Auto Start','Trigger failed: '..tostring(ay),3)end else ab.Notify('Auto Start',
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
function()ae=false end)return ak end function a.aa()local aa,ab,ac,ad=a.load'e',
a.load'c',a.load'b',a.load'g'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.
player,2,false,false,false,false,60,false,
'\r\nlocal ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")\r\n\r\nlocal payload = {}\r\nlocal function collectValue(name)\r\n\tlocal value = workspace:FindFirstChild(name)\r\n\tif value and value:IsA("ValueBase") then\r\n\t\tpayload[name] = value.Value\r\n\tend\r\nend\r\n\r\ncollectValue("dungeonName")\r\ncollectValue("dungeonProgress")\r\ncollectValue("dungeonStarted")\r\n\r\nlocal hardcore = workspace:FindFirstChild("hardcore")\r\nif hardcore and hardcore:IsA("BoolValue") then\r\n\tpayload.hardcore = hardcore.Value\r\n\tpayload.isHardcore = hardcore.Value\r\nend\r\n\r\nlocal dungeon = workspace:FindFirstChild("dungeon")\r\nif dungeon then\r\n\tfor _, value in ipairs(dungeon:GetChildren()) do\r\n\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\tend\r\n\tlocal bossRoom = dungeon:FindFirstChild("bossRoom")\r\n\tif bossRoom then\r\n\t\tfor _, value in ipairs(bossRoom:GetChildren()) do\r\n\t\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\t\tend\r\n\tend\r\nend\r\n\r\nif not payload.dungeonName then return end\r\nReplayDungeon:FireServer(payload)\r\n'
,[[game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder]],
function(ae)local af,ag=pcall(loadstring,'return '..ae)if af and type(ag)==
'function'then return ag end return nil end local ar,av=pcall(loadstring,am)if
ar and type(av)=='function'then ap=av end aq=ao(an)if not aq then aq=function()
return ae:FindFirstChild'PlayerGui'and ae.PlayerGui:FindFirstChild
'rewardGuiHolder'and ae.PlayerGui.rewardGuiHolder:FindFirstChild'holder'end end
local ax,ay,az=function()local ax,ay=pcall(function()local ax=ae:FindFirstChild
'PlayerGui'local ay=ax and ax:FindFirstChild'timeLeftGui'local az=ay and ay:
FindFirstChild'Frame'return az and az:FindFirstChild'time'end)if not ax or
typeof(ay)~='Instance'then return nil end local az if ay:IsA'ValueBase'then az=
ay.Value else az=ay.Text end if type(az)=='number'then return az end if type(az)
=='string'then local aA=az:gsub('%s+',''):gsub('^%[',''):gsub('%]$','')local aB,
aC=aA:match'^(%d+):(%d+)$'if aB and aC then return tonumber(aB)*60+tonumber(aC)
end local aF=tonumber(aA)if aF then return aF end end return nil end,{},function
()if not ad.IsDungeon()then return false end if not ap then ab.Notify(
'Auto Retry','Remote command invalid',3)return false end local ax,ay=pcall(ap)if
ax then ab.Notify('Auto Retry','Retrying dungeon!',3)return true end ab.Notify(
'Auto Retry','Trigger failed: '..tostring(ay),3)return false end function ay.
Start()if ah then return end ah=true ai=false al=false task.spawn(function()
while(ag or aj)and ac.IsActive()do if not ad.IsDungeon()then task.wait(1)
continue end if ag then local aA=0 if aq then local aB,aC=pcall(aq)if aB and
typeof(aC)=='Instance'and aC.Parent then aA=#aC:GetChildren()end end if aA>=af
and not ai then ai=true az()elseif aA<af then ai=false end end if aj then local
aA=ax()if aA and aA<ak and not al then al=true az()elseif aA and aA>=ak then al=
false end end if not ag and not aj then break end task.wait(0.75)end ah=false
end)end function ay.Stop()ag=false end function ay.Toggle(aA)ag=aA if aA then al
=false ay.Start()ab.Notify('Auto Retry','Watching reward holder...',2)else ay.
Stop()ab.Notify('Auto Retry','Stopped',2)end end function ay.SetTimeRetryEnabled
(aA)aj=aA==true if aj then al=false ay.Start()ab.Notify('Auto Retry',
'Watching time left...',2)else ab.Notify('Auto Retry','Time retry stopped',2)end
end function ay.GetTimeRetryEnabled()return aj end function ay.
SetTimeRetryThreshold(aA)ak=aA end function ay.GetTimeRetryThreshold()return ak
end function ay.GetTimeLeft()return ax()end function ay.RetryNow()if not ad.
IsDungeon()then ab.Notify('Auto Retry','Only available in Dungeon!',3)return end
task.spawn(function()az()end)end ad.Register{Name='AutoRetry',Zone='Dungeon',
OnLeave=function()ai=false al=false end}ac.Register(function()ay.Stop()aj=false
end)return ay end function a.ab()local aa,ab,ac,ad,ae,af,ag,ah=a.load'P',a.load
'Y',a.load'Z',a.load'_',a.load'aa',a.load'd',a.load'V',a.load'g'return function(
ai,aj)local ak,al,am=aj:Section{Side='Left'},aj:Section{Side='Right'},function(
ak,al)for am,an in ipairs(ak)do if an==al then return am end end return nil end
ak:Header{Name='Auto Join Dungeon (Lobby)'}al:Header{Name=
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
end ar()local av=ab.GetAllowedDifficulties()local ax=aa.PatchDropdownRestore(ak:
Dropdown({Name='Difficulty',Options=av,Default=am(av,ab.GetSelectedDifficulty())
or 1,Required=true,Callback=af.Wrap(function(ax)ab.SetDifficulty(ax)ar()end)},
'Dropdown_Difficulty'),true)ak:Toggle({Name='Hardcore',Default=false,Callback=af
.Wrap(function(ay)ab.SetHardcore(ay)end)},'Toggle_HardcoreAJ')ak:Toggle({Name=
'Private Room',Default=true,Callback=af.Wrap(function(ay)ab.SetPrivate(ay)end)},
'Toggle_PrivateAJ')ak:Toggle({Name='Wave Defence',Default=false,Callback=af.
Wrap(function(ay)ab.SetWaveDefence(ay)end)},'Toggle_WaveDefenceAJ')aa.
PatchSliderLoadCallback(ak:Slider({Name='Join Delay (s)',Default=3,Minimum=0,
Maximum=15,DisplayMethod='Value',Precision=1,Callback=af.Wrap(function(ay)ab.
SetDelay(ay)end)},'Slider_JoinDelay'))ak:Button{Name='Join Now',Callback=
function()ab.JoinNow()end}al:Toggle({Name='Auto Start',Default=false,Callback=af
.Wrap(function(ay)ac.Toggle(ay)end)},'Toggle_AutoStart')aa.
PatchSliderLoadCallback(al:Slider({Name='Start Delay (s)',Default=ac.GetDelay(),
Minimum=0,Maximum=15,DisplayMethod='Value',Precision=1,Callback=af.Wrap(function
(ay)ac.SetDelay(ay)end)},'Slider_AutoStartDelay'))al:Toggle({Name=
'Auto Start Lobby',Default=false,Callback=af.Wrap(function(ay)ad.Toggle(ay)end)}
,'Toggle_AutoStartLobby')al:Toggle({Name='Auto Retry',Default=false,Callback=af.
Wrap(function(ay)ae.Toggle(ay)end)},'Toggle_AutoRetry')al:Button{Name=
'Manual Retry',Callback=function()task.spawn(function()ae.RetryNow()end)end}al:
Toggle({Name='Retry on Time Low',Default=ae.GetTimeRetryEnabled(),Callback=af.
Wrap(function(ay)ae.SetTimeRetryEnabled(ay)end)},'Toggle_RetryTimeLow')aa.
PatchSliderLoadCallback(al:Slider({Name='Retry Time Threshold (s)',Default=ae.
GetTimeRetryThreshold(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=af.Wrap(function(ay)ae.SetTimeRetryThreshold(ay)end)},
'Slider_RetryTimeThreshold'))ab.OnDungeonChanged(function(ay,az)pcall(function()
ax:ClearOptions()ax:InsertOptions(az)ax:UpdateSelection(ab.
GetSelectedDifficulty())end)ar()end)end end function a.ac()local aa,ab,ac,ad,ae,
af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av=a.load'b',a.load'c',a.load'f',a.load
'g',{},false,false,true,{},{},{},'None',false,{weapons='Weapons',helmets=
'Helmets',chests='Chests',abilities='Abilities'},{'Common','Uncommon','Rare',
'Epic','Legendary','Mythic'},{'1','5','10','15','20','25','30','35','40','45',
'50','55','60','65','70','75','80','85','90','95','100','105','110','115','120',
'125','130','135','140','145','150','155','160','165','170','175','180','185',
'190','195','200','205','210','215','220','225','230','235','240','245','250',
'255','260','265','270','275','280','285','290','295','300'},{'None','Below',
'Above'},{Common=0,Uncommon=1,Rare=2,Epic=3,Legendary=4,Mythic=5},{}for ax,ay in
ipairs(ao)do av[ay]=true end local ax={}for ay,az in ipairs(ao)do ax[string.
lower(az)]=az end local ay,az=function(ay)if type(ay)~='string'then return nil
end return ax[string.lower(ay)]end,function(ay)local az pcall(function()az=game:
GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'sellItemEvent',5)end)if not az then return false,0 end local aA={}for aB,aC in
pairs(ay)do if type(aC)=='table'and#aC>0 then aA[aB]=aC end end if next(aA)==nil
then return false,0 end local aB=pcall(function()az:FireServer(aA)end)if not aB
then return false,0 end return true,0 end local aA=az function ae.SetSellAction(
aB)if type(aB)=='function'then aA=aB end end local aB=function()local aB,aC=
pcall(function()return game:GetService'ReplicatedStorage':WaitForChild('remotes'
,5):WaitForChild('reloadInvy',5)end)if not aB or not aC then return nil,
'Could not find remote reloadInvy'end local aF,aG=pcall(function()return aC:
InvokeServer()end)if not aF or aG==nil then return nil,
'Could not read inventory'end local aH,aI,aJ,aK={},{},function(aH)return aH.
sellPrice~=nil or aH.UniqueItemID~=nil or aH.rarity~=nil end,function(aH)local
aI=tostring(aH)local aJ=tonumber(aI:match'_(%d+)$')if not aJ then return nil,nil
end local aK=aI:match'^(.-)_%d+$'return aK,aJ end local aL=function(aL,aM,aN,aO)
local aQ=false if type(aL.equipped)=='boolean'then aQ=aL.equipped elseif type(aL
.equipped)=='table'then for aW,aX in pairs(aL.equipped)do if aX==true then aQ=
true break end end end local aW=ay(aL.rarity)or'Common'table.insert(aH,{Type=an[
aM]or aM or'Unknown',Category=aN or aM,Index=aO,Name=tostring(aL.name or aL.
UniqueItemID or'?'),Rarity=aW,RarityValue=ar[aW],SellPrice=tonumber(aL.sellPrice
)or 0,UniqueItemID=aL.UniqueItemID,Equipped=aQ,LevelReq=tonumber(aL.levelReq)or
0,Raw=aL})end local function aM(aN,aO,aQ,aW)if type(aN)~='table'then return end
if aI[aN]then return end aI[aN]=true if aJ(aN)then aL(aN,aO,aQ,aW)return end for
aX,aY in pairs(aN)do if an[aX]then aM(aY,aX,nil,nil)elseif type(aY)=='table'and
aJ(aY)then local aZ,a_=aK(aX)aM(aY,aO,aZ,a_)else aM(aY,aO,aQ,aW)end end end aM(
aG,nil,nil,nil)return aH end function ae.ShouldSellItem(aC)if not aC then return
false end if ah and aC.Equipped then return false end if next(ai)and av[aC.
Rarity]and not ai[aC.Rarity]then return false end if next(aj)and aC.Type and not
aj[aC.Type]then return false end local aF,aG=ak,al if next(aF)==nil then aF={[1]
=true}aG='None'end local aH=aC.LevelReq or 0 if aG=='Below'then local aI for aJ
in pairs(aF)do if not aI or aJ>aI then aI=aJ end end if aI and aH>aI then return
false end elseif aG=='Above'then local aI for aJ in pairs(aF)do if not aI or aJ<
aI then aI=aJ end end if aI and aH<aI then return false end else if not aF[aH]
then return false end end return true end function ae.HasAnyFilter()return next(
ai)~=nil or next(aj)~=nil or next(ak)~=nil end function ae.CountMatches()local
aC,aF=aB()if not aC then return{total=0,matching=0,error=aF or
'Error reading inventory'}end local aG,aH=0,{}for aI,aJ in ipairs(aC)do aH[aJ.
Type]=(aH[aJ.Type]or 0)+1 if ae.ShouldSellItem(aJ)then aG+=1 end end return{
total=#aC,matching=aG,byCategory=aH}end local aC=function()return ad.IsDungeon()
end function ae.IsDungeon()return ad.IsDungeon()end function ae.SellItems(aF)if
not aF and not aC()then return{sold=0,skipped=0,gold=0,error=
'AutoSell is only available inside Dungeons.'}end if am then return nil end am=
true local aG,aH,aI={sold=0,skipped=0,gold=0,error=nil},aB()if not aH then aG.
error=aI or'Error reading inventory'am=false return aG end local aJ={}for aK,aL
in ipairs(aH)do if ae.ShouldSellItem(aL)then if aL.Index then aG.sold+=1 local
aM=aL.Category or aL.Type aJ[aM]=aJ[aM]or{}table.insert(aJ[aM],aL.Index)end else
aG.skipped+=1 end end local aK,aL=pcall(aA,aJ)if aK and aL and type(aL)==
'number'then aG.gold=aL end am=false return aG end function ae.SetLevelReqMode(
aF)if aF=='Below'or aF=='Above'then al=aF else al='None'end end function ae.
GetLevelReqMode()return al end function ae.SetExcludeEquipped(aF)ah=aF end
function ae.GetExcludeEquipped()return ah end function ae.SetRarityFilter(aF)ai=
{}if type(aF)=='table'then for aG,aH in pairs(aF)do if aH==true and type(aG)==
'string'then local aI=ay(aG)or aG ai[aI]=true elseif type(aH)=='string'then
local aI=ay(aH)or aH ai[aI]=true end end elseif type(aF)=='string'then local aG=
ay(aF)or aF ai[aG]=true end end function ae.GetRarityFilter()local aF={}for aG
in pairs(ai)do table.insert(aF,aG)end return aF end function ae.SetTypeFilter(aF
)aj={}if type(aF)=='table'then for aG,aH in pairs(aF)do if aH==true and type(aG)
=='string'then aj[aG]=true elseif type(aH)=='string'then aj[aH]=true end end
elseif type(aF)=='string'then aj[aF]=true end end function ae.GetTypeFilter()
local aF={}for aG in pairs(aj)do table.insert(aF,aG)end return aF end function
ae.SetLevelReqExactFilter(aF)ak={}if type(aF)=='table'then for aG,aH in pairs(aF
)do if aH==true then local aI=tonumber(aG)if aI then ak[aI]=true end else local
aI=tonumber(aH)if aI then ak[aI]=true end end end elseif type(aF)=='string'or
type(aF)=='number'then local aG=tonumber(aF)if aG then ak[aG]=true end end end
function ae.GetLevelReqExactFilter()local aF={}for aG in pairs(ak)do table.
insert(aF,tostring(aG))end return aF end local aF=function()if not af then
return end if ag then return end if not aC()then return end if not ae.
HasAnyFilter()then return end ag=true task.spawn(function()task.wait(2.5)if not
af or not aC()then return end local aF=ae.SellItems()if aF and aF.sold and aF.
sold>0 then ab.Notify('AutoSell',('Auto-sold %d item(s) on dungeon start.'):
format(aF.sold),3)end end)end function ae.Toggle(aG)af=aG and true or false if
af and aC()and not ag then aF()end end function ae.IsEnabled()return af end ad.
Register{Name='AutoSell',Zone='Dungeon',OnEnter=function()ag=false aF()end,
OnLeave=function()ag=false end}ac.OnDungeonNameChanged(function(aG)if aG and ad.
IsDungeon()then ag=false aF()end end)task.spawn(function()while aa.IsActive()do
task.wait(1.5)if af and ad.IsDungeon()and not ag then aF()end end end)aa.
Register(function()af=false ad.Unregister'AutoSell'end)ae.LEVEL_REQ_OPTIONS=ap
ae.LEVEL_REQ_MODE_OPTIONS=aq return ae end function a.ad()local aa,ab,ac=a.load
'd',a.load'ac',a.load'c'return function(ad,ae)local af=ae:Section{Side='Left'}af
:Header{Name='AutoSell'}local ag=ae:Section{Side='Right'}ag:Header{Name=
'Filter Summary'}local ah,ai,aj,ak,al,am,an,ao=ag:Label{Text='Status: --'},ag:
Label{Text='Location: --'},ag:Label{Text='Safety: --'},ag:Label{Text=
[[Trigger: <font color='rgb(200,200,255)'>In-Dungeon Only (On Start)</font>]]},
ag:Label{Text='Rarities: --'},ag:Label{Text='Item Types: --'},ag:Label{Text=
'Level Req: --'},ag:Label{Text='Exclude Equipped: --'}local ap=function()local
ap=ab.IsEnabled()local aq,ar=ap and'0, 255, 0'or'255, 80, 80',ap and'Enabled'or
'Disabled'pcall(function()ah:UpdateName("Status: <font color='rgb("..aq..")'>"..
ar..'</font>')end)local av=ab.IsDungeon()local ax,ay=av and'0, 255, 0'or
'255, 160, 80',av and'Inside Dungeon (Active)'or'In Lobby (Paused)'pcall(
function()ai:UpdateName("Location: <font color='rgb("..ax..")'>"..ay..'</font>')
end)local az=ab.HasAnyFilter()local aA,aB=az and'0, 255, 0'or'255, 80, 80',az
and'\u{2713} Active (Configured)'or'\u{26a0} NO filter selected'pcall(function()
aj:UpdateName("Safety: <font color='rgb("..aA..")'>"..aB..'</font>')end)local aC
=ab.GetRarityFilter()local aF,aG=#aC>0 and table.concat(aC,', ')or
'All (No filter)',#aC>0 and'255, 220, 120'or'160, 160, 160'pcall(function()al:
UpdateName("Rarities: <font color='rgb("..aG..")'>"..aF..'</font>')end)local aH=
ab.GetTypeFilter()local aI,aJ=#aH>0 and table.concat(aH,', ')or'All (No filter)'
,#aH>0 and'255, 220, 120'or'160, 160, 160'pcall(function()am:UpdateName(
"Item Types: <font color='rgb("..aJ..")'>"..aI..'</font>')end)local aK,aL=ab.
GetLevelReqMode(),ab.GetLevelReqExactFilter()table.sort(aL,function(aM,aN)return
(tonumber(aM)or 0)<(tonumber(aN)or 0)end)local aM,aN='1 (Safe Fallback)',
'255, 160, 80'if#aL>0 then aN='255, 220, 120'if aK=='Below'then aM=
'Below (\u{2264} '..aL[#aL]..')'elseif aK=='Above'then aM='Above (\u{2265} '..aL
[1]..')'else aM='Exact ('..table.concat(aL,', ')..')'end end pcall(function()an:
UpdateName("Level Req: <font color='rgb("..aN..")'>"..aM..'</font>')end)local aO
=ab.GetExcludeEquipped()local aQ,aW=aO and'0, 255, 0'or'255, 80, 80',aO and
'Yes (Protected)'or'No (May Sell)'pcall(function()ao:UpdateName(
"Exclude Equipped: <font color='rgb("..aQ..")'>"..aW..'</font>')end)end af:
Toggle({Name='Auto Sell on Dungeon Start',Default=ab.IsEnabled(),Callback=aa.
Wrap(function(aq)ab.Toggle(aq)ap()end)},'Toggle_AutoSellEnabled')local aq,ar={
'Common','Uncommon','Rare','Epic','Legendary','Mythic'},{'Weapons','Helmets',
'Chests','Abilities'}af:Dropdown({Name='Rarity Filter',Options=aq,Default=ab.
GetRarityFilter(),Multi=true,Required=false,Callback=aa.Wrap(function(av)ab.
SetRarityFilter(av)ap()end)},'Dropdown_AutoSellRarity')af:Dropdown({Name=
'Item Type Filter',Options=ar,Default=ab.GetTypeFilter(),Multi=true,Required=
false,Callback=aa.Wrap(function(av)ab.SetTypeFilter(av)ap()end)},
'Dropdown_AutoSellType')local av,ax=(ab.GetLevelReqMode())local ay=table.find(ab
.LEVEL_REQ_MODE_OPTIONS,av)or 1 af:Dropdown({Name='Level Req Mode',Options=ab.
LEVEL_REQ_MODE_OPTIONS,Default=ay,Multi=false,Required=true,Callback=aa.Wrap(
function(az)ab.SetLevelReqMode(az)if ax then local aA=(az=='None')ax.Settings.
Multi=aA ax.Settings.Required=not aA local aB=ab.GetLevelReqExactFilter()if#aB>0
then if not aA and#aB>1 then ax:UpdateSelection(aB[1])else ax:UpdateSelection(aB
)end end end ap()end)},'Dropdown_AutoSellLevelReqMode')ax=af:Dropdown({Name=
'Level Req Filter',Options=ab.LEVEL_REQ_OPTIONS,Default=ab.
GetLevelReqExactFilter(),Multi=av=='None',Required=av~='None',Search=true,
Callback=aa.Wrap(function(az)ab.SetLevelReqExactFilter(az)ap()end)},
'Dropdown_AutoSellLevelReq')af:Toggle({Name='Exclude Equipped Items',Default=ab.
GetExcludeEquipped(),Callback=aa.Wrap(function(az)ab.SetExcludeEquipped(az)ap()
end)},'Toggle_AutoSellExcludeEquipped')local az=af:Label({Text=
'No search made yet.'},'Label_AutoSellResult')af:Button{Name='Search',Callback=
function()task.spawn(function()pcall(function()az:UpdateName
'Reading inventory...'end)local aA=ab.CountMatches()if not aA then return end if
aA.error then pcall(function()az:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..aA.error..'</font>')end)return end local
aB,aC=(
[[Found <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching items.
]]
):format(aA.matching,aA.total),true for aF,aG in ipairs{'Weapons','Helmets',
'Chests','Abilities'}do local aH=aA.byCategory and aA.byCategory[aG]if aH then
if aC then aB..=aG..': '..aH else aB..=' \u{2022} '..aG..': '..aH end aC=false
end end pcall(function()az:UpdateName(aB)end)end)end}af:Button{Name='Sell Now',
Callback=function()task.spawn(function()if not ab.IsDungeon()then ac.Notify(
'AutoSell','AutoSell is only available inside Dungeons.',3)pcall(function()az:
UpdateName
[[<font color='rgb(255,80,80)'>AutoSell is only available inside Dungeons.</font>]]
end)return end pcall(function()az:UpdateName'Reading inventory...'end)local aA=
ab.CountMatches()if not aA then pcall(function()az:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if aA.error then pcall(function()az:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..aA.error..'</font>')end)return end local
aB,aC=ab.HasAnyFilter(),''if not aB then aC=
'\n\n<font color="rgb(255,80,80)"><b>\u{26a0} NO filter selected!</b> This will sell the ENTIRE inventory (except equipped items).</font>'
end local aF=(
[[Sell <font color='rgb(0,255,0)'>%d</font>/<font color='rgb(240,240,240)'>%d</font> matching item(s) with current filters.]]
):format(aA.matching,aA.total)aF=aF..aC..'\n\nAre you sure?'ad:Dialog{Title=
'Confirm Sale',Description=aF,Buttons={{Name='Confirm',Callback=function()task.
spawn(function()pcall(function()az:UpdateName'Reading inventory...'end)ac.
Notify('AutoSell','Selling...',2)local aG=ab.SellItems()if not aG then pcall(
function()az:UpdateName
[[<font color='rgb(255,80,80)'>A sale is already running.</font>]]end)return end
if aG.error then pcall(function()az:UpdateName(
"<font color='rgb(255,80,80)'>Error: "..aG.error..'</font>')end)return end local
aH=(
[[Done: <font color='rgb(0,255,0)'>%d</font> sold, <font color='rgb(255,200,0)'>%d</font> skipped, <font color='rgb(255,220,120)'>%s</font> gold earned.]]
):format(aG.sold,aG.skipped,tostring(aG.gold))pcall(function()az:UpdateName(aH)
end)end)end},{Name='Cancel'}}}end)end}ap()end end function a.ae()local aa,ab,ac,
ad,ae,af,ag,ah,ai,aj,ak,al,am,an=a.load'e',a.load'f',{},0.05,0.8,Color3.fromRGB(
0,255,0),'PlayerHitbox_ESP',Color3.fromRGB(255,0,0),'EnemyHitbox_ESP',0.01,
'Real','Custom',false local ao,ap,aq,ar,av,ax,ay,az=ak,1.5,aa.player,false,ak,
1.5,function(ao,ap,aq)local ar=Instance.new'SelectionBox'ar.Name=ao ar.Adornee=
ap ar.Color3=aq ar.LineThickness=ad*4 ar.SurfaceColor3=aq ar.SurfaceTransparency
=ae ar.Parent=ap end local aA=function(aA,aB,aC,aF,aG)if not aB or not aB.Parent
then return end local aH,aI=aA..'_Proxy',aB:FindFirstChild(aA)local aJ=aB:
FindFirstChild(aH)if aF==al then if aI and aI:IsA'SelectionBox'and aI.Adornee==
aB then aI:Destroy()end if not aJ then aJ=Instance.new'Part'aJ.Name=aH aJ.
Anchored=true aJ.CanCollide=false aJ.CanQuery=false aJ.CanTouch=false aJ.
Transparency=1 aJ.Parent=aB ay(aA,aJ,aC)end local aK=aB.Size local aL=math.max(
math.abs(aK.X),math.abs(aK.Y),math.abs(aK.Z))local aM=math.max(aL*aG,1)aJ.Size=
Vector3.new(aM,aM,aM)aJ.CFrame=aB.CFrame else if aJ then aJ:Destroy()end if aI
and aI:IsA'SelectionBox'and aI.Adornee~=aB then aI:Destroy()aI=nil end if not aI
or not aI:IsA'SelectionBox'or aI.Adornee~=aB then ay(aA,aB,aC)end end end local
aB,aC=function()local aB=aq and aq.Character local aC=aB and aB:FindFirstChild
'HumanoidRootPart'if not aC or not aC.Parent then return end aA(ag,aC,af,ao,ap)
end,function()if an then task.cancel(an)an=nil end local aB=function(aB)if not
aB then return end for aC,aF in ipairs(aB:GetDescendants())do if aF.Name==ag or
aF.Name==ag..'_Proxy'then aF:Destroy()end end end aB(aq and aq.Character)for aC,
aF in ipairs(aa.Players:GetPlayers())do aB(aF.Character)end end function ac.
TogglePlayerHitbox(aF)if aF==am then return end am=aF if am then if an then task
.cancel(an)an=nil end an=task.spawn(function()while am do local aG,aH=pcall(aB)
if not aG then if os.clock()-(ac.lastPlayerWarn or 0)>5 then ac.lastPlayerWarn=
os.clock()warn('[PlayerHitbox] error:',tostring(aH))end end aa.RunService.
Heartbeat:Wait()end end)else aC()end end function ac.IsPlayerHitboxEnabled()
return am end function ac.GetPlayerHitboxMode()return ao end function ac.
SetPlayerHitboxMode(aF)if aF~=ak and aF~=al then return end ao=aF end function
ac.GetPlayerHitboxScale()return ap end function ac.SetPlayerHitboxScale(aF)ap=aF
end local aF,aG=function()for aF,aG in ipairs(ab.GetTrackedEnemyData())do local
aH=aG.Root if aH and aH.Parent then aA(ai,aH,ah,av,ax)end end end,function()if
az then task.cancel(az)az=nil end for aF,aG in ipairs(game:GetService'Workspace'
:GetDescendants())do local aH,aI=aG:FindFirstChild(ai),aG:FindFirstChild(ai..
'_Proxy')if aH then aH:Destroy()end if aI then aI:Destroy()end end end function
ac.ToggleEnemyHitbox(aH)if aH==ar then return end ar=aH if ar then if az then
task.cancel(az)az=nil end az=task.spawn(function()while ar do local aI,aJ=pcall(
aF)if not aI then if os.clock()-(ac.lastEnemyWarn or 0)>5 then ac.lastEnemyWarn=
os.clock()warn('[EnemyHitbox] error:',tostring(aJ))end end aa.RunService.
Heartbeat:Wait()end end)else aG()end end function ac.IsEnemyHitboxEnabled()
return ar end function ac.GetEnemyHitboxMode()return av end function ac.
SetEnemyHitboxMode(aH)if aH~=ak and aH~=al then return end av=aH end function ac
.GetEnemyHitboxScale()return ax end function ac.SetEnemyHitboxScale(aH)ax=aH end
local aH,aI,aJ,aK,aL,aM=Color3.fromRGB(255,0,0),'SkillESP',{},false,false local
aN=function()table.clear(aJ)local aN=game:GetService'Workspace'for aO,aQ in
ipairs(aN:GetChildren())do aJ[aQ]=true end aK=true end aN()local aO,aQ=function(
aO)local aQ=aq.Character if not aQ then return false end local aW=aO while aW do
if aW==aQ then return true end aW=aW.Parent end return false end,function(aO)
local aQ=aO while aQ do if aJ[aQ]then return true end aQ=aQ.Parent end return
false end local aW=function(aW)if not aK then return end if aQ(aW)then return
end if aO(aW)then return end if aW:FindFirstChild(aI)then return end local aX=
Instance.new'SelectionBox'aX.Name=aI aX.Adornee=aW aX.Color3=aH aX.SurfaceColor3
=aH aX.SurfaceTransparency=0.8 aX.Parent=aW end local aX,aY=function()if not aK
then return end local aX=game:GetService'Workspace'for aY,aZ in ipairs(aX:
GetChildren())do if aZ:IsA'BasePart'then aW(aZ)end for a_,a0 in ipairs(aZ:
GetDescendants())do if a0:IsA'BasePart'then aW(a0)end end end end,function()if
aM then task.cancel(aM)aM=nil end local aX=game:GetService'Workspace'for aY,aZ
in ipairs(aX:GetDescendants())do local a_=aZ:FindFirstChild(aI)if a_ then a_:
Destroy()end end end function ac.ToggleSkillHitbox(aZ)if aZ==aL then return end
aL=aZ if aL then if aM then task.cancel(aM)aM=nil end aM=task.spawn(function()
while aL do local a_,a0=pcall(aX)if not a_ and os.clock()-(ac.lastSkillWarnH or
0)>5 then ac.lastSkillWarnH=os.clock()warn('[SkillHitbox] error:',tostring(a0))
end task.wait(aj)end end)else aY()end end function ac.IsSkillHitboxEnabled()
return aL end return ac end function a.af()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,
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
GetPlayers())do local aq=ap.Character if aq then for ar,av in ipairs(aq:
GetDescendants())do if av.Name==ah then av:Destroy()end end end end end function
ae.Toggle(ar)if ar==ak then return end ak=ar if ak then if am then task.cancel(
am)am=nil end am=task.spawn(function()while ak and ac.IsActive()do if not ad.
IsDungeon()then task.wait(1)continue end local av,ax=pcall(function()for av,ax
in ipairs(ab.GetTrackedEnemyData())do if ax.Model and ax.Model.Parent then ao(ax
.Model)end end end)if not av then if os.clock()-(ae.lastWarn or 0)>5 then ae.
lastWarn=os.clock()warn('[EnemyESP] error:',tostring(ax))end end task.wait(ai)
end end)else if am then task.cancel(am)am=nil end local av=pcall(aq)if not av
then warn'[EnemyESP] cleanup error'end end end function ae.IsEnabled()return ak
end function ae.GetColorNames()local ar={}for av in pairs(aj)do table.insert(ar,
av)end table.sort(ar)return ar end function ae.GetSelectedColor()return al end
function ae.SetSelectedColor(ar)if not aj[ar]then return end if ar==al then
return end al=ar local av=pcall(ap)if not av then warn'[EnemyESP] recolor error'
end end ad.Register{Name='EnemyESP',Zone='Dungeon',OnLeave=function()pcall(aq)
end}ac.Register(function()ae.Toggle(false)end)return ae end function a.ag()local
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
'Model'or not aq.Parent then return false end local ar,av=pcall(function()return
aq:GetPivot().Position end)if ar and av and ap(av)then return true end if aq.
PrimaryPart and ap(aq.PrimaryPart.Position)then return true end for ax,ay in
ipairs(aq:GetDescendants())do if ay:IsA'BasePart'and ap(ay.Position)then return
true end end return false end local ar,av=function()if not ad then return end
local ar=workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if not ar then return end for av,ax in ipairs(
ar:GetDescendants())do if not ax.Parent then continue end if ax:IsA'Model'then
if aq(ax)then pcall(function()ax:Destroy()end)end elseif ax:IsA'BasePart'then if
ap(ax.Position)then local ay=ax:FindFirstAncestorOfClass'Model'if ay and ay~=
workspace and ay~=ar then pcall(function()ay:Destroy()end)else pcall(function()
ax:Destroy()end)end end end end end,function(ar)if not ad or not ar or not ar:
IsA'BasePart'then return end if ar.Name=='Meshes/Snow'or ar.Name:lower():find
'meshes/snow'or ar.Name:lower()=='snow'then if ag[ar]==nil then ag[ar]=ar.
Transparency end pcall(function()ar.Transparency=1 end)end end local ax=function
()if not ad then return end local ax=workspace:FindFirstChild'Map'if not ax then
return end for ay,az in ipairs(ax:GetDescendants())do if az:IsA'BasePart'and(az.
Name=='Meshes/Snow'or az.Name:lower():find'meshes/snow'or az.Name:lower()==
'snow')then av(az)end end end local ay=function()if not ad then return end am()
ak()al()ar()ax()end local az,aA=function()for az,aA in ipairs(ae)do pcall(
function()aA:Disconnect()end)end table.clear(ae)local az,aA=function(az)if not
az then return end table.insert(ae,az.ChildAdded:Connect(function(aA)if not ad
then return end if not aj(aA)then pcall(function()aA:Destroy()end)end end))table
.insert(ae,az.DescendantAdded:Connect(function(aA)if not ad then return end if
aA.Name:lower():find'wooden plank'then local aB=aA.Parent while aB and aB~=az
and aB~=workspace do if aB:IsA'Model'then pcall(function()aB:Destroy()end)return
end aB=aB.Parent end end local aB=aA.Parent while aB and aB~=az and aB~=
workspace do if(aB:IsA'Model'or aB:IsA'Folder')and aB.Name:lower():find'border'
then pcall(function()aA:Destroy()end)break end aB=aB.Parent end if aA:IsA'Model'
and aq(aA)then pcall(function()aA:Destroy()end)return elseif aA:IsA'BasePart'and
ap(aA.Position)then local aC=aA:FindFirstAncestorOfClass'Model'if aC and aC~=
workspace and aC~=az then pcall(function()aC:Destroy()end)else pcall(function()
aA:Destroy()end)end return end if aA:IsA'BasePart'and(aA.Name=='Meshes/Snow'or
aA.Name:lower():find'meshes/snow'or aA.Name:lower()=='snow')then av(aA)end end))
end,workspace:FindFirstChild'Map'or workspace:FindFirstChild'dungeon'or
workspace:FindFirstChild'Dungeon'if aA then az(aA)end table.insert(ae,workspace.
ChildAdded:Connect(function(aB)if not ad then return end local aC=aB.Name:lower(
)if aC=='map'or aC=='dungeon'then az(aB)task.delay(0.2,ay)end end))end,function(
)for az,aA in pairs(ag)do if az and az.Parent then pcall(function()az.
Transparency=aA end)end end table.clear(ag)for az,aA in pairs(af)do if az and az
.Parent then pcall(function()az.CanCollide=aA.CanCollide az.CanTouch=aA.CanTouch
end)end end table.clear(af)end function ac.Toggle(aB)if aB==ad then return end
ad=aB and true or false if ad then ay()az()if loopThread then task.cancel(
loopThread)loopThread=nil end loopThread=task.spawn(function()while ad do task.
wait(ah)pcall(ay)end end)else for aC,aF in ipairs(ae)do pcall(function()aF:
Disconnect()end)end table.clear(ae)if loopThread then task.cancel(loopThread)
loopThread=nil end aA()end end function ac.IsEnabled()return ad end ab.Register(
function()ac.Toggle(false)end)return ac end function a.ah()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'ae',a.load'af',a.load'ag',a.load'P',{'Custom Hitbox',
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
GetSelectedColor(),1 for ar,av in ipairs(ao)do if av==ap then aq=ar break end
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
IsSkillHitboxEnabled(),Callback=aa.Wrap(function(av)ab.ToggleSkillHitbox(av)end)
},'Toggle_SkillHitbox')al=function()pcall(function()am:SetVisibility(ab.
GetPlayerHitboxMode()=='Custom')end)pcall(function()ar:SetVisibility(ab.
GetEnemyHitboxMode()=='Custom')end)end al()local av=aj:Section{Side='Right'}av:
Header{Name='Map'}av:Toggle({Name='Map Optimizer',Default=ad.IsEnabled(),
Callback=aa.Wrap(function(ax)ad.Toggle(ax)end)},'Toggle_MapOptimizer')end end
function a.ai()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'f',a.load'b',game
:GetService'HttpService'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az
,aA=aa.Folder..'/settings/webhook.json',{},'',false,false,false,'',{'Tier6'},
true,{},false,{common=9807270,uncommon=43520,rare=3447003,epic=10181046,
legendary=16766720,secret=15158332,ultimate=15158332,mythic=15158332},{common=1,
uncommon=2,rare=3,epic=4,legendary=5,secret=6,ultimate=6,mythic=6},10181046,{{
match='northen',prefix='Valhalla'},{match='northern',prefix='Valhalla'}},
16766720 local aB,aC=function()local aB=ac.GetCurrentDungeonName()if not aB or
aB==''then return nil end local aC=string.lower(aB)for aF,aG in ipairs(ax)do if
string.find(aC,aG.match,1,true)then return aG.prefix end end return nil end,{
legendary=true,secret=true,ultimate=true,mythic=true}local aF,aG,aH,aI=function(
aF)if not aF then return false end if aC[tostring(aF.rarity or''):lower()]then
return true end local aG=aB()if aG and aG~=''then local aH=tostring(aF.itemName
or'')return string.sub(aH,1,#aG)==aG end return false end,{'Tier1','Tier2',
'Tier3','Tier4','Tier5','Tier6'},function(aF)local aG=tonumber(tostring(aF or'')
:match'Tier(%d+)')return aG or 6 end local aJ,aK=function()if aI then return aI
end aI={}for aJ,aK in ipairs(am)do aI[aH(aK)]=true end return aI end,{uncommon=1
,common=2,rare=3,epic=4,legendary=5,secret=6}local aL,aM,aN,aO=function(aL)if
not aL then return nil end local aM=tonumber(tostring(aL.tier or''):match
'tier(%d+)')if aM then return aM end if aL.secret==true then return 6 end return
aK[string.lower(tostring(aL.rarity or''))]end,function()local aL=game:GetService
'Players'.LocalPlayer if not aL then return'?'end if aL.Name and aL.Name~=''then
return aL.Name end return aL.DisplayName or'?'end,function()local aL=game:
GetService'Players'.LocalPlayer if not aL then return nil end local aM=aL:
FindFirstChild'XP'if aM and aM:IsA'IntValue'then return aM.Value end return nil
end local function aQ(aW,aX,aY)aY=aY or 12 if aY<0 then return nil end local aZ=
aW:FindFirstChild(aX)if aZ then return aZ end for a_,a0 in ipairs(aW:
GetChildren())do local a1=aQ(a0,aX,aY-1)if a1 then return a1 end end return nil
end local aW local aX,aY=function()if ac and type(ac.GetRealPlayerLevel)==
'function'then local aX=ac.GetRealPlayerLevel()if aX then local aY=tonumber(
tostring(aX):match'%d+')if aY and aY>0 then aW=tostring(aY)return aW end end end
local aX=_G.RealPlayerLevel or(type(getgenv)=='function'and getgenv().
RealPlayerLevel)if aX then local aY=tonumber(tostring(aX):match'%d+')if aY and
aY>0 then aW=tostring(aY)return aW end end local aY=game:GetService'Players'.
LocalPlayer if not aY then return aW or'?'end local aZ=aY:FindFirstChild
'leaderstats'if aZ then for a_,a0 in ipairs(aZ:GetChildren())do local a1=string.
lower(a0.Name)if string.find(a1,'level')or string.find(a1,'lvl')then local a2=
tonumber(tostring(a0.Value):match'%d+')if a2 and a2>0 then aW=tostring(a2)if ac
and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aW)end return aW end end
end end for a_,a0 in ipairs(aY:GetChildren())do local a1=string.lower(a0.Name)if
a1=='level'or a1=='lvl'or string.find(a1,'level')then if a0:IsA'ValueBase'then
local a2=tonumber(tostring(a0.Value):match'%d+')if a2 and a2>0 then aW=tostring(
a2)if ac and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aW)end return aW
end end end end for a_,a0 in pairs(aY:GetAttributes())do local a1=string.lower(
a_)if string.find(a1,'level')or string.find(a1,'lvl')then local a2=tonumber(
tostring(a0):match'%d+')if a2 and a2>0 then aW=tostring(a2)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aW)end return aW end end end if aY
:FindFirstChild'PlayerGui'then local a_=aY.PlayerGui:FindFirstChild
'playerStatus'if a_ then local a0=aQ(a_,'levelBorder')if a0 then local a1=a0:
FindFirstChild'level'if a1 and a1:IsA'TextLabel'then local a2=a1:GetAttribute
'RealLevel'or a1:GetAttribute'OriginalText'if a2 then local a3=tonumber(
tostring(a2):match'%d+')if a3 and a3>0 then aW=tostring(a3)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aW)end return aW end end local a3=
a1.Text local a4=tonumber(tostring(a3):match'%d+')if a4 and a4>0 then aW=
tostring(a4)if ac and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aW)end
return aW end end end end end return aW or'?'end,false local aZ,a_,a0=function()
if aO~=nil or aY then return end aY=true task.spawn(function()local aZ=os.clock(
)+8 while aO==nil and os.clock()<aZ do aO=aN()if aO~=nil then break end task.
wait(0.25)end aY=false end)end,function()local aZ,a_=pcall(function()return game
:GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'reloadInvy',5)end)if not aZ or not a_ or not a_:IsA'RemoteFunction'then return
nil end local a0,a1=pcall(function()return a_:InvokeServer()end)if not a0 or a1
==nil then return nil end if type(a1)=='table'and a1['1']and type(a1['1'])==
'table'then return a1['1']end return a1 end,function(aZ)return type(aZ)=='table'
and(aZ.sellPrice~=nil or aZ.UniqueItemID~=nil or aZ.rarity~=nil or aZ.name~=nil)
end local a1=function(a1)if type(a1)~='table'then return{}end local a2,a3={},{}
local function a4(a5,a6)if type(a5)~='table'or a3[a5]then return end a3[a5]=true
if a0(a5)then local a7=(a5.UniqueItemID and tostring(a5.UniqueItemID))or(a5.
uniqueItemNum and tostring(a5.uniqueItemNum))or nil table.insert(a2,{category=a6
,raw=a5,id=a7,name=tostring(a5.name or a5.itemName or''),rarity=tostring(a5.
rarity or''):lower()})return end for a7,a8 in pairs(a5)do if type(a8)=='table'
then local a9=a6 if a7=='weapons'or a7=='weapon'then a9='weapon'elseif a7==
'helmets'or a7=='helmet'then a9='helmet'elseif a7=='chests'or a7=='chest'then a9
='chest'elseif a7=='abilities'or a7=='ability'then a9='ability'end a4(a8,a9)end
end end a4(a1,nil)return a2 end local a2=function()if not an or ap then return
end ap=true task.spawn(function()local a2=a_()if a2 then local a3,a4=a1(a2),{}
for a5,a6 in ipairs(a3)do if a6.id then a4[a6.id]=true end end ao=a4 end ap=
false end)end local a3,a4=function()aO=aN()if aO==nil then aZ()end ac.
SetDungeonStartTime(nil)if an then a2()end end,function()if not ac.
GetDungeonStartTime()then ac.SetDungeonStartTime(os.clock())end if aO==nil then
aZ()end if an then a2()end end local a5,a6,a7,a8=function()if aA then return end
local a5=function(a5)if a5 then a3()else a4()end end a5(ac.IsInLobby())aA=ac.
OnLobbyChanged(a5)end,function(a5)a5=math.max(0,math.floor(a5 or 0))local a6,a7=
math.floor(a5/60),a5%60 return string.format('%d:%02d',a6,a7)end,function(a5)if
not a5 then return'0'end local a6,a7=(tostring(math.floor(a5)))while true do a6,
a7=string.gsub(a6,'^(-?%d+)(%d%d%d)','%1,%2')if a7==0 then break end end return
a6 end,function(a5)if not a5 then return 0,0 end local a6=string.gsub(tostring(
a5),',','')local a7,a8=string.match(a6,'(%d+)%s*/%s*(%d+)')if a7 and a8 then
return tonumber(a7)or 0,tonumber(a8)or 0 end local a9=tonumber(string.match(a6,
'^%s*([%d.-]+)'))return 0,a9 or 0 end local a9,b,ba,bb,bc=function(a9)if not an
or not a9 or type(a9.items)~='table'or#a9.items==0 then return end local b=a_()
if not b then return end local ba=a1(b)if#ba==0 then return end local bb={}for
bc,bd in ipairs(ba)do if bd.id and not ao[bd.id]then table.insert(bb,bd)end end
local bc,bd=(#bb>0)and bb or ba,{}for be,bf in ipairs(a9.items)do local bg=
tostring(bf.itemType or''):lower()if bg=='ability'or bg=='gold'or bf.itemName==
'gold'then continue end local bh,bi=(tostring(bf.itemName or''):lower())for bj,
bk in ipairs(bc)do if not bd[bj]then local bl=bk.name:lower()if bl==bh or string
.find(bl,bh,1,true)or string.find(bh,bl,1,true)then bd[bj]=true bi=bk break end
end end if bi then local bj=bi.raw local bk,bl,bm,bn,bo=tostring(bj.name or bj.
itemName or bf.itemName or''),bi.category or bg,bj.totalUpgrades or bj.
maxUpgrades or bj.totalUpgrade or bj.maxUpgrade or bj.upgradesTotal or bj.
upgradesMax or bj.upgradeTotal or bj.upgradeLimit or bj.availableUpgrades,0,0 if
bm~=nil then bo=tonumber(bm)or 0 end if bj.curUpgrades~=nil or bj.
currentUpgrades~=nil then bn=tonumber(bj.curUpgrades or bj.currentUpgrades)or 0
end if bj.upgrades~=nil then if type(bj.upgrades)=='string'then local bp,bq=a8(
bj.upgrades)bn=bn~=0 and bn or bp bo=bo~=0 and bo or bq elseif type(bj.upgrades)
=='number'then bn=bn~=0 and bn or bj.upgrades elseif type(bj.upgrades)=='table'
then local bp,bq=bj.upgrades.cur or bj.upgrades.current or bj.upgrades[1],bj.
upgrades.max or bj.upgrades.total or bj.upgrades.totalUpgrades or bj.upgrades[2]
if bp~=nil then bn=bn~=0 and bn or(tonumber(bp)or 0)end if bq~=nil then bo=bo~=0
and bo or(tonumber(bq)or 0)end end end local bp,bq,br,bs,bt,bu=tonumber(bj.
physicalDamage or bj.physicalPower or 0)or 0,tonumber(bj.spellPower or 0)or 0,
tonumber(bj.health or 0)or 0,'',0,''if bl=='weapon'or string.find(bl,'weapon')
then if bq>bp then bs='Spell'bt=bq bu='\u{1f52e}'else bs='Phys'bt=bp bu=
'\u{2694}\u{fe0f}'end else local bv=bk:lower()if string.find(bv,'guardian')then
bs='HP'bt=br bu='\u{1f6e1}\u{fe0f}'elseif string.find(bv,'mage')then bs='Spell'
bt=bq bu='\u{1f52e}'elseif string.find(bv,'warrior')then bs='Phys'bt=bp bu=
'\u{2694}\u{fe0f}'else if br>10000 and br>(bp*10)then bs='HP'bt=br bu=
'\u{1f6e1}\u{fe0f}'elseif bq>bp then bs='Spell'bt=bq bu='\u{1f52e}'else bs=
'Phys'bt=bp bu='\u{2694}\u{fe0f}'end end end local bv=math.max(0,bo-bn)local bw=
bt+(bv*10)if bt>0 or bo>0 then bf.potentialInfo={statName=bs,statVal=bt,
maxPotential=bw,curUpgrades=bn,maxUpgrades=bo,icon=bu}end end end local be={}for
bf,bg in ipairs(ba)do if bg.id then be[bg.id]=true end end ao=be end,function()
if not(isfile and isfile(af))then return end local a9,b=pcall(function()return
ae:JSONDecode(readfile(af))end)if a9 and type(b)=='table'then ah=type(b.url)==
'string'and b.url or''ai=b.enabled==true ak=b.pingEnabled==true al=type(b.
pingMention)=='string'and b.pingMention or''if b.showPotential~=nil then an=b.
showPotential==true end local ba=b.pingTiers if type(ba)=='string'then ba={ba}
end if type(ba)=='table'then local bb={}for bc,bd in ipairs(ba)do if table.find(
aG,bd)and not table.find(bb,bd)then table.insert(bb,bd)end end if#bb>0 then am=
bb end end aI=nil end end,function()if not(isfile and writefile)then return end
pcall(function()writefile(af,ae:JSONEncode{url=ah,enabled=ai,pingEnabled=ak,
pingMention=al,pingTiers=am,showPotential=an})end)end,function(a9)local b={}for
ba,bb in ipairs(a9 or{})do local bc,bd=bb.itemName or'Unknown',aF(bb)if bd then
bc='\u{2b50} '..bc end local be={}if bb.itemType and bb.itemType~='gold'then
table.insert(be,bb.itemType)end if bb.rarity then table.insert(be,bb.rarity)end
local bf=''if#be>0 then bf=string.format('%s (%s)',tostring(bc),table.concat(be,
', '))else bf=tostring(bc)end if an and bb.potentialInfo then local bg=bb.
potentialInfo local bh=(bg.icon and bg.icon~='')and(bg.icon..' ')or''local bi=
string.format('  \u{2514} %sMaxPot: %s',bh,a7(bg.maxPotential))table.insert(b,bf
..'\n'..bi)else table.insert(b,bf)end end return table.concat(b,'\n')end,
function(a9)if not a9 then return false end local b=aL(a9)if not b then return
false end return aJ()[b]==true end local bd=function(bd)if not ak or al==''then
return false end for be,bf in ipairs(bd or{})do if bc(bf)then return true end
end return false end local be=function(be,bf)local bg,bh=tonumber(be.gold)or 0,{
}for bi,bj in ipairs(be.items or{})do if bj.itemName and bj.itemName~='gold'then
table.insert(bh,bj)end end local bi,bj,bk,bl,bm=av,false,function(bi,bj)if bi==
nil then return bj end if bj==nil then return bi end return(ar[bi]or 0)>=(ar[bj]
or 0)and bi or bj end for bn,bo in ipairs(bh)do local bp=tostring(bo.rarity or''
):lower()if aF(bo)then bj=true bl=bk(bl,bp)end if aq[bp]~=nil then bm=bk(bm,bp)
end end if bj then bi=bl and(aq[bl]or ay)or ay elseif bm then bi=aq[bm]end bf=bf
or{}local bn=tostring(bf.level or'?')if bn=='???'or bn=='?'or bn==''or not bn:
match'%d+'then bn=aX()end if bn=='???'or not bn:match'%d+'then bn='?'end local
bo=tonumber(bf.expGained)local bp,bq,br=bo and string.format('+%s XP',tostring(
bo))or'?',a6(bf.duration),{}if bo then table.insert(br,bp)end if bg>0 then table
.insert(br,string.format('+%s gold',tostring(bg)))end local bs,bt=#br>0 and
table.concat(br,'  ')or'',#bh>0 and bb(bh)or'None'local bu=bt if bs~=''then bu=
bs..(bt~='None'and('\n'..bt)or'')end local bv,bw={{name='Player',value=string.
format('||%s|| (lv %s)',aM(),bn),inline=true},{name='Map',value=ac.
GetCurrentDungeonName()or'Unknown',inline=true},{name='Time',value=bq,inline=
true},{name='Rewards',value=bu,inline=false}},
'You cleared the dungeon and received your rewards!'if bd(bh)then bw=bw..'\n\n'
..al end return{embeds={{title='Dungeon WIN',description=bw,color=bi,fields=bv,
timestamp=DateTime.now():ToIsoDate()}}}end local bf=function(bf,bg)if ah==''or
string.find(ah,'^https://discord%.com/api/webhooks/')==nil then return false,
'Invalid webhook URL'end local bh=be(bf,bg)local bi,bj=pcall(function()return ae
:JSONEncode(bh)end)if not bi then return false,'Could not encode payload'end
local bk,bl=pcall(function()return request{Url=ah,Method='POST',Headers={[
'Content-Type']='application/json',['User-Agent']=
'ScriptHub-DungeonQuest (https://www.roblox.com)'},Body=bj}end)if not bk then
return false,'Request error: '..tostring(bl)end if bl and bl.Success then return
true end local bm=bl and bl.StatusCode or'?'return false,'HTTP '..tostring(bm)
end function ag.SetUrl(bg)ah=bg or''ba()end function ag.GetUrl()return ah end
function ag.SetEnabled(bg)ai=bg==true ba()end function ag.IsEnabled()return ai
end function ag.SetPingEnabled(bg)ak=bg==true ba()end function ag.IsPingEnabled(
)return ak end function ag.SetPingMention(bg)al=bg or''ba()end function ag.
GetPingMention()return al end function ag.SetPingTiers(bg)if type(bg)~='table'
then return end local bh,bi={},{}local bj=function(bj)if not bi[bj]and table.
find(aG,bj)then bi[bj]=true table.insert(bh,bj)end end for bk,bl in pairs(bg)do
if type(bk)=='string'and bl==true then bj(bk)elseif type(bl)=='string'then bj(bl
)end end if#bh==0 then return end am=bh aI=nil ba()end function ag.GetPingTiers(
)return am end function ag.GetPingTierOptions()return aG end function ag.
SetShowPotential(bg)an=bg==true ba()end function ag.IsShowPotential()return an
end function ag.Send()if not ai then ab.Notify('Webhook',
'Notifications is disabled',3)return end local bg={{itemName=
'Valhalla Mage Armor',rarity='uncommon',itemType='chest',potentialInfo=an and{
statName='Spell',statVal=12400,maxPotential=1212400,curUpgrades=0,maxUpgrades=
120000,icon='\u{1f52e}'}or nil},{itemName='Gale Barrage',rarity='epic',itemType=
'ability'}}local bh,bi=bf({items=bg,gold=931797476},{level=aX(),expGained=
49530000000,duration=448})if bh then ab.Notify('Webhook',
'Test sent successfully',3)else ab.Notify('Webhook','Send failed: '..tostring(bi
),4)end end function ag.Init()if aj then return end local bg local bh=pcall(
function()bg=game:GetService'ReplicatedStorage':WaitForChild('remotes',30)end)if
not bh or not bg then warn'[Webhook] Could not find ReplicatedStorage.remotes'
return end local bi=bg:FindFirstChild'cloneRewardGui'if not bi then warn
'[Webhook] Could not find remote cloneRewardGui'return end az=bi.OnClientEvent:
Connect(function(bj)if not ai then return end aZ()local bk=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local bl,bm=(aN())if aO~=nil and bl~=nil then bm=math.max(0,bl-aO)end
if an then pcall(a9,bj)end local bn,bo=bf(bj,{level=aX(),expGained=bm,duration=
bk})if not bn then ab.Notify('Webhook WIN','Send failed: '..tostring(bo),4)end
end)end)aj=true ab.Notify('Webhook','Webhook notifications ready',2)a5()if an
then a2()end end b()ad.Register(function()if az then az:Disconnect()az=nil end
if aA then aA()aA=nil end aj=false end)return ag end function a.aj()local aa=a.
load'ai'return function(ab,ac)local ad=ac:Section{Side='Right'}ad:Header{Name=
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
}end end function a.ak()local aa={}function aa.Apply(ab,ac,ad)for ae,af in
pairs(ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=
af end)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af
,{__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local
ai,aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.al()local aa,ab,ac,ad,ae,af=a.load'ak',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.am()local
aa,ab,ac,ad,ae,af,ag=a.load'a',a.load'b',a.load'ak',a.load'f',game:GetService
'Players',game:GetService'HttpService','Username'local ah=function()return(aa
and aa.Folder)or'EsclipseHub'end local ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az
,aA,aB,aC,aF,aG,aH,aI=function()return ah()..'/settings/streaming_mode.json'end,
{},false,false,ag,false,false,false,{},{},{},false,{},
'rbxassetid://92481398073007',{},false,function()return ae.LocalPlayer end,
function()if not(isfolder and makefolder)then return end pcall(function()local
ai=ah()if not isfolder(ai)then makefolder(ai)end local aj=ai..'/settings'if not
isfolder(aj)then makefolder(aj)end end)end local aJ,aK,aL,aM=function()local aJ=
ai()if not(isfile and isfile(aJ))then return end local aK,aL=pcall(function()
return af:JSONDecode(readfile(aJ))end)if aK and type(aL)=='table'then if aL.
enabled~=nil then ak=aL.enabled==true end if type(aL.replacement)=='string'and#
aL.replacement>0 then if aL.replacement=='EclipseHub'then am=ag else am=aL.
replacement end end if aL.maskStats~=nil then ap=aL.maskStats==true end end end,
function()if not(writefile and isfile)then return end aF()pcall(function()
writefile(ai(),af:JSONEncode{enabled=ak,replacement=am,maskStats=ap})end)end,
function()local aJ,aK={},aC()if not aK then return aJ end local aL,aM,aN=aK.Name
,aK.DisplayName,string.lower(am)if aL and#aL>=2 and string.lower(aL)~=aN then
table.insert(aJ,aL)end if aM and#aM>=2 and string.lower(aM)~=aN and string.
lower(aM)~=string.lower(aL)then table.insert(aJ,aM)end table.sort(aJ,function(aO
,aQ)return#aO>#aQ end)return aJ end,function(aJ,aK,aL)if#aJ==0 or#aK==0 then
return aJ end local aM,aN,aO=string.lower(aJ),{},1 while aO<=#aJ do local aQ,aW,
aX for aY,aZ in ipairs(aK)do local a_,a0=string.find(aM,string.lower(aZ),aO,true
)if a_ then if aQ==nil or a_<aQ or(a_==aQ and#aZ>#aX)then aQ=a_ aW=a0 aX=aZ end
end end if not aQ then table.insert(aN,string.sub(aJ,aO))break end if aQ>aO then
table.insert(aN,string.sub(aJ,aO,aQ-1))end table.insert(aN,aL)aO=aW+1 end return
table.concat(aN)end local aN,aO,aQ=function(aN,aO,aQ)if#aN==0 or#aO==0 then
return aN end if not string.find(aN,'<')or not string.find(aN,'>')then return
aM(aN,aO,aQ)end local aW,aX={},1 while aX<=#aN do local aY,aZ=string.find(aN,
'<[^>]->',aX)if not aY then local a_=string.sub(aN,aX)table.insert(aW,aM(a_,aO,
aQ))break end if aY>aX then local a_=string.sub(aN,aX,aY-1)table.insert(aW,aM(a_
,aO,aQ))end table.insert(aW,string.sub(aN,aY,aZ))aX=aZ+1 end return table.
concat(aW)end,function(aN)return aN:IsA'TextLabel'or aN:IsA'TextButton'or aN:IsA
'TextBox'end,function()local aN={}pcall(function()if typeof(gethui)=='function'
then local aO=gethui()if aO and aO~=game:GetService'CoreGui'then table.insert(aN
,aO)end end end)pcall(function()local aO=game:GetService'CoreGui'if aO then
table.insert(aN,aO)end end)return aN end local aW=function(aW)if not aO(aW)then
return end if aW:IsA'TextBox'and aW:IsFocused()then return end local aX=aL()if#
aX==0 then return end local aY=aq[aW]if aY then local aZ=aW.Text local a_=aN(aZ,
aX,am)if a_~=aZ then aY.original=aZ an=true aW.Text=a_ an=false end return end
local aZ=aW.Text local a_,a0=aN(aZ,aX,am),{original=aZ,conns={}}if a_~=aZ then
an=true aW.Text=a_ an=false end local a1=aW:GetPropertyChangedSignal'Text':
Connect(function()if an then return end if not al then return end local a1,a2=aW
.Text,aL()local a3=aN(a1,a2,am)if a3~=a1 then a0.original=a1 an=true aW.Text=a3
an=false else a0.original=a1 end end)table.insert(a0.conns,a1)if aW:IsA'TextBox'
then local a2=aW.FocusLost:Connect(function()if not al then return end local a2,
a3=aW.Text,aL()local a4=aN(a2,a3,am)if a4~=a2 then a0.original=a2 an=true aW.
Text=a4 an=false end end)table.insert(a0.conns,a2)end local a2 a2=aW.
AncestryChanged:Connect(function(a3,a4)if not a4 then for a5,a6 in ipairs(a0.
conns)do pcall(function()a6:Disconnect()end)end aq[aW]=nil end end)table.insert(
a0.conns,a2)aq[aW]=a0 end local aX,aY,aZ,a_=function(aX)if not aX then return
end pcall(function()for aY,aZ in ipairs(aX:GetDescendants())do if aO(aZ)then aW(
aZ)end end end)end,function(aX)if not aX then return end local aY,aZ=pcall(
function()return aX.DescendantAdded:Connect(function(aY)if not al then return
end task.spawn(aW,aY)end)end)if aY and aZ then table.insert(ar,aZ)end end,
function()local aX=aL()for aY,aZ in pairs(aq)do for a_,a0 in ipairs(aZ.conns)do
pcall(function()a0:Disconnect()end)end pcall(function()if aY and aY.Parent and
aZ.original then local a_,a0=aY.Text,aN(aZ.original,aX,am)if a_==a0 then an=true
aY.Text=aZ.original an=false end end end)end table.clear(aq)end,function()if aG
and typeof(aG.SetUserInfoState)=='function'then pcall(function()aG:
SetUserInfoState(not ak)end)end end function aj.Start()ak=true aK()if al then
return end al=true local a0=aC()if a0 then local a1=a0:FindFirstChild'PlayerGui'
if a1 then aX(a1)aY(a1)else local a2 a2=a0.ChildAdded:Connect(function(a3)if a3.
Name=='PlayerGui'then if a2 then a2:Disconnect()end if al then aX(a3)aY(a3)end
end end)table.insert(ar,a2)end if a0.Character then aX(a0.Character)aY(a0.
Character)end local a2=a0.CharacterAdded:Connect(function(a2)if not al then
return end task.wait(0.2)if not al then return end aX(a2)aY(a2)end)table.insert(
ar,a2)end pcall(function()local a1=workspace.DescendantAdded:Connect(function(a1
)if not al then return end if a1:IsA'BillboardGui'or a1:IsA'SurfaceGui'then for
a2,a3 in ipairs(a1:GetDescendants())do aW(a3)end local a2=a1.DescendantAdded:
Connect(function(a2)if not al then return end aW(a2)end)table.insert(ar,a2)end
end)table.insert(ar,a1)end)for a1,a2 in ipairs(aQ())do aX(a2)aY(a2)end a_()task.
spawn(function()for a1,a2 in ipairs{0.3,0.8,1.5,3}do task.wait(a2)if not al then
break end local a3=aC()if a3 then local a4=a3:FindFirstChild'PlayerGui'if a4
then aX(a4)end if a3.Character then aX(a3.Character)end end for a4,a5 in ipairs(
aQ())do aX(a5)end end end)if aH then pcall(task.cancel,aH)end aH=task.spawn(
function()while al do task.wait(0.5)if not al then break end local a1=aC()if a1
then local a2=a1:FindFirstChild'PlayerGui'if a2 then aX(a2)end if a1.Character
then aX(a1.Character)end end for a2,a3 in ipairs(aQ())do aX(a3)end end end)end
function aj.Stop()ak=false aK()if not al then return end al=false if aH then
pcall(task.cancel,aH)aH=nil end for a0,a1 in ipairs(ar)do pcall(function()a1:
Disconnect()end)end table.clear(ar)aZ()a_()end function aj.IsEnabled()return ak
end function aj.IsRunning()return al end local a0={k=1e3,m=1e6,b=1e9,t=1e12,qa=
1e15,qi=1e18}local a1=function(a1)if not a1 then return nil end local a2=string.
gsub(a1,'[,%s]','')local a3,a4=string.match(a2,'^([%-%d.]+)%s*(%a*)$')if not a3
then return nil end local a5=tonumber(a3)if not a5 then return nil end if a4 and
#a4>0 then local a6=a0[string.lower(a4)]if a6 then a5=a5*a6 end end return a5
end local a2=function(a2)if not a2 or#a2==0 then return nil end local a3=string.
gsub(a2,'<[^>]->','')local a4,a5=string.match(a3,
'^%s*([%-%d.,]+%s*%a*)%s*/%s*([%-%d.,]+%s*%a*)%s*$')if not a4 or not a5 then
return nil end local a6,a7=a1(a4),a1(a5)if not a6 or not a7 or a7<=0 then return
nil end local a8=math.clamp((a6/a7)*100,0,100)if a8==math.floor(a8)then return
string.format('%d%%',a8)else return string.format('%.1f%%',a8)end end
local function a3(a4,a5,a6)local a7=a6 or 6 if a7<0 or not a4 then return nil
end local a8=a4:FindFirstChild(a5)if a8 then return a8 end for a9,b in ipairs(a4
:GetChildren())do local ba=a3(b,a5,a7-1)if ba then return ba end end return nil
end local a4,a5=function()local a4=aC()if not a4 then return{}end local a5=a4:
FindFirstChild'PlayerGui'if not a5 then return{}end local a6=a5:FindFirstChild
'playerStatus'if not a6 then return{}end local a7=a6:FindFirstChild'Frame'if not
a7 then return{}end local a8,a9,b={},(a7:FindFirstChild'xpFrame')if a9 then b=a9
:FindFirstChild'xp'if not(b and b:IsA'TextLabel')then b=a9:
FindFirstChildWhichIsA'TextLabel'end end if not b then local ba=a3(a7,'xp',4)if
ba and ba:IsA'TextLabel'then b=ba end end if b and b:IsA'TextLabel'then table.
insert(a8,b)end local ba,bb=a7:FindFirstChild'healthFrame'or a7:FindFirstChild
'hpFrame'if ba then bb=ba:FindFirstChild'health'or ba:FindFirstChild'hp'if not(
bb and bb:IsA'TextLabel')then bb=ba:FindFirstChildWhichIsA'TextLabel'end end if
not bb then local bc=a3(a7,'health',4)or a3(a7,'hp',4)if bc and bc:IsA
'TextLabel'then bb=bc end end if bb and bb:IsA'TextLabel'then table.insert(a8,bb
)end local bc,bd=(a7:FindFirstChild'levelBorder')if bc then bd=bc:FindFirstChild
'level'if not(bd and bd:IsA'TextLabel')then bd=bc:FindFirstChildWhichIsA
'TextLabel'end end if not bd then local be=a3(a7,'level',4)if be and be:IsA
'TextLabel'then bd=be end end if bd and bd:IsA'TextLabel'then table.insert(a8,bd
)end return a8 end,function(a4)if a4.Name=='level'then return true end if a4.
Parent and a4.Parent.Name=='levelBorder'then return true end return false end
local a6,a7,a8=function(a6,a7)if a5(a6)then return'???'end return a2(a7)end,
function(a6)pcall(function()a6.FontFace=Font.fromName('GothamSSm',Enum.
FontWeight.Bold)end)pcall(function()a6.Font=Enum.Font.GothamBold end)end,
function(a6,a7)pcall(function()if a7.originalFontFace then a6.FontFace=a7.
originalFontFace elseif a7.originalFont then a6.Font=a7.originalFont end end)end
local a9,b,ba,bb,bc=function(a9)if not a9 or not a9:IsA'TextLabel'then return
end if av[a9]then return end local b=a9.Text local ba,bb=a6(a9,b),{original=b,
originalFontFace=a9.FontFace,originalFont=a9.Font,conn=nil}if a5(a9)then local
bc=tonumber(tostring(b):match'%d+')if bc and bc>0 then local bd=tostring(bc)
pcall(function()a9:SetAttribute('RealLevel',bd)end)if ad and ad.
SetRealPlayerLevel then ad.SetRealPlayerLevel(bd)end _G.RealPlayerLevel=bd end
end a7(a9)if ba and ba~=b then ax=true a9.Text=ba ax=false end local bc=a9:
GetPropertyChangedSignal'Text':Connect(function()if ax then return end if not ap
then return end local bc=a9.Text local bd=a6(a9,bc)a7(a9)if bd and bd~=bc then
bb.original=bc if a5(a9)then local be=tonumber(tostring(bc):match'%d+')if be and
be>0 then local bf=tostring(be)pcall(function()a9:SetAttribute('RealLevel',bf)
end)if ad and ad.SetRealPlayerLevel then ad.SetRealPlayerLevel(bf)end _G.
RealPlayerLevel=bf end end ax=true a9.Text=bd ax=false elseif not bd and not
string.find(bc,'%%')and bc~='???'then bb.original=bc if a5(a9)then local be=
tonumber(tostring(bc):match'%d+')if be and be>0 then local bf=tostring(be)pcall(
function()a9:SetAttribute('RealLevel',bf)end)if ad and ad.SetRealPlayerLevel
then ad.SetRealPlayerLevel(bf)end _G.RealPlayerLevel=bf end end end end)bb.conn=
bc local bd bd=a9.AncestryChanged:Connect(function(be,bf)if not bf then if bb.
conn then pcall(function()bb.conn:Disconnect()end)end pcall(function()bd:
Disconnect()end)av[a9]=nil end end)av[a9]=bb end,function()for a9,b in pairs(av)
do if b.conn then pcall(function()b.conn:Disconnect()end)end pcall(function()if
a9 and a9.Parent then if b.original then ax=true a9.Text=b.original ax=false end
a8(a9,b)end end)end table.clear(av)end,function()local a9=aC()if not a9 then
return nil end local b=a9:FindFirstChild'PlayerGui'if not b then return nil end
local ba=b:FindFirstChild'playerStatus'if not ba then return nil end local bb=ba
:FindFirstChild'Frame'if not bb then return nil end local bc=bb:FindFirstChild
'portraitBorder'if bc then local bd=bc:FindFirstChild'portrait'if bd and bd:IsA
'ImageLabel'then return bd end local be=bc:FindFirstChildWhichIsA'ImageLabel'if
be then return be end end local bd=a3(bb,'portrait',4)if bd and bd:IsA
'ImageLabel'then return bd end return nil end,function(a9)if not a9 or not a9:
IsA'ImageLabel'then return end if aA[a9]then return end local b=a9.Image local
ba={originalImage=b,conn=nil}if b~=az then aB=true a9.Image=az aB=false end
local bb=a9:GetPropertyChangedSignal'Image':Connect(function()if aB then return
end if not ap then return end local bb=a9.Image if bb~=az then ba.originalImage=
bb aB=true a9.Image=az aB=false end end)ba.conn=bb local bc bc=a9.
AncestryChanged:Connect(function(bd,be)if not be then if ba.conn then pcall(
function()ba.conn:Disconnect()end)end pcall(function()bc:Disconnect()end)aA[a9]=
nil end end)aA[a9]=ba end,function()for a9,b in pairs(aA)do if b.conn then
pcall(function()b.conn:Disconnect()end)end pcall(function()if a9 and a9.Parent
and b.originalImage then aB=true a9.Image=b.originalImage aB=false end end)end
table.clear(aA)end local bd=function()if not ap then return end local bd=a4()for
be,bf in ipairs(bd)do a9(bf)if av[bf]then a7(bf)end end local be=ba()if be then
bb(be)if aA[be]and be.Image~=az then aB=true be.Image=az aB=false end end end
local be,bf=function()if aI then return end bd()aI=task.spawn(function()while ap
do bd()task.wait(0.5)end aI=nil end)end,function()if aI then pcall(task.cancel,
aI)aI=nil end for be,bf in ipairs(ay)do pcall(function()bf:Disconnect()end)end
table.clear(ay)b()bc()end function aj.SetMaskStats(bg)ap=bg==true aK()if ap then
be()else bf()end end function aj.IsMaskStats()return ap end function aj.
SetReplacement(bg)if typeof(bg)~='string'or#bg==0 then bg=ag end if am==bg then
return end local bh=al if bh then aj.Stop()end am=bg aK()if bh then aj.Start()
end end function aj.GetReplacement()return am end function aj.SetWindow(bg)aG=bg
if al or ak then a_()end end function aj.Init()if ao then return end ao=true if
ak and not al then aj.Start()end if ap then be()end end function aj.GetRealLevel
()for bg,bh in pairs(av)do if a5(bg)and bh.original then local bi=tonumber(
tostring(bh.original):match'%d+')if bi and bi>0 then return tostring(bi)end end
end if _G.RealPlayerLevel then return _G.RealPlayerLevel end return nil end aJ()
ab.Register(function()if al then aj.Stop()end if ap then bf()end ao=false end)
return(ac.Wrap(aj,{Enabled=function(bg)if bg then aj.Start()else aj.Stop()end
end,Replacement=function(bg)aj.SetReplacement(bg)end,MaskStats=function(bg)aj.
SetMaskStats(bg)end}))end function a.an()local aa,ab,ac,ad=a.load'd',a.load'P',a
.load'al',a.load'am'return function(ae,af)local ag=af:Section{Side='Left'}ag:
Header{Name='Anti AFK'}ag:Toggle({Name='Anti AFK',Default=ac.IsEnabled(),
Callback=aa.Wrap(function(ah)if ah then ac.Start()else ac.Stop()end end)},
'Toggle_AntiAFK')ab.PatchSliderLoadCallback(ag:Slider({Name='Interval (seconds)'
,Default=ac.GetInterval(),Minimum=5,Maximum=300,DisplayMethod='Round',Precision=
0,Callback=aa.Wrap(function(ah)ac.SetInterval(ah)end)},'Slider_AntiAFKInterval')
)local ah=af:Section{Side='Right'}ah:Header{Name='Streaming Mode'}ah:Toggle({
Name='Streaming Mode (Hide Identity)',Default=ad.IsEnabled(),Callback=aa.Wrap(
function(ai)if ai then ad.Start()else ad.Stop()end end)},'Toggle_StreamingMode')
ah:Toggle({Name='Hide Stats (Level, XP, HP)',Default=ad.IsMaskStats(),Callback=
aa.Wrap(function(ai)ad.SetMaskStats(ai)end)},'Toggle_StreamingMaskStats')ah:
Input({Name='Fake Display Name',Placeholder='Username',AcceptedCharacters='All',
Default=ad.GetReplacement(),Callback=aa.Wrap(function(ai)ad.SetReplacement(ai)
end)},'Input_StreamingReplacement')end end function a.ao()return function(aa,ab)
a.load'ah'(aa,ab)a.load'aj'(aa,ab)a.load'an'(aa,ab)end end function a.ap()local
aa,ab,ac=a.load'a',a.load'c',game:GetService'HttpService'local ad,ae,af,ag=aa.
Folder..'/settings/autohide.json',{},false local ah,ai=function()if not(isfile
and isfile(ad))then return end local ah,ai=pcall(function()return ac:JSONDecode(
readfile(ad))end)if ah and type(ai)=='table'then af=ai.enabled==true end end,
function()if not(isfile and writefile)then return end pcall(function()writefile(
ad,ac:JSONEncode{enabled=af})end)end function ae.SetWindow(aj)ag=aj end function
ae.SetEnabled(aj)af=aj==true ai()end function ae.IsEnabled()return af end
function ae.Hide()if not af or not ag then return end local aj=pcall(function()
ag:SetState(false)end)if not aj then warn
'[AutoHide] Kh\u{f4}ng \u{1ea9}n \u{111}\u{1b0}\u{1ee3}c window'end end function
ae.Execute()if not af then return end task.spawn(function()task.wait(0.5)ae.
Hide()end)end ah()return ae end function a.aq()local aa,ab,ac,ad=a.load'a',a.
load'd',a.load'ap',a.load'h'return function(ae,af)local ag=aa.Folder local ah=ag
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
ab.Suspend()ad.SetLocked(true)local ar,av=aa:LoadConfig(aq)if not ar then ad.
SetLocked(false)ab.Resume()ae:Notify{Title='Interface',Description=
'Unable to load config: '..tostring(av)}return end aj(aq)task.delay(0.5,function
()ad.SetLocked(false)end)task.delay(1.5,function()ab.Resume()end)ae:Notify{Title
='Interface',Description=string.format('Loaded config %q',aq)}end}ak:Button{Name
='Overwrite Config',Callback=function()local aq=am.Value if not aq or aq==''then
ae:Notify{Title='Interface',Description='Please select a config first.'}return
end local ar,av=aa:SaveConfig(aq)if not ar then ae:Notify{Title='Interface',
Description='Unable to overwrite config: '..tostring(av)}return end aj(aq)ae:
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
'Press RightControl to show the window again.'}end end function a.ar()local aa,
ab,ac,ad,ae,af=a.load'f',a.load'aa','Boss Active','Boss','Dungeon','Time Left'
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
'Timer'}local ar=ai:Label{Text=af..': --'}local av=function()local av=ab.
GetTimeLeft()if not av then ar:UpdateName(af..
": <font color='rgb(160, 160, 160)'>--</font>")return end local ax=math.floor(av
)local ay,az=string.format('%d:%02d',math.floor(ax/60),ax%60),ab.
GetTimeRetryEnabled()and av<ab.GetTimeRetryThreshold()local aA=az and
'255, 80, 80'or'0, 255, 0'ar:UpdateName(af..": <font color='rgb("..aA..")'>"..ay
..'</font>')end aq()av()local ax task.spawn(function()while task.wait(0.5)do ak(
aa.IsBossActive())am()ao()aq()ax()av()end end)ai:Header{Name='Level Info'}local
ay=ai:Label{Text=ae..': Unknown'}local az=function()local az=aa.
GetCurrentDungeonName()if az then ay:UpdateName(ae..': '..az)else ay:UpdateName(
ae..": <font color='rgb(255, 80, 80)'>Unknown</font>")end end az()aa.
OnDungeonNameChanged(function()az()end)ai:Header{Name='Lobby / Dungeon'}local aA
=ai:Label{Text='Lobby: Unknown'}ax=function()local aB=aa.IsInLobby()local aC=aB
and'0, 255, 0'or'255, 80, 80'aA:UpdateName("Lobby: <font color='rgb("..aC..")'>"
..(aB and'Yes'or'No')..'</font>')end ax()aa.OnLobbyChanged(function()ax()end)ai:
Button{Name='Log Enemy Types to Console',Callback=function()local aB=aa.
GetEnemyNames()print('[DungeonQuest] Enemy types in map ('..#aB..'):')if#aB==0
then print'  (no enemies found)'else for aC,aF in ipairs(aB)do print('  - '..aF)
end end end}end end function a.as()return function(aa,ab)a.load'aq'(aa,ab)a.load
'ar'(aa,ab)end end function a.at()local aa,ab,ac=a.load'e',a.load'a',a.load'd'
local ad,ae,af,ag,ah,ai,aj=aa.HttpService or game:GetService'HttpService',{},
'DQMacro','pathRecord',3,'normal','full'local ak,al,am,an,ao=function(ak)if ak==
aj then return aj end return ai end,(isfile~=nil and writefile~=nil and
makefolder~=nil and isfolder~=nil),{},false,{}local ap,aq=function()for ap=#ao,1
,-1 do pcall(ao[ap])end end,function()local ap=ab.Folder or'EsclipseHub'return
ap..'/'..af end local ar,av=function()if not al then return end pcall(function()
local ar=ab.Folder or'EsclipseHub'if not isfolder(ar)then makefolder(ar)end
local av=aq()if not isfolder(av)then makefolder(av)end end)end,function(ar)if
type(ar)~='string'then return'Unknown'end return(string.gsub(ar,'[/\\:*?"<>|]',
'_'))end local ax,ay,az,aA,aB=function(ax)return aq()..'/'..av(ax)..'.json'end,
function(ax)if not ax then return nil end return{X=math.round(ax.X*100)/100,Y=
math.round(ax.Y*100)/100,Z=math.round(ax.Z*100)/100}end,function(ax)if not ax or
type(ax)~='table'then return nil end return Vector3.new(ax.X or 0,ax.Y or 0,ax.Z
or 0)end,function(ax)return type(ax)=='table'and type(ax.points)=='table'and#ax.
points>0 end,function(ax)if type(ax)~='table'or type(ax.X)~='number'then return
nil end local ay=Vector3.new(ax.X,0,ax.Z)if ay.Magnitude<0.001 then return nil
end return ay.Unit end local aC,aF,aG,aH,aI,aJ=function(aC)if type(aC)~='table'
then return nil end local aF={}for aG,aH in ipairs(aC.dwells or{})do local aI=
az(aH.pos)if aI then aF[#aF+1]={pos=aI,dur=tonumber(aH.dur)or 0,facing=aB(aH.
facing)}end end local aG={}for aH,aI in ipairs(aC.skills or{})do local aJ=az(aI.
pos)if aJ then aG[#aG+1]={pos=aJ,facing=aB(aI.facing),key=aI.key,dw=math.floor(
tonumber(aI.dw)or 0),dwT=tonumber(aI.dwT)or 0}end end if#aF==0 and#aG==0 then
return nil end return{dwells=aF,skills=aG}end,function()if an then return end an
=true if al then ar()local aC=aq()if isfolder'DQMacro'and listfiles then pcall(
function()local aF=listfiles'DQMacro'if type(aF)=='table'then for aG,aH in
ipairs(aF)do if type(aH)=='string'and string.lower(string.sub(aH,-5))=='.json'
and isfile(aH)then local aI=string.match(aH,'([^/\\]+)$')or'unknown.json'local
aJ,aK=aC..'/'..aI,readfile(aH)writefile(aJ,aK)delfile(aH)end end end end)end if
listfiles and isfolder(aC)then local aF,aG=pcall(function()return listfiles(aC)
end)if aF and type(aG)=='table'then for aH,aI in ipairs(aG)do if type(aI)==
'string'and string.lower(string.sub(aI,-5))=='.json'then pcall(function()if
isfile(aI)then local aJ=readfile(aI)local aK=ad:JSONDecode(aJ)if type(aK)==
'table'and type(aK.map)=='string'and type(aK.rooms)=='table'then am[aK.map]=aK
end end end)end end end end local aF=ab.contextData if type(aF)=='table'and
type(aF[ag])=='table'then local aG,aH=aF[ag],false for aI,aJ in pairs(aG)do if
type(aI)=='string'and type(aJ)=='table'then if not am[aI]then am[aI]=aJ end
pcall(function()writefile(ax(aI),ad:JSONEncode(aJ))end)aH=true end end if aH
then aF[ag]=nil ac.Save()end end else local aC=ab.contextData if type(aC)==
'table'and type(aC[ag])=='table'then for aF,aG in pairs(aC[ag])do if type(aF)==
'string'and type(aG)=='table'then am[aF]=aG end end end end end,0.1,0.82,0.3,
function(aC,aF)local aG,aH=aC.X-aF.X,aC.Z-aF.Z return math.sqrt(aG*aG+aH*aH)end
function ae.SimplifyPath(aK,aL)local aM=#aK if aM<=2 then return aK end local aN
={}for aO=1,aM do aN[aO]=false end aN[1]=true aN[aM]=true local aO={1}for aQ=2,
aM-1 do local aW,aX,aY=aK[aQ-1],aK[aQ],aK[aQ+1]local aZ,a_=aX.X-aW.X,aX.Z-aW.Z
local a0,a1,a2=math.sqrt(aZ*aZ+a_*a_),aY.X-aX.X,aY.Z-aX.Z local a3=math.sqrt(a1*
a1+a2*a2)if a0>=aI and a3>=aI then local a4=(aZ*a1+a_*a2)/(a0*a3)if a4<aH then
aN[aQ]=true table.insert(aO,aQ)end end end table.insert(aO,aM)local aQ,aW=aL*aL,
{}for aX=1,#aO-1 do local aY,aZ=aO[aX],aO[aX+1]if aZ-aY>1 then table.insert(aW,{
aY,aZ})end end while#aW>0 do local aX=table.remove(aW)local aY,aZ=aX[1],aX[2]
local a_,a0,a1,a2=aK[aY].X,aK[aY].Z,aK[aZ].X,aK[aZ].Z local a3,a4=a1-a_,a2-a0
local a5,a6,a7=a3*a3+a4*a4,-1,0 for a8=aY+1,aZ-1 do local a9=0 if a5>0 then a9=(
(aK[a8].X-a_)*a3+(aK[a8].Z-a0)*a4)/a5 a9=math.clamp(a9,0,1)end local b,ba=aK[a8]
.X-(a_+a3*a9),aK[a8].Z-(a0+a4*a9)local bb=b*b+ba*ba if bb>a6 then a6=bb a7=a8
end end if a7>0 and a6>aQ then aN[a7]=true table.insert(aW,{aY,a7})table.insert(
aW,{a7,aZ})end end local aX={}for aY=1,aM do if aN[aY]and(#aX==0 or aJ(aX[#aX],
aK[aY])>=aG or aY==aM)then table.insert(aX,aK[aY])end end if#aX==1 then table.
insert(aX,aK[aM])end return aX end function ae.OnChanged(aK)if type(aK)~=
'function'then return function()end end table.insert(ao,aK)return function()for
aL,aM in ipairs(ao)do if aM==aK then table.remove(ao,aL)break end end end end
function ae.HasMap(aK)if type(aK)~='string'or#aK==0 then return false end aF()
local aL=am[aK]if not aL or type(aL.rooms)~='table'then return false end for aM,
aN in pairs(aL.rooms)do if aA(aN)and#aN.points>0 then return true end end return
false end function ae.GetRoomSegment(aK,aL)if type(aK)~='string'or type(aL)~=
'number'then return nil end aF()local aM=am[aK]if not aM or type(aM.rooms)~=
'table'then return nil end local aN=aM.rooms[tostring(aL)]if not aA(aN)then
return nil end local aO={}for aQ,aW in ipairs(aN.points)do local aX=az(aW)if aX
then aO[#aO+1]=aX end end if#aO==0 then return nil end return{startPos=az(aN.
startPos)or aO[1],points=aO,events=aN.events and aC(aN.events)or nil,speed=
tonumber(aN.speed)or 0,boss=aN.boss==true}end function ae.HasSegmentOrMacro(aK,
aL)return ae.GetRoomSegment(aK,aL)~=nil end function ae.GetMap(aK)if not ae.
HasMap(aK)then return nil end aF()local aL=am[aK]if not aL then return nil end
local aM={}for aN,aO in pairs(aL.rooms or{})do local aQ=tonumber(aN)if aQ and
aA(aO)then local aW=ae.GetRoomSegment(aK,aQ)if aW then aM[aQ]=aW end end end
return{map=aK,version=aL.version,rooms=aM,created=aL.created,updated=aL.updated,
mode=ak(aL.mode)}end function ae.GetMaps()aF()local aK={}for aL,aM in pairs(am)
do if type(aL)=='string'and type(aM)=='table'and aM.map==aL and type(aM.rooms)==
'table'then local aN,aO,aQ=0,0,0 for aW,aX in pairs(aM.rooms)do if tonumber(aW)
~=nil and aA(aX)then aN+=1 if aX.boss==true then aO+=1 end aQ+=#aX.points end
end if aN>0 then table.insert(aK,{map=aL,roomCount=aN,bossCount=aO,pointCount=aQ
,updated=aM.updated,mode=ak(aM.mode)})end end end table.sort(aK,function(aL,aM)
return aL.map<aM.map end)return aK end function ae.Count()return#ae.GetMaps()end
function ae.SaveSegment(aK,aL,aM,aN,aO,aQ,aW)if type(aK)~='string'or#aK==0 then
return false end if type(aL)~='number'or aL<=0 then return false end if not aM
or not aN or#aN==0 then return false end aF()local aX=am[aK]if not aX or type(aX
)~='table'then aX={map=aK,version=ah,created=os.time(),updated=os.time(),mode=ai
,rooms={}}am[aK]=aX end if type(aX.rooms)~='table'then aX.rooms={}end local aY={
}for aZ,a_ in ipairs(aN)do aY[#aY+1]=ay(a_)end local aZ={startPos=ay(aM)or aY[1]
,points=aY}if aW then aZ.boss=true end if type(aQ)=='number'and aQ>0 then aZ.
speed=aQ end local a_=function(a_)if not a_ or type(a_)~='table'then return nil
end local a0,a1=#(a_.dwells or{}),#(a_.skills or{})if a0==0 and a1==0 then
return nil end local a2={dwells={},skills={}}for a3,a4 in ipairs(a_.dwells or{})
do a2.dwells[#a2.dwells+1]={pos=ay(a4.pos),dur=a4.dur or 0,facing=a4.facing}end
for a3,a4 in ipairs(a_.skills or{})do a2.skills[#a2.skills+1]={pos=ay(a4.pos),
facing=a4.facing,key=a4.key,dw=a4.dw or 0,dwT=a4.dwT or 0}end return a2 end if
aO and type(aO)=='table'then local a0=a_(aO)if a0 then aZ.events=a0 end end aX.
rooms[tostring(aL)]=aZ aX.version=ah aX.map=aK aX.updated=os.time()if al then
ar()pcall(function()writefile(ax(aK),ad:JSONEncode(aX))end)else local a0=ab.
contextData if type(a0)=='table'then if not a0[ag]then a0[ag]={}end a0[ag][aK]=
aX ac.Save()end end ap()return true end function ae.GetMapMode(aK)if type(aK)~=
'string'or#aK==0 then return ai end aF()local aL=am[aK]if type(aL)~='table'then
return ai end return ak(aL.mode)end function ae.SetMapMode(aK,aL)if type(aK)~=
'string'or#aK==0 then return false end local aM=ak(aL)aF()local aN=am[aK]if not
aN or type(aN)~='table'then aN={map=aK,version=ah,created=os.time(),updated=os.
time(),mode=ai,rooms={}}am[aK]=aN end aN.mode=aM aN.map=aK aN.updated=os.time()
if al then ar()pcall(function()writefile(ax(aK),ad:JSONEncode(aN))end)else local
aO=ab.contextData if type(aO)=='table'then if not aO[ag]then aO[ag]={}end aO[ag]
[aK]=aN ac.Save()end end ap()return true end function ae.RemoveMap(aK)aF()if not
am[aK]then return false end am[aK]=nil if al then local aL=ax(aK)pcall(function(
)if isfile(aL)then delfile(aL)end end)else local aL=ab.contextData if type(aL)==
'table'and aL[ag]then aL[ag][aK]=nil ac.Save()end end ap()return true end
function ae.ClearAll()aF()if next(am)==nil then return end local aK=aq()if al
and isfolder(aK)and listfiles then pcall(function()local aL=listfiles(aK)if
type(aL)=='table'then for aM,aN in ipairs(aL)do if type(aN)=='string'and string.
lower(string.sub(aN,-5))=='.json'and isfile(aN)then delfile(aN)end end end end)
end table.clear(am)local aL=ab.contextData if type(aL)=='table'and aL[ag]then aL
[ag]=nil ac.Save()end ap()end function ae.ReloadFromDisk()table.clear(am)an=
false aF()ap()end function ae.ReloadFromConfig()ae.ReloadFromDisk()end return ae
end function a.au()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'at',a.load'd'
,a.load'c'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.RunService,aa.player,
aa.UserInputService,0.1,8000,0.4,0.1,1.5,1,6,{},true,true function ap.SetCapture
(av)av=av and true or false aq=av ar=av end function ap.IsCaptureEnabled()return
aq or ar end local av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aQ,aW,aX,
aY,aZ,a_,a0,a1,a2,a3,a4,a5,a6=false,0,{},0,{},{},0,false,0,0,false,false,false,0
,0,0,{}local a7,a8=function()local a7={recording=av,map=aQ,room=ax,pointCount=#
ay,dwellCount=#aA,skillCount=#aB,savedRooms=aL}for a8,a9 in ipairs(aO)do pcall(
a9,a7)end end,function()local a7=ag and ag.Character local a8=a7 and a7:
FindFirstChild'HumanoidRootPart'if a8 and a8.Parent then return a8 end return
nil end local a9,b,ba,bb=function()local a9=a8()if not a9 then return nil end
local b=a9.CFrame.LookVector if b.Magnitude<0.001 then return nil end return{X=b
.X/b.Magnitude,Z=b.Z/b.Magnitude}end,function()if aX then aX:Disconnect()aX=nil
end if aY then aY:Disconnect()aY=nil end if aZ then aZ()aZ=nil end if a_ then
a_()a_=nil end if a0 then a0()a0=nil end if respawnConnection then
respawnConnection()respawnConnection=nil end end,function(a9)ay={a9}aA={}aB={}a1
=nil aC=0 a2=nil a3=nil a4=nil a5=a9 aG=0 aH=0 az=os.clock()a6=os.clock()aF=
false end,function()aQ=nil ax=0 aW=nil ay={}aA={}aB={}a1=nil aC=0 a2=nil a3=nil
a4=nil a5=nil aF=false aG=0 aH=0 a6=nil aJ=false aK=false aI=false aL=0 aM=0 aN=
0 end local bc,bd=function(bc,bd)ax=bc aW=bd aK=true ba(bd)aJ=ab.IsBossActive()
end,function(bc,bd)if not aK then return nil end local be=ac.SimplifyPath(ay,ak)
if#be<2 then return nil end local bf if#aA>0 or#aB>0 then bf={dwells=aA,skills=
aB}end local bg=0 if aH>0.5 and aG>5 then bg=math.clamp(aG/aH,5,100)end local bh
=ac.SaveSegment(aQ,ax,aW,be,bf,bg,aJ)if not bh then return nil end aL+=1 aN+=#ay
if aJ then aM+=1 end if not bd then local bi=''if bf then bi=(
' (%d smooth pts, %d skills, %d dwells, %.1f spd)'):format(#be,#(bf.skills or{})
,#(bf.dwells or{}),bg)else bi=(' (%d smooth pts, %.1f spd)'):format(#be,bg)end
ae.Notify('Path Record',('Saved room %d%s to map [%s] %s'):format(ax,bi,aQ,bc
and('- '..bc)or''),3)end return{points=be,events=bf,speed=bg}end function ap.
IsRecording()return av end function ap.GetStartRoom()return ax end function ap.
GetCurrentPoints()return ay end function ap.GetCurrentDwells()return aA end
function ap.GetCurrentSkills()return aB end function ap.GetStatus()return{
recording=av,map=aQ,room=ax,pointCount=#ay,dwellCount=#aA,skillCount=#aB,
savedRooms=aL}end function ap.OnStatusChanged(be)if type(be)~='function'then
return function()end end table.insert(aO,be)return function()for bf,bg in
ipairs(aO)do if bg==be then table.remove(aO,bf)break end end end end function ap
.Start()if av then return false,'already recording'end local be=a8()if not be
then return false,'no character found'end if ab.IsDead()then return false,
'character is dead'end local bf=ab.GetCurrentRoomIndex()if bf<=0 then return
false,'not inside a dungeon'end local bg=ab.GetCurrentDungeonName()if not bg or#
bg==0 then return false,'unable to identify map'end aI=ac.GetMapMode(bg)=='full'
if ab.IsBossActive()and not aI then return false,
'boss room (use Hazard Scanner)'end aQ=bg bc(bf,be.Position)av=true ad.
SetRecording(true)aL=0 aM=0 aN=0 aX=af.Heartbeat:Connect(function()if not av
then return end if ab.IsDead()then a2=nil a1=nil a5=nil ap.Stop'player died'
return end local bh=a8()if not bh then return end local bi,bj=bh.Position,ay[#ay
]if bj and(bi-bj).Magnitude>35 then if not aI then ap.Stop'large teleport'return
end bd('large teleport',true)local bk=ab.GetCurrentRoomIndex()if bk==ax then bk=
0 end bc(bk,bi)a7()task.spawn(function()task.wait(ao)if av and ax<=0 then ap.
Stop'end of map'end end)return end local bk,bl=os.clock(),a5 and(bi-a5).
Magnitude or 0 a5=bi local bm=a6 and math.max(0.0001,bk-a6)or 0.016 a6=bk local
bn=bm>0 and(bl/bm)or 0 if bn>=am then aG+=bl aH+=bm a2=nil a1=nil else if aq
then if not a2 then a2=bk a3=bi a4=a9()end if a1 then a1.dur=bk-a2 a1.facing=a9(
)or a4 elseif bk-a2>=al then aC=a2-az a1={pos=a3,dur=bk-a2,facing=a4,index=#aA+1
}table.insert(aA,a1)for bo,bp in ipairs(aB)do if bp.dw==0 and bp._castAt and bp.
_castAt>=a2 then bp.dw=a1.index bp.dwT=math.max(0,(bp._castAt-az)-aC)bp.pos=a1.
pos a1.facing=bp.facing or a1.facing end end end end end local bo=ay[#ay]if bo
and(bi-bo).Magnitude<ai then return end if#ay>=aj then ap.Stop
'reached max points'return end table.insert(ay,bi)end)if ar then aY=ah.
InputBegan:Connect(function(bh,bi)if not av or not ar then return end if ah:
GetFocusedTextBox()then return end if ab.IsDead()then return end local bj if bh.
UserInputType==Enum.UserInputType.MouseButton2 then if bi then return end bj=
'QE'elseif bh.UserInputType==Enum.UserInputType.Keyboard and(bh.KeyCode==Enum.
KeyCode.Q or bh.KeyCode==Enum.KeyCode.E)then bj=bh.KeyCode==Enum.KeyCode.Q and
'Q'or'E'else return end local bk=a8()if not bk then return end local bl=aq and(
a1~=nil)local bm={pos=bl and a1.pos or bk.Position,facing=a9(),key=bj,dw=0,dwT=0
,_castAt=os.clock()}if bl then bm.dw=a1.index bm.dwT=math.max(0,(os.clock()-az)-
aC)a1.facing=bm.facing or a1.facing end table.insert(aB,bm)end)end aZ=ab.
OnRoomIndexChanged(function()if av then local bh=ab.GetCurrentRoomIndex()if aK
and ax<=0 and bh>0 then ax=bh return end if bh~=ax and not aF then aF=true task.
delay(an,function()aF=false if av then if aI then ap.Rollover()else ap.Stop
'room completed'end end end)end end end)a0=ab.OnBossActiveChanged(function(bh)if
not av then return end if bh then if aI then aJ=true else ap.Stop
'entered boss room'end return end if aI and aJ then bd('boss defeated',true)aJ=
false aK=false task.spawn(function()task.wait(ao)if av and not aK then ap.Stop
'end of map'end end)end end)a_=ab.OnLobbyChanged(function(bh)if av and bh then
ap.Stop'returned to lobby'end end)respawnConnection=ab.OnRespawn(function()if av
then ap.Stop'player died'end end)ae.Notify('Path Record',(
'Started recording room %d (%s)'):format(bf,bg),2)a7()return true end function
ap.Rollover()if not av then return false end bd('room transition',true)local be=
a8()local bf=be and be.Position or aW bc(ab.GetCurrentRoomIndex(),bf)a7()return
true end function ap.Stop(be)if not av then return false end av=false ad.
SetRecording(false)b()local bf=bd(be,true)if bf then if aL>1 then local bg=aM>0
and(' | %d boss'):format(aM)or''ae.Notify('Path Record',(
'Saved map [%s] %s: %d room(s)%s (%d raw pts)'):format(aQ,be or'completed',aL,bg
,aN),4)else local bg=''if bf.events then bg=(
' (%d smooth pts, %d skills, %d dwells, %.1f spd)'):format(#bf.points,#(bf.
events.skills or{}),#(bf.events.dwells or{}),bf.speed or 0)else bg=(
' (%d smooth pts, %.1f spd)'):format(#bf.points,bf.speed or 0)end local bh=ax>0
and(aJ and' (boss)'or'')or''ae.Notify('Path Record',(
'Saved room %d%s%s to map [%s] %s'):format(ax,bg,bh,aQ,be and('- '..be)or''),3)
end elseif aL>0 then local bg=aM>0 and(' | %d boss'):format(aM)or''ae.Notify(
'Path Record',('Saved map [%s] %s: %d room(s)%s (%d raw pts)'):format(aQ,be or
'completed',aL,bg,aN),4)end bb()a7()return bf~=nil end function ap.Cancel()if
not av then return end b()bb()av=false ad.SetRecording(false)a7()end return ap
end function a.av()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'at',a.load'c'
,a.load'aa'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,aF,
aG,aH,aI,aJ,aK,aL=aa.player,aa.VirtualInputManager,aa.UserInputService,aa.
RunService or game:GetService'RunService',0.4,0.5,8,2,4.5,8,14,8,2,0.5,2,0.001,
0.1,{},true,true,true,0.6,0.005,0.45,0.2,false,true function aA.SetAimSkillQ(aM)
aK=aM and true or false end function aA.IsAimSkillQEnabled()return aK end
function aA.SetAimSkillE(aM)aL=aM and true or false end function aA.
IsAimSkillEEnabled()return aL end local aM=function(aM)if aM=='Q'then return aK
elseif aM=='E'then return aL end return aK or aL end function aA.
SetStartPauseTime(aN)if type(aN)=='number'then aJ=math.clamp(aN,0,5)end end
function aA.GetStartPauseTime()return aJ end function aA.SetPreAimTime(aN)if
type(aN)=='number'then aI=math.clamp(aN,0.1,1.5)end end function aA.
GetPreAimTime()return aI end function aA.SetSkillFaceHold(aN)if type(aN)==
'number'then aG=math.clamp(aN,av,ax)end end function aA.GetSkillFaceHold()return
aG end function aA.SetDoubleClickDelay(aN)if type(aN)=='number'then aH=math.
clamp(aN,ay,az)end end function aA.GetDoubleClickDelay()return aH end function
aA.SetReplayTimeline(aN)aN=aN and true or false aB=aN aC=aN aF=aN end function
aA.IsReplayTimelineEnabled()return aB end local aN,aO,aQ,aW=true,false function
aA.SetSpeedMatch(aX)aN=aX and true or false end function aA.IsSpeedMatchEnabled(
)return aN end function aA.SetUseFastSpeed(aX)aO=aX and true or false end
function aA.IsUseFastSpeedEnabled()return aO end local aX,aY=false,5 function aA
.SetAutoRetryOnDeathLimit(aZ)aX=aZ and true or false end function aA.
IsAutoRetryOnDeathLimitEnabled()return aX end local aZ,a_,a0,a1,a2,a3,a4,a5,a6,
a7,a8=function(aZ)local a_ if aO then local a0=ab.GetFastSpeed()if type(a0)==
'number'and a0>0 then a_=a0 end elseif aN then if type(aZ)=='number'and aZ>0
then a_=aZ end end if not a_ or a_<=0 then return end local a0=ab.GetHumanoid()
if not a0 then return end if aQ==nil then aW=a0.WalkSpeed end aQ=a_ if a0.
WalkSpeed~=a_ then a0.WalkSpeed=a_ end end,function()if aQ==nil then return end
local aZ=ab.GetHumanoid()if aW and aZ and aZ.WalkSpeed~=aW then aZ.WalkSpeed=aW
end aQ=nil aW=nil end,false,false,false,0,0,0,{}local a9,b,ba,bb,bc=function(a9)
local b={playing=a0,map=a7,room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
resume=a1,progressPercent=a5,progressStuds=a3,totalStuds=a4,reason=a9}for ba,bb
in ipairs(a6)do pcall(bb,b)end end,function()local a9=af and af.Character local
b=a9 and a9:FindFirstChild'HumanoidRootPart'if b and b.Parent then return b end
return nil end,function(a9)if not a9 or not a9.Parent then return nil end local
b,ba=pcall(function()return a9.Position end)if not b or not ba then return nil
end return ba end,function(a9,b)local ba,bb=a9.X-b.X,a9.Z-b.Z return math.sqrt(
ba*ba+bb*bb)end local bd=function()if bc then return bc end pcall(function()
local bd=af:FindFirstChild'PlayerScripts'local be=bd and bd:FindFirstChild
'PlayerModule'if be then bc=require(be):GetControls()end end)return bc end local
be,bf,bg,bh=function()if ab.DisableControls then ab.DisableControls'PathRecord'
else local be=bd()if be and type(be.Disable)=='function'then pcall(function()be:
Disable()end)end end end,function()if ab.EnableControls then ab.EnableControls
'PathRecord'else local be=bd()if be and type(be.Enable)=='function'then pcall(
function()be:Enable()end)end end end,(Vector3.zero)local bi,bj,bk,bl=function()
if bh then return end local bi=ai.PreSimulation or ai.Heartbeat or ai.
RenderStepped bh=bi:Connect(function()if not a0 then return end local bj=ab.
GetHumanoid()if bj then bj:Move(bg,false)end end)end,function()if bh then bh:
Disconnect()bh=nil end bg=Vector3.zero local bi=ab.GetHumanoid()if bi then
pcall(function()bi:Move(Vector3.zero,false)end)end end,function(bi)local bj=b()
if not bj or not bi then bg=Vector3.zero return end local bk=bj.Position local
bl=Vector3.new(bi.X-bk.X,0,bi.Z-bk.Z)if bl.Magnitude>0.05 then bg=bl.Unit else
bg=Vector3.zero end end,function()bg=Vector3.zero local bi=ab.GetHumanoid()if bi
then pcall(function()bi:Move(Vector3.zero,false)end)end end local bm,bn,bo,bp,bq
=function(bm)bl()bj()bf()end,function(bm)local bn,bo=ab.GetKeyHoldTime()or 0.05,
aH task.spawn(function()pcall(function()local bp=function(bp,bq)ag:SendKeyEvent(
bq,bp,false,game)end local bq=function(bq)if bq=='Q'then bp(Enum.KeyCode.Q,true)
task.wait(bn)bp(Enum.KeyCode.Q,false)elseif bq=='E'then bp(Enum.KeyCode.E,true)
task.wait(bn)bp(Enum.KeyCode.E,false)else bp(Enum.KeyCode.Q,true)bp(Enum.KeyCode
.E,true)task.wait(bn)bp(Enum.KeyCode.Q,false)bp(Enum.KeyCode.E,false)end end bq(
bm)if bo>0 then task.wait(bo)end bq(bm)end)end)end,function(bm,bn)if not bm or
not bm.Parent then return end local bo=ab.GetHumanoid()if bo then bo.AutoRotate=
false end local bp=bn or Vector3.new(1,0,0)if bp.Magnitude<0.1 then bp=Vector3.
new(1,0,0)end bp=Vector3.new(bp.X,0,bp.Z).Unit pcall(function()local bq=bm.
Position bm.CFrame=CFrame.lookAt(bq,bq+bp)end)end,function(bm,bn,bo)if not bm or
not bm.Parent then return end local bp=ab.GetHumanoid()if bp and bp.AutoRotate~=
false then bp.AutoRotate=false end local bq=bn or Vector3.new(1,0,0)if bq.
Magnitude<0.1 then bq=Vector3.new(1,0,0)end bq=Vector3.new(bq.X,0,bq.Z).Unit
pcall(function()local br=bm.Position local bs=CFrame.lookAt(br,br+bq)bm.CFrame=
bm.CFrame:Lerp(bs,math.clamp(bo or 0.35,0.05,1))end)end,function()local bm=ab.
GetHumanoid()if bm then bm.AutoRotate=true end end local br=function(br,bs,bt)
local bu,bv=ab.GetHumanoid(),b()if not bu or not bv then return end aZ(br.speed)
local bw=ac.SimplifyPath(br.points,aj)local bx=#bw if bx<2 then return end local
by,bz=0,{}bz[1]=0 for bA=2,bx do local bB=bb(bw[bA-1],bw[bA])by+=bB bz[bA]=by
end a3=0 a4=by a5=0 a9'progress_init'local bA,bB=function(bA,bB,bC)bB=bB or 0 bC
=bC or by local bD,bE=0,math.huge for bF=2,bx do if bz[bF]<bB then continue end
if bz[bF-1]>bC then continue end local bH,bI=bw[bF-1],bw[bF]local bJ,bK=bH.X,bH.
Z local bL,bM=bI.X-bJ,bI.Z-bK local bN,bO=bL*bL+bM*bM,0 if bN>0 then bO=((bA.X-
bJ)*bL+(bA.Z-bK)*bM)/bN bO=math.clamp(bO,0,1)end local bP,bQ=bA.X-(bJ+bL*bO),bA.
Z-(bK+bM*bO)local bR=bP*bP+bQ*bQ if bR<bE then bE=bR bD=bz[bF-1]+math.sqrt(bN)*
bO end end return bD end,function(bA)local bB=2 while bB<=bx and bz[bB]<bA do bB
+=1 end bB=math.min(bB,bx)local bC=bz[bB]-bz[bB-1]if bC<=0 then return bw[bB]end
local bD,bE,bF=math.clamp((bA-bz[bB-1])/bC,0,1),bw[bB-1],bw[bB]return Vector3.
new(bE.X+(bF.X-bE.X)*bD,bE.Y+(bF.Y-bE.Y)*bD,bE.Z+(bF.Z-bE.Z)*bD)end local bC,bD,
bE=function(bC)local bD=by-bC if bD<=1 then return math.max(0.2,bD)end local bE,
bF=math.min(bC+2,by),math.min(bC+4.5,by)if bF-bC<0.8 then return math.min(am,bD)
end local bH,bI,bJ=bB(bC),bB(bE),bB(bF)local bK,bL,bM,bN=bI.X-bH.X,bI.Z-bH.Z,bJ.
X-bI.X,bJ.Z-bI.Z local bO,bP=math.sqrt(bK*bK+bL*bL),math.sqrt(bM*bM+bN*bN)if bO>
0.1 and bP>0.1 then local bQ=math.clamp((bK*bM+bL*bN)/(bO*bP),-1,1)local bR=math
.clamp((bQ+0.2)/1.2,0,1)local bS=am+(an-am)*bR return math.min(bS,bD)end return
math.min(an,bD)end,{},{}if br.events and(aB or aC or aF)then local bF,bH=br.
events.dwells or{},br.events.skills or{}for bI,bJ in ipairs(bF)do local bK,bL=
bA(bJ.pos),bJ.dur or 0 if bK<=0.8 or bK>=by-0.8 then bL=aJ end bD[bI]={arc=bK,
dur=bL,facing=bJ.facing,skills={},pos=bJ.pos}end if aJ>0 and(#bD==0 or bD[1].arc
>0.8)then table.insert(bD,1,{arc=0,dur=aJ,facing=br.events and br.events.
startFacing or nil,skills={},pos=br.startPos or bw[1]})end for bI,bJ in ipairs(
bH)do local bK=(aB and bJ.dw>0 and bD[bJ.dw])and bD[bJ.dw]or nil if bK then
table.insert(bK.skills,{tOff=bJ.dwT or 0,facing=bJ.facing,key=bJ.key})else table
.insert(bE,{arc=bA(bJ.pos),facing=bJ.facing,key=bJ.key})end end table.sort(bE,
function(bI,bJ)return bI.arc<bJ.arc end)end local bF,bH,bI=function(bF)if not a0
or(bF.dur or 0)<=0 then return true end if aB then bl()if aF and bF.facing then
bo(bv,bF.facing)end local bH,bI,bJ=os.clock(),{},0 while a0 and(os.clock()-bH<bF
.dur)do if not bv or not bv.Parent then return false,'no_root'end if ab.IsDead()
then return false,'dead'end if ab.GetCurrentRoomIndex()~=bs then return false,
'room_changed'end if ab.IsBossActive()and not bt then return false,'boss'end bl(
)local bK=os.clock()-bH for bL,bM in ipairs(bF.skills or{})do if not bI[bL]and
bK>=(bM.tOff or 0)then bI[bL]=true if aF and bM.facing and aM(bM.key)then bo(bv,
bM.facing)bJ=os.clock()+aG end if aC then bn(bM.key or'QE')end end end task.
wait(0.03)end for bK,bL in ipairs(bF.skills or{})do if not bI[bK]then bI[bK]=
true if aF and bL.facing and aM(bL.key)then bo(bv,bL.facing)bJ=os.clock()+aG end
if aC then bn(bL.key or'QE')end end end while a0 and os.clock()<bJ do bl()task.
wait(0.03)end if aF then bq()end end return true end,br.startPos or bw[1],ba(bv)
if bI and bH then local bJ=bb(bI,bH)if bJ>1.8 then local bK=os.clock()+al while
a0 and os.clock()<bK do local bL=ba(bv)if not bL then break end local bM=bb(bL,
bH)if bM<=1.8 then break end if ab.IsDead()or ab.GetCurrentRoomIndex()~=bs then
break end bk(bH)task.wait(0.03)end bl()end local bK=ba(bv)if bK and bb(bK,bH)<=3
then pcall(function()local bL=bv.CFrame.Rotation bv.CFrame=CFrame.new(bH.X,bv.
Position.Y,bH.Z)*bL bv.AssemblyLinearVelocity=Vector3.zero bv.
AssemblyAngularVelocity=Vector3.zero end)end end local bJ,bK,bL,bM,bN,bO,bP=0,bH
or ba(bv),os.clock(),1,1,0 bi()while a0 do if not bv or not bv.Parent then bq()
return false,'no_root'end if ab.IsDead()then bq()return false,'dead'end if ab.
GetCurrentRoomIndex()~=bs then bq()return false,'room_changed'end if ab.
IsBossActive()and not bt then bq()return false,'boss'end local bQ=ba(bv)if not
bQ then task.wait(0.08)continue end local bR=bA(bQ,math.max(0,bJ-ao),math.min(by
,bJ+ap))if bR>bJ then bJ=bR end a3=bJ a5=by>0 and math.clamp(math.floor((bJ/by)*
100),0,100)or 0 if bK then if bb(bQ,bK)>0.02 then bL=os.clock()end end bK=bQ if
os.clock()-bL>aq then bJ=math.min(bJ+ar,by-ak)bL=os.clock()bK=bQ end while bN<=#
bE and bE[bN].arc<=bJ do local bS=bE[bN]if aF and bS.facing and aM(bS.key)then
bo(bv,bS.facing)bP=bS.facing bO=os.clock()+aG end if aC then bn(bS.key or'QE')
end bN+=1 end while bM<=#bD and bJ>=bD[bM].arc do local bS=bD[bM]local bX,bY=bF(
bS)if not bX then bl()bq()return false,bY end bM+=1 bK=ba(bv)bL=os.clock()end
local bS if aF then local bX,bY=math.huge,bM while bY<=#bD do local bZ,b_=(bD[bY
])if bZ.skills and#bZ.skills>0 then for b0,b2 in ipairs(bZ.skills)do if b2.
facing and aM(b2.key)then b_=b2.facing break end end end b_=b_ or bZ.facing if
b_ then if bZ.arc<bX then bX=bZ.arc bS=b_ end break end bY+=1 end local bZ=bN
while bZ<=#bE do local b_=bE[bZ]if b_.facing and aM(b_.key)then if b_.arc<bX
then bX=b_.arc bS=b_.facing end break end bZ+=1 end end if aF then if os.clock()
<bO then if bP then bp(bv,bP,0.45)end if bu.AutoRotate~=false then bu.AutoRotate
=false end elseif bS then bp(bv,bS,0.35)if bu.AutoRotate~=false then bu.
AutoRotate=false end else if bu.AutoRotate~=true then bu.AutoRotate=true end end
else if bu.AutoRotate~=true then bu.AutoRotate=true end end if bJ>=by-ak then
while bM<=#bD do local bX=bD[bM]local bY,bZ=bF(bX)if not bY then bl()bq()return
false,bZ end bM+=1 end while bN<=#bE do local bX=bE[bN]if aF and bX.facing and
aM(bX.key)then bo(bv,bX.facing)bP=bX.facing bO=os.clock()+aG end if aC then bn(
bX.key or'QE')end bN+=1 end local bX=os.clock()+5 while a0 do local bY=ba(bv)if
not bY then break end local bZ=bb(bY,bw[bx])if bZ<=ak then break end if ab.
GetCurrentRoomIndex()~=bs then bl()bq()return false,'room_changed'end if(ab.
IsBossActive()and not bt)or ab.IsDead()then bl()bq()return false,'dead'end if os
.clock()>=bX then break end bk(bw[bx])if os.clock()<bO then if bP then bp(bv,bP,
0.45)end if bu.AutoRotate~=false then bu.AutoRotate=false end elseif bu.
AutoRotate~=true then bu.AutoRotate=true end task.wait(0.03)end bl()bq()a3=by a5
=100 return true,'completed'end local bX=bC(bJ)local bY=bB(math.min(bJ+bX,by-
0.01))bk(bY)task.wait(0.03)end bl()bq()return false,'stopped'end local bs=
function()local bs,bt,bu,bv=0,false,false,0 while a0 do if a1 then break end if
ab.IsDead()then if not bu then bu=true if aX and not a2 and not ab.IsBossActive(
)and bs>0 then bv+=1 if bv>=aY then ad.Notify('Path Record',string.format(
'Exceeded %d deaths in Room %d. Retrying dungeon...',aY,bs),3)bv=0 ae.RetryNow()
end end end task.wait(0.25)continue end if bu then bu=false end if ab.IsInLobby(
)then a1=false a0=false break end if ab.IsBossActive()and not a2 then task.wait(
0.25)continue end local bw=ab.GetCurrentRoomIndex()if bw<=0 then task.wait(0.1)
continue end if bw~=bs then bs=bw bv=0 bt=false a3=0 a4=0 a5=0 end local bx=ac.
GetRoomSegment(a7,bw)if not bx then task.wait(0.1)continue end if bt then task.
wait(0.1)continue end local by,bz=br(bx,bw,a2)bq()if by then bt=true a3=a4 a5=
100 else if bz=='dead'then if not bu then bu=true if aX and not a2 and not ab.
IsBossActive()and bw>0 then bv+=1 if bv>=aY then ad.Notify('Path Record',string.
format('Exceeded %d deaths in Room %d. Retrying dungeon...',aY,bw),3)bv=0 ae.
RetryNow()end end end ad.Notify('Path Record',
'Died: Waiting to respawn to retry path...',2)while a0 and ab.IsDead()do task.
wait(0.2)end task.wait(0.6)end end end bj()bf()a_()bq()a8=nil a9()end function
aA.IsPlaying()return a0 end function aA.ResumeWanted()return a1 end function aA.
GetActiveMap()return a7 end function aA.IsBossPlayActive()return a2 end function
aA.GetStatus()return{playing=a0,map=a7,room=ab.GetCurrentRoomIndex(),boss=ab.
IsBossActive(),resume=a1,progressPercent=a5,progressStuds=a3,totalStuds=a4}end
function aA.OnStatusChanged(bt)if type(bt)~='function'then return function()end
end table.insert(a6,bt)return function()for bu,bv in ipairs(a6)do if bv==bt then
table.remove(a6,bu)break end end end end function aA.Start()if a0 then return
false,'\u{111}ang ph\u{e1}t r\u{1ed3}i'end if ab.IsInLobby()then return false,
'\u{111}ang \u{1edf} lobby'end local bt=ab.GetCurrentRoomIndex()if bt<=0 then
return false,'ch\u{1b0}a c\u{f3} room'end local bu=ab.GetCurrentDungeonName()if
not bu or#bu==0 then return false,
'kh\u{f4}ng x\u{e1}c \u{111}\u{1ecb}nh \u{111}\u{1b0}\u{1ee3}c map'end if not ac
.HasSegmentOrMacro(bu,bt)then return false,(
'map [%s] ch\u{1b0}a c\u{f3} segment room %d'):format(bu,bt)end local bv=ac.
GetMapMode(bu)=='full'if ab.IsBossActive()and(not bv or not ac.
HasSegmentOrMacro(bu,bt))then return false,
'boss room (h\u{e3}y d\u{f9}ng Hazard Scanner)'end a7=bu a2=bv a1=false a3=0 a4=
0 a5=0 a0=true be()bi()a8=task.spawn(bs)a9'started'return true end function aA.
Stop()a0=false a1=false a7=nil a2=false a3=0 a4=0 a5=0 if a8 then task.cancel(a8
)a8=nil end bm(ab.GetHumanoid())a_()bq()a9'stopped'end function aA.
PauseForExclusive()if not a0 then return end a1=true a0=false a2=false a3=0 a4=0
a5=0 if a8 then task.cancel(a8)a8=nil end bm(ab.GetHumanoid())a_()bq()ad.Notify(
'Path Record',
[[Yielded control: will auto-resume upon entering a recorded room]],3)a9'paused'
end return aA end function a.aw()local aa,ab,ac,ad,ae,af,ag=a.load'e',a.load'f',
a.load'at',a.load'au',a.load'av',a.load'b',game:GetService'Workspace'local ah,ai
,aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI,aJ=aa.RunService,{}
,'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.fromRGB(255,60,60),
Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.fromRGB(0,220,110),
Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.fromRGB(255,190,30),
Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),Color3.fromRGB(255,210,60
),0.35,0.55,2.5,3,0.35,true,true,true,true local aK,aL,aM,aN,aO,aQ,aW,aX,aY,aZ,
a_=az,true,0,{},{},{},{},{}local a0,a1,a2,a3,a4,a5,a6,a7=function()if aY and aY.
Parent and aZ and aZ.Parent then return aZ end ai.Clear()local a0=Instance.new
'Folder'a0.Name=aj a0.Parent=ag local a1=Instance.new'Part'a1.Name=ak a1.
Anchored=true a1.CanCollide=false a1.CanQuery=false a1.CanTouch=false a1.
Transparency=1 a1.Size=Vector3.new(1,1,1)a1.CFrame=CFrame.new(0,0,0)a1.Parent=a0
aY=a0 aZ=a1 table.clear(aN)table.clear(aO)table.clear(aQ)table.clear(aW)table.
clear(aX)return aZ end,function(a0,a1)local a2=aN[a0]if not a2 or not a2.Parent
then a2=Instance.new'SphereHandleAdornment'a2.Name='PR_NodeSphere_'..tostring(a0
)a2.Adornee=a1 a2.AlwaysOnTop=aL a2.ZIndex=5 a2.Transparency=0.2 a2.Parent=a1 aN
[a0]=a2 end return a2 end,function(a0,a1)local a2=aO[a0]if not a2 or not a2.
Parent then a2=Instance.new'LineHandleAdornment'a2.Name='PR_PathLine_'..
tostring(a0)a2.Adornee=a1 a2.AlwaysOnTop=aL a2.ZIndex=4 a2.Transparency=0.3 a2.
Thickness=aB a2.Parent=a1 aO[a0]=a2 end return a2 end,function(a0,a1)local a2=aQ
[a0]if not a2 or not a2.Parent then a2=Instance.new'SphereHandleAdornment'a2.
Name='PR_EventSphere_'..tostring(a0)a2.Adornee=a1 a2.AlwaysOnTop=aL a2.ZIndex=8
a2.Transparency=0.15 a2.Radius=aA a2.Parent=a1 aQ[a0]=a2 end return a2 end,
function(a0,a1)local a2=aW[a0]if not a2 or not a2.Parent then a2=Instance.new
'LineHandleAdornment'a2.Name='PR_FacingRay_'..tostring(a0)a2.Adornee=a1 a2.
AlwaysOnTop=aL a2.ZIndex=9 a2.Transparency=0.1 a2.Thickness=aC a2.Parent=a1 aW[
a0]=a2 end return a2 end,function(a0,a1)local a2=aX[a0]if not a2 or not a2.
billboard or not a2.billboard.Parent then local a3=Instance.new'Attachment'a3.
Name='PR_BadgeAtt_'..tostring(a0)a3.Parent=a1 local a4=Instance.new
'BillboardGui'a4.Name='PR_BadgeGui_'..tostring(a0)a4.Adornee=a3 a4.Size=UDim2.
new(0,115,0,24)a4.StudsOffset=Vector3.new(0,1.6,0)a4.AlwaysOnTop=true a4.
MaxDistance=180 a4.LightInfluence=0 a4.Parent=aY local a5=Instance.new'Frame'a5.
Name='BadgeFrame'a5.Size=UDim2.new(1,0,1,0)a5.BackgroundColor3=Color3.fromRGB(15
,15,20)a5.BackgroundTransparency=0.25 a5.BorderSizePixel=0 a5.Parent=a4 local a6
=Instance.new'UICorner'a6.CornerRadius=UDim.new(0,6)a6.Parent=a5 local a7=
Instance.new'UIStroke'a7.Name='Stroke'a7.Color=av a7.Thickness=1.4 a7.
Transparency=0.15 a7.Parent=a5 local a8=Instance.new'TextLabel'a8.Name='Text'a8.
Size=UDim2.new(1,-6,1,0)a8.Position=UDim2.new(0,3,0,0)a8.BackgroundTransparency=
1 a8.Font=Enum.Font.GothamBold a8.TextSize=11 a8.TextColor3=Color3.fromRGB(255,
255,255)a8.RichText=true a8.Text=''a8.TextXAlignment=Enum.TextXAlignment.Center
a8.TextYAlignment=Enum.TextYAlignment.Center a8.Parent=a5 a2={attachment=a3,
billboard=a4,frame=a5,stroke=a7,label=a8}aX[a0]=a2 end return a2 end,function(a0
)if not a0 then return nil end if typeof(a0)=='Vector3'then if a0.Magnitude>
0.001 then return a0.Unit end return nil end if type(a0)=='table'and type(a0.X)
=='number'and type(a0.Z)=='number'then local a1=Vector3.new(a0.X,0,a0.Z)if a1.
Magnitude>0.001 then return a1.Unit end end return nil end,function()for a0,a1
in ipairs(aN)do if a1 and a1.Parent then a1.Visible=false end end for a0,a1 in
ipairs(aO)do if a1 and a1.Parent then a1.Visible=false end end for a0,a1 in
ipairs(aQ)do if a1 and a1.Parent then a1.Visible=false end end for a0,a1 in
ipairs(aW)do if a1 and a1.Parent then a1.Visible=false end end for a0,a1 in
ipairs(aX)do if a1 and a1.billboard and a1.billboard.Parent then a1.billboard.
Enabled=false end end end function ai.Update()if not aG then a7()return end if
ab.IsInLobby()then a7()return end local a8,a9,b,ba=ad.IsRecording(),{},{},{}if
a8 then local bb=ad.GetCurrentPoints()if bb and#bb>0 then table.insert(a9,bb)end
local bc=ad.GetCurrentDwells and ad.GetCurrentDwells()if bc then b=bc end local
bd=ad.GetCurrentSkills and ad.GetCurrentSkills()if bd then ba=bd end else local
bb,bc=ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if bb and#bb>0 and bc>0
then local bd=ac.GetRoomSegment(bb,bc)if bd then if bd.points and#bd.points>0
then table.insert(a9,bd.points)end if bd.events then b=bd.events.dwells or{}ba=
bd.events.skills or{}end end end end if#a9==0 then a7()return end local bb=a0()
if not bb then return end local bc,bd,be,bf,bg,bh,bi,bj,bk=a8 and al or an,a8
and am or ao,0,0,0,0,0 for bl,bm in ipairs(a9)do local bn=#bm if bn>0 then if
not bj then bj=bm[1]end bk=bm[bn]for bo=1,bn do local bp=bm[bo]if bp then be+=1
local bq=a1(be,bb)bq.Radius=aK bq.Color3=bc bq.AlwaysOnTop=aL bq.CFrame=CFrame.
new(bp+Vector3.new(0,aF,0))bq.Visible=true end end if aH and bn>=2 then for bo=1
,bn-1 do local bp,bq=bm[bo],bm[bo+1]if bp and bq then local br,bs=bp+Vector3.
new(0,aF,0),bq+Vector3.new(0,aF,0)local bt=(bs-br).Magnitude if bt>0.05 then bf
+=1 local bu=a2(bf,bb)bu.Length=bt bu.Thickness=aB bu.Color3=bd bu.AlwaysOnTop=
aL bu.CFrame=CFrame.lookAt(br,bs)bu.Visible=true end end end end end end if aI
then local bl if bj then for bm,bn in ipairs(b)do if bn.pos and(bn.pos-bj).
Magnitude<1.5 then bl=bn break end end bg+=1 local bm=a3(bg,bb)bm.Radius=aA bm.
Color3=ap bm.AlwaysOnTop=aL bm.CFrame=CFrame.new(bj+Vector3.new(0,aF,0))bm.
Visible=true bi+=1 local bn=a5(bi,bb)bn.attachment.WorldPosition=bj+Vector3.new(
0,aF,0)bn.stroke.Color=ap local bo=ae and ae.GetStartPauseTime and ae.
GetStartPauseTime()or 0 if bo>0 then bn.label.Text=(
"<font color='rgb(0,240,255)'><b>\u{1f6a9} START (%.1fs)</b></font>"):format(bo)
else bn.label.Text="<font color='rgb(0,240,255)'><b>\u{1f6a9} START</b></font>"
end bn.billboard.Enabled=true if aJ and bl and bl.facing then local bp=a6(bl.
facing)if bp then bh+=1 local bq,br=a4(bh,bb),bj+Vector3.new(0,aF,0)local bs=br+
bp*3.5 bq.Length=3.5 bq.Color3=ap bq.AlwaysOnTop=aL bq.CFrame=CFrame.lookAt(br,
bs)bq.Visible=true end end end for bm,bn in ipairs(b)do local bo=bn.pos local bp
,bq=bj and(bo-bj).Magnitude<1.5,bk and(bo-bk).Magnitude<1.5 if bo and not bp and
not bq then bg+=1 local br=a3(bg,bb)br.Radius=aA br.Color3=ar br.AlwaysOnTop=aL
br.CFrame=CFrame.new(bo+Vector3.new(0,aF,0))br.Visible=true local bs=math.round(
(bn.dur or 0)*10)/10 bi+=1 local bt=a5(bi,bb)bt.attachment.WorldPosition=bo+
Vector3.new(0,aF,0)bt.stroke.Color=ar bt.label.Text=(
"<font color='rgb(255,200,60)'><b>\u{23f3} Pause (%.1fs)</b></font>"):format(bs)
bt.billboard.Enabled=true if aJ then local bu=a6(bn.facing)if bu then bh+=1
local bv,bw=a4(bh,bb),bo+Vector3.new(0,aF,0)local bx=bw+bu*3 bv.Length=3 bv.
Color3=ay bv.AlwaysOnTop=aL bv.CFrame=CFrame.lookAt(bw,bx)bv.Visible=true end
end end end for bm,bn in ipairs(ba)do local bo=bn.pos if bo then bg+=1 local bp=
a3(bg,bb)bp.Radius=aA bp.Color3=av bp.AlwaysOnTop=aL bp.CFrame=CFrame.new(bo+
Vector3.new(0,aF,0))bp.Visible=true local bq=(bn.key and#bn.key>0)and bn.key or
'QE'bi+=1 local br=a5(bi,bb)br.attachment.WorldPosition=bo+Vector3.new(0,aF,0)br
.stroke.Color=av br.label.Text=(
"<font color='rgb(220,100,255)'><b>\u{26a1} Skill [%s]</b></font>"):format(bq)br
.billboard.Enabled=true if aJ then local bs=a6(bn.facing)if bs then bh+=1 local
bt,bu=a4(bh,bb),bo+Vector3.new(0,aF,0)local bv=bu+bs*3.8 bt.Length=3.8 bt.Color3
=ax bt.AlwaysOnTop=aL bt.CFrame=CFrame.lookAt(bu,bv)bt.Visible=true end end end
end local bm if bk and bk~=bj and not a8 then for bn,bo in ipairs(b)do if bo.pos
and(bo.pos-bk).Magnitude<1.5 then bm=bo break end end bg+=1 local bn=a3(bg,bb)bn
.Radius=aA bn.Color3=aq bn.AlwaysOnTop=aL bn.CFrame=CFrame.new(bk+Vector3.new(0,
aF,0))bn.Visible=true bi+=1 local bo=a5(bi,bb)bo.attachment.WorldPosition=bk+
Vector3.new(0,aF,0)bo.stroke.Color=aq local bp=ae and ae.GetStartPauseTime and
ae.GetStartPauseTime()or 0 if bm and bp>0 then bo.label.Text=(
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH (%.1fs)</b></font>"):format(
bp)else bo.label.Text=
"<font color='rgb(255,100,200)'><b>\u{1f3c1} FINISH</b></font>"end bo.billboard.
Enabled=true if aJ and bm and bm.facing then local bq=a6(bm.facing)if bq then bh
+=1 local br,bs=a4(bh,bb),bk+Vector3.new(0,aF,0)local bt=bs+bq*3.5 br.Length=3.5
br.Color3=aq br.AlwaysOnTop=aL br.CFrame=CFrame.lookAt(bs,bt)br.Visible=true end
end end end for bl=be+1,#aN do local bm=aN[bl]if bm and bm.Parent then bm.
Visible=false end end for bl=bf+1,#aO do local bm=aO[bl]if bm and bm.Parent then
bm.Visible=false end end for bl=bg+1,#aQ do local bm=aQ[bl]if bm and bm.Parent
then bm.Visible=false end end for bl=bh+1,#aW do local bm=aW[bl]if bm and bm.
Parent then bm.Visible=false end end for bl=bi+1,#aX do local bm=aX[bl]if bm and
bm.billboard and bm.billboard.Parent then bm.billboard.Enabled=false end end end
local a8=function()if a_ then return end a_=ah.Heartbeat:Connect(function()local
a8,a9=os.clock(),ad.IsRecording()local b=a9 and 0.03 or 0.1 if a8-aM<b then
return end aM=a8 pcall(ai.Update)end)end function ai.SetEnabled(a9)aG=a9 and
true or false if not aG then a7()else pcall(ai.Update)end end function ai.
IsEnabled()return aG end function ai.SetShowLines(a9)aH=a9 and true or false if
not aH then for b,ba in ipairs(aO)do if ba and ba.Parent then ba.Visible=false
end end else pcall(ai.Update)end end function ai.IsShowLinesEnabled()return aH
end function ai.SetShowEvents(a9)aI=a9 and true or false if not aI then for b,ba
in ipairs(aQ)do if ba and ba.Parent then ba.Visible=false end end for b,ba in
ipairs(aX)do if ba and ba.billboard and ba.billboard.Parent then ba.billboard.
Enabled=false end end else pcall(ai.Update)end end function ai.
IsShowEventsEnabled()return aI end function ai.SetShowFacingRays(a9)aJ=a9 and
true or false if not aJ then for b,ba in ipairs(aW)do if ba and ba.Parent then
ba.Visible=false end end else pcall(ai.Update)end end function ai.
IsShowFacingRaysEnabled()return aJ end function ai.SetNodeRadius(a9)if type(a9)
=='number'then aK=math.clamp(a9,0.1,1.5)pcall(ai.Update)end end function ai.
GetNodeRadius()return aK end function ai.SetAlwaysOnTop(a9)aL=a9 and true or
false for b,ba in ipairs(aN)do if ba and ba.Parent then ba.AlwaysOnTop=aL end
end for b,ba in ipairs(aO)do if ba and ba.Parent then ba.AlwaysOnTop=aL end end
for b,ba in ipairs(aQ)do if ba and ba.Parent then ba.AlwaysOnTop=aL end end for
b,ba in ipairs(aW)do if ba and ba.Parent then ba.AlwaysOnTop=aL end end for b,ba
in ipairs(aX)do if ba and ba.billboard and ba.billboard.Parent then ba.billboard
.AlwaysOnTop=aL end end end function ai.IsAlwaysOnTopEnabled()return aL end
function ai.Clear()a7()table.clear(aN)table.clear(aO)table.clear(aQ)table.clear(
aW)table.clear(aX)local a9=ag:FindFirstChild(aj)if a9 then pcall(function()a9:
Destroy()end)end aY=nil aZ=nil end function ai.Destroy()if a_ then a_:
Disconnect()a_=nil end ai.Clear()end ai.Clear()a8()af.Register(function()ai.
Destroy()end)return ai end function a.ax()local aa,ab,ac=a.load'e',a.load'f',a.
load'b'local ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,
aF=aa.player,aa.RunService,aa.CoreGui or game:GetService'CoreGui',game:
GetService'Workspace',{},{Cyan=Color3.fromRGB(0,230,255),Red=Color3.fromRGB(255,
60,60),Orange=Color3.fromRGB(255,140,0),Yellow=Color3.fromRGB(255,220,40),Green=
Color3.fromRGB(0,255,120),Emerald=Color3.fromRGB(40,220,160),Blue=Color3.
fromRGB(0,140,255),Purple=Color3.fromRGB(180,80,255),Magenta=Color3.fromRGB(255,
60,200),White=Color3.fromRGB(255,255,255)},false,25,0.4,true,true,'Cyan','Red',
0.8,0.15,'PR_InRange_Highlight',0.2,0,{}local aG,aH,aI,aJ=function()return ai[ao
]or ai.Cyan end,function()return ai[ap]or ai.Red end,function()local aG=ad and
ad.Character if not aG or not aG.Parent then return nil end local aH=aG:
FindFirstChildOfClass'Humanoid'if aH and aH.Health<=0 then return nil end local
aI=aG:FindFirstChild'HumanoidRootPart'if aI and aI.Parent then return aI end
return nil end,function()for aG,aH in pairs(az)do pcall(function()aH:Destroy()
end)end table.clear(az)pcall(function()for aG,aH in ipairs(ag:GetDescendants())
do if aH.Name==av then pcall(function()aH:Destroy()end)end end end)end local aK,
aL=function()if aA then pcall(function()aA:Destroy()end)aA=nil end if aB then
pcall(function()aB:Destroy()end)aB=nil end aF=nil aJ()end,function()if not aA or
not aA.Parent then pcall(function()if aA then aA:Destroy()end end)aA=Instance.
new'CylinderHandleAdornment'aA.Name='PR_SkillRangeRing'aA.AlwaysOnTop=true aA.
ZIndex=5 aA.Parent=af end if am then if not aB or not aB.Parent then pcall(
function()if aB then aB:Destroy()end end)aB=Instance.new
'CylinderHandleAdornment'aB.Name='PR_SkillRangeFill'aB.AlwaysOnTop=true aB.
ZIndex=4 aB.Parent=af end else if aB then pcall(function()aB:Destroy()end)aB=nil
end end end local aM,aN=function(aM)if not aj then aK()return end aL()local aN,
aO=2.6,aG()local aQ=Vector3.new(aM.Position.X,aM.Position.Y-aN,aM.Position.Z)
local aW=CFrame.new(aQ)*CFrame.Angles(math.rad(90),0,0)local aX=aM.CFrame:
ToObjectSpace(aW)if aA then aA.Adornee=aM aA.Height=0.06 aA.Radius=ak aA.
InnerRadius=math.max(0.1,ak-al)aA.Color3=aO aA.Transparency=1-aq aA.CFrame=aX aA
.Visible=(aM~=nil and aM.Parent~=nil)end if aB and am then aB.Adornee=aM aB.
Height=0.02 aB.Radius=ak aB.InnerRadius=0 aB.Color3=aO aB.Transparency=1-ar aB.
CFrame=aX aB.Visible=(aM~=nil and aM.Parent~=nil)end end,function(aM)if not aj
or not an or not aM then if next(az)~=nil then aJ()end return end local aN,aO,aQ
,aW,aX=ab.GetTrackedEnemyData(),aM.Position,ak*ak,{},aH()for aY,aZ in ipairs(aN)
do local a_,a0,a1=aZ.Model,aZ.Root,aZ.Humanoid if a_ and a_.Parent and a0 and a0
.Parent and a1 and a1.Health>0 then local a2,a3=a0.Position.X-aO.X,a0.Position.Z
-aO.Z if(a2*a2+a3*a3)<=aQ then aW[a_]=true end end end for aY,aZ in pairs(az)do
if not aW[aY]or not aY.Parent then pcall(function()aZ:Destroy()end)az[aY]=nil
end end for aY in pairs(aW)do if not az[aY]or not az[aY].Parent then local aZ=aY
:FindFirstChild(av)local a_=(aZ and aZ:IsA'Highlight')and aZ or Instance.new
'Highlight'a_.Name=av a_.Adornee=aY a_.FillColor=aX a_.FillTransparency=0.35 a_.
OutlineColor=Color3.fromRGB(255,255,255)a_.OutlineTransparency=0.1 a_.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop a_.Parent=aY az[aY]=a_ else local aZ=az[aY]
if aZ.FillColor~=aX then aZ.FillColor=aX end if not aZ.Enabled then aZ.Enabled=
true end end end end local aO=function()if not aj then return end local aO=aI()
if not aO then if aA then aA.Visible=false end if aB then aB.Visible=false end
if next(az)~=nil then aJ()end aF=nil return end local aQ=2.6 local aW=Vector3.
new(aO.Position.X,aO.Position.Y-aQ,aO.Position.Z)local aX=CFrame.new(aW)*CFrame.
Angles(math.rad(90),0,0)local aY=aO.CFrame:ToObjectSpace(aX)if not aA or not aA.
Parent or aO~=aF then aF=aO aM(aO)else if aA.Adornee~=aO then aA.Adornee=aO end
aA.CFrame=aY if not aA.Visible then aA.Visible=true end if am then if not aB or
not aB.Parent then aM(aO)else if aB.Adornee~=aO then aB.Adornee=aO end aB.CFrame
=aY if not aB.Visible then aB.Visible=true end end elseif aB and aB.Visible then
aB.Visible=false end end local aZ=os.clock()if aZ-ay>=ax then ay=aZ aN(aO)end
end function ah.SetEnabled(aQ)aj=aQ and true or false if aj then local aW=aI()if
aW then aM(aW)aF=aW aN(aW)end if not aC then aC=ae.Heartbeat:Connect(aO)end else
aK()if aC then aC:Disconnect()aC=nil end aF=nil end end function ah.IsEnabled()
return aj end function ah.SetRadius(aQ)if type(aQ)=='number'then ak=math.clamp(
aQ,5,150)local aW=aI()if aj and aW then aM(aW)aN(aW)end end end function ah.
GetRadius()return ak end function ah.SetFillEnabled(aQ)am=aQ and true or false
local aW=aI()if aj and aW then aM(aW)end end function ah.IsFillEnabled()return
am end function ah.SetHighlightInRange(aQ)an=aQ and true or false if not an then
aJ()else local aW=aI()if aj and aW then aN(aW)end end end function ah.
IsHighlightInRangeEnabled()return an end function ah.GetColorNames()local aQ={
'Cyan','Red','Orange','Yellow','Green','Emerald','Blue','Purple','Magenta',
'White'}return aQ end function ah.GetSelectedCircleColor()return ao end function
ah.SetCircleColor(aQ)if type(aQ)=='string'and ai[aQ]then ao=aQ local aW=aI()if
aj and aW then aM(aW)end end end function ah.GetSelectedHighlightColor()return
ap end function ah.SetHighlightColor(aQ)if type(aQ)=='string'and ai[aQ]then ap=
aQ local aW=aI()if aj and aW then aN(aW)end end end if ad then ad.CharacterAdded
:Connect(function(aQ)if aj then task.spawn(function()local aW=aQ:WaitForChild(
'HumanoidRootPart',10)if aW and aj then aM(aW)aF=aW aN(aW)end end)end end)end ab
.OnRespawn(function()if aj then task.delay(0.2,function()local aQ=aI()if aQ and
aj then aM(aQ)aF=aQ aN(aQ)end end)end end)ac.Register(function()ah.SetEnabled(
false)aK()end)return ah end function a.ay()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,
ak,al,am,an,ao=a.load'e',a.load'f',a.load'b',a.load'h',a.load'c',a.load'O',a.
load'g',a.load'at',a.load'au',a.load'av',a.load'aw',a.load'ax',{},false,{}local
ap,aq,ar=function(ap)local aq=ai.GetStatus()local ar={recording=ai.IsRecording()
,playing=aj.IsPlaying(),resume=aj.ResumeWanted(),autoPlayWanted=an,inLobby=ab.
IsInLobby(),map=ab.GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab
.IsBossActive(),recordedMaps=ah.Count(),pointCount=ai.IsRecording()and aq.
pointCount or 0,reason=ap}for av,ax in ipairs(ao)do pcall(ax,ar)end end,true,
true function am.IsTimelineCaptureEnabled()return aq end function am.
SetTimelineCapture(av)aq=av and true or false ai.SetCapture(aq)ap'timeline'end
function am.IsTimelineReplayEnabled()return ar end function am.SetTimelineReplay
(av)ar=av and true or false aj.SetReplayTimeline(ar)ap'timeline'end function am.
IsSpeedMatchEnabled()return aj.IsSpeedMatchEnabled()end function am.
SetSpeedMatch(av)aj.SetSpeedMatch(av and true or false)ap'speedmatch'end
function am.IsUseFastSpeedEnabled()return aj.IsUseFastSpeedEnabled()end function
am.SetUseFastSpeed(av)aj.SetUseFastSpeed(av and true or false)ap'usefastspeed'
end function am.IsAutoRetryOnDeathLimitEnabled()return aj.
IsAutoRetryOnDeathLimitEnabled()end function am.SetAutoRetryOnDeathLimit(av)aj.
SetAutoRetryOnDeathLimit(av and true or false)ap'retryondeath'end function am.
GetPreAimTime()return aj.GetPreAimTime()end function am.SetPreAimTime(av)aj.
SetPreAimTime(av)ap'preaim'end function am.GetSkillFaceHold()return aj.
GetSkillFaceHold()end function am.SetSkillFaceHold(av)aj.SetSkillFaceHold(av)ap
'facehold'end function am.GetDoubleClickDelay()return aj.GetDoubleClickDelay()
end function am.SetDoubleClickDelay(av)aj.SetDoubleClickDelay(av)ap'doubleclick'
end function am.GetStartPauseTime()return aj.GetStartPauseTime()end function am.
SetStartPauseTime(av)aj.SetStartPauseTime(av)ap'startpause'end function am.
IsAimSkillQEnabled()return aj.IsAimSkillQEnabled()end function am.SetAimSkillQ(
av)aj.SetAimSkillQ(av and true or false)ap'aimskillq'end function am.
IsAimSkillEEnabled()return aj.IsAimSkillEEnabled()end function am.SetAimSkillE(
av)aj.SetAimSkillE(av and true or false)ap'aimskille'end function am.
ToggleRecord(av)if av then if not ag.IsDungeon()then ae.Notify('Path Record',
'Cannot record in Lobby!',3)return false end if ai.IsRecording()then return true
end if aj.IsPlaying()then aj.Stop()end local ax,ay=ai.Start()if not ax then ae.
Notify('Path Record','Failed to start record: '..tostring(ay),3)end ap()return
ax else local ax=ai.IsRecording()ai.Stop()ap()return ax end end function am.
IsRecording()return ai.IsRecording()end function am.CurrentRoomHasRecord()return
ah.HasSegmentOrMacro(ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex())end
function am.GetMapMode(av)return ah.GetMapMode(av)end function am.SetMapMode(av,
ax)if ah.SetMapMode(av,ax)then ap'mode'end end function am.IsAutoPlayWanted()
return an end function am.TogglePlay(av)an=av and true or false if an then if aj
.IsPlaying()then ap'already_playing'return true end if ai.IsRecording()then ai.
Stop()end if not ag.IsDungeon()then ap'armed_lobby'return true end local ax,ay=
ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if not ax or#ax==0 or ay<=0
then ap'armed_waiting'return true end if ab.IsBossActive()and ah.GetMapMode(ax)
~='full'then ap'armed_boss'return true end if ah.HasSegmentOrMacro(ax,ay)then ad
.EnableExclusive'PathRecord'aj.Start()end ap'play_started'return true else local
ax=aj.IsPlaying()aj.Stop()ap'play_stopped'return ax end end function am.
IsPlaying()return aj.IsPlaying()end function am.IsEnabled()return aj.IsPlaying()
end function am.SetRangeVisual(av)al.SetEnabled(av)ap'rangevisual'end function
am.IsRangeVisualEnabled()return al.IsEnabled()end function am.
SetRangeVisualRadius(av)al.SetRadius(av)ap'rangeradius'end function am.
GetRangeVisualRadius()return al.GetRadius()end function am.SetRangeVisualFill(av
)al.SetFillEnabled(av)ap'rangefill'end function am.IsRangeVisualFillEnabled()
return al.IsFillEnabled()end function am.SetHighlightInRange(av)al.
SetHighlightInRange(av)ap'rangehighlight'end function am.
IsHighlightInRangeEnabled()return al.IsHighlightInRangeEnabled()end function am.
GetRangeColorNames()return al.GetColorNames()end function am.
GetSelectedCircleColor()return al.GetSelectedCircleColor()end function am.
SetCircleColor(av)al.SetCircleColor(av)ap'circlecolor'end function am.
GetSelectedHighlightColor()return al.GetSelectedHighlightColor()end function am.
SetHighlightColor(av)al.SetHighlightColor(av)ap'highlightcolor'end function am.
SetVisualEnabled(av)ak.SetEnabled(av)ap'visual'end function am.IsVisualEnabled()
return ak.IsEnabled()end function am.SetVisualShowLines(av)ak.SetShowLines(av)ap
'visuallines'end function am.IsVisualShowLinesEnabled()return ak.
IsShowLinesEnabled()end function am.SetVisualNodeRadius(av)ak.SetNodeRadius(av)
ap'visualradius'end function am.GetVisualNodeRadius()return ak.GetNodeRadius()
end function am.SetVisualAlwaysOnTop(av)ak.SetAlwaysOnTop(av)ap'visualontop'end
function am.IsVisualAlwaysOnTopEnabled()return ak.IsAlwaysOnTopEnabled()end
function am.SetVisualShowEvents(av)ak.SetShowEvents(av)ap'visualevents'end
function am.IsVisualShowEventsEnabled()return ak.IsShowEventsEnabled()end
function am.SetVisualShowFacing(av)ak.SetShowFacingRays(av)ap'visualfacing'end
function am.IsVisualShowFacingEnabled()return ak.IsShowFacingRaysEnabled()end
function am.GetMaps()return ah.GetMaps()end function am.GetMacro(av)return ah.
GetMap(av)end function am.RemoveMap(av)ah.RemoveMap(av)ap'removed'end function
am.ClearAll()ah.ClearAll()ap'cleared'end function am.ReloadFromDisk()ah.
ReloadFromDisk()ap'reloaded'end function am.GetStatus()local av,ax=ai.GetStatus(
),aj.GetStatus()return{recording=ai.IsRecording(),playing=aj.IsPlaying(),resume=
aj.ResumeWanted(),autoPlayWanted=an,inLobby=ab.IsInLobby(),map=ab.
GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab.IsBossActive(),
recordedMaps=ah.Count(),pointCount=av.pointCount,dwellCount=av.dwellCount or 0,
skillCount=av.skillCount or 0,progressPercent=ax.progressPercent or 0,
progressStuds=ax.progressStuds or 0,totalStuds=ax.totalStuds or 0}end function
am.OnStatusChanged(av)if type(av)~='function'then return function()end end table
.insert(ao,av)return function()for ax,ay in ipairs(ao)do if ay==av then table.
remove(ao,ax)break end end end end bossConnection=ab.OnBossActiveChanged(
function(av)local ax=aj.GetActiveMap()or ab.GetCurrentDungeonName()local ay=ax
and ah.GetMapMode(ax)=='full'if av then if ay then if aj.ResumeWanted()or an
then local az=ab.GetCurrentRoomIndex()if az>0 and ah.HasSegmentOrMacro(ax,az)
then ad.EnableExclusive'PathRecord'aj.Start()ap'boss'end elseif aj.IsPlaying()
then ad.EnableExclusive'PathRecord'end return end if aj.IsPlaying()or aj.
ResumeWanted()or an then aj.PauseForExclusive()if af.IsAutoBossCombatEnabled()
then af.Toggle(true,true)ae.Notify('Path Record',
[[Boss Room: Combat Master enabled (Auto Farm + Dodge + Skill)]],3)else ae.
Notify('Path Record','Boss Room: Paused, using Hazard Scanner',3)end ap'boss'end
else if not ay then if af.IsAutoTriggeredByBoss()then af.Toggle(false)ae.Notify(
'Path Record','Boss Defeated: Combat Master disabled',3)end if an or aj.
ResumeWanted()then task.delay(0.5,function()if not an and not aj.ResumeWanted()
then return end if aj.IsPlaying()or ai.IsRecording()then return end local az,aA=
ab.GetCurrentDungeonName(),ab.GetCurrentRoomIndex()if az and aA>0 and ah.
HasSegmentOrMacro(az,aA)then ad.EnableExclusive'PathRecord'aj.Start()ap'resumed'
end end)end end end end)storageUnsub=ah.OnChanged(function()ap'storage'end)
roomUnsub=ab.OnRoomIndexChanged(function(av)if not ab.IsBossActive()and(af.
IsAutoTriggeredByBoss()or af.IsEnabled())then af.Toggle(false)end if not an and
not aj.ResumeWanted()then return end local ax=av or ab.GetCurrentRoomIndex()if
ax<=0 or ab.IsInLobby()or ab.IsDead()then return end local ay=ab.
GetCurrentDungeonName()if not ay or#ay==0 then return end if aj.GetActiveMap()
and aj.GetActiveMap()~=ay then return end if ab.IsBossActive()and ah.GetMapMode(
ay)~='full'then return end if not ah.HasSegmentOrMacro(ay,ax)then return end if
not aj.IsPlaying()then ad.EnableExclusive'PathRecord'aj.Start()ap'resumed'end
end)mapUnsub=ab.OnDungeonNameChanged(function(av)if af.IsAutoTriggeredByBoss()or
af.IsEnabled()then af.Toggle(false)end if ai.IsRecording()then ai.Stop
'map change'end if aj.IsPlaying()or aj.ResumeWanted()then local ax=aj.
GetActiveMap()if ax and ax~=av then aj.Stop()end end if an and av and#av>0 then
task.delay(0.3,function()if not an or aj.IsPlaying()or ai.IsRecording()then
return end local ax=ab.GetCurrentRoomIndex()if ax>0 and ah.HasSegmentOrMacro(av,
ax)then if not(ab.IsBossActive()and ah.GetMapMode(av)~='full')then ad.
EnableExclusive'PathRecord'aj.Start()ap'map_autoplay'end end end)end ap'map'end)
ai.SetCapture(aq)aj.SetReplayTimeline(ar)ad.Register('PathRecord',function(av)if
not av then aj.PauseForExclusive()end ap'disabled'end,am.IsEnabled)task.delay(1,
function()if an and not aj.IsPlaying()and not ai.IsRecording()then local av=ab.
GetCurrentDungeonName()if av and#av>0 and not ab.IsInLobby()then if ah.
HasSegmentOrMacro(av,ab.GetCurrentRoomIndex())then am.TogglePlay(true)end end
end end)ag.Register{Name='PathRecord',Zone='Dungeon',OnLeave=function()if ai.
IsRecording()then ai.Cancel()end if aj.IsPlaying()then aj.Stop()end ak.Clear()ap
'zone_leave'end}ac.Register(function()aj.Stop()ai.Cancel()ak.Clear()if
bossConnection then bossConnection()bossConnection=nil end if roomUnsub then
roomUnsub()roomUnsub=nil end if mapUnsub then mapUnsub()mapUnsub=nil end if
storageUnsub then storageUnsub()storageUnsub=nil end end)return am end function
a.az()local aa,ab,ac,ad,ae,af=a.load'e',a.load'b',a.load'ay',a.load'd',a.load'P'
,a.load'c'local ag=aa.RunService return function(ah,ai)local aj=ai:Section{Side=
'Left'}aj:Header{Name='Path Record Controls'}aj:Label{Text=
[[Macro = 1 recording per map, <font color='rgb(0,255,120)'>click Record once to record continuously</font> across rooms (auto-saves on lobby return). FULL Mode -> records & replays boss rooms as well.]]
}local ak,al,am,an,ao,ap,aq=false,false,false,false local ar,av=function()if not
ao then return nil end local ar=ao:GetOptions()for av,ax in pairs(ar)do if ax
and av~='None'then local ay=string.match(av,'^Map %[(.+)%] %(%d+ rooms%)$')if ay
and#ay>0 then return ay end end end return nil end,aj:Toggle{Name=
'Record Path (Macro)',Default=ac.IsRecording(),Callback=function(ar)if ak then
return end if ar then if ac.IsRecording()then return end if ac.
CurrentRoomHasRecord()then if an then return end an=true ah:Dialog{Title=
'Confirm Record',Description=
[[This room <font color='rgb(255,200,0)'>already has a saved macro</font>.

Recording now will <b>OVERWRITE the existing segment</b> for this room.
Do you still want to re-record?]]
,Buttons={{Name='Record (Overwrite)',Callback=function()an=false local av=ac.
ToggleRecord(true)if not av then pcall(function()ak=true recordToggle:
UpdateState(false,true)ak=false end)end end},{Name='Cancel',Callback=function()
an=false local av,ax=pcall(function()ak=true recordToggle:UpdateState(false,true
)ak=false end)if not av then ak=false warn(
'Path Record: Cancel failed to reset toggle - '..tostring(ax))end end}}}return
end ac.ToggleRecord(true)else an=false if ac.IsRecording()then ac.ToggleRecord(
false)end end end}aj:Label{Text=
[[Captures <font color='rgb(255,150,80)'>pauses</font> + <font color='rgb(255,80,80)'>skills (M2 / Q / E)</font> + facing direction for pinpoint playback accuracy.]]
}local ax,ay,az,aA,aB,aC,aF,aG,aH=aj:Label{Text=
[[Record Mode (Per-map): <font color='rgb(120,200,255)'>NORMAL</font>]]},aj:
Toggle{Name='Full Mode (Record & Play Boss Rooms)',Default=false,Callback=
function(ax)if am then return end local ay=ac.GetStatus().map local az=(ay and#
ay>0)and ay or ar()if not az or#az==0 then af.Notify('Path Record',
[[No map selected. Please choose a map in the dropdown or join a dungeon.]],3)
pcall(function()am=true recordBossToggle:UpdateState(false,true)am=false end)
return end ac.SetMapMode(az,ax and'full'or'normal')af.Notify('Path Record',(
'Map [%s]: %s Mode'):format(az,ax and'FULL (record & replay boss rooms)'or
'NORMAL (skip boss, use Hazard Scanner)'),3)if ap then ap(ac.GetStatus())end end
},aj:Toggle({Name='Play Path (Macro)',Default=ac.IsAutoPlayWanted(),Callback=ad.
Wrap(function(ax)if al then return end ac.TogglePlay(ax)end)},'Toggle_PR_Play'),
aj:Toggle({Name='Record Pauses & Skills',Default=ac.IsTimelineCaptureEnabled(),
Callback=ad.Wrap(function(ax)ac.SetTimelineCapture(ax)end)},
'Toggle_PR_TimelineCapture'),aj:Toggle({Name='Replay Pauses & Skills',Default=ac
.IsTimelineReplayEnabled(),Callback=ad.Wrap(function(ax)ac.SetTimelineReplay(ax)
end)},'Toggle_PR_TimelineReplay'),aj:Toggle({Name='Match Record Speed (Precise)'
,Default=ac.IsSpeedMatchEnabled(),Callback=ad.Wrap(function(ax)ac.SetSpeedMatch(
ax)end)},'Toggle_PR_SpeedMatch'),aj:Toggle({Name='Use Player Fast Speed',Default
=ac.IsUseFastSpeedEnabled(),Callback=ad.Wrap(function(ax)ac.SetUseFastSpeed(ax)
end)},'Toggle_PR_UseFastSpeed'),aj:Toggle({Name=
'Auto Retry on Death Limit (5 Deaths)',Default=ac.
IsAutoRetryOnDeathLimitEnabled(),Callback=ad.Wrap(function(ax)ac.
SetAutoRetryOnDeathLimit(ax)end)},'Toggle_PR_AutoRetryOnDeathLimit'),ai:Section{
Side='Left'}aH:Header{Name='Combat & Skill Timing'}ae.PatchSliderLoadCallback(aH
:Slider({Name='Pre-Aim Lead Time (s)',Default=ac.GetPreAimTime(),Minimum=0.1,
Maximum=1.5,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aI)ac.
SetPreAimTime(aI)end),onInputComplete=function(aI)ad.SaveNow()af.Notify(
'Path Record',('Saved Pre-Aim Lead Time = %ss'):format(tostring(aI)),2)end},
'Slider_PR_PreAimTime'))ae.PatchSliderLoadCallback(aH:Slider({Name=
'Skill Face Hold (s)',Default=ac.GetSkillFaceHold(),Minimum=0.5,Maximum=2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aI)ac.
SetSkillFaceHold(aI)end),onInputComplete=function(aI)ad.SaveNow()af.Notify(
'Path Record',('Saved Skill Face Hold = %ss'):format(tostring(aI)),2)end},
'Slider_PR_SkillFaceHold'))ae.PatchSliderLoadCallback(aH:Slider({Name=
'Skill Double Click Delay (s)',Default=ac.GetDoubleClickDelay(),Minimum=0.005,
Maximum=0.1,DisplayMethod='Value',Precision=3,Callback=ad.Wrap(function(aI)ac.
SetDoubleClickDelay(aI)end),onInputComplete=function(aI)ad.SaveNow()af.Notify(
'Path Record',('Saved Double Click Delay = %ss'):format(tostring(aI)),2)end},
'Slider_PR_DoubleClickDelay'))ae.PatchSliderLoadCallback(aH:Slider({Name=
'Start / Finish Pause Time (s)',Default=ac.GetStartPauseTime(),Minimum=0,Maximum
=3,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aI)ac.
SetStartPauseTime(aI)end),onInputComplete=function(aI)ad.SaveNow()af.Notify(
'Path Record',('Saved Start / Finish Pause Time = %ss'):format(tostring(aI)),2)
end},'Slider_PR_StartPauseTime'))aH:Toggle({Name='Aim Skill Q (Buff)',Default=ac
.IsAimSkillQEnabled(),Callback=ad.Wrap(function(aI)ac.SetAimSkillQ(aI)end)},
'Toggle_PR_AimSkillQ')aH:Toggle({Name='Aim Skill E (Attack)',Default=ac.
IsAimSkillEEnabled(),Callback=ad.Wrap(function(aI)ac.SetAimSkillE(aI)end)},
'Toggle_PR_AimSkillE')local aI=ai:Section{Side='Left'}aI:Header{Name=
'Macro Storage'}ao=ae.PatchDropdownRestore(aI:Dropdown{Name='Map Recording',
Options={'None'},Default=1,Required=true,Callback=function(aJ)local aK=ac.
GetStatus()if ap then ap(aK)end if aq then aq(aK)end end},false)local aJ,aK,aL,
aM,aN,aO=aI:Button{Name='Delete Selected Map',Callback=function()local aJ=ar()if
aJ and#aJ>0 then ac.RemoveMap(aJ)end end},aI:Button{Name=
'Reload Macros (EsclipseHub/DQMacro)',Callback=function()ac.ReloadFromDisk()af.
Notify('Path Record',
'Scanned and reloaded macro files from EsclipseHub/DQMacro/',2)end},false,
'Clear All Recordings',"<font color='rgb(255,80,80)'>Confirm Clear All?</font>",
3 local aQ=function()if not aL then return end aL=false if clearTimer then task.
cancel(clearTimer)clearTimer=nil end pcall(function()clearBtn:UpdateName(aM)end)
end local aW,aX=aI:Button{Name=aM,Callback=function()if not aL then aL=true if
clearTimer then task.cancel(clearTimer)end clearTimer=task.delay(aO,aQ)pcall(
function()clearBtn:UpdateName(aN)end)return end aQ()ac.ClearAll()end},ai:Section
{Side='Right'}aX:Header{Name='Status Monitor & Live HUD'}local aY,aZ,a_,a0,a1,a2
=aX:Label{Text="State: <font color='rgb(160,160,160)'>Idle</font>"},aX:Label{
Text="Progress: <font color='rgb(160,160,160)'>-</font>"},aX:Label{Text=
[[Room: <font color='rgb(160,160,160)'>-</font> | Boss: <font color='rgb(160,160,160)'>-</font>]]
},aX:Label{Text="Events: <font color='rgb(160,160,160)'>-</font>"},aX:Label{Text
="Macros: <font color='rgb(160,160,160)'>None</font>"},ai:Section{Side='Right'}
a2:Header{Name='Path 3D Visualizer'}a2:Label{Text=
"Path node visuals: <font color='rgb(255,90,90)'>\u{1f534} Red when recording</font> (real-time) | <font color='rgb(0,255,120)'>\u{1f7e2} Green normally</font> (preview / playback)."
}local a3,a4,a5,a6=a2:Toggle({Name='Show Path Nodes (3D Spheres)',Default=ac.
IsVisualEnabled(),Callback=ad.Wrap(function(a3)ac.SetVisualEnabled(a3)end)},
'Toggle_PR_VisualEnabled'),a2:Toggle({Name='Connect Path Lines',Default=ac.
IsVisualShowLinesEnabled(),Callback=ad.Wrap(function(a3)ac.SetVisualShowLines(a3
)end)},'Toggle_PR_VisualShowLines'),a2:Toggle({Name=
'Show Event Spheres & 3D Text',Default=ac.IsVisualShowEventsEnabled(),Callback=
ad.Wrap(function(a3)ac.SetVisualShowEvents(a3)end)},'Toggle_PR_VisualShowEvents'
),a2:Toggle({Name='Show Skill Facing Rays',Default=ac.IsVisualShowFacingEnabled(
),Callback=ad.Wrap(function(a3)ac.SetVisualShowFacing(a3)end)},
'Toggle_PR_VisualShowFacing')ae.PatchSliderLoadCallback(a2:Slider({Name=
'Sphere Node Size',Default=ac.GetVisualNodeRadius(),Minimum=0.1,Maximum=1.2,
DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(a7)ac.
SetVisualNodeRadius(a7)end),onInputComplete=function(a7)ad.SaveNow()end},
'Slider_PR_VisualNodeRadius'))a2:Toggle({Name='Always On Top (X-Ray)',Default=ac
.IsVisualAlwaysOnTopEnabled(),Callback=ad.Wrap(function(a7)ac.
SetVisualAlwaysOnTop(a7)end)},'Toggle_PR_VisualAlwaysOnTop')local a7=ai:Section{
Side='Right'}a7:Header{Name='Skill Range Visual'}a7:Label{Text=
[[Indicator circle around character to estimate <font color='rgb(0,255,200)'>attack range / AOE radius</font> for angle and placement calibration when recording.]]
}local a8=a7:Toggle({Name='Show Range Circle',Default=ac.IsRangeVisualEnabled(),
Callback=ad.Wrap(function(a8)ac.SetRangeVisual(a8)end)},'Toggle_PR_RangeVisual')
ae.PatchSliderLoadCallback(a7:Slider({Name='Skill Range (Studs)',Default=ac.
GetRangeVisualRadius(),Minimum=5,Maximum=120,DisplayMethod='Value',Precision=1,
Callback=ad.Wrap(function(a9)ac.SetRangeVisualRadius(a9)end),onInputComplete=
function(a9)ad.SaveNow()end},'Slider_PR_RangeRadius'))a7:Toggle({Name=
'Fill Circle Area',Default=ac.IsRangeVisualFillEnabled(),Callback=ad.Wrap(
function(a9)ac.SetRangeVisualFill(a9)end)},'Toggle_PR_RangeFill')local a9,b,ba=
ac.GetRangeColorNames(),ac.GetSelectedCircleColor(),1 for bb,bc in ipairs(a9)do
if bc==b then ba=bb break end end ae.PatchDropdownRestore(a7:Dropdown({Name=
'Circle Color',Options=a9,Default=ba,Required=true,Callback=ad.Wrap(function(bb)
ac.SetCircleColor(bb)end)},'Dropdown_PR_CircleColor'),false)local bb,bc,bd=a7:
Toggle({Name='Highlight In-Range Enemies (Glow)',Default=ac.
IsHighlightInRangeEnabled(),Callback=ad.Wrap(function(bb)ac.SetHighlightInRange(
bb)end)},'Toggle_PR_HighlightInRange'),ac.GetSelectedHighlightColor(),2 for be,
bf in ipairs(a9)do if bf==bc then bd=be break end end ae.PatchDropdownRestore(a7
:Dropdown({Name='Enemy Highlight Color',Options=a9,Default=bd,Required=true,
Callback=ad.Wrap(function(be)ac.SetHighlightColor(be)end)},
'Dropdown_PR_HighlightColor'),false)local be=function(be)be=math.clamp(be or 0,0
,100)local bf=10 local bg=math.round((be/100)*bf)local bh=bf-bg local bi=string.
rep('\u{25a0}',bg)..string.rep('\u{25a1}',bh)return(
"<font color='rgb(0,255,180)'>%s</font> <b>%d%%</b>"):format(bi,be)end aq=
function(bf)if not an then pcall(function()if av and av.GetState and av:
GetState()~=bf.recording then ak=true av:UpdateState(bf.recording,true)ak=false
end end)end pcall(function()local bg=ac.IsAutoPlayWanted()if az and az.GetState
and az:GetState()~=bg then al=true az:UpdateState(bg,true)al=false end end)
pcall(function()local bg=bf.map local bh=(bg and#bg>0)and bg or ar()local bi=bh
and ac.GetMapMode(bh)=='full'or false if ay and ay.GetState and ay:GetState()~=
bi then am=true ay:UpdateState(bi,true)am=false end end)pcall(function()if a3
and a3.GetState and a3:GetState()~=ac.IsVisualEnabled()then a3:UpdateState(ac.
IsVisualEnabled(),true)end end)pcall(function()if a4 and a4.GetState and a4:
GetState()~=ac.IsVisualShowLinesEnabled()then a4:UpdateState(ac.
IsVisualShowLinesEnabled(),true)end end)pcall(function()if a5 and a5.GetState
and a5:GetState()~=ac.IsVisualShowEventsEnabled()then a5:UpdateState(ac.
IsVisualShowEventsEnabled(),true)end end)pcall(function()if a6 and a6.GetState
and a6:GetState()~=ac.IsVisualShowFacingEnabled()then a6:UpdateState(ac.
IsVisualShowFacingEnabled(),true)end end)pcall(function()if a8 and a8.GetState
and a8:GetState()~=ac.IsRangeVisualEnabled()then a8:UpdateState(ac.
IsRangeVisualEnabled(),true)end end)pcall(function()if bb and bb.GetState and bb
:GetState()~=ac.IsHighlightInRangeEnabled()then bb:UpdateState(ac.
IsHighlightInRangeEnabled(),true)end end)end local bf,bg=function(bf)local bg={}
for bh,bi in ipairs(bf)do bg[#bg+1]=('Map [%s] (%d rooms)'):format(bi.map,bi.
roomCount)end if#bg==0 then bg[1]='None'end return bg end local bh=function(bh)
local bi=bf(bh)local bj=table.concat(bi,'|')if bj==bg then return end bg=bj
local bk for bl,bm in pairs(ao:GetOptions())do if bm then bk=bl break end end
pcall(function()ao:ClearOptions()end)pcall(function()ao:InsertOptions(bi)end)
local bl=bk if not bl or not ao:IsOption(bl)then bl=bi[1]end pcall(function()ao:
UpdateSelection(bl)end)end ap=function(bi)local bj,bk=false,bi.map local bl=(bk
and#bk>0)and bk or ar()if bl then bj=ac.GetMapMode(bl)=='full'end local bm if bi
.recording then bm="<font color='rgb(255,90,90)'>Recording...</font>"elseif bi.
playing then bm="<font color='rgb(0,230,255)'>Playing</font>"elseif bi.resume
then bm="<font color='rgb(255,200,0)'>Waiting (auto-resume)</font>"elseif bi.
autoPlayWanted then if bi.inLobby then bm=
"<font color='rgb(100,220,100)'>Armed (Lobby)</font>"elseif not bi.map or#bi.map
==0 then bm="<font color='rgb(100,220,100)'>Armed (Loading...)</font>"elseif bi.
boss and not bj then bm=
"<font color='rgb(255,160,50)'>Waiting (Boss Room)</font>"else bm=
[[<font color='rgb(100,220,100)'>Armed (Waiting for Room)</font>]]end else bm=
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aY:UpdateName(
'State: '..bm)end)if bi.playing then local bn,bo=be(bi.progressPercent),(
'(%.1f / %.1f studs)'):format(bi.progressStuds or 0,bi.totalStuds or 0)pcall(
function()aZ:UpdateName('Progress: '..bn..' '..bo)end)elseif bi.recording then
pcall(function()aZ:UpdateName(
[[Progress: <font color='rgb(255,90,90)'>Recording Segment...</font> (]]..
tostring(bi.pointCount or 0)..' pts)')end)else pcall(function()aZ:UpdateName
"Progress: <font color='rgb(160,160,160)'>-</font>"end)end local bn,bo=bj and
"<font color='rgb(255,140,255)'>FULL</font>"or
"<font color='rgb(120,200,255)'>NORMAL</font>",bl and(' (map ['..bl..'])')or
' (per-map)'pcall(function()ax:UpdateName('Record Mode'..bo..': '..bn)end)local
bp if bi.boss then if bj then bp=
"<font color='rgb(255,140,255)'>YES (FULL path)</font>"else bp=
"<font color='rgb(255,80,80)'>YES (Hazard Scanner)</font>"end else bp=
"<font color='rgb(0,255,120)'>No</font>"end local bq,br=bi.room and bi.room>0
and("<font color='rgb(0,255,255)'>room %d</font>"):format(bi.room)or
"<font color='rgb(160,160,160)'>-</font>",bi.map and#bi.map>0 and(
"<font color='rgb(150,255,150)'>%s</font>"):format(bi.map)or
"<font color='rgb(160,160,160)'>-</font>"pcall(function()a_:UpdateName('Map: '..
br..' | Room: '..bq..' | Boss: '..bp)end)if bi.recording then pcall(function()a0
:UpdateName((
[[Events: <font color='rgb(255,170,60)'>%d pts</font> | <font color='rgb(255,90,220)'>%d skills</font> | <font color='rgb(255,215,0)'>%d pauses</font>]]
):format(bi.pointCount or 0,bi.skillCount or 0,bi.dwellCount or 0))end)elseif bi
.playing then pcall(function()a0:UpdateName
"<font color='rgb(0,230,255)'>Playing</font>"end)else pcall(function()a0:
UpdateName"Events: <font color='rgb(160,160,160)'>-</font>"end)end local bs=ac.
GetMaps()if#bs==0 then pcall(function()a1:UpdateName
"Macros: <font color='rgb(160,160,160)'>None</font>"end)else local bt={}for bu,
bv in ipairs(bs)do local bw=bv.bossCount and bv.bossCount>0 and('+%db'):format(
bv.bossCount)or''bt[#bt+1]=('%s(%dr/%dp%s)'):format(bv.map,bv.roomCount,bv.
pointCount,bw)end pcall(function()a1:UpdateName(
"Macros: <font color='rgb(150,255,150)'>"..table.concat(bt,', ')..'</font>')end)
end bh(bs)end local bi,bj=ac.OnStatusChanged(function(bi)ap(bi)aq(bi)end),0
local bk=ag.Heartbeat:Connect(function()local bk=os.clock()if bk-bj<0.35 then
return end bj=bk local bl=ac.GetStatus()ap(bl)aq(bl)end)ab.Register(function()if
bk then bk:Disconnect()bk=nil end if bi then bi()bi=nil end end)ap(ac.GetStatus(
))aq(ac.GetStatus())end end function a.aA()local aa,ab,ac,ad,ae,af,ag=a.load'b',
a.load'e',{},{'inventory','inspectGui','sellShop','tradingGui','blacksmith'},{
'armorMain','weaponMain'},10,{warrior={className='Warrior',primaryStat=
'physicalDamage'},mage={className='Mage',primaryStat='spellPower'},guardian={
className='Guardian',primaryStat='health'}}local ah,ai=function(ah)if not ah
then return nil,nil end local ai=string.lower(ah)for aj,ak in pairs(ag)do if
string.find(ai,aj)then return ak.className,ak.primaryStat end end return nil,nil
end,function(ah)if not ah then return nil end local ai=string.match(ah,
'^%s*([%d,.-]+)')if not ai then return nil end local aj=string.gsub(ai,',','')
return tonumber(aj)end local aj,ak,al,am,an,ao,ap,aq,ar,av,ax,ay,az,aA,aB,aC,aF,
aG=function(aj)if not aj then return 0,0 end local ak=string.gsub(aj,',','')
local al,am=string.match(ak,'(%d+)%s*/%s*(%d+)')if al and am then return
tonumber(al)or 0,tonumber(am)or 0 end local an=ai(ak)return 0,an or 0 end,
function(aj)if not aj then return''end local ak=string.match(aj,'^([^\n\r]+)')
local al=ak or aj local am=string.match(al,'^(.-)%s*[%(\\[]')if am and am~=''
then return string.gsub(am,'%s+$','')end return string.gsub(al,'%s+$','')end,
function(aj)if not aj then return false end if string.find(aj,
'[\n\r]%s*[%(\\[].-[%)\\]]')then return true end return string.find(aj,
'%s*[%(\\[].-[%)\\]]%s*$')~=nil end,true,{},'',false,{},{},{},{},{},{},{},{}
local aH=function(aH)local aI=aq[aH]if aI and aH and aH.Parent then ap=true
pcall(function()aH.Text=aI.text end)ap=false end aq[aH]=nil end local aI,aJ=
function()for aI,aJ in pairs(aq)do aH(aI)end table.clear(aq)end,function(aI,aJ)
local aK,aL=string.lower(aJ),aI:FindFirstChild(aJ)if aL then if aL:IsA
'TextLabel'then return aL elseif aL:IsA'GuiObject'then for aM,aN in ipairs{
'valueText','ValueText','value','Value','amount','Amount','text','label'}do
local aO=aL:FindFirstChild(aN)if aO and aO:IsA'TextLabel'then return aO end end
local aM=aL:FindFirstChildOfClass'TextLabel'if aM then return aM end end end for
aM,aN in ipairs(aI:GetDescendants())do if aN:IsA'TextLabel'then local aO=string.
lower(aN.Name)if aO==aK then return aN end if(aO=='valuetext'or aO=='value'or aO
=='amount')and aN.Parent then local aQ=string.lower(aN.Parent.Name)if string.
find(aQ,aK)then return aN end end end end if aK=='upgrades'then for aM,aN in
ipairs(aI:GetDescendants())do if aN:IsA'TextLabel'and not string.find(string.
lower(aN.Name),'title')then if string.find(aN.Text,'%d+%s*/%s*%d+')then return
aN end end end end return nil end local aK=function(aK)if not am then return end
if not aK or not aK:IsA'GuiObject'or not aK.Visible then return end local aL=aK.
Parent if aL and aL:IsA'GuiObject'and not aL.Visible then return end if ap then
return end local aM,aN=aK.Name,{}local aO={aM}for aQ,aW in ipairs(aK:
GetDescendants())do local aX=string.lower(aW.Name)if not string.find(aX,'title')
then if aW:IsA'TextLabel'then local aY,aZ=(aW.Parent~=aK and aW.Parent.Name..'/'
..aW.Name)or aW.Name,ak(aW.Text)table.insert(aN,{name=aW.Name,value=aZ,kind=
'TextLabel',path=aY,instance=aW})table.insert(aO,aY..'='..aZ)elseif aW:IsA
'ValueBase'then local aY,aZ=tostring(aW.Value),(aW.Parent~=aK and aW.Parent.Name
..'/'..aW.Name)or aW.Name table.insert(aN,{name=aW.Name,value=aY,kind=
'ValueBase',path=aZ})table.insert(aO,aZ..'='..aY)end end end local aQ=aJ(aK,
'name')local aW=(aQ and ak(aQ.Text))or nil if not aW then for aX,aY in ipairs(aN
)do if string.lower(aY.name)=='name'then aW=aY.value break end end end local aX=
aJ(aK,'upgrades')local aY=(aX and ak(aX.Text))or nil if not aY then for aZ,a_ in
ipairs(aN)do if string.lower(a_.name)=='upgrades'or string.find(a_.value,
'%d+%s*/%s*%d+')then aY=a_.value break end end end local aZ,a_,a0=aJ(aK,
'physicalDamage')or aJ(aK,'physicalPower'),aJ(aK,'spellPower'),aJ(aK,'health')
local a1,a2,a3,a4,a5,a6=aZ and ai(ak(aZ.Text)),a_ and ai(ak(a_.Text)),a0 and ai(
ak(a0.Text))if aM=='weaponMain'then if(a2 or 0)>(a1 or 0)then a4='Mage'a5=
'spellPower'a6=a_ else a4='Warrior'a5='physicalDamage'a6=aZ end else a4,a5=ah(aW
)if a4=='Warrior'then a6=aZ elseif a4=='Mage'then a6=a_ elseif a4=='Guardian'
then a6=a0 else if(a3 or 0)>10000 and(a3 or 0)>((a1 or 0)*10)then a4='Guardian'
a5='health'a6=a0 elseif(a2 or 0)>(a1 or 0)then a4='Mage'a5='spellPower'a6=a_
else a4='Warrior'a5='physicalDamage'a6=aZ end end end local a7,a8=aj(aY)local a9
=math.max(0,a8-a7)if a6 and a6:IsA'TextLabel'and a8>0 then local b=ak(a6.Text)
local ba=ai(b)if ba then local bb=ba+(a9*af)local bc=string.format('%s\n(%s)',b,
tostring(bb))for bd,be in ipairs(aN)do if be.instance==a6 or be.name==a5 then be
.isPrimaryStat=true be.calculatedTotal=bb be.remainingUpgrades=a9 be.curUpgrades
=a7 be.maxUpgrades=a8 end end table.insert(aO,'calc='..tostring(bb))if a6.Text~=
bc then if not aq[a6]then aq[a6]={text=a6.Text}end ap=true pcall(function()a6.
Text=bc a6.ClipsDescendants=false end)ap=false end end end local b={name=1,
levelReq=2,physicalDamage=3,spellPower=4,health=5,upgrades=6,sellPrice=7,
description=8}table.sort(aN,function(ba,bb)local bc,bd=b[ba.name]or 99,b[bb.name
]or 99 if bc~=bd then return bc<bd end return ba.path<bb.path end)local ba=table
.concat(aO,'|')if ba~=ao then ao=ba aF=aM an=aN aG=a4 for bb,bc in ipairs(aB)do
pcall(bc,aF,an,aG)end end end local aL=function(aL,aM)if ax[aM]then return end
ax[aM]=true local aN=aM:GetPropertyChangedSignal'Text':Connect(function()if not
am or ap then return end if aL.Visible and not al(aM.Text)then aK(aL)end end)
table.insert(ar,aN)end local aM=function(aM)if av[aM]then return end av[aM]=true
local aN=aM:GetPropertyChangedSignal'Visible':Connect(function()if not am then
return end if aM.Visible then aK(aM)else aI()ao=''aF=nil an={}aG=nil for aN,aO
in ipairs(aB)do pcall(aO,nil,{},nil)end end end)table.insert(ar,aN)for aO,aQ in
ipairs(aM:GetDescendants())do if aQ:IsA'TextLabel'then aL(aM,aQ)end end local aO
=aM.DescendantAdded:Connect(function(aO)if aO:IsA'TextLabel'then aL(aM,aO)if aM.
Visible then task.defer(function()aK(aM)end)end end end)table.insert(ar,aO)if aM
.Visible then task.defer(function()aK(aM)end)end end local aN=function(aN)if not
aN or not aN:IsA'GuiObject'or ay[aN]then return end ay[aN]=true local aO=aN:
GetPropertyChangedSignal'Visible':Connect(function()if not am then return end if
not aN.Visible then aI()if aF~=nil then aF=nil an={}aG=nil ao=''for aO,aQ in
ipairs(aB)do pcall(aQ,nil,{},nil)end end end end)table.insert(ar,aO)for aQ,aW in
ipairs(ae)do local aX=aN:FindFirstChild(aW)if aX and aX:IsA'GuiObject'then aM(aX
)if aX.Visible and aN.Visible then aK(aX)end end end local aQ=aN.ChildAdded:
Connect(function(aQ)if aQ:IsA'GuiObject'then for aW,aX in ipairs(ae)do if aQ.
Name==aX then aM(aQ)if aQ.Visible and aN.Visible then aK(aQ)end end end end end)
table.insert(ar,aQ)end local aO=function(aO)if not aO or az[aO]then return end
az[aO]=true local aQ=aO:FindFirstChild'itemStatFrame'if aQ and aQ:IsA'GuiObject'
then aN(aQ)end local aW=aO.ChildAdded:Connect(function(aW)if aW.Name==
'itemStatFrame'and aW:IsA'GuiObject'then aN(aW)end end)table.insert(ar,aW)local
aX=aO.AncestryChanged:Connect(function(aX,aY)if not aY then az[aO]=nil aI()end
end)table.insert(ar,aX)end local aQ,aW=function()local aQ=ab.player or ab.
Players.LocalPlayer if not aQ then return end local aW=aQ:FindFirstChild
'PlayerGui'if not aW then return end for aX,aY in ipairs(ad)do local aZ=aW:
FindFirstChild(aY)if not aZ then for a_,a0 in ipairs(aW:GetChildren())do if
string.lower(a0.Name)==string.lower(aY)then aZ=a0 break end end end if aZ then
aO(aZ)end end local aX=aW.ChildAdded:Connect(function(aX)for aY,aZ in ipairs(ad)
do if string.lower(aX.Name)==string.lower(aZ)then aO(aX)end end end)table.
insert(ar,aX)end,function()if aC then task.cancel(aC)aC=nil end for aQ,aW in
ipairs(ar)do pcall(function()aW:Disconnect()end)end table.clear(ar)table.clear(
av)table.clear(ax)table.clear(ay)table.clear(az)aI()aF=nil an={}aG=nil ao=''for
aQ,aW in ipairs(aB)do pcall(aW,nil,{},nil)end end local aX=function()if aC then
return end aQ()aC=task.spawn(function()while am do task.wait(1.5)if not am then
break end local aX,aY=false,ab.player or ab.Players.LocalPlayer if aY then local
aZ=aY:FindFirstChild'PlayerGui'if aZ then for a_,a0 in ipairs(ad)do local a1=aZ:
FindFirstChild(a0)if not a1 then for a2,a3 in ipairs(aZ:GetChildren())do if
string.lower(a3.Name)==string.lower(a0)then a1=a3 break end end end if a1 then
if not az[a1]then aO(a1)end local a2=a1:FindFirstChild'itemStatFrame'if a2 and
a2:IsA'GuiObject'then if not ay[a2]then aN(a2)end if a2.Visible then for a3,a4
in ipairs(ae)do local a5=a2:FindFirstChild(a4)if a5 and a5:IsA'GuiObject'then if
not av[a5]then aM(a5)end if a5.Visible then aX=true aK(a5)end end end end end
end end end end if not aX and next(aq)~=nil then aI()if aF~=nil then aF=nil an={
}aG=nil ao=''for aZ,a_ in ipairs(aB)do pcall(a_,nil,{},nil)end end end end aC=
nil end)end function ac.IsEnabled()return am end function ac.GetActiveInspector(
)return aF,an,aG end function ac.SetEnabled(aY)local aZ=aY and true or false if
am==aZ then return end am=aZ if am then aX()else aW()end for a_,a0 in ipairs(aA)
do pcall(a0,am)end end function ac.OnChanged(aY)if type(aY)=='function'then
table.insert(aA,aY)end end function ac.OnInspectorChanged(aY)if type(aY)==
'function'then table.insert(aB,aY)end end function ac.GetActiveFrame()local aY
for aZ,a_ in ipairs(an)do if a_.name=='name'and a_.value~=''then aY=a_.value
break end end return aF,aY end function ac.OnFrameChanged(aY)if type(aY)==
'function'then table.insert(aB,function(aZ,a_,a0)local a1 for a2,a3 in ipairs(a_
)do if a3.name=='name'and a3.value~=''then a1=a3.value break end end pcall(aY,aZ
,a1)end)end end function ac.Init()if not am then am=true end aX()end aa.
Register(function()am=false aW()table.clear(aA)table.clear(aB)end)aX()return ac
end function a.aB()local aa=function(aa)local ab=Instance.new'Frame'ab.Name=
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
'rbxassetid://109718589733073')return ab end return aa end function a.aC()local
aa,ab,ac,ad,ae=a.load'b',a.load'e',a.load'c',a.load'aB',a.load'a'local af,ag,ah,
ai,aj,ak,al,am,an,ao,ap=ab.TweenService or game:GetService'TweenService',ab.
HttpService or game:GetService'HttpService',{},'None',false,false,true,1.25,
function()local af='EsclipseHub'pcall(function()if ae and ae.Folder then af=ae.
Folder end end)return af end local aq,ar=function()return an()..
'/settings/inventory_sort.json'end,function()if not(makefolder and isfolder)then
return end pcall(function()local aq=an()if not isfolder(aq)then makefolder(aq)
end local ar=aq..'/settings'if not isfolder(ar)then makefolder(ar)end end)end
local av,ax=function()if not(isfile and readfile)then return end local av=aq()if
not isfile(av)then return end local ax,ay=pcall(function()local ax=readfile(av)
return ag:JSONDecode(ax)end)if not(ax and type(ay)=='table')then return end if
ay.mainFilterMode=='Descending'or ay.mainFilterMode=='Ascending'or ay.
mainFilterMode=='None'then ai=ay.mainFilterMode end if type(ay.rarityEnabled)==
'boolean'then aj=ay.rarityEnabled end if ay.selectedStatFilter==
'Physical Damage'or ay.selectedStatFilter=='Spell Power'or ay.selectedStatFilter
=='Health'then ao=ay.selectedStatFilter elseif ay.selectedStatFilter==nil then
ao=nil end if type(ay.abilityEnabled)=='boolean'then ak=ay.abilityEnabled end if
type(ay.autoSortEnabled)=='boolean'then al=ay.autoSortEnabled end if ak then aj=
false ao=nil elseif ao~=nil then aj=false end end,function()if not(isfile and
writefile)then return end if ap then task.cancel(ap)ap=nil end ap=task.delay(0.5
,function()ap=nil pcall(function()ar()local av,ax=aq(),{mainFilterMode=ai,
rarityEnabled=aj,selectedStatFilter=ao,abilityEnabled=ak,autoSortEnabled=al}
writefile(av,ag:JSONEncode(ax))end)end)end local function ay(az)if not az or not
az.Parent then return end local aA=az.Parent if not aA:IsA'GuiObject'then return
end local aB=aA.AbsoluteSize.Y if aB<=10 then task.defer(function()if az and az.
Parent then ay(az)end end)return end local aC=workspace.CurrentCamera local aF=
aC and aC.ViewportSize or Vector2.new(1920,1080)local aG,aH,aI=aF.X,ab.player or
ab.Players.LocalPlayer local aJ=aH and aH:FindFirstChild'PlayerGui'if aJ then
for aK,aL in ipairs(aJ:GetChildren())do if aL:IsA'ScreenGui'and aL.Enabled then
for aM,aN in ipairs(aL:GetDescendants())do if aN:IsA'GuiObject'and aN.Visible
and aN.AbsoluteSize.Y>20 then local aO=string.lower(aN.Name)if string.find(aO,
'bosskey')or string.find(aO,'keyframe')or string.find(aO,'keysframe')or string.
find(aO,'keysholder')or string.find(aO,'keyholder')then local aQ=aN.
AbsolutePosition.Y+aN.AbsoluteSize.Y if not aI or aQ>aI then aI=aQ end end end
end end end end local aK=aA.AbsolutePosition.Y local aL,aM,aN=aK+aB,280,1.25 if
aI and aI>aK and aI<aL then local aO=(aL-aI)-10 if aO>30 then aN=math.min(aN,aO/
aM)end else if aB<440 then local aO=math.clamp(aB/440,0.35,1)local aQ=0.38+(aO*
0.32)aN=math.min(aN,(aB*aQ)/aM)end end local aO=440 local aQ=(aB/aO)*1.25 local
aW,aX=math.clamp(math.min(aQ,aN),0.28,1.25),az:FindFirstChildOfClass'UIScale'if
not aX then aX=Instance.new'UIScale'aX.Name='SortBarUIScale'aX.Parent=az end aX.
Scale=aW local aY=aW/1.25 local aZ,a_,a0=math.clamp(math.round(30*aY),8,30),math
.clamp(math.round(15*aY),0,15),aA.AbsolutePosition.X local a1,a2=a0+aA.
AbsoluteSize.X,50*aW+aZ local a3,a4=(a1+a2)<=(aG-4),(a0-a2)>=4 if not a3 and a4
then az.AnchorPoint=Vector2.new(1,1)az.Position=UDim2.new(0,-aZ,1,a_)else az.
AnchorPoint=Vector2.new(0,1)az.Position=UDim2.new(1,aZ,1,a_)end end local az,aA,
aB,aC,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,aQ,aW,aX=0,30,6,false,{common=1,uncommon=2,
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
fromRGB(215,125,255)}},{},false,{},{},{},{},{},{}local aY,aZ=function(aY)local
aZ={}if type(aY)~='table'then return aZ end for a_,a0 in pairs(aY)do if type(a0)
=='table'then local a1=aG[a_]or a_ for a2,a3 in pairs(a0)do local a4=tostring(a2
)aZ[a4]=a3 local a5=string.match(a4,'_(%d+)$')if a5 then aZ[a_..'_'..a5]=a3 aZ[
a1..'_'..a5]=a3 local a6=string.match(a4,'^(.-)_')if a6 then aZ[a6..'_'..a5]=a3
end end end end end return aZ end,function(aY)local aZ=os.clock()if not aY and
cachedInventoryData and(aZ-az)<aA then return cachedInventoryData end if
cachedInventoryData and(aZ-az)<aB then return cachedInventoryData end if(aZ-az)<
3 then return cachedInventoryData end if aC then return cachedInventoryData end
aC=true local a_,a0=pcall(function()local a_=ab.ReplicatedStorage or game:
GetService'ReplicatedStorage'local a0=a_ and a_:FindFirstChild'remotes'if not a0
then return nil end local a1=a0:FindFirstChild'reloadInvy'if not a1 or not a1:
IsA'RemoteFunction'then return nil end return a1:InvokeServer()end)aC=false az=
os.clock()if a_ and a0 then if type(a0)=='table'and a0['1']and type(a0['1'])==
'table'then cachedInventoryData=a0['1']else cachedInventoryData=a0 end
cachedLookupMap=nil return cachedInventoryData end return cachedInventoryData
end local a_,a0,a1=function(a_,a0,a1)if not a_ or type(a_)~='table'then return
nil end if not cachedLookupMap then cachedLookupMap=aY(a_)end return
cachedLookupMap[a0..'_'..a1]end,false,function(a_)if not a_ then return 0,0 end
local a0=string.gsub(tostring(a_),',','')local a1,a2=string.match(a0,
'(%d+)%s*/%s*(%d+)')if a1 and a2 then return tonumber(a1)or 0,tonumber(a2)or 0
end local a3=tonumber(string.match(a0,'^%s*([%d.-]+)'))return 0,a3 or 0 end
local a2=function(a2,a3)if not a2 or type(a2)~='table'then return 0,0 end if not
a0 then a0=true local a4={}for a5,a6 in pairs(a2)do table.insert(a4,string.
format('%s=%s',tostring(a5),tostring(a6)))end print(string.format(
'[InventorySort:ItemDump] %s (%s): %s',tostring(a2.name or'Unknown'),tostring(a2
.rarity or'Common'),table.concat(a4,', ')))end local a4,a5,a6=a2.totalUpgrades
or a2.maxUpgrades or a2.totalUpgrade or a2.maxUpgrade or a2.upgradesTotal or a2.
upgradesMax or a2.upgradeTotal or a2.upgradeLimit or a2.availableUpgrades if a4
~=nil then a6=tonumber(a4)end local a7=a2.curUpgrades or a2.currentUpgrades or
a2.currentUpgrade or a2.upgradesCur if a7~=nil then a5=tonumber(a7)end if a2.
upgrades~=nil then if type(a2.upgrades)=='string'then local a8,a9=a1(a2.upgrades
)a5=a5 or a8 a6=a6 or a9 elseif type(a2.upgrades)=='number'then a5=a5 or a2.
upgrades elseif type(a2.upgrades)=='table'then local a8,a9=a2.upgrades.cur or a2
.upgrades.current or a2.upgrades[1],a2.upgrades.max or a2.upgrades.total or a2.
upgrades.totalUpgrades or a2.upgrades[2]if a8~=nil then a5=a5 or tonumber(a8)end
if a9~=nil then a6=a6 or tonumber(a9)end end end if(not a6 or a6==0)and a3 and
a3:IsA'GuiObject'then for a8,a9 in ipairs{'totalUpgrades','maxUpgrades',
'upgrades','totalUpgrade'}do local b=a3:FindFirstChild(a9)if not b then local ba
=a3:FindFirstChild'itemType'if ba then b=ba:FindFirstChild(a9)end end if b and b
:IsA'ValueBase'then local ba=tonumber(b.Value)if ba and ba>0 then a6=ba break
end end end end return a5 or 0,a6 or 0 end local a3=function(a3,a4,a5,a6,a7,a8,
a9)if not a3 or type(a3)~='table'then local b=math.max(a5,a6,a7)return a5,a6,a7,
b end local b,ba=a2(a3,a9)local bb=math.max(0,ba-b)local bc,bd,be,bf,bg=bb*10,a5
,a6,a7,string.lower(a4 or'')local bh=(bg=='weapon'or bg=='weapons'or string.
find(bg,'weapon')~=nil)if bh then if a6>a5 then be=a6+bc else bd=a5+bc end else
local bi=string.lower(a8 or'')if string.find(bi,'guardian')then bf=a7+bc elseif
string.find(bi,'mage')then be=a6+bc elseif string.find(bi,'warrior')then bd=a5+
bc else if a7>10000 and a7>(a5*10)then bf=a7+bc elseif a6>a5 then be=a6+bc else
bd=a5+bc end end end local bi=math.max(bd,be,bf)return bd,be,bf,bi end local a4,
a5=function(a4,a5,a6)if not a4:IsA'GuiObject'then return nil end local a7=a4:
FindFirstChild'itemType'if not a7 then return nil end local a8,a9,b=tostring(a7.
Value or''),'',a7:FindFirstChild'uniqueItemNum'if b then a9=tostring(b.Value or
'')end local ba,bb,bc,bd,be,bf,bg,bh=a_(a5,a8,a9),tonumber(a4.Name)or a6,0,0,0,0
,0,''if ba and type(ba)=='table'then bc=tonumber(ba.physicalDamage or ba.
physicalPower or 0)or 0 bd=tonumber(ba.spellPower or 0)or 0 be=tonumber(ba.
health or 0)or 0 local bi=string.lower(tostring(ba.rarity or'common'))bf=aF[bi]
or 0 bg=tonumber(ba.levelReq or 0)or 0 bh=tostring(ba.name or'')end local bi,bj,
bk,bl=a3(ba,a8,bc,bd,be,bh,a4)return{slot=a4,originalOrder=bb,category=string.
lower(a8),physical=bc,spell=bd,health=be,maxPhysical=bi,maxSpell=bj,maxHealth=bk
,maxPot=bl,rarityScore=bf,levelReq=bg,name=bh}end,function(a4)local a5=string.
lower(a4)if a5=='weapon'or a5=='weapons'then return 1 elseif a5=='chest'or a5==
'chests'or a5=='helmet'or a5=='helmets'or a5=='armor'then return 2 elseif a5==
'ability'or a5=='abilities'then return 3 end return 4 end local a6,a7,a8=
function(a6,a7)if ai=='None'and not ak then return a6.originalOrder<a7.
originalOrder end if ak then local a8,a9=(a6.category=='ability'or a6.category==
'abilities'),(a7.category=='ability'or a7.category=='abilities')if a8~=a9 then
return a8 end local b=(ai~='Ascending')if a8 and a9 then if a6.levelReq~=a7.
levelReq then if b then return a6.levelReq>a7.levelReq else return a6.levelReq<
a7.levelReq end end if a6.rarityScore~=a7.rarityScore then if b then return a6.
rarityScore>a7.rarityScore else return a6.rarityScore<a7.rarityScore end end if
a6.name~=a7.name then return a6.name<a7.name end return a6.originalOrder<a7.
originalOrder end local ba,bb=a5(a6.category),a5(a7.category)if ba~=bb then
return ba<bb end if a6.levelReq~=a7.levelReq then if b then return a6.levelReq>
a7.levelReq else return a6.levelReq<a7.levelReq end end if a6.name~=a7.name then
return a6.name<a7.name end return a6.originalOrder<a7.originalOrder end local a8
,a9,b=(ai=='Descending'),a5(a6.category),a5(a7.category)if a9~=b then return a9<
b end if a9==3 then if a6.levelReq~=a7.levelReq then if a8 then return a6.
levelReq>a7.levelReq else return a6.levelReq<a7.levelReq end end if a6.
rarityScore~=a7.rarityScore then if a8 then return a6.rarityScore>a7.rarityScore
else return a6.rarityScore<a7.rarityScore end end if a6.name~=a7.name then
return a6.name<a7.name end return a6.originalOrder<a7.originalOrder end if ao~=
nil then local ba,bb=0,0 if ao=='Physical Damage'then ba=a6.maxPhysical bb=a7.
maxPhysical elseif ao=='Spell Power'then ba=a6.maxSpell bb=a7.maxSpell elseif ao
=='Health'then ba=a6.maxHealth bb=a7.maxHealth end if ba~=bb then if a8 then
return ba>bb else return ba<bb end end end if aj then if a6.rarityScore~=a7.
rarityScore then if a8 then return a6.rarityScore>a7.rarityScore else return a6.
rarityScore<a7.rarityScore end end end if ao==nil and not aj then local ba,bb=a6
.maxPot,a7.maxPot if ba~=bb then if a8 then return ba>bb else return ba<bb end
end end if a6.levelReq~=a7.levelReq then if a8 then return a6.levelReq>a7.
levelReq else return a6.levelReq<a7.levelReq end end if aj then local ba,bb=a6.
maxPot,a7.maxPot if ba~=bb then if a8 then return ba>bb else return ba<bb end
end end if ao~=nil then local ba,bb=a6.maxPot,a7.maxPot if ba~=bb then return ba
>bb end end if a6.name~=a7.name then return a6.name<a7.name end if a6.category~=
a7.category then local ba,bb=(a6.category=='chest'or a6.category=='chests'),(a7.
category=='chest'or a7.category=='chests')if ba~=bb then return ba end end
return a6.originalOrder<a7.originalOrder end,function()local a6=ab.player or ab.
Players.LocalPlayer if not a6 then return nil,nil end local a7=a6:FindFirstChild
'PlayerGui'if not a7 then return nil,nil end local a8=a7:FindFirstChild
'inventory'if not a8 then return nil,nil end local a9=a8:FindFirstChild
'mainBackground'if not a9 or not a9.Visible then return nil,nil end local b=a9:
FindFirstChild'innerBackground'if not b then return nil,nil end local ba=b:
FindFirstChild'rightSideFrame'if not ba then return nil,nil end local bb=ba:
FindFirstChild'ScrollingFrame'if not bb or not bb:IsA'ScrollingFrame'then return
nil,nil end local bc=bb:FindFirstChildOfClass'UIGridLayout'return bb,bc end
function ah.RequestSort(a9)if not al then return end if ai=='None'and not ak
then return end if a8 then task.cancel(a8)a8=nil end local b=a9 or 0.15 a8=task.
delay(b,function()a8=nil ah.ApplySort()end)end function ah.ApplySort()if aL then
return end local a9,b=a7()if not a9 then return end aL=true local ba,bb=pcall(
function()if b and b.SortOrder~=Enum.SortOrder.LayoutOrder then b.SortOrder=Enum
.SortOrder.LayoutOrder end local ba,bb,bc=aZ(),{},0 for bd,be in ipairs(a9:
GetChildren())do if be:IsA'GuiObject'and be.Name~='UIGridLayout'then bc=bc+1
local bf=a4(be,ba,bc)if bf then table.insert(bb,bf)end end end if#bb==0 then
return end table.sort(bb,function(bd,be)return a6(bd,be)end)for bd,be in ipairs(
bb)do if be.slot.LayoutOrder~=bd then be.slot.LayoutOrder=bd end end end)aL=
false if not ba and bb then warn(
'[InventorySort] L\u{1ed7}i khi s\u{1eaf}p x\u{1ebf}p kho \u{111}\u{1ed3}:',bb)
end end local a9=function(a9,b,ba)local bb,bc=aI[b]or aI.Inactive,aJ[a9.Name]
local bd,be,bf,bg,bh,bi=bb.BackgroundTransparency,bb.BackgroundColor3,bb.
ElementTransparency,bb.ElementColor3,bb.StrokeTransparency,bb.StrokeColor3 if b
=='Active'and bc then bd=0.12 be=bc.ActiveBg bh=0 bi=bc.ActiveStroke elseif b==
'ActiveHovered'and bc then bd=0.05 be=bc.ActiveHoverBg bh=0 bi=bc.
ActiveHoverStroke end local bj=TweenInfo.new(aI.TweenDuration,aI.EasingStyle,aI.
EasingDirection)pcall(function()if ba then af:Create(a9,bj,{
BackgroundTransparency=bd,BackgroundColor3=be}):Play()else a9.
BackgroundTransparency=bd a9.BackgroundColor3=be end end)for bk,bl in ipairs(a9:
GetDescendants())do pcall(function()if bl:IsA'ImageLabel'or bl:IsA'ImageButton'
then if ba then af:Create(bl,bj,{ImageTransparency=bf,ImageColor3=bg}):Play()
else bl.ImageTransparency=bf bl.ImageColor3=bg end elseif bl:IsA'TextLabel'or bl
:IsA'TextButton'then if ba then af:Create(bl,bj,{TextTransparency=bf,TextColor3=
bg}):Play()else bl.TextTransparency=bf bl.TextColor3=bg end elseif bl:IsA
'UIStroke'then if ba then af:Create(bl,bj,{Transparency=bh,Color=bi}):Play()else
bl.Transparency=bh bl.Color=bi end end end)end end local b=function(b,ba)if not
b or not b.Parent then return end local bb=(aM[b]==true)if b.Name==
'IBmainFilter'then local bc,bd=(ai~='None'),aH[ai]or aH.None if bc then a9(b,bb
and'ActiveHovered'or'Active',ba)else a9(b,bb and'Hovered'or'Inactive',ba)end for
be,bf in ipairs(b:GetDescendants())do if bf:IsA'ImageLabel'then if bf.Image~=bd
then bf.Image=bd end bf.Rotation=0 end end elseif b.Name=='IBrarity'then local
bc=(aj==true)if bc then a9(b,bb and'ActiveHovered'or'Active',ba)else a9(b,bb and
'Hovered'or'Inactive',ba)end elseif b.Name=='IBphysic'then local bc=(ao==
'Physical Damage')if bc then a9(b,bb and'ActiveHovered'or'Active',ba)else a9(b,
bb and'Hovered'or'Inactive',ba)end elseif b.Name=='IBspell'then local bc=(ao==
'Spell Power')if bc then a9(b,bb and'ActiveHovered'or'Active',ba)else a9(b,bb
and'Hovered'or'Inactive',ba)end elseif b.Name=='IBhealth'then local bc=(ao==
'Health')if bc then a9(b,bb and'ActiveHovered'or'Active',ba)else a9(b,bb and
'Hovered'or'Inactive',ba)end elseif b.Name=='IBability'then local bc=(ak==true)
if bc then a9(b,bb and'ActiveHovered'or'Active',ba)else a9(b,bb and'Hovered'or
'Inactive',ba)end end end local ba,bb=function(ba)for bb,bc in ipairs(aQ)do b(bc
,ba)end end,false local bc=function()if bb then return end bb=true local bc,bd=
ah.GetSortCriteria(),ah.GetSortDirection()for be,bf in ipairs(aW)do pcall(bf,bc)
end for be,bf in ipairs(aX)do pcall(bf,bd)end bb=false end local bd=function(bd)
if aN[bd]then return end aN[bd]=true table.insert(aQ,bd)if bd:IsA'ImageButton'or
bd:IsA'TextButton'then bd.AutoButtonColor=false end if not bd:
FindFirstChildOfClass'UICorner'then local be=Instance.new'UICorner'be.
CornerRadius=UDim.new(0,6)be.Parent=bd end if not bd:FindFirstChildOfClass
'UIStroke'then local be=Instance.new'UIStroke'be.Thickness=1.2 be.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border be.Transparency=aI.Inactive.
StrokeTransparency be.Color=aI.Inactive.StrokeColor3 be.Parent=bd end if not bd:
FindFirstChildOfClass'UIPadding'then local be=Instance.new'UIPadding'be.
PaddingTop=UDim.new(0,7)be.PaddingBottom=UDim.new(0,7)be.PaddingLeft=UDim.new(0,
7)be.PaddingRight=UDim.new(0,7)be.Parent=bd end for be,bf in ipairs(bd:
GetChildren())do if bf:IsA'ImageLabel'then bf.AnchorPoint=Vector2.new(0.5,0.5)bf
.Position=UDim2.new(0.5,0,0.5,0)bf.Size=UDim2.new(1,0,1,0)bf.ScaleType=Enum.
ScaleType.Fit elseif bf:IsA'UIListLayout'then bf:Destroy()end end aM[bd]=false
local be=bd.MouseEnter:Connect(function()aM[bd]=true b(bd,true)end)table.insert(
aK,be)local bf=bd.MouseLeave:Connect(function()aM[bd]=false b(bd,true)end)table.
insert(aK,bf)if bd:IsA'GuiButton'then local bg=bd.Activated:Connect(function()if
bd.Name=='IBmainFilter'then if ai=='None'then ai='Descending'ac.Notify(
'Main Filter','Descending (Power High -> Low)',1.5)elseif ai=='Descending'then
ai='Ascending'ac.Notify('Main Filter','Ascending (Power Low -> High)',1.5)else
ai='None'ac.Notify('Main Filter','Deselected (Restore Default Inventory)',1.5)
end ba(true)bc()if al then ah.RequestSort(0.05)end ax()elseif bd.Name==
'IBrarity'then aj=not aj if aj then ao=nil ak=false if ai=='None'then ai=
'Descending'end ac.Notify('Filter','Mode: Rarity',1.5)else ac.Notify('Filter',
'Rarity Filter Disabled',1.5)end ba(true)bc()if al then ah.RequestSort(0.05)end
ax()elseif bd.Name=='IBphysic'or bd.Name=='IBspell'or bd.Name=='IBhealth'then
local bg=(bd.Name=='IBphysic'and'Physical Damage')or(bd.Name=='IBspell'and
'Spell Power')or'Health'if ao==bg then ao=nil ac.Notify('Filter','Deselected '..
bg,1.5)else ao=bg aj=false ak=false if ai=='None'then ai='Descending'end ac.
Notify('Filter','Selected Stat: '..bg,1.5)end ba(true)bc()if al then ah.
RequestSort(0.05)end ax()elseif bd.Name=='IBability'then ak=not ak if ak then aj
=false ao=nil if ai=='None'then ai='Descending'end ac.Notify('Filter',
'Sort: Ability',1.5)else ac.Notify('Filter','Deselected Ability',1.5)end ba(true
)bc()if al then ah.RequestSort(0.05)end ax()end end)table.insert(aK,bg)end b(bd,
false)end function hookSortBar(be)if aO[be]then return end aO[be]=true pcall(
function()be.BackgroundColor3=Color3.fromRGB(18,20,26)be.BackgroundTransparency=
0.15 be.BorderSizePixel=0 if not be:FindFirstChildOfClass'UICorner'then local bf
=Instance.new'UICorner'bf.CornerRadius=UDim.new(0,8)bf.Parent=be end local bf=be
:FindFirstChild'DockStroke'or be:FindFirstChildOfClass'UIStroke'if not bf then
bf=Instance.new'UIStroke'bf.Name='DockStroke'bf.Thickness=1.2 bf.Color=Color3.
fromRGB(65,72,90)bf.Transparency=0.3 bf.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border bf.Parent=be end if not be:FindFirstChildOfClass'UIPadding'then local bg=
Instance.new'UIPadding'bg.PaddingTop=UDim.new(0,5)bg.PaddingBottom=UDim.new(0,5)
bg.PaddingLeft=UDim.new(0,5)bg.PaddingRight=UDim.new(0,5)bg.Parent=be end end)
local bf=be:FindFirstChildOfClass'UIListLayout'if bf then bf.Padding=UDim.new(0,
6)end local bg={IBmainFilter=true,IBrarity=true,IBphysic=true,IBspell=true,
IBhealth=true,IBability=true}for bh,bi in ipairs(be:GetChildren())do if bi:IsA
'GuiObject'and bg[bi.Name]then bd(bi)end end local bh=be.ChildAdded:Connect(
function(bh)if bh:IsA'GuiObject'and bg[bh.Name]then bd(bh)end end)table.insert(
aK,bh)local bi=be.Parent if bi and bi:IsA'GuiObject'then local bj=bi:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()ay(be)end)table.insert(
aK,bj)local bk=bi:GetPropertyChangedSignal'AbsolutePosition':Connect(function()
ay(be)end)table.insert(aK,bk)end local bj=workspace.CurrentCamera if bj then
local bk=bj:GetPropertyChangedSignal'ViewportSize':Connect(function()ay(be)end)
table.insert(aK,bk)end ay(be)ba(false)end function ensureSortBar()local be=ab.
player or ab.Players.LocalPlayer if not be then return nil end local bf=be:
FindFirstChild'PlayerGui'if not bf then return nil end local bg=bf:
FindFirstChild'inventory'if not bg then return nil end local bh=bg:
FindFirstChild'mainBackground'if not bh then return nil end local bi=bh:
FindFirstChild'innerBackground'if not bi then return nil end if bi:IsA
'GuiObject'then bi.ClipsDescendants=false end if bh:IsA'GuiObject'then bh.
ClipsDescendants=false end local bj=(bi:FindFirstChild'sortBarFrame')if not bj
and typeof(ad)=='function'then local bk,bl=pcall(ad,bi)if bk and bl then bj=bl
injectedSortBar=bl end end if bj and typeof(hookSortBar)=='function'and not aO[
bj]then hookSortBar(bj)end return bj end function ah.GetScale()return am end
function ah.GetMainFilterMode()return ai end function ah.SetMainFilterMode(be)if
ai==be then return end ai=be ba(true)bc()if al then ah.RequestSort(0.05)end ax()
end function ah.IsRarityEnabled()return aj end function ah.SetRarityEnabled(be)
local bf=be and true or false if aj==bf then return end aj=bf if aj then ao=nil
ak=false if ai=='None'then ai='Descending'end end ba(true)bc()if al then ah.
RequestSort(0.05)end ax()end function ah.GetStatFilter()return ao end function
ah.SetStatFilter(be)if ao==be then return end ao=be if ao then aj=false ak=false
if ai=='None'then ai='Descending'end end ba(true)bc()if al then ah.RequestSort(
0.05)end ax()end function ah.IsAbilityEnabled()return ak end function ah.
SetAbilityEnabled(be)local bf=be and true or false if ak==bf then return end ak=
bf if ak then aj=false ao=nil if ai=='None'then ai='Descending'end end ba(true)
bc()if al then ah.RequestSort(0.05)end ax()end function ah.SetSortCriteria(be)if
not be or type(be)~='string'then return end local bf=ah.GetSortCriteria()if be==
'None'then if ai=='None'and not aj and not ao and not ak then return end ai=
'None'aj=false ao=nil ak=false elseif be=='Rarity'then if aj and not ak and ao==
nil then return end aj=true ao=nil ak=false if ai=='None'then ai='Descending'end
elseif be=='Ability'then if ak then return end ak=true aj=false ao=nil if ai==
'None'then ai='Descending'end elseif be=='Physical Damage'or be=='Spell Power'or
be=='Health'then if ao==be and not ak and not aj then return end ao=be aj=false
ak=false if ai=='None'then ai='Descending'end elseif be=='Power'then if ai~=
'None'and not aj and ao==nil and not ak then return end if ai=='None'then ai=
'Descending'end aj=false ao=nil ak=false else return end if ah.GetSortCriteria()
==bf then return end ba(true)bc()if al then ah.RequestSort(0.05)end ax()end
function ah.GetSortCriteria()if ak then return'Ability'end if aj then return
'Rarity'end if ao then return ao end if ai~='None'then return'Power'end return
'None'end function ah.SetSortDirection(be)if not be or type(be)~='string'then
return end local bf='None'if be=='Ascending'or string.find(be,'Ascending')then
bf='Ascending'elseif be=='Descending'or string.find(be,'Descending')then bf=
'Descending'else bf='None'end if ai==bf then return end ai=bf ba(true)bc()if al
then ah.RequestSort(0.05)end ax()end function ah.GetSortDirection()if ai==
'Ascending'then return'Ascending'elseif ai=='Descending'then return'Descending'
else return'None'end end function ah.OnCriteriaChanged(be)if type(be)==
'function'then table.insert(aW,be)end end function ah.OnDirectionChanged(be)if
type(be)=='function'then table.insert(aX,be)end end function ah.SetAutoSort(be)
local bf=be and true or false if al==bf then return end al=bf ax()end function
ah.IsAutoSort()return al end function ah.Init()for be,bf in ipairs(aK)do pcall(
function()bf:Disconnect()end)end table.clear(aK)table.clear(aN)table.clear(aO)
table.clear(aQ)table.clear(aM)av()bc()local be=ab.ReplicatedStorage or game:
GetService'ReplicatedStorage'local bf=be and be:FindFirstChild'remotes'if bf
then local bg=bf:FindFirstChild'reloadInventory'if bg and bg:IsA'RemoteEvent'
then local bh=bg.OnClientEvent:Connect(function()local bh=os.clock()if(bh-az)>=
aB then cachedInventoryData=nil end ah.RequestSort(0.35)end)table.insert(aK,bh)
end end local bg=function()local bg=ab.player or ab.Players.LocalPlayer if not
bg then return end local bh=bg:WaitForChild('PlayerGui',15)if not bh then return
end local bi=bh:WaitForChild('inventory',15)if not bi then return end local bj=
bi:WaitForChild('mainBackground',15)if not bj then return end local bk=bj:
WaitForChild('innerBackground',15)if not bk then return end ensureSortBar()if bj
.Visible and al and(ai~='None'or ak)then ah.RequestSort(0.2)end local bl=bj:
GetPropertyChangedSignal'Visible':Connect(function()if bj.Visible then local bl=
ensureSortBar()if bl then ay(bl)end ah.RequestSort(0.15)end end)table.insert(aK,
bl)local bm=bk.ChildAdded:Connect(function(bm)if bm.Name=='sortBarFrame'and bm:
IsA'GuiObject'then hookSortBar(bm)end end)table.insert(aK,bm)local bn=bk:
WaitForChild('rightSideFrame',10)local bo=bn and bn:WaitForChild(
'ScrollingFrame',10)if bo then local bp=bo.ChildAdded:Connect(function(bp)if bp:
IsA'GuiObject'and al and(ai~='None'or ak)then ah.RequestSort(0.3)end end)table.
insert(aK,bp)end end task.spawn(bg)local bh=ab.player or ab.Players.LocalPlayer
if bh then local bi=bh.CharacterAdded:Connect(function()task.delay(1,bg)end)
table.insert(aK,bi)end end aa.Register(function()if a8 then task.cancel(a8)a8=
nil end if ap then task.cancel(ap)ap=nil pcall(function()ar()local be,bf=aq(),{
mainFilterMode=ai,rarityEnabled=aj,selectedStatFilter=ao,abilityEnabled=ak,
autoSortEnabled=al}writefile(be,ag:JSONEncode(bf))end)end for be,bf in ipairs(aK
)do pcall(function()bf:Disconnect()end)end table.clear(aK)table.clear(aN)table.
clear(aO)table.clear(aQ)table.clear(aM)table.clear(aW)table.clear(aX)
cachedInventoryData=nil ai='None'aj=false ao=nil ak=false if injectedSortBar and
injectedSortBar.Parent then pcall(function()injectedSortBar:Destroy()end)
injectedSortBar=nil end end)ah.Init()return ah end function a.aD()return
function(aa)pcall(function()local ab=setthreadidentity or set_thread_identity or
setidentity or(syn and syn.set_thread_identity)if ab then local ac=pcall(ab,7)if
not ac then pcall(ab,8)end end end)local ab,ac=game:GetService'Players',os.
clock()+15 while not ab.LocalPlayer do if os.clock()>ac then break end task.
wait(0.1)end local ad=ab.LocalPlayer if not ad then return warn
[[[DungeonQuest] Failed to retrieve LocalPlayer, aborting script initialization.]]
end local ae,af,ag,ah=a.load'a',a.load'b',a.load'd',a.load'g'ag.Suspend()local
ai,aj=ae:Window{Title='DungeonQuest',Subtitle='EsclipseHub',Size=UDim2.
fromOffset(1000,600),SidebarWidth=300,DragStyle=1,DisabledWindowControls={},
ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,AcrylicBlur=true},a.load'c'
aj:SetWindow(ai)_G.ScriptHub_UI=ai _G.ScriptHub_Cleanup=function()af.Cleanup()
end ai.onUnloaded(function()af.Cleanup()if _G.ScriptHub_UI==ai then _G.
ScriptHub_UI=nil end end)local ak=ai:TabGroup()local al={Combat=ak:Tab{Name=
'Combat',Image='rbxassetid://10734975692'},Dungeon=ak:Tab{Name='Dungeon Joiner',
Image='rbxassetid://10734886202'},Inventory=ak:Tab{Name='Inventory',Image=
'rbxassetid://10709769841'},Utilities=ak:Tab{Name='Utilities',Image=
'rbxassetid://10747383470'},Configs=ak:Tab{Name='Configs',Image=
'rbxassetid://10734950309'},PathRecord=ak:Tab{Name='Path Record',Image=
'rbxassetid://10734950309'}}ae:SetFolder'EsclipseHub'local am,an,ao,ap,aq,ar=a.
load'X',a.load'ab',a.load'ad',a.load'ao',a.load'as',a.load'az'am(ai,al.Combat)
an(ai,al.Dungeon)ao(ai,al.Inventory)ap(ai,al.Utilities)aq(ai,al.Configs)ar(ai,al
.PathRecord)local av=a.load'Q'av.Init()local ax=a.load'ai'ax.Init()a.load'af'a.
load'aA'a.load'aC'local ay=a.load'ap'ay.SetWindow(ai)ay.Execute()local az=a.load
'am'az.SetWindow(ai)az.Init()al.Combat:Select()local aA=a.load'h'aA.SetLocked(
true)if ae.Elevate then ae.Elevate()end local aB,aC=pcall(function()ae:
LoadAutoLoadConfig()end)if not aB then warn(
'[DungeonQuest] Error during LoadAutoLoadConfig:',aC)end local aF=function()
local aF=ae.Folder..'/settings/autoload.txt'if isfile and isfile(aF)then local
aG,aH=pcall(readfile,aF)if aG and type(aH)=='string'then aH=string.gsub(aH,
'[\r\n%s]+','')if#aH>0 then ag.SetActive(aH)return end end end if not ag.
GetActive()then local aG=ae.Folder..'/settings/Default.json'if isfile and
isfile(aG)then ag.SetActive'Default'end end end aF()local aG=a.load'q'aG.
LoadData(ae.contextData)task.delay(0.3,function()aA.SetLocked(false)end)task.
delay(1.5,function()ag.Resume()end)end end function a.aE()local aa={}function aa
:Export()local ab={}for ac,ad in pairs(self)do if typeof(ad)=='Instance'or type(
ad)=='table'then local ae,af=pcall(function()end)if ae and af~=nil then ab[ac]=
af end end end return ab end function aa:Import(ab)for ac,ad in pairs(ab)do
local ae=self[ac]if ae and ae.Value~=nil then local af=pcall(function()end)if
not af then warn(`Failed to import value for flag "{ac}"`)end end end end
function aa:Reset()for ab in pairs(self)do self[ab]=nil end end return aa end
function a.aF()local aa,ab=a.load'ak',{}function ab:Window(ac)ac=ac or{}print
'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.aG()local aa,ab=a.load'ak',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.aH()local aa,ab,
ac=a.load'aE',a.load'aF',a.load'aG'local ad=ab:Window{Visible=true}return{Flags=
aa,Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)
end,Settings=function(ae)end,Config=function(ae)end}}end function a.aI()local aa
={}function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.aJ()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.aK()return function(aa)local ab,ac,
ad=a.load'aH',a.load'aI',a.load'aJ'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab
.Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do
local al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end
do local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah
.Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'aD',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name='Game 2',Load=a.
load'aK',Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and
game.PlaceId~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.
Places then for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:
Load()end end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae
:Load()end end