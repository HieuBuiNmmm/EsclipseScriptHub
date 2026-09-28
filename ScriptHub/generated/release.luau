local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={Options={},OptionOrder={},
Folder='Maclib',contextData={},GetService=function(b)return cloneref and
cloneref(game:GetService(b))or game:GetService(b)end}local c,d,e,f,g,h,i,j=
function(c,d)if not c then return end b.Options[c]=d if not table.find(b.
OptionOrder,c)then table.insert(b.OptionOrder,c)end end,b.GetService
'TweenService',b.GetService'RunService',b.GetService'HttpService',b.GetService
'ContentProvider',b.GetService'UserInputService',b.GetService'Lighting',b.
GetService'Players'local k,l,m,n,o,p,q,r,s,t,u=e:IsStudio(),j.LocalPlayer,{},0,
false,{interFont='rbxassetid://12187365364',userInfoBlurred=
'rbxassetid://18824089198',toggleBackground='rbxassetid://18772190202',
togglerHead='rbxassetid://18772309008',buttonImage='rbxassetid://10709791437',
searchIcon='rbxassetid://86737463322606',colorWheel='rbxassetid://2849458409',
colorTarget='rbxassetid://73265255323268',grid='rbxassetid://121484455191370',
globe='rbxassetid://108952102602834',transform='rbxassetid://90336395745819',
dropdown='rbxassetid://18865373378',sliderbar='rbxassetid://18772615246',
sliderhead='rbxassetid://18772834246'},function()pcall(function()local k=
setthreadidentity or set_thread_identity or setidentity or(syn and syn.
set_thread_identity)if k then local l=pcall(k,7)if not l then pcall(k,8)end end
end)end b.Elevate=q local v,w=function()q()local v=Instance.new'ScreenGui'v.
ScreenInsets=Enum.ScreenInsets.None v.ResetOnSpawn=false v.ZIndexBehavior=Enum.
ZIndexBehavior.Sibling v.DisplayOrder=2147483647 local w=e:IsStudio()and l:
FindFirstChild'PlayerGui'or(gethui and gethui())or(cloneref and cloneref(b.
GetService'CoreGui')or b.GetService'CoreGui')v.Parent=w return v end,function(v,
w,x)q()local y,z=pcall(d.Create,d,v,w,x)if y and z then return z end if x and
typeof(v)=='Instance'then for A,B in pairs(x)do pcall(function()v[A]=B end)end
end return{Play=function()end,Cancel=function()end,Pause=function()end,Completed
={Wait=function()end}}end function b:Window(x)local y={Settings=x}if x.
AcrylicBlur~=nil then s=x.AcrylicBlur else s=true end local z,A=v(),Instance.new
'Frame'A.Name='Notifications'A.BackgroundColor3=Color3.fromRGB(255,255,255)A.
BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)A.BorderSizePixel=0
A.Size=UDim2.fromScale(1,1)A.Parent=z A.ZIndex=2 local B=Instance.new
'UIListLayout'B.Name='NotificationsUIListLayout'B.Padding=UDim.new(0,10)B.
HorizontalAlignment=Enum.HorizontalAlignment.Right B.SortOrder=Enum.SortOrder.
LayoutOrder B.VerticalAlignment=Enum.VerticalAlignment.Bottom B.Parent=A local C
=Instance.new'UIPadding'C.Name='NotificationsUIPadding'C.PaddingBottom=UDim.new(
0,10)C.PaddingLeft=UDim.new(0,10)C.PaddingRight=UDim.new(0,10)C.PaddingTop=UDim.
new(0,10)C.Parent=A local D=Instance.new'Frame'D.Name='Base'D.AnchorPoint=
Vector2.new(0.5,0.5)D.BackgroundColor3=Color3.fromRGB(15,15,15)D.
BackgroundTransparency=x.AcrylicBlur and 0.05 or 0 D.BorderColor3=Color3.
fromRGB(0,0,0)D.BorderSizePixel=0 D.Position=UDim2.fromScale(0.5,0.5)D.Size=x.
Size or UDim2.fromOffset(868,650)local E=Instance.new'UIScale'E.Name=
'BaseUIScale'E.Parent=D local F=Instance.new'UICorner'F.Name='BaseUICorner'F.
CornerRadius=UDim.new(0,10)F.Parent=D local G=Instance.new'UIStroke'G.Name=
'BaseUIStroke'G.ApplyStrokeMode=Enum.ApplyStrokeMode.Border G.Color=Color3.
fromRGB(255,255,255)G.Transparency=0.9 G.Parent=D local H=Instance.new'Frame'H.
Name='Sidebar'H.BackgroundColor3=Color3.fromRGB(255,255,255)H.
BackgroundTransparency=1 H.BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel=0
H.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-8)H.Size=x.SidebarWidth
and UDim2.new(0,x.SidebarWidth,1,0)or UDim2.fromScale(0.325,1)local I=Instance.
new'Frame'I.Name='Divider'I.AnchorPoint=Vector2.new(1,0)I.BackgroundColor3=
Color3.fromRGB(255,255,255)I.BackgroundTransparency=0.9 I.BorderColor3=Color3.
fromRGB(0,0,0)I.BorderSizePixel=0 I.Position=UDim2.fromScale(1,0)I.Size=UDim2.
new(0,1,1,0)I.Parent=H local J=Instance.new'TextButton'J.Name='DividerInteract'J
.AnchorPoint=Vector2.new(0.5,0)J.BackgroundColor3=Color3.fromRGB(255,255,255)J.
BackgroundTransparency=1 J.BorderColor3=Color3.fromRGB(0,0,0)J.BorderSizePixel=0
J.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'J.Position=
UDim2.fromScale(0.5,0)J.Size=UDim2.new(1,6,1,0)J.Text=''J.TextColor3=Color3.
fromRGB(0,0,0)J.TextSize=14 J.Parent=I local K=Instance.new'Frame'K.Name=
'WindowControls'K.BackgroundColor3=Color3.fromRGB(255,255,255)K.
BackgroundTransparency=1 K.BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0
K.Size=UDim2.new(1,0,0,31)local L=Instance.new'Frame'L.Name='Controls'L.
BackgroundColor3=Color3.fromRGB(119,174,94)L.BackgroundTransparency=1 L.
BorderColor3=Color3.fromRGB(0,0,0)L.BorderSizePixel=0 L.Size=UDim2.fromScale(1,1
)local M=Instance.new'UIListLayout'M.Name='UIListLayout'M.Padding=UDim.new(0,5)M
.FillDirection=Enum.FillDirection.Horizontal M.SortOrder=Enum.SortOrder.
LayoutOrder M.VerticalAlignment=Enum.VerticalAlignment.Center M.Parent=L local N
=Instance.new'UIPadding'N.Name='UIPadding'N.PaddingLeft=UDim.new(0,11)N.Parent=L
local O,P={sizes={enabled=UDim2.fromOffset(8,8),disabled=UDim2.fromOffset(7,7)},
transparencies={enabled=0,disabled=1},strokeTransparency=0.9},Instance.new
'UIStroke'P.Name='BaseUIStroke'P.ApplyStrokeMode=Enum.ApplyStrokeMode.Border P.
Color=Color3.fromRGB(255,255,255)P.Transparency=O.strokeTransparency local Q=
Instance.new'TextButton'Q.Name='Exit'Q.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'Q.Text=''Q.TextColor3=Color3.
fromRGB(0,0,0)Q.TextSize=14 Q.AutoButtonColor=false Q.BackgroundColor3=Color3.
fromRGB(250,93,86)Q.BorderColor3=Color3.fromRGB(0,0,0)Q.BorderSizePixel=0 local
R=Instance.new'UICorner'R.Name='UICorner'R.CornerRadius=UDim.new(1,0)R.Parent=Q
Q.Parent=L local S=Instance.new'TextButton'S.Name='Minimize'S.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'S.Text=''S.TextColor3=Color3.
fromRGB(0,0,0)S.TextSize=14 S.AutoButtonColor=false S.BackgroundColor3=Color3.
fromRGB(252,190,57)S.BorderColor3=Color3.fromRGB(0,0,0)S.BorderSizePixel=0 S.
LayoutOrder=1 local T=Instance.new'UICorner'T.Name='UICorner'T.CornerRadius=UDim
.new(1,0)T.Parent=S S.Parent=L local U=Instance.new'TextButton'U.Name='Maximize'
U.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'U.Text=''U.
TextColor3=Color3.fromRGB(0,0,0)U.TextSize=14 U.AutoButtonColor=false U.
BackgroundColor3=Color3.fromRGB(119,174,94)U.BorderColor3=Color3.fromRGB(0,0,0)U
.BorderSizePixel=0 U.LayoutOrder=1 local V=Instance.new'UICorner'V.Name=
'UICorner'V.CornerRadius=UDim.new(1,0)V.Parent=U U.Parent=L local aa=function(W,
X)local Y,Z=X and O.sizes.enabled or O.sizes.disabled,X and O.transparencies.
enabled or O.transparencies.disabled W.Size=Y W.BackgroundTransparency=Z W.
Active=X W.Interactable=X for _,aa in ipairs(W:GetChildren())do if aa:IsA
'UIStroke'then aa.Transparency=Z end end if not X then P:Clone().Parent=W end
end aa(U,false)local W={Q,S}for X,Y in pairs(W)do local Z,_=Y.Name,true if x.
DisabledWindowControls and table.find(x.DisabledWindowControls,Z)then _=false
end aa(Y,_)end L.Parent=K local X=Instance.new'Frame'X.Name='Divider'X.
AnchorPoint=Vector2.new(0,1)X.BackgroundColor3=Color3.fromRGB(255,255,255)X.
BackgroundTransparency=0.9 X.BorderColor3=Color3.fromRGB(0,0,0)X.BorderSizePixel
=0 X.Position=UDim2.fromScale(0,1)X.Size=UDim2.new(1,0,0,1)X.Parent=K K.Parent=H
local Y=Instance.new'Frame'Y.Name='Information'Y.BackgroundColor3=Color3.
fromRGB(255,255,255)Y.BackgroundTransparency=1 Y.BorderColor3=Color3.fromRGB(0,0
,0)Y.BorderSizePixel=0 Y.Position=UDim2.fromOffset(0,31)Y.Size=UDim2.new(1,0,0,
60)local Z=Instance.new'Frame'Z.Name='Divider'Z.AnchorPoint=Vector2.new(0,1)Z.
BackgroundColor3=Color3.fromRGB(255,255,255)Z.BackgroundTransparency=0.9 Z.
BorderColor3=Color3.fromRGB(0,0,0)Z.BorderSizePixel=0 Z.Position=UDim2.
fromScale(0,1)Z.Size=UDim2.new(1,0,0,1)Z.Parent=Y local _=Instance.new'Frame'_.
Name='InformationHolder'_.BackgroundColor3=Color3.fromRGB(255,255,255)_.
BackgroundTransparency=1 _.BorderColor3=Color3.fromRGB(0,0,0)_.BorderSizePixel=0
_.Size=UDim2.fromScale(1,1)local ab=Instance.new'UIPadding'ab.Name=
'InformationHolderUIPadding'ab.PaddingBottom=UDim.new(0,10)ab.PaddingLeft=UDim.
new(0,23)ab.PaddingRight=UDim.new(0,22)ab.PaddingTop=UDim.new(0,10)ab.Parent=_
local ac=Instance.new'ImageButton'ac.Name='GlobalSettingsButton'ac.Image=p.globe
ac.ImageTransparency=0.5 ac.AnchorPoint=Vector2.new(1,0.5)ac.BackgroundColor3=
Color3.fromRGB(255,255,255)ac.BackgroundTransparency=1 ac.BorderColor3=Color3.
fromRGB(0,0,0)ac.BorderSizePixel=0 ac.Position=UDim2.fromScale(1,0.5)ac.Size=
UDim2.fromOffset(16,16)ac.Parent=_ local ad=function(ad)if ad=='Default'then w(
ac,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{ImageTransparency=0.5}):Play()
elseif ad=='Hover'then w(ac,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.3}):Play()end end ac.MouseEnter:Connect(function()ad'Hover'
end)ac.MouseLeave:Connect(function()ad'Default'end)local ae=Instance.new'Frame'
ae.Name='TitleFrame'ae.BackgroundColor3=Color3.fromRGB(255,255,255)ae.
BackgroundTransparency=1 ae.BorderColor3=Color3.fromRGB(0,0,0)ae.BorderSizePixel
=0 ae.Size=UDim2.fromScale(1,1)local af=Instance.new'TextLabel'af.Name='Title'af
.FontFace=Font.new(p.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)af
.Text=x.Title af.TextColor3=Color3.fromRGB(255,255,255)af.RichText=true af.
TextSize=18 af.TextTransparency=0.1 af.TextTruncate=Enum.TextTruncate.SplitWord
af.TextXAlignment=Enum.TextXAlignment.Left af.TextYAlignment=Enum.TextYAlignment
.Top af.AutomaticSize=Enum.AutomaticSize.Y af.BackgroundColor3=Color3.fromRGB(
255,255,255)af.BackgroundTransparency=1 af.BorderColor3=Color3.fromRGB(0,0,0)af.
BorderSizePixel=0 af.Size=UDim2.new(1,-20,0,0)af.Parent=ae local ag=Instance.new
'TextLabel'ag.Name='Subtitle'ag.FontFace=Font.new(p.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)ag.RichText=true ag.Text=x.Subtitle ag.RichText=
true ag.TextColor3=Color3.fromRGB(255,255,255)ag.TextSize=12 ag.TextTransparency
=0.7 ag.TextTruncate=Enum.TextTruncate.SplitWord ag.TextXAlignment=Enum.
TextXAlignment.Left ag.TextYAlignment=Enum.TextYAlignment.Top ag.AutomaticSize=
Enum.AutomaticSize.Y ag.BackgroundColor3=Color3.fromRGB(255,255,255)ag.
BackgroundTransparency=1 ag.BorderColor3=Color3.fromRGB(0,0,0)ag.BorderSizePixel
=0 ag.LayoutOrder=1 ag.Size=UDim2.new(1,-20,0,0)ag.Parent=ae local ah=Instance.
new'UIListLayout'ah.Name='TitleFrameUIListLayout'ah.Padding=UDim.new(0,3)ah.
SortOrder=Enum.SortOrder.LayoutOrder ah.VerticalAlignment=Enum.VerticalAlignment
.Center ah.Parent=ae ae.Parent=_ _.Parent=Y Y.Parent=H local ai=Instance.new
'Frame'ai.Name='SidebarGroup'ai.BackgroundColor3=Color3.fromRGB(255,255,255)ai.
BackgroundTransparency=1 ai.BorderColor3=Color3.fromRGB(0,0,0)ai.BorderSizePixel
=0 ai.Position=UDim2.fromOffset(0,91)ai.Size=UDim2.new(1,0,1,-91)local aj=
Instance.new'Frame'aj.Name='UserInfo'aj.AnchorPoint=Vector2.new(0,1)aj.
BackgroundColor3=Color3.fromRGB(255,255,255)aj.BackgroundTransparency=1 aj.
BorderColor3=Color3.fromRGB(0,0,0)aj.BorderSizePixel=0 aj.Position=UDim2.
fromScale(0,1)aj.Size=UDim2.new(1,0,0,107)local ak=Instance.new'Frame'ak.Name=
'InformationGroup'ak.BackgroundColor3=Color3.fromRGB(255,255,255)ak.
BackgroundTransparency=1 ak.BorderColor3=Color3.fromRGB(0,0,0)ak.BorderSizePixel
=0 ak.Size=UDim2.fromScale(1,1)local al=Instance.new'UIPadding'al.Name=
'InformationGroupUIPadding'al.PaddingBottom=UDim.new(0,17)al.PaddingLeft=UDim.
new(0,25)al.Parent=ak local am=Instance.new'UIListLayout'am.Name=
'InformationGroupUIListLayout'am.FillDirection=Enum.FillDirection.Horizontal am.
SortOrder=Enum.SortOrder.LayoutOrder am.VerticalAlignment=Enum.VerticalAlignment
.Center am.Parent=ak local an,ao,ap=l.UserId,Enum.ThumbnailType.AvatarBust,Enum.
ThumbnailSize.Size48x48 local aq,ar=j:GetUserThumbnailAsync(an,ao,ap)local as=
Instance.new'ImageLabel'as.Name='Headshot'as.BackgroundColor3=Color3.fromRGB(255
,255,255)as.BackgroundTransparency=1 as.BorderColor3=Color3.fromRGB(0,0,0)as.
BorderSizePixel=0 as.Size=UDim2.fromOffset(32,32)as.Image=(ar and aq)or
'rbxassetid://0'local at=Instance.new'UICorner'at.Name='UICorner'at.CornerRadius
=UDim.new(1,0)at.Parent=as local au=Instance.new'UIStroke'au.Name='BaseUIStroke'
au.ApplyStrokeMode=Enum.ApplyStrokeMode.Border au.Color=Color3.fromRGB(255,255,
255)au.Transparency=0.9 au.Parent=as as.Parent=ak local av=Instance.new'Frame'av
.Name='UserAndDisplayFrame'av.BackgroundColor3=Color3.fromRGB(255,255,255)av.
BackgroundTransparency=1 av.BorderColor3=Color3.fromRGB(0,0,0)av.BorderSizePixel
=0 av.LayoutOrder=1 av.Size=UDim2.new(1,-42,0,32)local aw=Instance.new
'TextLabel'aw.Name='DisplayName'aw.FontFace=Font.new(p.interFont,Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)aw.Text=l.DisplayName aw.TextColor3=Color3.
fromRGB(255,255,255)aw.TextSize=13 aw.TextTransparency=0.1 aw.TextTruncate=Enum.
TextTruncate.SplitWord aw.TextXAlignment=Enum.TextXAlignment.Left aw.
TextYAlignment=Enum.TextYAlignment.Top aw.AutomaticSize=Enum.AutomaticSize.XY aw
.BackgroundColor3=Color3.fromRGB(255,255,255)aw.BackgroundTransparency=1 aw.
BorderColor3=Color3.fromRGB(0,0,0)aw.BorderSizePixel=0 aw.Parent=av aw.Size=
UDim2.fromScale(1,0)local ax=Instance.new'UIPadding'ax.Name=
'UserAndDisplayFrameUIPadding'ax.PaddingLeft=UDim.new(0,8)ax.PaddingTop=UDim.
new(0,3)ax.Parent=av local ay=Instance.new'UIListLayout'ay.Name=
'UserAndDisplayFrameUIListLayout'ay.Padding=UDim.new(0,1)ay.SortOrder=Enum.
SortOrder.LayoutOrder ay.Parent=av local az=Instance.new'TextLabel'az.Name=
'Username'az.FontFace=Font.new(p.interFont,Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal)az.Text='@'..l.Name az.TextColor3=Color3.fromRGB(255,255,255)az
.TextSize=12 az.TextTransparency=0.7 az.TextTruncate=Enum.TextTruncate.SplitWord
az.TextXAlignment=Enum.TextXAlignment.Left az.TextYAlignment=Enum.TextYAlignment
.Top az.AutomaticSize=Enum.AutomaticSize.XY az.BackgroundColor3=Color3.fromRGB(
255,255,255)az.BackgroundTransparency=1 az.BorderColor3=Color3.fromRGB(0,0,0)az.
BorderSizePixel=0 az.LayoutOrder=1 az.Parent=av az.Size=UDim2.fromScale(1,0)av.
Parent=ak ak.Parent=aj local aA=Instance.new'UIPadding'aA.Name=
'UserInfoUIPadding'aA.PaddingLeft=UDim.new(0,10)aA.PaddingRight=UDim.new(0,10)aA
.Parent=aj aj.Parent=ai local aB=Instance.new'UIPadding'aB.Name=
'SidebarGroupUIPadding'aB.PaddingLeft=UDim.new(0,10)aB.PaddingRight=UDim.new(0,
10)aB.PaddingTop=UDim.new(0,31)aB.Parent=ai local aC=Instance.new'Frame'aC.Name=
'TabSwitchers'aC.BackgroundColor3=Color3.fromRGB(255,255,255)aC.
BackgroundTransparency=1 aC.BorderColor3=Color3.fromRGB(0,0,0)aC.BorderSizePixel
=0 aC.Size=UDim2.new(1,0,1,-107)local aD=Instance.new'ScrollingFrame'aD.Name=
'TabSwitchersScrollingFrame'aD.AutomaticCanvasSize=Enum.AutomaticSize.Y aD.
BottomImage=''aD.CanvasSize=UDim2.new()aD.ScrollBarImageTransparency=0.8 aD.
ScrollBarThickness=1 aD.TopImage=''aD.BackgroundColor3=Color3.fromRGB(255,255,
255)aD.BackgroundTransparency=1 aD.BorderColor3=Color3.fromRGB(0,0,0)aD.
BorderSizePixel=0 aD.Size=UDim2.fromScale(1,1)local aE=Instance.new
'UIListLayout'aE.Name='TabSwitchersScrollingFrameUIListLayout'aE.Padding=UDim.
new(0,17)aE.SortOrder=Enum.SortOrder.LayoutOrder aE.Parent=aD local aF=Instance.
new'UIPadding'aF.Name='TabSwitchersScrollingFrameUIPadding'aF.PaddingTop=UDim.
new(0,2)aF.Parent=aD aD.Parent=aC aC.Parent=ai ai.Parent=H H.Parent=D local aG=
Instance.new'Frame'aG.Name='Content'aG.AnchorPoint=Vector2.new(1,0)aG.
BackgroundColor3=Color3.fromRGB(255,255,255)aG.BackgroundTransparency=1 aG.
BorderColor3=Color3.fromRGB(0,0,0)aG.BorderSizePixel=0 aG.Position=UDim2.
fromScale(1,4.69e-8)aG.Size=UDim2.new(0,(D.AbsoluteSize.X-H.AbsoluteSize.X),1,0)
local aH,aI,aJ,aK,aL,aM=false,H.AbsoluteSize.X,20,107 local aN,aO=D.AbsoluteSize
.X-aK,{DefaultTransparency=0.9,HoverTransparency=0.85,EasingStyle=Enum.
EasingStyle.Sine}local aP=function(aP)w(I,TweenInfo.new(0.2,aO.EasingStyle),{
BackgroundTransparency=aP=='Idle'and aO.DefaultTransparency or aO.
HoverTransparency}):Play()end J.MouseEnter:Connect(function()aP'Hover'end)J.
MouseLeave:Connect(function()aP'Idle'end)J.MouseButton1Down:Connect(function()aH
=true aL=h:GetMouseLocation().X aM=H.AbsoluteSize.X end)h.InputEnded:Connect(
function(aQ)if aQ.UserInputType==Enum.UserInputType.MouseButton1 then aH=false
end end)h.InputChanged:Connect(function(aQ)if aH and aQ.UserInputType==Enum.
UserInputType.MouseMovement then local aR=h:GetMouseLocation().X-aL local aS=aM+
aR if math.abs(aS-aI)<aJ then aS=aI else aS=math.clamp(aS,aK,aN)end H.Size=UDim2
.new(0,aS,1,0)aG.Size=UDim2.new(0,D.AbsoluteSize.X-aS,1,0)end end)local aQ=
Instance.new'Frame'aQ.Name='Topbar'aQ.BackgroundColor3=Color3.fromRGB(255,255,
255)aQ.BackgroundTransparency=1 aQ.BorderColor3=Color3.fromRGB(0,0,0)aQ.
BorderSizePixel=0 aQ.Size=UDim2.new(1,0,0,63)local aR=Instance.new'Frame'aR.Name
='Divider'aR.AnchorPoint=Vector2.new(0,1)aR.BackgroundColor3=Color3.fromRGB(255,
255,255)aR.BackgroundTransparency=0.9 aR.BorderColor3=Color3.fromRGB(0,0,0)aR.
BorderSizePixel=0 aR.Position=UDim2.fromScale(0,1)aR.Size=UDim2.new(1,0,0,1)aR.
Parent=aQ local aS=Instance.new'Frame'aS.Name='Elements'aS.BackgroundColor3=
Color3.fromRGB(255,255,255)aS.BackgroundTransparency=1 aS.BorderColor3=Color3.
fromRGB(0,0,0)aS.BorderSizePixel=0 aS.Size=UDim2.fromScale(1,1)local aT=Instance
.new'UIPadding'aT.Name='UIPadding'aT.PaddingLeft=UDim.new(0,20)aT.PaddingRight=
UDim.new(0,20)aT.Parent=aS local aU=Instance.new'ImageButton'aU.Name='MoveIcon'
aU.Image=p.transform aU.ImageTransparency=0.7 aU.AnchorPoint=Vector2.new(1,0.5)
aU.BackgroundColor3=Color3.fromRGB(255,255,255)aU.BackgroundTransparency=1 aU.
BorderColor3=Color3.fromRGB(0,0,0)aU.BorderSizePixel=0 aU.Position=UDim2.
fromScale(1,0.5)aU.Size=UDim2.fromOffset(15,15)aU.Parent=aS aU.Visible=not x.
DragStyle or x.DragStyle==1 local aV=Instance.new'TextButton'aV.Name='Interact'
aV.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'aV.Text=''aV.
TextColor3=Color3.fromRGB(0,0,0)aV.TextSize=14 aV.AnchorPoint=Vector2.new(0.5,
0.5)aV.BackgroundColor3=Color3.fromRGB(255,255,255)aV.BackgroundTransparency=1
aV.BorderColor3=Color3.fromRGB(0,0,0)aV.BorderSizePixel=0 aV.Position=UDim2.
fromScale(0.5,0.5)aV.Size=UDim2.fromOffset(40,40)aV.Parent=aU local aW=function(
aW)if aW=='Default'then w(aU,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7}):Play()elseif aW=='Hover'then w(aU,TweenInfo.new(0.2,Enum
.EasingStyle.Sine),{ImageTransparency=0.4}):Play()end end aV.MouseEnter:Connect(
function()aW'Hover'end)aV.MouseLeave:Connect(function()aW'Default'end)local aX,
aY,aZ,a_=false local a0,a1,a2=function(a0)local a1=a0.Position-aZ D.Position=
UDim2.new(a_.X.Scale,a_.X.Offset+a1.X,a_.Y.Scale,a_.Y.Offset+a1.Y)end,function(
a0)if a0.UserInputType==Enum.UserInputType.MouseButton1 or a0.UserInputType==
Enum.UserInputType.Touch then aX=true aZ=a0.Position a_=D.Position a0.Changed:
Connect(function()if a0.UserInputState==Enum.UserInputState.End then aX=false
end end)end end,function(a0)if aX and(a0.UserInputType==Enum.UserInputType.
MouseMovement or a0.UserInputType==Enum.UserInputType.Touch)then aY=a0 end end
if not x.DragStyle or x.DragStyle==1 then aV.InputBegan:Connect(function(a3)if
a3.UserInputType==Enum.UserInputType.MouseButton1 or a3.UserInputType==Enum.
UserInputType.Touch then a1(a3)end end)aV.InputChanged:Connect(a2)h.InputChanged
:Connect(function(a3)if a3==aY and aX then a0(a3)end end)aV.InputEnded:Connect(
function(a3)if a3.UserInputType==Enum.UserInputType.MouseButton1 or a3.
UserInputType==Enum.UserInputType.Touch then aX=false end end)elseif x.DragStyle
==2 then D.InputBegan:Connect(function(a3)if a3.UserInputType==Enum.
UserInputType.MouseButton1 or a3.UserInputType==Enum.UserInputType.Touch then
a1(a3)end end)D.InputChanged:Connect(a2)h.InputChanged:Connect(function(a3)if a3
==aY and aX then a0(a3)end end)D.InputEnded:Connect(function(a3)if a3.
UserInputType==Enum.UserInputType.MouseButton1 or a3.UserInputType==Enum.
UserInputType.Touch then aX=false end end)end local a3=Instance.new'TextLabel'a3
.Name='CurrentTab'a3.FontFace=Font.new(p.interFont)a3.RichText=true a3.Text=''a3
.RichText=true a3.TextColor3=Color3.fromRGB(255,255,255)a3.TextSize=15 a3.
TextTransparency=0.5 a3.TextTruncate=Enum.TextTruncate.SplitWord a3.
TextXAlignment=Enum.TextXAlignment.Left a3.TextYAlignment=Enum.TextYAlignment.
Top a3.AnchorPoint=Vector2.new(0,0.5)a3.AutomaticSize=Enum.AutomaticSize.Y a3.
BackgroundColor3=Color3.fromRGB(255,255,255)a3.BackgroundTransparency=1 a3.
BorderColor3=Color3.fromRGB(0,0,0)a3.BorderSizePixel=0 a3.Position=UDim2.
fromScale(0,0.5)a3.Size=UDim2.fromScale(0.9,0)a3.Parent=aS aS.Parent=aQ aQ.
Parent=aG aG.Parent=D local a4=Instance.new'Frame'a4.Name='GlobalSettings'a4.
AutomaticSize=Enum.AutomaticSize.XY a4.BackgroundColor3=Color3.fromRGB(15,15,15)
a4.BorderColor3=Color3.fromRGB(0,0,0)a4.BorderSizePixel=0 a4.Position=UDim2.
fromScale(0.298,0.104)local a5=Instance.new'UIStroke'a5.Name=
'GlobalSettingsUIStroke'a5.ApplyStrokeMode=Enum.ApplyStrokeMode.Border a5.Color=
Color3.fromRGB(255,255,255)a5.Transparency=0.9 a5.Parent=a4 local a6=Instance.
new'UICorner'a6.Name='GlobalSettingsUICorner'a6.CornerRadius=UDim.new(0,10)a6.
Parent=a4 local a7=Instance.new'UIPadding'a7.Name='GlobalSettingsUIPadding'a7.
PaddingBottom=UDim.new(0,10)a7.PaddingTop=UDim.new(0,10)a7.Parent=a4 local a8=
Instance.new'UIListLayout'a8.Name='GlobalSettingsUIListLayout'a8.Padding=UDim.
new(0,5)a8.SortOrder=Enum.SortOrder.LayoutOrder a8.Parent=a4 local a9=Instance.
new'UIScale'a9.Name='GlobalSettingsUIScale'a9.Scale=1e-7 a9.Parent=a4 a4.Parent=
D D.Parent=z function y:UpdateTitle(ba)af.Text=ba end function y:UpdateSubtitle(
ba)ag.Text=ba end local ba,bb=a9.Scale==1 and true or false local bc=function()
if not ba then local bc=w(a9,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum
.EasingDirection.Out),{Scale=1})bc:Play()bc.Completed:Wait()ba=true elseif ba
then local bc=w(a9,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})bc:Play()bc.Completed:Wait()ba=false end end ac.
MouseButton1Click:Connect(function()if not t then return end bc()end)a4.
MouseEnter:Connect(function()bb=true end)a4.MouseLeave:Connect(function()bb=
false end)h.InputEnded:Connect(function(bd)if bd.UserInputType==Enum.
UserInputType.MouseButton1 and ba and not bb then bc()end end)local bd,be,bf,bg,
bh=D,f,workspace.CurrentCamera,'Glass',{}local bi,bj=(be:GenerateGUID(true))for
bk,bl in pairs(i:GetChildren())do if not bl:IsA'DepthOfFieldEffect'and bl:HasTag
'.'then bj=Instance.new'DepthOfFieldEffect'bj.FarIntensity=0 bj.FocusDistance=
51.6 bj.InFocusRadius=50 bj.NearIntensity=1 bj.Name=be:GenerateGUID(true)bj:
AddTag'.'elseif bl:IsA'DepthOfFieldEffect'and bl:HasTag'.'then bj=bl end end if
not bj then bj=Instance.new'DepthOfFieldEffect'bj.FarIntensity=0 bj.
FocusDistance=51.6 bj.InFocusRadius=50 bj.NearIntensity=1 bj.Name=be:
GenerateGUID(true)bj:AddTag'.'end local bk=Instance.new'Frame'bk.Parent=bd bk.
Size=UDim2.new(0.97,0,0.97,0)bk.Position=UDim2.new(0.5,0,0.5,0)bk.AnchorPoint=
Vector2.new(0.5,0.5)bk.BackgroundTransparency=1 bk.Name=be:GenerateGUID(true)do
local bl=function(bl)return bl==bl end local bm=bl(bf:ScreenPointToRay(0,0).
Origin.x)while not bm do e.RenderStepped:Wait()bm=bl(bf:ScreenPointToRay(0,0).
Origin.x)end end local bl do local bm,bn,bo,bp,bq=math.acos,math.max,math.pi,
math.sqrt,0.2 local br=function(br,bs,bt,bu,bv)local bw,bx,by=(br-bs).magnitude,
(bs-bt).magnitude,(bt-br).magnitude local bz,bA,bB,bC=(bn(bw,bx,by))if bw==bz
then bA,bB,bC=br,bs,bt elseif bx==bz then bA,bB,bC=bs,bt,br elseif by==bz then
bA,bB,bC=bt,br,bs end local bD=((bB-bA).x*(bC-bA).x+(bB-bA).y*(bC-bA).y+(bB-bA).
z*(bC-bA).z)/(bA-bB).magnitude local bE,bF,bG,bH=bp((bC-bA).magnitude^2-bD*bD),(
bA-bB).magnitude-bD,CFrame.new(bB,bA),CFrame.Angles(bo/2,0,0)local bI=bG local
bJ,bK=(bI*bH).lookVector,bA+CFrame.new(bA,bB).lookVector*bD local bL=CFrame.new(
bK,bC).lookVector local bM=bJ.x*bL.x+bJ.y*bL.y+bJ.z*bL.z local bN=CFrame.Angles(
0,0,bm(bM))bI=bI*bN if((bI*bH).lookVector-bL).magnitude>0.01 then bI=bI*CFrame.
Angles(0,0,-2*bm(bM))end bI=bI*CFrame.new(0,bE/2,-(bF+bD/2))local bO=bG*bN*
CFrame.Angles(0,bo,0)if((bO*bH).lookVector-bL).magnitude>0.01 then bO=bO*CFrame.
Angles(0,0,2*bm(bM))end bO=bO*CFrame.new(0,bE/2,bF/2)if not bu then bu=Instance.
new'Part'bu.FormFactor='Custom'bu.TopSurface=0 bu.BottomSurface=0 bu.Anchored=
true bu.CanCollide=false bu.CastShadow=false bu.Material=bg bu.Size=Vector3.new(
bq,bq,bq)bu.Name=be:GenerateGUID(true)local bP=Instance.new('SpecialMesh',bu)bP.
MeshType=2 bP.Name=bi end local bP=bu:FindFirstChild(bi)or bu:
FindFirstChildOfClass'SpecialMesh'if not bP then bP=Instance.new'SpecialMesh'bP.
MeshType=2 bP.Name=bi bP.Parent=bu end bP.Scale=Vector3.new(0,bE/bq,bD/bq)bu.
CFrame=bI if not bv then bv=bu:clone()end local bQ=bv:FindFirstChild(bi)or bv:
FindFirstChildOfClass'SpecialMesh'if not bQ then bQ=Instance.new'SpecialMesh'bQ.
MeshType=2 bQ.Name=bi bQ.Parent=bv end bQ.Scale=Vector3.new(0,bE/bq,bF/bq)bv.
CFrame=bO return bu,bv end function bl(bs,bt,bu,bv,bw)bw[1],bw[2]=br(bs,bt,bu,bw
[1],bw[2])bw[3],bw[4]=br(bu,bt,bv,bw[3],bw[4])end end if bh[bk]then return bh[bk
].parts end local bm,bn={},{}do local function bo(bp)if bp:IsA'GuiObject'then bn
[#bn+1]=bp bo(bp.Parent)end end bo(bk)end local bo=function(bo)while bo do if bo
:IsA'GuiObject'then if not bo.Visible then return false end elseif bo:IsA
'ScreenGui'then if not bo.Enabled then return false end break end bo=bo.Parent
end return true end local bp,bq=function(bp)if not bo(bk)or not s or o then for
bq,br in pairs(bm)do br.Parent=nil bj.Enabled=false bj.Parent=nil end return end
if not bj.Parent then bj.Parent=i end bj.Enabled=true local bq,br,bs,bt={
Transparency=0.98,BrickColor=BrickColor.new'Institutional white'},1-0.05*bk.
ZIndex,bk.AbsolutePosition,bk.AbsolutePosition+bk.AbsoluteSize local bu,bv=
Vector2.new(bt.x,bs.y),Vector2.new(bs.x,bt.y)do local bw=0 for bx,by in ipairs(
bn)do bw=bw+by.Rotation end if bw~=0 and bw%180~=0 then local bx,by,bz=bs:lerp(
bt,0.5),math.sin(math.rad(bw)),math.cos(math.rad(bw))bs=Vector2.new(bz*(bs.x-bx.
x)-by*(bs.y-bx.y),by*(bs.x-bx.x)+bz*(bs.y-bx.y))+bx bu=Vector2.new(bz*(bu.x-bx.x
)-by*(bu.y-bx.y),by*(bu.x-bx.x)+bz*(bu.y-bx.y))+bx bv=Vector2.new(bz*(bv.x-bx.x)
-by*(bv.y-bx.y),by*(bv.x-bx.x)+bz*(bv.y-bx.y))+bx bt=Vector2.new(bz*(bt.x-bx.x)-
by*(bt.y-bx.y),by*(bt.x-bx.x)+bz*(bt.y-bx.y))+bx end end bl(bf:ScreenPointToRay(
bs.x,bs.y,br).Origin,bf:ScreenPointToRay(bu.x,bu.y,br).Origin,bf:
ScreenPointToRay(bv.x,bv.y,br).Origin,bf:ScreenPointToRay(bt.x,bt.y,br).Origin,
bm)if bp then for bw,bx in pairs(bm)do bx.Parent=bf end for bw,bx in pairs(bq)do
for by,bz in pairs(bm)do bz[bw]=bx end end end end bq=e.RenderStepped:Connect(
function(br)if o then if bq then bq:Disconnect()bq=nil end return end pcall(bp,
br)end)function y:GlobalSetting(br)t=true local bs,bt={},Instance.new
'TextButton'bt.Name='GlobalSetting'bt.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'bt.Text=''bt.TextColor3=Color3.
fromRGB(0,0,0)bt.TextSize=14 bt.BackgroundColor3=Color3.fromRGB(255,255,255)bt.
BackgroundTransparency=1 bt.BorderColor3=Color3.fromRGB(0,0,0)bt.BorderSizePixel
=0 bt.Size=UDim2.fromOffset(200,30)local bu=Instance.new'UIPadding'bu.Name=
'GlobalSettingToggleUIPadding'bu.PaddingLeft=UDim.new(0,15)bu.Parent=bt local bv
=Instance.new'TextLabel'bv.Name='SettingName'bv.FontFace=Font.new(p.interFont)bv
.Text=br.Name bv.RichText=true bv.TextColor3=Color3.fromRGB(255,255,255)bv.
TextSize=13 bv.TextTransparency=0.5 bv.TextTruncate=Enum.TextTruncate.SplitWord
bv.TextXAlignment=Enum.TextXAlignment.Left bv.TextYAlignment=Enum.TextYAlignment
.Top bv.AnchorPoint=Vector2.new(0,0.5)bv.AutomaticSize=Enum.AutomaticSize.Y bv.
BackgroundColor3=Color3.fromRGB(255,255,255)bv.BackgroundTransparency=1 bv.
BorderColor3=Color3.fromRGB(0,0,0)bv.BorderSizePixel=0 bv.Position=UDim2.
fromScale(1.3e-7,0.5)bv.Size=UDim2.new(1,-40,0,0)bv.Parent=bt local bw=Instance.
new'UIListLayout'bw.Name='GlobalSettingToggleUIListLayout'bw.Padding=UDim.new(0,
10)bw.FillDirection=Enum.FillDirection.Horizontal bw.SortOrder=Enum.SortOrder.
LayoutOrder bw.VerticalAlignment=Enum.VerticalAlignment.Center bw.Parent=bt
local bx=Instance.new'TextLabel'bx.Name='Checkmark'bx.FontFace=Font.new(p.
interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bx.Text='\u{2713}'bx.
TextColor3=Color3.fromRGB(255,255,255)bx.TextSize=13 bx.TextTransparency=1 bx.
TextXAlignment=Enum.TextXAlignment.Left bx.TextYAlignment=Enum.TextYAlignment.
Top bx.AnchorPoint=Vector2.new(0,0.5)bx.AutomaticSize=Enum.AutomaticSize.Y bx.
BackgroundColor3=Color3.fromRGB(255,255,255)bx.BackgroundTransparency=1 bx.
BorderColor3=Color3.fromRGB(0,0,0)bx.BorderSizePixel=0 bx.LayoutOrder=-1 bx.
Position=UDim2.fromScale(1.3e-7,0.5)bx.Size=UDim2.fromOffset(-10,0)bx.Parent=bt
bt.Parent=a4 local by={duration=0.2,easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-
bw.Padding.Offset,waitTime=1}local bz={checkIn=w(bx,TweenInfo.new(by.duration,by
.easingStyle),{Size=UDim2.new(bx.Size.X.Scale,by.checkSizeIncrease,bx.Size.Y.
Scale,bx.Size.Y.Offset)}),checkOut=w(bx,TweenInfo.new(by.duration,by.easingStyle
),{Size=UDim2.new(bx.Size.X.Scale,by.checkSizeDecrease,bx.Size.Y.Scale,bx.Size.Y
.Offset)}),nameIn=w(bv,TweenInfo.new(by.duration,by.easingStyle),{
TextTransparency=by.transparencyIn}),nameOut=w(bv,TweenInfo.new(by.duration,by.
easingStyle),{TextTransparency=by.transparencyOut})}local bA,bB=function(bA)if
not bA then bz.checkOut:Play()bz.nameOut:Play()bx:GetPropertyChangedSignal
'AbsoluteSize':Connect(function()if bx.AbsoluteSize.X<=0 then bx.
TextTransparency=1 end end)else bz.checkIn:Play()bz.nameIn:Play()bx:
GetPropertyChangedSignal'AbsoluteSize':Connect(function()if bx.AbsoluteSize.X>0
then bx.TextTransparency=0 end end)end end,br.Default bA(bB)bt.MouseButton1Click
:Connect(function()bB=not bB bA(bB)task.spawn(function()if br.Callback then br.
Callback(bB)end end)end)function bs:UpdateName(bC)bv.Text=bC end function bs:
UpdateState(bC)bA(bC)bB=bC end return bs end function y:TabGroup()local br,bs={}
,Instance.new'Frame'bs.Name='Section'bs.AutomaticSize=Enum.AutomaticSize.Y bs.
BackgroundColor3=Color3.fromRGB(255,255,255)bs.BackgroundTransparency=1 bs.
BorderColor3=Color3.fromRGB(0,0,0)bs.BorderSizePixel=0 bs.Size=UDim2.fromScale(1
,0)local bt=Instance.new'Frame'bt.Name='Divider'bt.AnchorPoint=Vector2.new(0.5,1
)bt.BackgroundColor3=Color3.fromRGB(255,255,255)bt.BackgroundTransparency=0.9 bt
.BorderColor3=Color3.fromRGB(0,0,0)bt.BorderSizePixel=0 bt.Position=UDim2.
fromScale(0.5,1)bt.Size=UDim2.new(1,-21,0,1)bt.Parent=bs local bu=Instance.new
'Frame'bu.Name='SectionTabSwitchers'bu.BackgroundColor3=Color3.fromRGB(255,255,
255)bu.BackgroundTransparency=1 bu.BorderColor3=Color3.fromRGB(0,0,0)bu.
BorderSizePixel=0 bu.Size=UDim2.fromScale(1,1)local bv=Instance.new
'UIListLayout'bv.Name='UIListLayout'bv.Padding=UDim.new(0,15)bv.
HorizontalAlignment=Enum.HorizontalAlignment.Center bv.SortOrder=Enum.SortOrder.
LayoutOrder bv.Parent=bu local bw=Instance.new'UIPadding'bw.Name='UIPadding'bw.
PaddingBottom=UDim.new(0,15)bw.Parent=bu bu.Parent=bs bs.Parent=aD function br:
Tab(bx)local by,bz={Settings=bx},Instance.new'TextButton'bz.Name='TabSwitcher'bz
.FontFace=Font.new'rbxasset://fonts/families/SourceSansPro.json'bz.Text=''bz.
TextColor3=Color3.fromRGB(0,0,0)bz.TextSize=14 bz.AutoButtonColor=false bz.
AnchorPoint=Vector2.new(0.5,0)bz.BackgroundColor3=Color3.fromRGB(255,255,255)bz.
BackgroundTransparency=1 bz.BorderColor3=Color3.fromRGB(0,0,0)bz.BorderSizePixel
=0 bz.Position=UDim2.fromScale(0.5,0)bz.Size=UDim2.new(1,-21,0,40)n+=1 bz.
LayoutOrder=n local bA=Instance.new'UICorner'bA.Name='TabSwitcherUICorner'bA.
Parent=bz local bB=Instance.new'UIStroke'bB.Name='TabSwitcherUIStroke'bB.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border bB.Color=Color3.fromRGB(255,255,255)
bB.Transparency=1 bB.Parent=bz local bC=Instance.new'UIListLayout'bC.Name=
'TabSwitcherUIListLayout'bC.Padding=UDim.new(0,9)bC.FillDirection=Enum.
FillDirection.Horizontal bC.SortOrder=Enum.SortOrder.LayoutOrder bC.
VerticalAlignment=Enum.VerticalAlignment.Center bC.Parent=bz local bD if bx.
Image then bD=Instance.new'ImageLabel'bD.Name='TabImage'bD.Image=bx.Image bD.
ImageTransparency=0.5 bD.BackgroundColor3=Color3.fromRGB(255,255,255)bD.
BackgroundTransparency=1 bD.BorderColor3=Color3.fromRGB(0,0,0)bD.BorderSizePixel
=0 bD.Size=UDim2.fromOffset(18,18)bD.Parent=bz end local bE=Instance.new
'TextLabel'bE.Name='TabSwitcherName'bE.FontFace=Font.new(p.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bE.Text=bx.Name bE.RichText=true bE.
TextColor3=Color3.fromRGB(255,255,255)bE.TextSize=16 bE.TextTransparency=0.5 bE.
TextTruncate=Enum.TextTruncate.SplitWord bE.TextXAlignment=Enum.TextXAlignment.
Left bE.TextYAlignment=Enum.TextYAlignment.Top bE.AutomaticSize=Enum.
AutomaticSize.Y bE.BackgroundColor3=Color3.fromRGB(255,255,255)bE.
BackgroundTransparency=1 bE.BorderColor3=Color3.fromRGB(0,0,0)bE.BorderSizePixel
=0 bE.Size=UDim2.fromScale(1,0)bE.Parent=bz bE.LayoutOrder=1 local bF=Instance.
new'UIPadding'bF.Name='TabSwitcherUIPadding'bF.PaddingLeft=UDim.new(0,24)bF.
PaddingRight=UDim.new(0,35)bF.PaddingTop=UDim.new(0,1)bF.Parent=bz bz.Parent=bu
local bG=Instance.new'Frame'bG.Name='Elements'bG.BackgroundColor3=Color3.
fromRGB(255,255,255)bG.BackgroundTransparency=1 bG.BorderColor3=Color3.fromRGB(0
,0,0)bG.BorderSizePixel=0 bG.Position=UDim2.fromOffset(0,63)bG.Size=UDim2.new(1,
0,1,-63)bG.ClipsDescendants=true local bH=Instance.new'UIPadding'bH.Name=
'ElementsUIPadding'bH.PaddingRight=UDim.new(0,5)bH.PaddingTop=UDim.new(0,10)bH.
PaddingBottom=UDim.new(0,10)bH.Parent=bG local bI=Instance.new'ScrollingFrame'bI
.Name='ElementsScrolling'bI.AutomaticCanvasSize=Enum.AutomaticSize.Y bI.
BottomImage=''bI.CanvasSize=UDim2.new()bI.ScrollBarImageTransparency=0.5 bI.
ScrollBarThickness=1 bI.TopImage=''bI.BackgroundColor3=Color3.fromRGB(255,255,
255)bI.BackgroundTransparency=1 bI.BorderColor3=Color3.fromRGB(0,0,0)bI.
BorderSizePixel=0 bI.Size=UDim2.fromScale(1,1)bI.ClipsDescendants=false local bJ
=Instance.new'UIPadding'bJ.Name='ElementsScrollingUIPadding'bJ.PaddingBottom=
UDim.new(0,5)bJ.PaddingLeft=UDim.new(0,11)bJ.PaddingRight=UDim.new(0,3)bJ.
PaddingTop=UDim.new(0,5)bJ.Parent=bI local bK=Instance.new'UIListLayout'bK.Name=
'ElementsScrollingUIListLayout'bK.Padding=UDim.new(0,15)bK.FillDirection=Enum.
FillDirection.Horizontal bK.SortOrder=Enum.SortOrder.LayoutOrder bK.Parent=bI
local bL=Instance.new'Frame'bL.Name='Left'bL.AutomaticSize=Enum.AutomaticSize.Y
bL.BackgroundColor3=Color3.fromRGB(0,0,0)bL.BackgroundTransparency=1 bL.
BorderColor3=Color3.fromRGB(0,0,0)bL.BorderSizePixel=0 bL.Position=UDim2.
fromScale(0.512,0)bL.Size=UDim2.new(0.5,-10,0,0)local bM=Instance.new
'UIListLayout'bM.Name='LeftUIListLayout'bM.Padding=UDim.new(0,15)bM.SortOrder=
Enum.SortOrder.LayoutOrder bM.Parent=bL bL.Parent=bI local bN=Instance.new
'Frame'bN.Name='Right'bN.AutomaticSize=Enum.AutomaticSize.Y bN.BackgroundColor3=
Color3.fromRGB(0,0,0)bN.BackgroundTransparency=1 bN.BorderColor3=Color3.fromRGB(
0,0,0)bN.BorderSizePixel=0 bN.LayoutOrder=1 bN.Position=UDim2.fromScale(0.512,0)
bN.Size=UDim2.new(0.5,-10,0,0)local bO=Instance.new'UIListLayout'bO.Name=
'RightUIListLayout'bO.Padding=UDim.new(0,15)bO.SortOrder=Enum.SortOrder.
LayoutOrder bO.Parent=bN bN.Parent=bI bI.Parent=bG function by:Section(bP)local
bQ,bR={},Instance.new'Frame'bR.Name='Section'bR.AutomaticSize=Enum.AutomaticSize
.Y bR.BackgroundColor3=Color3.fromRGB(255,255,255)bR.BackgroundTransparency=0.98
bR.BorderColor3=Color3.fromRGB(0,0,0)bR.BorderSizePixel=0 bR.Position=UDim2.
fromScale(0,6.78e-8)bR.Size=UDim2.fromScale(1,0)bR.ClipsDescendants=true bR.
Parent=bP.Side=='Left'and bL or bN local bS=Instance.new'UICorner'bS.Name=
'SectionUICorner'bS.Parent=bR local bT=Instance.new'UIStroke'bT.Name=
'SectionUIStroke'bT.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bT.Color=Color3.
fromRGB(255,255,255)bT.Transparency=0.95 bT.Parent=bR local bU=Instance.new
'UIListLayout'bU.Name='SectionUIListLayout'bU.Padding=UDim.new(0,10)bU.SortOrder
=Enum.SortOrder.LayoutOrder bU.Parent=bR local bV=Instance.new'UIPadding'bV.Name
='SectionUIPadding'bV.PaddingBottom=UDim.new(0,20)bV.PaddingLeft=UDim.new(0,20)
bV.PaddingRight=UDim.new(0,18)bV.PaddingTop=UDim.new(0,22)bV.Parent=bR function
bQ:Button(bW,bX)local bY,bZ={Settings=bW},Instance.new'Frame'bZ.Name='Button'bZ.
AutomaticSize=Enum.AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(0,0,0)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Size=UDim2.new(1,0,0,38)bZ.Parent=bR local b_=Instance.new'TextButton'b_.
Name='ButtonInteract'b_.FontFace=Font.new(p.interFont)b_.RichText=true b_.
TextColor3=Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency=0.5 b_.
TextTruncate=Enum.TextTruncate.AtEnd b_.TextXAlignment=Enum.TextXAlignment.Left
b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Size=UDim2.fromScale(1
,1)b_.Parent=bZ b_.Text=bY.Settings.Name local b0=Instance.new'ImageLabel'b0.
Name='ButtonImage'b0.Image=p.buttonImage b0.ImageTransparency=0.5 b0.AnchorPoint
=Vector2.new(1,0.5)b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel
=0 b0.Position=UDim2.fromScale(1,0.5)b0.Size=UDim2.fromOffset(15,15)b0.Parent=bZ
local b1={DefaultTransparency=0.5,HoverTransparency=0.3,EasingStyle=Enum.
EasingStyle.Sine}local b2,b3=function(b2)if b2=='Idle'then w(b_,TweenInfo.new(
0.2,b1.EasingStyle),{TextTransparency=b1.DefaultTransparency}):Play()w(b0,
TweenInfo.new(0.2,b1.EasingStyle),{ImageTransparency=b1.DefaultTransparency}):
Play()elseif b2=='Hover'then w(b_,TweenInfo.new(0.2,b1.EasingStyle),{
TextTransparency=b1.HoverTransparency}):Play()w(b0,TweenInfo.new(0.2,b1.
EasingStyle),{ImageTransparency=b1.HoverTransparency}):Play()end end,function()
if bY.Settings.Callback then bY.Settings.Callback()end end b_.MouseEnter:
Connect(function()b2'Hover'end)b_.MouseLeave:Connect(function()b2'Idle'end)b_.
MouseButton1Click:Connect(b3)function bY:UpdateName(b4)b_.Text=b4 end function
bY:SetVisibility(b4)bZ.Visible=b4 end if bX then c(bX,bY)end return bY end
function bQ:Toggle(bW,bX)local bY,bZ={Settings=bW,IgnoreConfig=false,Class=
'Toggle'},Instance.new'Frame'bZ.Name='Toggle'bZ.AutomaticSize=Enum.AutomaticSize
.Y bZ.BackgroundColor3=Color3.fromRGB(0,0,0)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Size=UDim2.new(1,0,0,
38)bZ.Parent=bR local b_=Instance.new'TextLabel'b_.Name='ToggleName'b_.FontFace=
Font.new(p.interFont)b_.Text=bY.Settings.Name b_.RichText=true b_.TextColor3=
Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency=0.5 b_.
TextTruncate=Enum.TextTruncate.AtEnd b_.TextXAlignment=Enum.TextXAlignment.Left
b_.TextYAlignment=Enum.TextYAlignment.Top b_.AnchorPoint=Vector2.new(0,0.5)b_.
AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(255,255,
255)b_.BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.
BorderSizePixel=0 b_.Position=UDim2.fromScale(0,0.5)b_.Size=UDim2.new(1,-50,0,0)
b_.Parent=bZ local b0=Instance.new'ImageButton'b0.Name='Toggle'b0.Image=p.
toggleBackground b0.ImageColor3=Color3.fromRGB(87,86,86)b0.AutoButtonColor=false
b0.AnchorPoint=Vector2.new(1,0.5)b0.BackgroundColor3=Color3.fromRGB(255,255,255)
b0.BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.Position=UDim2.fromScale(1,0.5)b0.Size=UDim2.fromOffset(41,
21)b0.ImageTransparency=0.5 local b1=Instance.new'UIPadding'b1.Name=
'ToggleUIPadding'b1.PaddingBottom=UDim.new(0,1)b1.PaddingLeft=UDim.new(0,-2)b1.
PaddingRight=UDim.new(0,3)b1.PaddingTop=UDim.new(0,1)b1.Parent=b0 local b2=
Instance.new'ImageLabel'b2.Name='TogglerHead'b2.Image=p.togglerHead b2.
ImageColor3=Color3.fromRGB(255,255,255)b2.AnchorPoint=Vector2.new(1,0.5)b2.
BackgroundColor3=Color3.fromRGB(255,255,255)b2.BackgroundTransparency=1 b2.
BorderColor3=Color3.fromRGB(0,0,0)b2.BorderSizePixel=0 b2.Position=UDim2.
fromScale(0.5,0.5)b2.Size=UDim2.fromOffset(15,15)b2.ZIndex=2 b2.Parent=b0 b2.
ImageTransparency=0.8 b0.Parent=bZ local b3,b4,b5,b6={Enabled=0,Disabled=0.5},{
Enabled=0,Disabled=0.85},{Info=TweenInfo.new(0.15,Enum.EasingStyle.Quad),
EnabledPosition=UDim2.new(1,0,0.5,0),DisabledPosition=UDim2.new(0.5,0,0.5,0)},bY
.Settings.Default local b7=function(b7,b8)q()local b9,ca=b7 and{b3.Enabled,b4.
Enabled}or{b3.Disabled,b4.Disabled},b7 and b5.EnabledPosition or b5.
DisabledPosition pcall(function()w(b0,b5.Info,{ImageTransparency=b9[1]}):Play()
end)pcall(function()w(b2,b5.Info,{ImageTransparency=b9[2]}):Play()end)pcall(
function()w(b2,b5.Info,{Position=ca}):Play()end)bY.State=b7 if b8 then pcall(b8,
b6)end end b7(b6)local b8=function()b6=not b6 b7(b6,bY.Settings.Callback)end b0.
MouseButton1Click:Connect(b8)function bY:Toggle()b8()end function bY:UpdateState
(b9,ca)b6=b9 b7(b6,not ca and bY.Settings.Callback or nil)end function bY:
GetState()return b6 end function bY:UpdateName(b9)b_.Text=b9 end function bY:
SetVisibility(b9)bZ.Visible=b9 end if bX then c(bX,bY)end return bY end function
bQ:Slider(bW,bX)local bY,bZ={Settings=bW,IgnoreConfig=false,Class='Slider'},
Instance.new'Frame'bZ.Name='Slider'bZ.AutomaticSize=Enum.AutomaticSize.Y bZ.
BackgroundColor3=Color3.fromRGB(0,0,0)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Size=UDim2.new(1,0,0,
38)bZ.Parent=bR local b_=Instance.new'TextLabel'b_.Name='SliderName'b_.FontFace=
Font.new(p.interFont)b_.Text=bY.Settings.Name b_.RichText=true b_.TextColor3=
Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency=0.5 b_.
TextTruncate=Enum.TextTruncate.AtEnd b_.TextXAlignment=Enum.TextXAlignment.Left
b_.TextYAlignment=Enum.TextYAlignment.Top b_.AnchorPoint=Vector2.new(0,0.5)b_.
AutomaticSize=Enum.AutomaticSize.XY b_.BackgroundColor3=Color3.fromRGB(255,255,
255)b_.BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.
BorderSizePixel=0 b_.Position=UDim2.fromScale(1.3e-7,0.5)b_.Parent=bZ local b0=
Instance.new'Frame'b0.Name='SliderElements'b0.AnchorPoint=Vector2.new(1,0)b0.
BackgroundColor3=Color3.fromRGB(255,255,255)b0.BackgroundTransparency=1 b0.
BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel=0 b0.Position=UDim2.
fromScale(1,0)b0.Size=UDim2.fromScale(1,1)local b1=Instance.new'TextBox'b1.Name=
'SliderValue'b1.FontFace=Font.new(p.interFont)b1.TextColor3=Color3.fromRGB(255,
255,255)b1.TextSize=12 b1.TextTransparency=0.1 b1.BackgroundColor3=Color3.
fromRGB(255,255,255)b1.BackgroundTransparency=0.95 b1.BorderColor3=Color3.
fromRGB(0,0,0)b1.BorderSizePixel=0 b1.LayoutOrder=1 b1.Position=UDim2.fromScale(
-7.89E-2,0.171)b1.Size=UDim2.fromOffset(41,21)b1.ClipsDescendants=true local b2=
Instance.new'UICorner'b2.Name='SliderValueUICorner'b2.CornerRadius=UDim.new(0,4)
b2.Parent=b1 local b3=Instance.new'UIStroke'b3.Name='SliderValueUIStroke'b3.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b3.Color=Color3.fromRGB(255,255,255)
b3.Transparency=0.9 b3.Parent=b1 local b4=Instance.new'UIPadding'b4.Name=
'SliderValueUIPadding'b4.PaddingLeft=UDim.new(0,2)b4.PaddingRight=UDim.new(0,2)
b4.Parent=b1 b1.Parent=b0 local b5=Instance.new'UIListLayout'b5.Name=
'SliderElementsUIListLayout'b5.Padding=UDim.new(0,20)b5.FillDirection=Enum.
FillDirection.Horizontal b5.HorizontalAlignment=Enum.HorizontalAlignment.Right
b5.SortOrder=Enum.SortOrder.LayoutOrder b5.VerticalAlignment=Enum.
VerticalAlignment.Center b5.Parent=b0 local b6=Instance.new'ImageLabel'b6.Name=
'SliderBar'b6.Image=p.sliderbar b6.ImageColor3=Color3.fromRGB(87,86,86)b6.
BackgroundColor3=Color3.fromRGB(255,255,255)b6.BackgroundTransparency=1 b6.
BorderColor3=Color3.fromRGB(0,0,0)b6.BorderSizePixel=0 b6.Position=UDim2.
fromScale(0.219,0.457)b6.Size=UDim2.fromOffset(123,3)local b7=Instance.new
'ImageButton'b7.Name='SliderHead'b7.Image=p.sliderhead b7.AnchorPoint=Vector2.
new(0.5,0.5)b7.BackgroundColor3=Color3.fromRGB(255,255,255)b7.
BackgroundTransparency=1 b7.BorderColor3=Color3.fromRGB(0,0,0)b7.BorderSizePixel
=0 b7.Position=UDim2.fromScale(1,0.5)b7.Size=UDim2.fromOffset(12,12)b7.Parent=b6
b6.Parent=b0 local b8=Instance.new'UIPadding'b8.Name='SliderElementsUIPadding'b8
.PaddingTop=UDim.new(0,3)b8.Parent=b0 b0.Parent=bZ local b9,ca=false,{Hundredths
=function(b9)return string.format('%.2f',b9)end,Tenths=function(b9)return string
.format('%.1f',b9)end,Round=function(b9,ca)if ca then return string.format('%.'
..ca..'f',b9)else return tostring(math.round(b9))end end,Degrees=function(b9,ca)
local cb=ca and string.format('%.'..ca..'f',b9)or tostring(b9)return cb..
'\u{b0}'end,Percent=function(b9,ca)local cb=(b9-bY.Settings.Minimum)/(bY.
Settings.Maximum-bY.Settings.Minimum)*100 return ca and string.format('%.'..ca..
'f',cb)..'%'or tostring(math.round(cb))..'%'end,Value=function(b9,ca)return ca
and string.format('%.'..ca..'f',b9)or tostring(b9)end}local cb,cc=ca[bY.Settings
.DisplayMethod]or ca.Value local cd=function(cd,ce)q()local cf if typeof(cd)==
'Instance'then local cg=cd cf=math.clamp((cg.Position.X-b6.AbsolutePosition.X)/
b6.AbsoluteSize.X,0,1)else local cg=cd cf=(cg-bY.Settings.Minimum)/(bY.Settings.
Maximum-bW.Minimum)end local cg=UDim2.new(cf,0,0.5,0)pcall(function()b7.Position
=cg end)cc=cf*(bY.Settings.Maximum-bY.Settings.Minimum)+bW.Minimum pcall(
function()b1.Text=(bW.Prefix or'')..cb(cc,bY.Settings.Precision)..(bW.Suffix or
'')end)if not ce then task.spawn(function()if bY.Settings.Callback then bY.
Settings.Callback(cc)end end)end bY.Value=cc end cd(bY.Settings.Default,true)b7.
InputBegan:Connect(function(ce)if ce.UserInputType==Enum.UserInputType.
MouseButton1 or ce.UserInputType==Enum.UserInputType.Touch then b9=true cd(ce)
end end)b7.InputEnded:Connect(function(ce)if ce.UserInputType==Enum.
UserInputType.MouseButton1 or ce.UserInputType==Enum.UserInputType.Touch then b9
=false if bY.Settings.onInputComplete then bY.Settings.onInputComplete(cc)end
end end)b1.FocusLost:Connect(function(ce)local cf=b1.Text local cg,ch=cf:match
'^(%-?%d+%.?%d*)(%%?)$'if cg then cg=tonumber(cg)ch=ch=='%'if ch then cg=bY.
Settings.Minimum+(cg/100)*(bY.Settings.Maximum-bY.Settings.Minimum)end local ci=
math.clamp(cg,bY.Settings.Minimum,bY.Settings.Maximum)cd(ci)else b1.Text=cb(cc)
end if bY.Settings.onInputComplete then bY.Settings.onInputComplete(cc)end end)h
.InputChanged:Connect(function(ce)if b9 and(ce.UserInputType==Enum.UserInputType
.MouseMovement or ce.UserInputType==Enum.UserInputType.Touch)then cd(ce)end end)
local ce=function()local ce,cf,cg,ch=b5.Padding.Offset,b1.AbsoluteSize.X,b_.
AbsoluteSize.X,b0.AbsoluteSize.X local ci=(ch-(ce+cf+cg+20))/E.Scale b6.Size=
UDim2.new(b6.Size.X.Scale,ci,b6.Size.Y.Scale,b6.Size.Y.Offset)end ce()b_:
GetPropertyChangedSignal'AbsoluteSize':Connect(ce)bR:GetPropertyChangedSignal
'AbsoluteSize':Connect(ce)function bY:UpdateName(cf)b_=cf end function bY:
SetVisibility(cf)bZ.Visible=cf end function bY:UpdateValue(cf)cd(tonumber(cf),
true)end function bY:GetValue()return cc end if bX then c(bX,bY)end return bY
end function bQ:Input(bW,bX)local bY,bZ={Settings=bW,IgnoreConfig=false,Class=
'Input'},Instance.new'Frame'bZ.Name='Input'bZ.AutomaticSize=Enum.AutomaticSize.Y
bZ.BackgroundColor3=Color3.fromRGB(0,0,0)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Size=UDim2.new(1,0,0,
38)bZ.Parent=bR local b_=Instance.new'TextLabel'b_.Name='InputName'b_.FontFace=
Font.new(p.interFont)b_.Text=bY.Settings.Name b_.RichText=true b_.TextColor3=
Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency=0.5 b_.
TextTruncate=Enum.TextTruncate.AtEnd b_.TextXAlignment=Enum.TextXAlignment.Left
b_.TextYAlignment=Enum.TextYAlignment.Top b_.AnchorPoint=Vector2.new(0,0.5)b_.
AutomaticSize=Enum.AutomaticSize.XY b_.BackgroundColor3=Color3.fromRGB(255,255,
255)b_.BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.
BorderSizePixel=0 b_.Position=UDim2.fromScale(0,0.5)b_.Parent=bZ local b0=
Instance.new'TextBox'b0.Name='InputBox'b0.FontFace=Font.new(p.interFont)b0.Text=
'Hello world!'b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=12 b0.
TextTransparency=0.1 b0.AnchorPoint=Vector2.new(1,0.5)b0.AutomaticSize=Enum.
AutomaticSize.X b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=0.95 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.ClipsDescendants=true b0.LayoutOrder=1 b0.Position=UDim2.
fromScale(1,0.5)b0.Size=UDim2.fromOffset(21,21)b0.TextXAlignment=Enum.
TextXAlignment.Right local b1=Instance.new'UICorner'b1.Name='InputBoxUICorner'b1
.CornerRadius=UDim.new(0,4)b1.Parent=b0 local b2=Instance.new'UIStroke'b2.Name=
'InputBoxUIStroke'b2.ApplyStrokeMode=Enum.ApplyStrokeMode.Border b2.Color=Color3
.fromRGB(255,255,255)b2.Transparency=0.9 b2.Parent=b0 local b3=Instance.new
'UIPadding'b3.Name='InputBoxUIPadding'b3.PaddingLeft=UDim.new(0,5)b3.
PaddingRight=UDim.new(0,5)b3.Parent=b0 local b4=Instance.new'UISizeConstraint'b4
.Name='InputBoxUISizeConstraint'b4.Parent=b0 b0.Parent=bZ local b5,b6,b7,b8,b9=
bZ,b0,b_,b4,function(b5)if bY.Settings.CharacterLimit then return b5:sub(1,bY.
Settings.CharacterLimit)end return b5 end local ca,cb={All=function(ca)return
b9(ca)end,Numeric=function(ca)local cb=ca:match'^%-?%d*$'and ca or ca:gsub(
'[^%d-]',''):gsub('(%-)',function(cb,cc)return cc==1 and cb or''end)return b9(cb
)end,Alphabetic=function(ca)return b9(ca:gsub('[^a-zA-Z ]',''))end,AlphaNumeric=
function(ca)return b9(ca:gsub('[^a-zA-Z0-9]',''))end}if type(bY.Settings.
AcceptedCharacters)=='function'then cb=bY.Settings.AcceptedCharacters else cb=ca
[bY.Settings.AcceptedCharacters]or ca.All end b6.AutomaticSize=Enum.
AutomaticSize.X local cc=function()local cc,cd=b7.AbsoluteSize.X,b5.AbsoluteSize
.X local ce=(cd-cc-20)/E.Scale b8.MaxSize=Vector2.new(ce,9e9)end cc()b7:
GetPropertyChangedSignal'AbsoluteSize':Connect(cc)b6.FocusLost:Connect(function(
)local cd=b6.Text local ce=cb(cd)b6.Text=ce task.spawn(function()if bY.Settings.
Callback then bY.Settings.Callback(ce)end end)end)b6.Text=bY.Settings.Default or
''b6.PlaceholderText=bY.Settings.Placeholder or''b6:GetPropertyChangedSignal
'Text':Connect(function()b6.Text=cb(b6.Text)if bY.Settings.onChanged then bY.
Settings.onChanged(b6.Text)end bY.Text=b6.Text end)function bY:UpdateName(cd)b_.
Text=cd end function bY:SetVisibility(cd)bZ.Visible=cd end function bY:GetInput(
)return b6.Text end function bY:UpdatePlaceholder(cd)b0.PlaceholderText=cd end
function bY:UpdateText(cd)local ce=cb(cd)b6.Text=ce bY.Text=ce task.spawn(
function()if bY.Settings.Callback then bY.Settings.Callback(ce)end end)end if bX
then c(bX,bY)end return bY end function bQ:Keybind(bW,bX)local bY,bZ={Settings=
bW,IgnoreConfig=false,Class='Keybind'},Instance.new'Frame'bZ.Name='Keybind'bZ.
AutomaticSize=Enum.AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(0,0,0)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Size=UDim2.new(1,0,0,38)bZ.Parent=bR local b_=Instance.new'TextLabel'b_.
Name='KeybindName'b_.FontFace=Font.new(p.interFont)b_.Text=bY.Settings.Name b_.
RichText=true b_.TextColor3=Color3.fromRGB(255,255,255)b_.TextSize=13 b_.
TextTransparency=0.5 b_.TextTruncate=Enum.TextTruncate.AtEnd b_.TextXAlignment=
Enum.TextXAlignment.Left b_.TextYAlignment=Enum.TextYAlignment.Top b_.
AnchorPoint=Vector2.new(0,0.5)b_.AutomaticSize=Enum.AutomaticSize.XY b_.
BackgroundColor3=Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Position=UDim2.
fromScale(0,0.5)b_.Parent=bZ local b0=Instance.new'TextBox'b0.Name='BinderBox'b0
.CursorPosition=-1 b0.FontFace=Font.new(p.interFont)b0.PlaceholderText='...'b0.
Text=''b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=12 b0.
TextTransparency=0.1 b0.AnchorPoint=Vector2.new(1,0.5)b0.AutomaticSize=Enum.
AutomaticSize.X b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=0.95 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.ClipsDescendants=true b0.LayoutOrder=1 b0.Position=UDim2.
fromScale(1,0.5)b0.Size=UDim2.fromOffset(21,21)local b1=Instance.new'UICorner'b1
.Name='BinderBoxUICorner'b1.CornerRadius=UDim.new(0,4)b1.Parent=b0 local b2=
Instance.new'UIStroke'b2.Name='BinderBoxUIStroke'b2.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border b2.Color=Color3.fromRGB(255,255,255)b2.Transparency=0.9
b2.Parent=b0 local b3=Instance.new'UIPadding'b3.Name='BinderBoxUIPadding'b3.
PaddingLeft=UDim.new(0,5)b3.PaddingRight=UDim.new(0,5)b3.Parent=b0 local b4=
Instance.new'UISizeConstraint'b4.Name='BinderBoxUISizeConstraint'b4.Parent=b0 b0
.Parent=bZ local b5,b6,b7,b8=false,false,(bY.Settings.Default)local b9=function(
)b8=false b5=false b0:ReleaseFocus()end if b7 then b0.Text=b7.Name end b0.
Focused:Connect(function()b8=true end)b0.FocusLost:Connect(function()b8=false
end)h.InputBegan:Connect(function(ca)if b8 and not b5 then b5=true local cb cb=h
.InputBegan:Connect(function(cc)if bY.Settings.Blacklist and(table.find(bY.
KeybindFunctions.Settings.Blacklist,cc.KeyCode)or table.find(bY.Settings.
Blacklist,cc.UserInputType))then b0:ReleaseFocus()b9()cb:Disconnect()return end
if cc.UserInputType==Enum.UserInputType.Keyboard then b7=cc.KeyCode b0.Text=cc.
KeyCode.Name elseif cc.UserInputType==Enum.UserInputType.MouseButton1 or cc.
UserInputType==Enum.UserInputType.MouseButton2 then b7=cc.UserInputType b0.Text=
cc.UserInputType.Name end if bY.Settings.onBinded then bY.Settings.onBinded(b7)
end b6=true b9()cb:Disconnect()end)else if not b6 and(ca.KeyCode==b7 or ca.
UserInputType==b7)then if bY.Settings.Callback then bY.Settings.Callback(b7)end
if bY.Settings.onBindHeld then bY.Settings.onBindHeld(true,b7)end else b6=false
end end end)h.InputEnded:Connect(function(ca)if not b8 and not b5 then if ca.
KeyCode==b7 or ca.UserInputType==b7 then if bW.onBindHeld then bW.onBindHeld(
false,b7)end end end end)function bY:Bind(ca)b7=ca b0.Text=ca.Name end function
bY:Unbind()b7=nil b0.Text=''end function bY:GetBind()return b7 end function bY:
UpdateName(ca)b_=ca end function bY:SetVisibility(ca)bZ.Visible=ca end if bX
then c(bX,bY)end return bY end function bQ:Dropdown(bW,bX)local bY,bZ,b_,b0={
Settings=bW,IgnoreConfig=false,Class='Dropdown'},{},{},Instance.new'Frame'b0.
Name='Dropdown'b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=0.985 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.Size=UDim2.new(1,0,0,38)b0.Parent=bR b0.ClipsDescendants=
true local b1=Instance.new'UIPadding'b1.Name='DropdownUIPadding'b1.PaddingLeft=
UDim.new(0,15)b1.PaddingRight=UDim.new(0,15)b1.Parent=b0 local b2=Instance.new
'TextButton'b2.Name='Interact'b2.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b2.Text=''b2.TextColor3=Color3.
fromRGB(0,0,0)b2.TextSize=14 b2.BackgroundColor3=Color3.fromRGB(255,255,255)b2.
BackgroundTransparency=1 b2.BorderColor3=Color3.fromRGB(0,0,0)b2.BorderSizePixel
=0 b2.Size=UDim2.new(1,0,0,38)b2.Parent=b0 local b3=Instance.new'TextLabel'b3.
Name='DropdownName'b3.FontFace=Font.new(p.interFont)b3.Text=bW.Default and(bY.
Settings.Name..' \u{2022} '..table.concat(bZ,', '))or(bY.Settings.Name..'...')b3
.RichText=true b3.TextColor3=Color3.fromRGB(255,255,255)b3.TextSize=13 b3.
TextTransparency=0.5 b3.TextTruncate=Enum.TextTruncate.SplitWord b3.
TextXAlignment=Enum.TextXAlignment.Left b3.AutomaticSize=Enum.AutomaticSize.Y b3
.BackgroundColor3=Color3.fromRGB(255,255,255)b3.BackgroundTransparency=1 b3.
BorderColor3=Color3.fromRGB(0,0,0)b3.BorderSizePixel=0 b3.Size=UDim2.new(1,-20,0
,38)b3.Parent=b0 local b4=Instance.new'UIStroke'b4.Name='DropdownUIStroke'b4.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border b4.Color=Color3.fromRGB(255,255,255)
b4.Transparency=0.95 b4.Parent=b0 local b5=Instance.new'UICorner'b5.Name=
'DropdownUICorner'b5.CornerRadius=UDim.new(0,6)b5.Parent=b0 local b6=Instance.
new'ImageLabel'b6.Name='DropdownImage'b6.Image=p.dropdown b6.ImageTransparency=
0.5 b6.AnchorPoint=Vector2.new(1,0)b6.BackgroundColor3=Color3.fromRGB(255,255,
255)b6.BackgroundTransparency=1 b6.BorderColor3=Color3.fromRGB(0,0,0)b6.
BorderSizePixel=0 b6.Position=UDim2.new(1,0,0,12)b6.Size=UDim2.fromOffset(14,14)
b6.Parent=b0 local b7=Instance.new'Frame'b7.Name='DropdownFrame'b7.
BackgroundColor3=Color3.fromRGB(255,255,255)b7.BackgroundTransparency=1 b7.
BorderColor3=Color3.fromRGB(0,0,0)b7.BorderSizePixel=0 b7.ClipsDescendants=true
b7.Size=UDim2.fromScale(1,1)b7.Visible=false b7.AutomaticSize=Enum.AutomaticSize
.Y local b8=Instance.new'UIPadding'b8.Name='DropdownFrameUIPadding'b8.PaddingTop
=UDim.new(0,38)b8.PaddingBottom=UDim.new(0,10)b8.Parent=b7 local b9=Instance.new
'UIListLayout'b9.Name='DropdownFrameUIListLayout'b9.Padding=UDim.new(0,5)b9.
SortOrder=Enum.SortOrder.LayoutOrder b9.Parent=b7 local ca=Instance.new'Frame'ca
.Name='Search'ca.BackgroundColor3=Color3.fromRGB(255,255,255)ca.
BackgroundTransparency=0.95 ca.BorderColor3=Color3.fromRGB(0,0,0)ca.
BorderSizePixel=0 ca.LayoutOrder=-1 ca.Size=UDim2.new(1,0,0,30)ca.Parent=b7 ca.
Visible=bY.Settings.Search local cb=Instance.new'UICorner'cb.Name=
'SectionUICorner'cb.Parent=ca local cc=Instance.new'ImageLabel'cc.Name=
'SearchIcon'cc.Image=p.searchIcon cc.ImageColor3=Color3.fromRGB(180,180,180)cc.
AnchorPoint=Vector2.new(0,0.5)cc.BackgroundColor3=Color3.fromRGB(255,255,255)cc.
BackgroundTransparency=1 cc.BorderColor3=Color3.fromRGB(0,0,0)cc.BorderSizePixel
=0 cc.Position=UDim2.fromScale(0,0.5)cc.Size=UDim2.fromOffset(12,12)cc.Parent=ca
local cd=Instance.new'UIPadding'cd.Name='UIPadding'cd.PaddingLeft=UDim.new(0,15)
cd.Parent=ca local ce=Instance.new'TextBox'ce.Name='SearchBox'ce.CursorPosition=
-1 ce.FontFace=Font.new(p.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal
)ce.PlaceholderColor3=Color3.fromRGB(150,150,150)ce.PlaceholderText='Search...'
ce.Text=''ce.TextColor3=Color3.fromRGB(200,200,200)ce.TextSize=14 ce.
TextXAlignment=Enum.TextXAlignment.Left ce.BackgroundColor3=Color3.fromRGB(255,
255,255)ce.BackgroundTransparency=1 ce.BorderColor3=Color3.fromRGB(0,0,0)ce.
BorderSizePixel=0 ce.Size=UDim2.fromScale(1,1)local cf=function()local cf,cg,ch=
0,0,b8.PaddingTop.Offset+b8.PaddingBottom.Offset for ci,cj in pairs(b7:
GetChildren())do if not cj:IsA'UIComponent'and cj.Visible then cf+=cj.
AbsoluteSize.Y cg+=1 end end local ci=b9.Padding.Offset*(cg-1)return cf+ci+ch
end local cg=function()local cg=ce.Text:lower()for ch,ci in pairs(b_)do local cj
=ci.NameLabel.Text:lower()local ck=string.find(cj,cg)~=nil if ci.Button.Visible
~=ck then ci.Button.Visible=ck end end b0.Size=UDim2.new(1,0,0,cf())end ce:
GetPropertyChangedSignal'Text':Connect(cg)local ch=Instance.new'UIPadding'ch.
Name='UIPadding'ch.PaddingLeft=UDim.new(0,23)ch.Parent=ce ce.Parent=ca local ci=
{duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-13,waitTime=1}local
cj,ck,cl=function(cj,ck)local cl=b_[cj]if not cl then return end local cm,cn=cl.
Checkmark,cl.NameLabel if ck then if bY.Settings.Multi then if not table.find(bZ
,cj)then table.insert(bZ,cj)bY.Value=bZ end else for co,cp in pairs(b_)do if co
~=cj then w(cp.Checkmark,TweenInfo.new(ci.duration,ci.easingStyle),{Size=UDim2.
new(cp.Checkmark.Size.X.Scale,ci.checkSizeDecrease,cp.Checkmark.Size.Y.Scale,cp.
Checkmark.Size.Y.Offset)}):Play()w(cp.NameLabel,TweenInfo.new(ci.duration,ci.
easingStyle),{TextTransparency=ci.transparencyOut}):Play()cp.Checkmark.
TextTransparency=1 end end bZ={cj}bY.Value=bZ[1]end w(cm,TweenInfo.new(ci.
duration,ci.easingStyle),{Size=UDim2.new(cm.Size.X.Scale,ci.checkSizeIncrease,cm
.Size.Y.Scale,cm.Size.Y.Offset)}):Play()w(cn,TweenInfo.new(ci.duration,ci.
easingStyle),{TextTransparency=ci.transparencyIn}):Play()cm.TextTransparency=0
else if bY.Settings.Multi then local co=table.find(bZ,cj)if co then table.
remove(bZ,co)end else bZ={}end w(cm,TweenInfo.new(ci.duration,ci.easingStyle),{
Size=UDim2.new(cm.Size.X.Scale,ci.checkSizeDecrease,cm.Size.Y.Scale,cm.Size.Y.
Offset)}):Play()w(cn,TweenInfo.new(ci.duration,ci.easingStyle),{TextTransparency
=ci.transparencyOut}):Play()cm.TextTransparency=1 end if bW.Required and#bZ==0
and not ck then return end if#bZ>0 then b3.Text=bY.Settings.Name..' \u{2022} '..
table.concat(bZ,', ')else b3.Text=bY.Settings.Name..'...'end end,false,false
local cm=function()if cl then return end cl=true local cm,cn=38,not ck local co=
cn and UDim2.new(1,0,0,cf())or UDim2.new(1,0,0,cm)local cp,cq=w(b0,TweenInfo.
new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=co}),w(b6,
TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=cn
and-90 or 0})cp:Play()cq:Play()if cn then b7.Visible=true cp.Completed:Connect(
function()cl=false end)else cp.Completed:Connect(function()b7.Visible=false cl=
false end)end ck=cn end b2.MouseButton1Click:Connect(cm)local cn=function(cn,co)
local cp=Instance.new'TextButton'cp.Name='Option'cp.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'cp.Text=''cp.TextColor3=Color3.
fromRGB(0,0,0)cp.TextSize=14 cp.BackgroundColor3=Color3.fromRGB(255,255,255)cp.
BackgroundTransparency=1 cp.BorderColor3=Color3.fromRGB(0,0,0)cp.BorderSizePixel
=0 cp.Size=UDim2.new(1,0,0,30)local cq=Instance.new'UIPadding'cq.Name=
'OptionUIPadding'cq.PaddingLeft=UDim.new(0,15)cq.Parent=cp local cr=Instance.new
'TextLabel'cr.Name='OptionName'cr.FontFace=Font.new(p.interFont)cr.Text=co cr.
RichText=true cr.TextColor3=Color3.fromRGB(255,255,255)cr.TextSize=13 cr.
TextTransparency=0.5 cr.TextTruncate=Enum.TextTruncate.AtEnd cr.TextXAlignment=
Enum.TextXAlignment.Left cr.TextYAlignment=Enum.TextYAlignment.Top cr.
AnchorPoint=Vector2.new(0,0.5)cr.AutomaticSize=Enum.AutomaticSize.XY cr.
BackgroundColor3=Color3.fromRGB(255,255,255)cr.BackgroundTransparency=1 cr.
BorderColor3=Color3.fromRGB(0,0,0)cr.BorderSizePixel=0 cr.Position=UDim2.
fromScale(1.3e-7,0.5)cr.Parent=cp local cs=Instance.new'UIListLayout'cs.Name=
'OptionUIListLayout'cs.Padding=UDim.new(0,10)cs.FillDirection=Enum.FillDirection
.Horizontal cs.SortOrder=Enum.SortOrder.LayoutOrder cs.VerticalAlignment=Enum.
VerticalAlignment.Center cs.Parent=cp local ct=Instance.new'TextLabel'ct.Name=
'Checkmark'ct.FontFace=Font.new(p.interFont)ct.Text='\u{2713}'ct.TextColor3=
Color3.fromRGB(255,255,255)ct.TextSize=13 ct.TextTransparency=1 ct.
TextXAlignment=Enum.TextXAlignment.Left ct.TextYAlignment=Enum.TextYAlignment.
Top ct.AnchorPoint=Vector2.new(0,0.5)ct.AutomaticSize=Enum.AutomaticSize.Y ct.
BackgroundColor3=Color3.fromRGB(255,255,255)ct.BackgroundTransparency=1 ct.
BorderColor3=Color3.fromRGB(0,0,0)ct.BorderSizePixel=0 ct.LayoutOrder=-1 ct.
Position=UDim2.fromScale(1.3e-7,0.5)ct.Size=UDim2.fromOffset(-10,0)ct.Parent=cp
cp.Parent=b7 b7.Parent=b0 b_[co]={Index=cn,Button=cp,NameLabel=cr,Checkmark=ct}
local cu={duration=0.2,easingStyle=Enum.EasingStyle.Quint,transparencyIn=0.2,
transparencyOut=0.5,checkSizeIncrease=12,checkSizeDecrease=-cs.Padding.Offset,
waitTime=1}local cv,cw={checkIn=w(ct,TweenInfo.new(cu.duration,cu.easingStyle),{
Size=UDim2.new(ct.Size.X.Scale,cu.checkSizeIncrease,ct.Size.Y.Scale,ct.Size.Y.
Offset)}),checkOut=w(ct,TweenInfo.new(cu.duration,cu.easingStyle),{Size=UDim2.
new(ct.Size.X.Scale,cu.checkSizeDecrease,ct.Size.Y.Scale,ct.Size.Y.Offset)}),
nameIn=w(cr,TweenInfo.new(cu.duration,cu.easingStyle),{TextTransparency=cu.
transparencyIn}),nameOut=w(cr,TweenInfo.new(cu.duration,cu.easingStyle),{
TextTransparency=cu.transparencyOut})},false if bY.Settings.Default then if bY.
Settings.Multi then cw=table.find(bY.Settings.Default,co)and true or false else
cw=(bY.Settings.Default==cn or bY.Settings.Default==co)and true or false end end
cj(co,cw)if cw and not bY.Settings.Multi then bY.Value=co end local cx=b_[co].
Button cx.MouseButton1Click:Connect(function()local cy=table.find(bZ,co)and true
or false local cz=not cy if bY.Settings.Required and not cz and#bZ<=1 then
return end cj(co,cz)task.spawn(function()if bY.Settings.Multi then local cA={}
for cB,cC in ipairs(bZ)do cA[cC]=true end if bY.Settings.Callback then bY.
Settings.Callback(cA)end else if cz and bY.Settings.Callback then bY.Settings.
Callback(bZ[1]or nil)end end end)end)if ck then b0.Size=UDim2.new(1,0,0,cf())end
end if bY.Settings.Options then for co,cq in pairs(bY.Settings.Options)do cn(co,
cq)end end function bY:UpdateName(co)b3.Text=co end function bY:SetVisibility(co
)b0.Visible=co end function bY:UpdateSelection(co)if not co then return end for
cq,cr in pairs(b_)do cj(cq,false)end local cq={}if type(co)=='number'then for cr
,cs in pairs(b_)do local ct=cs.Index==co cj(cr,ct)if ct then table.insert(cq,cr)
end end elseif type(co)=='string'then for cr,cs in pairs(b_)do local ct=cr==co
cj(cr,ct)if ct then table.insert(cq,cr)end end elseif type(co)=='table'then for
cr,cs in pairs(b_)do local ct=table.find(co,cr)~=nil cj(cr,ct)if ct then table.
insert(cq,cr)end end end if bY.Settings.Callback then if bY.Settings.Multi then
local cr={}for cs,ct in ipairs(cq)do cr[ct]=true end bY.Settings.Callback(cr)
else bY.Settings.Callback(cq[1]or nil)end end end function bY:InsertOptions(co)
if not co then return end bY.Settings.Options=co for cq,cr in pairs(co)do cn(cq,
cr)end end function bY:ClearOptions()for co,cq in pairs(b_)do cq.Button:Destroy(
)end b_={}bZ={}if ck then b0.Size=UDim2.new(1,0,0,cf())end end function bY:
GetOptions()local co={}for cq,cr in pairs(b_)do local cs=table.find(bZ,cq)and
true or false co[cq]=cs end return co end function bY:RemoveOptions(co)if not co
then return end for cq,cr in ipairs(co)do local cs=b_[cr]if cs then for ct=#bZ,1
,-1 do if bZ[ct]==cr then table.remove(bZ,ct)end end cs.Button:Destroy()b_[cr]=
nil end end if ck then b0.Size=UDim2.new(1,0,0,cf())end end function bY:IsOption
(co)if not co then return end return b_[co]~=nil end if bX then c(bX,bY)end
return bY end function bQ:Colorpicker(bW,bX)local bY={Settings=bW,IgnoreConfig=
false,Class='Colorpicker'}local bZ=bY.Settings.Alpha and true or false bY.Color=
bY.Settings.Default bY.Alpha=bZ and bY.Settings.Alpha local b_=Instance.new
'Frame'b_.Name='Colorpicker'b_.AutomaticSize=Enum.AutomaticSize.Y b_.
BackgroundColor3=Color3.fromRGB(0,0,0)b_.BackgroundTransparency=1 b_.
BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Size=UDim2.new(1,0,0,
38)b_.Parent=bR local b0=Instance.new'TextLabel'b0.Name='KeybindName'b0.FontFace
=Font.new(p.interFont)b0.Text=bW.Name b0.TextColor3=Color3.fromRGB(255,255,255)
b0.TextSize=13 b0.TextTransparency=0.5 b0.RichText=true b0.TextTruncate=Enum.
TextTruncate.AtEnd b0.TextXAlignment=Enum.TextXAlignment.Left b0.TextYAlignment=
Enum.TextYAlignment.Top b0.AnchorPoint=Vector2.new(0,0.5)b0.AutomaticSize=Enum.
AutomaticSize.XY b0.BackgroundColor3=Color3.fromRGB(255,255,255)b0.
BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.BorderSizePixel
=0 b0.Position=UDim2.fromScale(0,0.5)b0.Parent=b_ local b1=Instance.new
'ImageLabel'b1.Name='NewColor'b1.Image=p.grid b1.ScaleType=Enum.ScaleType.Tile
b1.TileSize=UDim2.fromOffset(500,500)b1.AnchorPoint=Vector2.new(1,0.5)b1.
BackgroundColor3=Color3.fromRGB(255,255,255)b1.BackgroundTransparency=1 b1.
BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel=0 b1.Position=UDim2.
fromScale(1,0.5)b1.Size=UDim2.fromOffset(21,21)local b2=Instance.new'Frame'b2.
Name='Color'b2.AnchorPoint=Vector2.new(0.5,0.5)b2.BackgroundColor3=bY.Color b2.
BorderSizePixel=0 b2.Position=UDim2.fromScale(0.5,0.5)b2.Size=UDim2.fromScale(1,
1)b2.BackgroundTransparency=bY.Alpha or 0 local b3=Instance.new'UICorner'b3.Name
='UICorner'b3.CornerRadius=UDim.new(0,6)b3.Parent=b2 local b4=Instance.new
'TextButton'b4.Name='Interact'b4.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'b4.Text=''b4.TextColor3=Color3.
fromRGB(0,0,0)b4.TextSize=14 b4.BackgroundColor3=Color3.fromRGB(255,255,255)b4.
BackgroundTransparency=1 b4.BorderColor3=Color3.fromRGB(0,0,0)b4.BorderSizePixel
=0 b4.Size=UDim2.fromScale(1,1)b4.Parent=b2 b2.Parent=b1 local b5=Instance.new
'UICorner'b5.Name='UICorner'b5.CornerRadius=UDim.new(0,8)b5.Parent=b1 b1.Parent=
b_ local b6=Instance.new'Frame'b6.Name='ColorPicker'b6.BackgroundColor3=Color3.
fromRGB(0,0,0)b6.BackgroundTransparency=0.5 b6.BorderColor3=Color3.fromRGB(0,0,0
)b6.BorderSizePixel=0 b6.Size=UDim2.fromScale(1,1)b6.Visible=false local b7=
Instance.new'UICorner'b7.Name='BaseUICorner'b7.CornerRadius=UDim.new(0,10)b7.
Parent=b6 local b8=Instance.new'Frame'b8.Name='Prompt'b8.AnchorPoint=Vector2.
new(0.5,0.5)b8.AutomaticSize=Enum.AutomaticSize.Y b8.BackgroundColor3=Color3.
fromRGB(15,15,15)b8.BorderColor3=Color3.fromRGB(0,0,0)b8.BorderSizePixel=0 b8.
Position=UDim2.fromScale(0.5,0.5)b8.Size=UDim2.fromOffset(420,0)local b9=
Instance.new'UIScale'b9.Name='BaseUIScale'b9.Parent=b8 b9.Scale=0.95 local ca=
Instance.new'UIStroke'ca.Name='GlobalSettingsUIStroke'ca.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border ca.Color=Color3.fromRGB(255,255,255)ca.Transparency=0.9
ca.Parent=b8 local cb=Instance.new'UICorner'cb.Name='GlobalSettingsUICorner'cb.
CornerRadius=UDim.new(0,10)cb.Parent=b8 local cc=Instance.new'UIListLayout'cc.
Name='UIListLayout'cc.Padding=UDim.new(0,10)cc.HorizontalAlignment=Enum.
HorizontalAlignment.Center cc.SortOrder=Enum.SortOrder.LayoutOrder cc.Parent=b8
local cd=Instance.new'Frame'cd.Name='ColorOptions'cd.AutomaticSize=Enum.
AutomaticSize.XY cd.BackgroundColor3=Color3.fromRGB(255,255,255)cd.
BackgroundTransparency=1 cd.BorderColor3=Color3.fromRGB(0,0,0)cd.BorderSizePixel
=0 cd.LayoutOrder=1 cd.Size=UDim2.fromScale(1,0)local ce=Instance.new
'TextButton'ce.Name='Value'ce.FontFace=Font.new
'rbxasset://fonts/families/SourceSansPro.json'ce.Text=''ce.TextColor3=Color3.
fromRGB(0,0,0)ce.TextSize=14 ce.AutoButtonColor=false ce.BackgroundColor3=Color3
.fromRGB(255,255,255)ce.BorderColor3=Color3.fromRGB(0,0,0)ce.BorderSizePixel=0
ce.LayoutOrder=1 ce.Position=UDim2.fromScale(0.092,0.886)ce.Size=UDim2.new(1,0,0
,15)local cf=Instance.new'UIGradient'cf.Name='UIGradient'cf.Color=ColorSequence.
new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cf.Parent=ce local cg=
Instance.new'Frame'cg.Name='Slide'cg.AnchorPoint=Vector2.new(0,0.5)cg.
BackgroundColor3=Color3.fromRGB(255,255,255)cg.BorderColor3=Color3.fromRGB(27,42
,53)cg.BorderSizePixel=0 cg.Position=UDim2.fromScale(0,0.5)cg.Size=UDim2.new(0,
13,1,8)local ch=Instance.new'UICorner'ch.Name='UICorner'ch.CornerRadius=UDim.
new(1,0)ch.Parent=cg local ci=Instance.new'UIStroke'ci.Name='UIStroke'ci.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border ci.Transparency=0.5 ci.Parent=cg cg.
Parent=ce local cj=Instance.new'UICorner'cj.Name='UICorner'cj.CornerRadius=UDim.
new(0,6)cj.Parent=ce local ck=Instance.new'UIStroke'ck.Name='UIStroke'ck.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border ck.Color=Color3.fromRGB(255,255,255)
ck.Transparency=0.9 local cl=Instance.new'UIGradient'cl.Name='UIGradient'cl.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0))}cl.Rotation=180 cl.Parent=ck
ck.Parent=ce ce.Parent=cd local cm=Instance.new'UIListLayout'cm.Name=
'UIListLayout'cm.Padding=UDim.new(0,25)cm.SortOrder=Enum.SortOrder.LayoutOrder
cm.Parent=cd local cn=Instance.new'Frame'cn.Name='Wheel'cn.AutomaticSize=Enum.
AutomaticSize.Y cn.BackgroundColor3=Color3.fromRGB(255,255,255)cn.
BackgroundTransparency=1 cn.BorderColor3=Color3.fromRGB(0,0,0)cn.BorderSizePixel
=0 cn.Size=UDim2.new(1,0,0,100)local co=Instance.new'ImageButton'co.Name='Wheel'
co.Image=p.colorWheel co.AutoButtonColor=false co.Active=false co.
BackgroundColor3=Color3.fromRGB(248,248,248)co.BackgroundTransparency=1 co.
BorderColor3=Color3.fromRGB(27,42,53)co.Selectable=false co.Size=UDim2.
fromOffset(220,220)co.SizeConstraint=Enum.SizeConstraint.RelativeYY local cq=
Instance.new'ImageLabel'cq.Name='Target'cq.Image=p.colorTarget cq.ImageColor3=
Color3.fromRGB(0,0,0)cq.AnchorPoint=Vector2.new(0.5,0.5)cq.BackgroundColor3=
Color3.fromRGB(255,255,255)cq.BackgroundTransparency=1 cq.BorderColor3=Color3.
fromRGB(27,42,53)cq.Position=UDim2.fromScale(0.5,0.5)cq.Size=UDim2.fromOffset(22
,22)cq.SizeConstraint=Enum.SizeConstraint.RelativeYY cq.Parent=co co.Parent=cn
local cr=Instance.new'Frame'cr.Name='Inputs'cr.AnchorPoint=Vector2.new(1,0.5)cr.
AutomaticSize=Enum.AutomaticSize.XY cr.BackgroundColor3=Color3.fromRGB(255,255,
255)cr.BackgroundTransparency=1 cr.BorderColor3=Color3.fromRGB(0,0,0)cr.
BorderSizePixel=0 cr.LayoutOrder=1 cr.Position=UDim2.fromScale(1,0.5)local cs=
Instance.new'UIListLayout'cs.Name='UIListLayout'cs.Padding=UDim.new(0,5)cs.
SortOrder=Enum.SortOrder.LayoutOrder cs.Parent=cr local ct=Instance.new'Frame'ct
.Name='Red'ct.AutomaticSize=Enum.AutomaticSize.XY ct.BackgroundColor3=Color3.
fromRGB(0,0,0)ct.BackgroundTransparency=1 ct.BorderColor3=Color3.fromRGB(0,0,0)
ct.BorderSizePixel=0 ct.LayoutOrder=1 ct.Size=UDim2.fromOffset(0,38)local cu=
Instance.new'TextLabel'cu.Name='InputName'cu.FontFace=Font.new(p.interFont)cu.
Text='Red'cu.TextColor3=Color3.fromRGB(255,255,255)cu.TextSize=13 cu.
TextTransparency=0.5 cu.TextTruncate=Enum.TextTruncate.AtEnd cu.TextXAlignment=
Enum.TextXAlignment.Left cu.TextYAlignment=Enum.TextYAlignment.Top cu.
AnchorPoint=Vector2.new(0,0.5)cu.AutomaticSize=Enum.AutomaticSize.XY cu.
BackgroundColor3=Color3.fromRGB(255,255,255)cu.BackgroundTransparency=1 cu.
BorderColor3=Color3.fromRGB(0,0,0)cu.BorderSizePixel=0 cu.LayoutOrder=2 cu.
Position=UDim2.fromScale(0,0.5)cu.Parent=ct local cv=Instance.new'UIListLayout'
cv.Name='UIListLayout'cv.Padding=UDim.new(0,15)cv.FillDirection=Enum.
FillDirection.Horizontal cv.SortOrder=Enum.SortOrder.LayoutOrder cv.
VerticalAlignment=Enum.VerticalAlignment.Center cv.Parent=ct local cw=Instance.
new'TextBox'cw.Name='InputBox'cw.ClearTextOnFocus=false cw.CursorPosition=-1 cw.
FontFace=Font.new(p.interFont)cw.Text='255'cw.TextColor3=Color3.fromRGB(255,255,
255)cw.TextSize=12 cw.TextTransparency=0.1 cw.TextXAlignment=Enum.TextXAlignment
.Left cw.AnchorPoint=Vector2.new(1,0.5)cw.BackgroundColor3=Color3.fromRGB(255,
255,255)cw.BackgroundTransparency=0.95 cw.BorderColor3=Color3.fromRGB(0,0,0)cw.
BorderSizePixel=0 cw.ClipsDescendants=true cw.LayoutOrder=1 cw.Position=UDim2.
fromScale(1,0.5)cw.Size=UDim2.fromOffset(75,25)local cx=Instance.new'UICorner'cx
.Name='InputBoxUICorner'cx.CornerRadius=UDim.new(0,4)cx.Parent=cw local cy=
Instance.new'UIStroke'cy.Name='InputBoxUIStroke'cy.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cy.Color=Color3.fromRGB(255,255,255)cy.Transparency=0.9
cy.Parent=cw local cz=Instance.new'UISizeConstraint'cz.Name=
'InputBoxUISizeConstraint'cz.Parent=cw local cA=Instance.new'UIPadding'cA.Name=
'InputBoxUIPadding'cA.PaddingLeft=UDim.new(0,8)cA.PaddingRight=UDim.new(0,10)cA.
Parent=cw cw.Parent=ct ct.Parent=cr local cB=Instance.new'Frame'cB.Name='Green'
cB.AutomaticSize=Enum.AutomaticSize.XY cB.BackgroundColor3=Color3.fromRGB(0,0,0)
cB.BackgroundTransparency=1 cB.BorderColor3=Color3.fromRGB(0,0,0)cB.
BorderSizePixel=0 cB.LayoutOrder=2 cB.Size=UDim2.fromOffset(0,38)local cC=
Instance.new'TextLabel'cC.Name='InputName'cC.FontFace=Font.new(p.interFont)cC.
Text='Green'cC.TextColor3=Color3.fromRGB(255,255,255)cC.TextSize=13 cC.
TextTransparency=0.5 cC.TextTruncate=Enum.TextTruncate.AtEnd cC.TextXAlignment=
Enum.TextXAlignment.Left cC.TextYAlignment=Enum.TextYAlignment.Top cC.
AnchorPoint=Vector2.new(0,0.5)cC.AutomaticSize=Enum.AutomaticSize.XY cC.
BackgroundColor3=Color3.fromRGB(255,255,255)cC.BackgroundTransparency=1 cC.
BorderColor3=Color3.fromRGB(0,0,0)cC.BorderSizePixel=0 cC.LayoutOrder=2 cC.
Position=UDim2.fromScale(0,0.5)cC.Parent=cB local cD=Instance.new'UIListLayout'
cD.Name='UIListLayout'cD.Padding=UDim.new(0,15)cD.FillDirection=Enum.
FillDirection.Horizontal cD.SortOrder=Enum.SortOrder.LayoutOrder cD.
VerticalAlignment=Enum.VerticalAlignment.Center cD.Parent=cB local cE=Instance.
new'TextBox'cE.Name='InputBox'cE.ClearTextOnFocus=false cE.FontFace=Font.new(p.
interFont)cE.Text='255'cE.TextColor3=Color3.fromRGB(255,255,255)cE.TextSize=12
cE.TextTransparency=0.1 cE.TextXAlignment=Enum.TextXAlignment.Left cE.
AnchorPoint=Vector2.new(1,0.5)cE.BackgroundColor3=Color3.fromRGB(255,255,255)cE.
BackgroundTransparency=0.95 cE.BorderColor3=Color3.fromRGB(0,0,0)cE.
BorderSizePixel=0 cE.ClipsDescendants=true cE.LayoutOrder=1 cE.Position=UDim2.
fromScale(1,0.5)cE.Size=UDim2.fromOffset(75,25)local cF=Instance.new'UICorner'cF
.Name='InputBoxUICorner'cF.CornerRadius=UDim.new(0,4)cF.Parent=cE local cG=
Instance.new'UIStroke'cG.Name='InputBoxUIStroke'cG.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cG.Color=Color3.fromRGB(255,255,255)cG.Transparency=0.9
cG.Parent=cE local cH=Instance.new'UISizeConstraint'cH.Name=
'InputBoxUISizeConstraint'cH.Parent=cE local cI=Instance.new'UIPadding'cI.Name=
'InputBoxUIPadding'cI.PaddingLeft=UDim.new(0,8)cI.PaddingRight=UDim.new(0,10)cI.
Parent=cE cE.Parent=cB cB.Parent=cr local cJ=Instance.new'Frame'cJ.Name='Blue'cJ
.AutomaticSize=Enum.AutomaticSize.XY cJ.BackgroundColor3=Color3.fromRGB(0,0,0)cJ
.BackgroundTransparency=1 cJ.BorderColor3=Color3.fromRGB(0,0,0)cJ.
BorderSizePixel=0 cJ.LayoutOrder=3 cJ.Size=UDim2.fromOffset(0,38)local cK=
Instance.new'TextLabel'cK.Name='InputName'cK.FontFace=Font.new(p.interFont)cK.
Text='Blue'cK.TextColor3=Color3.fromRGB(255,255,255)cK.TextSize=13 cK.
TextTransparency=0.5 cK.TextTruncate=Enum.TextTruncate.AtEnd cK.TextXAlignment=
Enum.TextXAlignment.Left cK.TextYAlignment=Enum.TextYAlignment.Top cK.
AnchorPoint=Vector2.new(0,0.5)cK.AutomaticSize=Enum.AutomaticSize.XY cK.
BackgroundColor3=Color3.fromRGB(255,255,255)cK.BackgroundTransparency=1 cK.
BorderColor3=Color3.fromRGB(0,0,0)cK.BorderSizePixel=0 cK.LayoutOrder=2 cK.
Position=UDim2.fromScale(0,0.5)cK.Parent=cJ local cL=Instance.new'UIListLayout'
cL.Name='UIListLayout'cL.Padding=UDim.new(0,15)cL.FillDirection=Enum.
FillDirection.Horizontal cL.SortOrder=Enum.SortOrder.LayoutOrder cL.
VerticalAlignment=Enum.VerticalAlignment.Center cL.Parent=cJ local cM=Instance.
new'TextBox'cM.Name='InputBox'cM.ClearTextOnFocus=false cM.FontFace=Font.new(p.
interFont)cM.Text='255'cM.TextColor3=Color3.fromRGB(255,255,255)cM.TextSize=12
cM.TextTransparency=0.1 cM.TextXAlignment=Enum.TextXAlignment.Left cM.
AnchorPoint=Vector2.new(1,0.5)cM.BackgroundColor3=Color3.fromRGB(255,255,255)cM.
BackgroundTransparency=0.95 cM.BorderColor3=Color3.fromRGB(0,0,0)cM.
BorderSizePixel=0 cM.ClipsDescendants=true cM.LayoutOrder=1 cM.Position=UDim2.
fromScale(1,0.5)cM.Size=UDim2.fromOffset(75,25)local cN=Instance.new'UICorner'cN
.Name='InputBoxUICorner'cN.CornerRadius=UDim.new(0,4)cN.Parent=cM local cO=
Instance.new'UIStroke'cO.Name='InputBoxUIStroke'cO.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cO.Color=Color3.fromRGB(255,255,255)cO.Transparency=0.9
cO.Parent=cM local cP=Instance.new'UISizeConstraint'cP.Name=
'InputBoxUISizeConstraint'cP.Parent=cM local cQ=Instance.new'UIPadding'cQ.Name=
'InputBoxUIPadding'cQ.PaddingLeft=UDim.new(0,8)cQ.PaddingRight=UDim.new(0,10)cQ.
Parent=cM cM.Parent=cJ cJ.Parent=cr local cR=Instance.new'Frame'cR.Name='Alpha'
cR.AutomaticSize=Enum.AutomaticSize.XY cR.BackgroundColor3=Color3.fromRGB(0,0,0)
cR.BackgroundTransparency=1 cR.BorderColor3=Color3.fromRGB(0,0,0)cR.
BorderSizePixel=0 cR.LayoutOrder=4 cR.Size=UDim2.fromOffset(0,38)cR.Visible=bZ
local cS=Instance.new'TextLabel'cS.Name='InputName'cS.FontFace=Font.new(p.
interFont)cS.Text='Alpha'cS.TextColor3=Color3.fromRGB(255,255,255)cS.TextSize=13
cS.TextTransparency=0.5 cS.TextTruncate=Enum.TextTruncate.AtEnd cS.
TextXAlignment=Enum.TextXAlignment.Left cS.TextYAlignment=Enum.TextYAlignment.
Top cS.AnchorPoint=Vector2.new(0,0.5)cS.AutomaticSize=Enum.AutomaticSize.XY cS.
BackgroundColor3=Color3.fromRGB(255,255,255)cS.BackgroundTransparency=1 cS.
BorderColor3=Color3.fromRGB(0,0,0)cS.BorderSizePixel=0 cS.LayoutOrder=2 cS.
Position=UDim2.fromScale(0,0.5)cS.Parent=cR local cT=Instance.new'UIListLayout'
cT.Name='UIListLayout'cT.Padding=UDim.new(0,15)cT.FillDirection=Enum.
FillDirection.Horizontal cT.SortOrder=Enum.SortOrder.LayoutOrder cT.
VerticalAlignment=Enum.VerticalAlignment.Center cT.Parent=cR local cU=Instance.
new'TextBox'cU.Name='InputBox'cU.ClearTextOnFocus=false cU.FontFace=Font.new(p.
interFont)cU.Text='0'cU.TextColor3=Color3.fromRGB(255,255,255)cU.TextSize=12 cU.
TextTransparency=0.1 cU.TextXAlignment=Enum.TextXAlignment.Left cU.AnchorPoint=
Vector2.new(1,0.5)cU.BackgroundColor3=Color3.fromRGB(255,255,255)cU.
BackgroundTransparency=0.95 cU.BorderColor3=Color3.fromRGB(0,0,0)cU.
BorderSizePixel=0 cU.ClipsDescendants=true cU.LayoutOrder=1 cU.Position=UDim2.
fromScale(1,0.5)cU.Size=UDim2.fromOffset(75,25)local cV=Instance.new'UICorner'cV
.Name='InputBoxUICorner'cV.CornerRadius=UDim.new(0,4)cV.Parent=cU local cW=
Instance.new'UIStroke'cW.Name='InputBoxUIStroke'cW.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border cW.Color=Color3.fromRGB(255,255,255)cW.Transparency=0.9
cW.Parent=cU local cX=Instance.new'UISizeConstraint'cX.Name=
'InputBoxUISizeConstraint'cX.Parent=cU local cY=Instance.new'UIPadding'cY.Name=
'InputBoxUIPadding'cY.PaddingLeft=UDim.new(0,8)cY.PaddingRight=UDim.new(0,10)cY.
Parent=cU cU.Parent=cR cR.Parent=cr local cZ=Instance.new'Frame'cZ.Name='Hex'cZ.
AutomaticSize=Enum.AutomaticSize.XY cZ.BackgroundColor3=Color3.fromRGB(0,0,0)cZ.
BackgroundTransparency=1 cZ.BorderColor3=Color3.fromRGB(0,0,0)cZ.BorderSizePixel
=0 cZ.Size=UDim2.fromOffset(0,38)local c_=Instance.new'TextLabel'c_.Name=
'InputName'c_.FontFace=Font.new(p.interFont)c_.Text='Hex'c_.TextColor3=Color3.
fromRGB(255,255,255)c_.TextSize=13 c_.TextTransparency=0.5 c_.TextTruncate=Enum.
TextTruncate.AtEnd c_.TextXAlignment=Enum.TextXAlignment.Left c_.TextYAlignment=
Enum.TextYAlignment.Top c_.AnchorPoint=Vector2.new(0,0.5)c_.AutomaticSize=Enum.
AutomaticSize.XY c_.BackgroundColor3=Color3.fromRGB(255,255,255)c_.
BackgroundTransparency=1 c_.BorderColor3=Color3.fromRGB(0,0,0)c_.BorderSizePixel
=0 c_.LayoutOrder=2 c_.Position=UDim2.fromScale(0,0.5)c_.Parent=cZ local c0=
Instance.new'UIListLayout'c0.Name='UIListLayout'c0.Padding=UDim.new(0,15)c0.
FillDirection=Enum.FillDirection.Horizontal c0.SortOrder=Enum.SortOrder.
LayoutOrder c0.VerticalAlignment=Enum.VerticalAlignment.Center c0.Parent=cZ
local c1=Instance.new'TextBox'c1.Name='InputBox'c1.ClearTextOnFocus=false c1.
CursorPosition=-1 c1.FontFace=Font.new(p.interFont)c1.Text='255'c1.TextColor3=
Color3.fromRGB(255,255,255)c1.TextSize=12 c1.TextTransparency=0.1 c1.
TextXAlignment=Enum.TextXAlignment.Left c1.AnchorPoint=Vector2.new(1,0.5)c1.
BackgroundColor3=Color3.fromRGB(255,255,255)c1.BackgroundTransparency=0.95 c1.
BorderColor3=Color3.fromRGB(0,0,0)c1.BorderSizePixel=0 c1.ClipsDescendants=true
c1.LayoutOrder=1 c1.Position=UDim2.fromScale(1,0.5)c1.Size=UDim2.fromOffset(75,
25)local c2=Instance.new'UICorner'c2.Name='InputBoxUICorner'c2.CornerRadius=UDim
.new(0,4)c2.Parent=c1 local c3=Instance.new'UIStroke'c3.Name='InputBoxUIStroke'
c3.ApplyStrokeMode=Enum.ApplyStrokeMode.Border c3.Color=Color3.fromRGB(255,255,
255)c3.Transparency=0.9 c3.Parent=c1 local c4=Instance.new'UISizeConstraint'c4.
Name='InputBoxUISizeConstraint'c4.Parent=c1 local c5=Instance.new'UIPadding'c5.
Name='InputBoxUIPadding'c5.PaddingLeft=UDim.new(0,8)c5.PaddingRight=UDim.new(0,
10)c5.Parent=c1 c1.Parent=cZ cZ.Parent=cr cr.Parent=cn local c6=Instance.new
'UIPadding'c6.Name='UIPadding'c6.PaddingRight=UDim.new(0,5)c6.Parent=cn cn.
Parent=cd local c7=Instance.new'Frame'c7.Name='ColorWells'c7.AutomaticSize=Enum.
AutomaticSize.Y c7.BackgroundColor3=Color3.fromRGB(255,255,255)c7.
BackgroundTransparency=1 c7.BorderColor3=Color3.fromRGB(0,0,0)c7.BorderSizePixel
=0 c7.LayoutOrder=2 c7.Size=UDim2.fromScale(1,0)local c8=Instance.new
'UIGridLayout'c8.Name='UIGridLayout'c8.CellPadding=UDim2.fromOffset(10,0)c8.
CellSize=UDim2.new(0.5,-5,0,30)c8.SortOrder=Enum.SortOrder.LayoutOrder c8.Parent
=c7 local c9=Instance.new'ImageLabel'c9.Name='NewColor'c9.Image=p.grid c9.
ScaleType=Enum.ScaleType.Tile c9.TileSize=UDim2.fromOffset(500,500)c9.
BackgroundColor3=Color3.fromRGB(255,255,255)c9.BackgroundTransparency=1 c9.
BorderColor3=Color3.fromRGB(0,0,0)c9.BorderSizePixel=0 c9.Size=UDim2.fromOffset(
100,100)local da=Instance.new'UICorner'da.Name='UICorner'da.Parent=c9 local db=
Instance.new'Frame'db.Name='Color'db.AnchorPoint=Vector2.new(0.5,0.5)db.
BorderColor3=Color3.fromRGB(27,42,53)db.BorderSizePixel=0 db.Position=UDim2.
fromScale(0.5,0.5)db.Size=UDim2.new(1,1,1,1)local dc=Instance.new'UICorner'dc.
Name='UICorner'dc.Parent=db db.Parent=c9 c9.Parent=c7 local dd=Instance.new
'ImageLabel'dd.Name='OldColor'dd.Image=p.grid dd.ScaleType=Enum.ScaleType.Tile
dd.TileSize=UDim2.fromOffset(500,500)dd.BackgroundColor3=Color3.fromRGB(255,255,
255)dd.BackgroundTransparency=1 dd.BorderColor3=Color3.fromRGB(0,0,0)dd.
BorderSizePixel=0 dd.LayoutOrder=1 dd.Size=UDim2.fromOffset(100,100)local de=
Instance.new'UICorner'de.Name='UICorner'de.Parent=dd local df=Instance.new
'Frame'df.Name='Color'df.AnchorPoint=Vector2.new(0.5,0.5)df.BorderColor3=Color3.
fromRGB(27,42,53)df.BorderSizePixel=0 df.Position=UDim2.fromScale(0.5,0.5)df.
Size=UDim2.new(1,1,1,1)local dg=Instance.new'UICorner'dg.Name='UICorner'dg.
Parent=df df.Parent=dd dd.Parent=c7 c7.Parent=cd cd.Parent=b8 local dh=Instance.
new'Frame'dh.Name='Interactions'dh.AutomaticSize=Enum.AutomaticSize.Y dh.
BackgroundColor3=Color3.fromRGB(0,0,0)dh.BackgroundTransparency=1 dh.
BorderColor3=Color3.fromRGB(0,0,0)dh.BorderSizePixel=0 dh.LayoutOrder=2 dh.Size=
UDim2.fromScale(1,0)local di=Instance.new'UIListLayout'di.Name='UIListLayout'di.
Padding=UDim.new(0,10)di.SortOrder=Enum.SortOrder.LayoutOrder di.Parent=dh local
dj=Instance.new'TextButton'dj.Name='Confirm'dj.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dj.Text=
'Confirm'dj.TextColor3=Color3.fromRGB(255,255,255)dj.TextSize=15 dj.
TextTransparency=0.5 dj.TextTruncate=Enum.TextTruncate.AtEnd dj.AutoButtonColor=
false dj.AutomaticSize=Enum.AutomaticSize.Y dj.BackgroundColor3=Color3.fromRGB(
25,25,25)dj.BorderColor3=Color3.fromRGB(0,0,0)dj.BorderSizePixel=0 dj.Size=UDim2
.fromScale(1,0)local dk=Instance.new'UIPadding'dk.Name='UIPadding'dk.
PaddingBottom=UDim.new(0,9)dk.PaddingLeft=UDim.new(0,10)dk.PaddingRight=UDim.
new(0,10)dk.PaddingTop=UDim.new(0,9)dk.Parent=dj local dl=Instance.new'UICorner'
dl.Name='BaseUICorner'dl.CornerRadius=UDim.new(0,10)dl.Parent=dj dj.Parent=dh
local dm=Instance.new'TextButton'dm.Name='Cancel'dm.FontFace=Font.new(
'rbxassetid://12187365364',Enum.FontWeight.Medium,Enum.FontStyle.Normal)dm.Text=
'Cancel'dm.TextColor3=Color3.fromRGB(255,255,255)dm.TextSize=15 dm.
TextTransparency=0.5 dm.TextTruncate=Enum.TextTruncate.AtEnd dm.AutoButtonColor=
false dm.AutomaticSize=Enum.AutomaticSize.Y dm.BackgroundColor3=Color3.fromRGB(
25,25,25)dm.BorderColor3=Color3.fromRGB(0,0,0)dm.BorderSizePixel=0 dm.Size=UDim2
.fromScale(1,0)local dn=Instance.new'UICorner'dn.Name='BaseUICorner'dn.
CornerRadius=UDim.new(0,10)dn.Parent=dm local dp=Instance.new'UIPadding'dp.Name=
'UIPadding'dp.PaddingBottom=UDim.new(0,9)dp.PaddingLeft=UDim.new(0,10)dp.
PaddingRight=UDim.new(0,10)dp.PaddingTop=UDim.new(0,9)dp.Parent=dm dm.Parent=dh
local dq=Instance.new'UIPadding'dq.Name='UIPadding'dq.PaddingTop=UDim.new(0,10)
dq.Parent=dh dh.Parent=b8 local dr=Instance.new'UIPadding'dr.Name=
'GlobalSettingsUIPadding'dr.PaddingBottom=UDim.new(0,20)dr.PaddingLeft=UDim.new(
0,20)dr.PaddingRight=UDim.new(0,20)dr.PaddingTop=UDim.new(0,20)dr.Parent=b8
local ds=Instance.new'Frame'ds.Name='Paragraph'ds.AutomaticSize=Enum.
AutomaticSize.Y ds.BackgroundColor3=Color3.fromRGB(0,0,0)ds.
BackgroundTransparency=1 ds.BorderColor3=Color3.fromRGB(0,0,0)ds.BorderSizePixel
=0 ds.Size=UDim2.fromScale(1,0)local dt=Instance.new'TextLabel'dt.Name=
'ParagraphHeader'dt.FontFace=Font.new('rbxassetid://12187365364',Enum.FontWeight
.SemiBold,Enum.FontStyle.Normal)dt.RichText=true dt.Text=bY.Settings.Name dt.
TextColor3=Color3.fromRGB(255,255,255)dt.TextSize=18 dt.TextTransparency=0.4 dt.
TextWrapped=true dt.TextYAlignment=Enum.TextYAlignment.Top dt.AutomaticSize=Enum
.AutomaticSize.XY dt.BackgroundColor3=Color3.fromRGB(255,255,255)dt.
BackgroundTransparency=1 dt.BorderColor3=Color3.fromRGB(0,0,0)dt.BorderSizePixel
=0 dt.Size=UDim2.fromScale(1,0)dt.Parent=ds local du=Instance.new'UIListLayout'
du.Name='UIListLayout'du.Padding=UDim.new(0,15)du.HorizontalAlignment=Enum.
HorizontalAlignment.Center du.SortOrder=Enum.SortOrder.LayoutOrder du.Parent=ds
local dv=Instance.new'UIPadding'dv.Name='UIPadding'dv.PaddingBottom=UDim.new(0,
15)dv.Parent=ds local dw=Instance.new'Frame'dw.Name='Line'dw.BackgroundColor3=
Color3.fromRGB(255,255,255)dw.BackgroundTransparency=0.9 dw.BorderColor3=Color3.
fromRGB(0,0,0)dw.BorderSizePixel=0 dw.LayoutOrder=1 dw.Size=UDim2.new(1,0,0,1)dw
.Parent=ds ds.Parent=b8 b8.Parent=b6 b6.Parent=D local dx,dy,dz,dA,dB,dC,dD,dE,
dF,dG,dH,dI,dJ,dK,dL,dM,dN,dO,dP=Color3.fromHSV,Color3.fromRGB,Vector2.new,UDim2
.new,co,cq,ce,db,{Hex=cZ.InputBox,Red=ct.InputBox,Green=cB.InputBox,Blue=cJ.
InputBox,Alpha=cR.InputBox},l:GetMouse(),false,false,0,0,1,function(dx)return
math.atan2(dx.y,dx.x),dx.magnitude end,function(dx)return((dx+math.pi)/(2*math.
pi))*360 end,function(dx)return dx*(math.pi/180)end,function(dx)dx=dx:gsub('#',
'')if#dx~=6 then return 0,0,0 end local dy,dz,dA=tonumber(dx:sub(1,2),16)or 0,
tonumber(dx:sub(3,4),16)or 0,tonumber(dx:sub(5,6),16)or 0 return dy,dz,dA end
local dQ=function(dQ,dR,dS)local dT=tonumber(dQ)if dT then return math.clamp(dT,
dR,dS)end return dR end local dR=function()local dR=dx(dJ,dK,dL)dE.
BackgroundColor3=dR dE.BackgroundTransparency=dQ(dF.Alpha.Text,0,1)dF.Red.Text=
tostring(math.floor(dR.r*255+0.5))dF.Green.Text=tostring(math.floor(dR.g*255+0.5
))dF.Blue.Text=tostring(math.floor(dR.b*255+0.5))dF.Alpha.Text=dQ(dF.Alpha.Text,
0,1)local dS=string.format('#%02X%02X%02X',math.floor(dR.r*255+0.5),math.floor(
dR.g*255+0.5),math.floor(dR.b*255+0.5))dF.Hex.Text=dS end local dS,dT,dU,dV=
function(dS)local dT=dS-dD.AbsolutePosition.X local dU=math.clamp(dT,0,dD.
AbsoluteSize.X-cg.AbsoluteSize.X)cg.Position=dA(0,dU,0.5,0)dL=1-(dU/(dD.
AbsoluteSize.X-cg.AbsoluteSize.X))dR()end,function(dS,dT)local dU,dV=dB.
AbsoluteSize.x/2,dz(dS,dT)-dB.AbsolutePosition-dB.AbsoluteSize/2 if dV:Dot(dV)>
dU*dU then dV=dV.unit*dU end dC.Position=dA(0.5,dV.x,0.5,dV.y)local dW,dX=dM(dV*
dz(1,-1))dJ,dK=dN(dW)/360,math.clamp(dX/dU,0,1)dD.BackgroundColor3=dx(dJ,dK,1)
dR()end,function(dS)local dT=(1-dS)*(dD.AbsoluteSize.X-cg.AbsoluteSize.X)cg.
Position=UDim2.new(0,dT,0.5,0)end,function(dS,dT)local dU,dV=dB.AbsoluteSize.X/2
,dO(dS*360)local dW=dT*dU local dX,dY=dW*math.cos(dV),dW*math.sin(dV)dC.Position
=UDim2.new(0.5,-dX,0.5,dY)dD.BackgroundColor3=dx(dS,dT,1)end local dW,dX,dY=
function()local dW,dX,dY=dQ(dF.Red.Text,0,255),dQ(dF.Green.Text,0,255),dQ(dF.
Blue.Text,0,255)dF.Red.Text=dW dF.Green.Text=dX dF.Blue.Text=dY dJ,dK,dL=Color3.
fromRGB(dW,dX,dY):ToHSV()dU(dL)dV(dJ,dK)dR()end,function()local dW=dF.Hex.Text
local dX,dY,dZ=dP(dW)dX=dQ(dX,0,255)dY=dQ(dY,0,255)dZ=dQ(dZ,0,255)dF.Red.Text=dX
dF.Green.Text=dY dF.Blue.Text=dZ dJ,dK,dL=Color3.fromRGB(dX,dY,dZ):ToHSV()dU(dL)
dV(dJ,dK)dR()end,function()local dW,dX,dY=math.floor(bY.Color.R*255+0.5),math.
floor(bY.Color.G*255+0.5),math.floor(bY.Color.B*255+0.5)dF.Red.Text=dW dF.Green.
Text=dX dF.Blue.Text=dY dF.Alpha.Text=bZ and bY.Alpha or 0 local dZ=string.
format('#%02X%02X%02X',dW,dX,dY)dF.Hex.Text=dZ dJ,dK,dL=Color3.fromRGB(dW,dX,dY)
:ToHSV()df.BackgroundColor3=bY.Color df.BackgroundTransparency=bZ and bY.Alpha
or 0 dE.BackgroundColor3=Color3.fromRGB(dW,dX,dY)dE.BackgroundTransparency=bZ
and bY.Alpha or 0 dU(dL)dV(dJ,dK)end dB.InputBegan:Connect(function(dZ)if dZ.
UserInputType==Enum.UserInputType.MouseButton1 or dZ.UserInputType==Enum.
UserInputType.Touch then dH=true dT(dG.X,dG.Y)end end)dD.InputBegan:Connect(
function(dZ)if dZ.UserInputType==Enum.UserInputType.MouseButton1 or dZ.
UserInputType==Enum.UserInputType.Touch then dI=true dS(dG.X)end end)dD.
InputEnded:Connect(function(dZ)if dZ.UserInputType==Enum.UserInputType.
MouseButton1 or dZ.UserInputType==Enum.UserInputType.Touch then dI=false end end
)dB.InputEnded:Connect(function(dZ)if dZ.UserInputType==Enum.UserInputType.
MouseButton1 or dZ.UserInputType==Enum.UserInputType.Touch then dH=false end end
)h.InputChanged:Connect(function(dZ)if dZ.UserInputType==Enum.UserInputType.
MouseMovement or dZ.UserInputType==Enum.UserInputType.Touch then if dI then dS(
dG.X)elseif dH then dT(dG.X,dG.Y)end end end)local dZ=function(dZ)local d_=dZ.
Text dZ.Text=''dZ.PlaceholderText=d_ end dF.Hex.FocusLost:Connect(dX)dF.Red.
FocusLost:Connect(dW)dF.Green.FocusLost:Connect(dW)dF.Blue.FocusLost:Connect(dW)
dF.Alpha.FocusLost:Connect(dR)dF.Hex.Focused:Connect(function()dZ(dF.Hex)end)dF.
Red.Focused:Connect(function()dZ(dF.Red)end)dF.Green.Focused:Connect(function()
dZ(dF.Green)end)dF.Blue.Focused:Connect(function()dZ(dF.Blue)end)dF.Alpha.
Focused:Connect(function()dZ(dF.Alpha)end)local d_=function()local d_=Instance.
new'CanvasGroup'd_.Name='ColorPickerCanvas'd_.BackgroundTransparency=1 d_.
BorderSizePixel=0 d_.Size=UDim2.fromScale(1,1)d_.ZIndex=5 d_.GroupTransparency=1
d_.Parent=D d_.Visible=false return d_ end local d0=function(d0)local d1,d2,d3,
d4,d5=d_(),d0 and 0 or 1,d0 and 1 or 0.95,d0 and 1 or 0,TweenInfo.new(0.1,Enum.
EasingStyle.Sine)local d6,d7=w(d1,d5,{GroupTransparency=d2}),w(b9,d5,{Scale=d3})
b6.Visible=true b6.Parent=d1 d1.Visible=true d1.GroupTransparency=d4 d6:Play()d7
:Play()d6.Completed:Wait()if not d0 then b6.Visible=false d1.Visible=false end
b6.Parent=D d1:Destroy()end local d1,d2=function()d0(true)end,function()d0(false
)end b4.MouseButton1Click:Connect(d1)dm.MouseButton1Click:Connect(d2)dj.
MouseButton1Click:Connect(function()d2()local d3=dx(dJ,dK,dL)bY.Color=Color3.
fromRGB(d3.r*255,d3.g*255,d3.b*255)bY.Alpha=bZ and dQ(dF.Alpha.Text,0,1)df.
BackgroundColor3=bY.Color df.BackgroundTransparency=bZ and bY.Alpha or 0 b2.
BackgroundColor3=bY.Color b2.BackgroundTransparency=bZ and bY.Alpha or 0 if bY.
Settings.Callback then task.spawn(function()bY.Settings.Callback(bY.Color,bZ and
bY.Alpha)end)end end)dY()function bY:UpdateName(d3)b0.Text=d3 end function bY:
SetVisibility(d3)b_.Visible=d3 end function bY:SetColor(d3)bY.Color=d3 b2.
BackgroundColor3=d3 local d4,d5,d6=math.floor(bY.Color.R*255+0.5),math.floor(bY.
Color.G*255+0.5),math.floor(bY.Color.B*255+0.5)dF.Red.Text=d4 dF.Green.Text=d5
dF.Blue.Text=d6 local d7=string.format('#%02X%02X%02X',d4,d5,d6)dF.Hex.Text=d7
dJ,dK,dL=Color3.fromRGB(d4,d5,d6):ToHSV()df.BackgroundColor3=bY.Color dE.
BackgroundColor3=Color3.fromRGB(d4,d5,d6)dU(dL)dV(dJ,dK)if bY.Settings.Callback
then task.spawn(function()bY.Settings.Callback(bY.Color,bZ and bY.Alpha)end)end
end function bY:SetAlpha(d3)bY.Alpha=d3 b2.Transparency=d3 dY()end if bX then c(
bX,bY)end return bY end function bQ:Header(bW,bX)local bY,bZ={Settings=bW},
Instance.new'Frame'bZ.Name='Header'bZ.AutomaticSize=Enum.AutomaticSize.Y bZ.
BackgroundColor3=Color3.fromRGB(0,0,0)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.LayoutOrder=0 bZ.Size=
UDim2.fromScale(1,0)bZ.Parent=bR local b_=Instance.new'UIPadding'b_.Name=
'UIPadding'b_.PaddingBottom=UDim.new(0,5)b_.Parent=bZ local b0=Instance.new
'TextLabel'b0.Name='HeaderText'b0.FontFace=Font.new(p.interFont,Enum.FontWeight.
Medium,Enum.FontStyle.Normal)b0.RichText=true b0.Text=bY.Settings.Text or bY.
Settings.Name b0.TextColor3=Color3.fromRGB(255,255,255)b0.TextSize=16 b0.
TextTransparency=0.3 b0.TextWrapped=true b0.TextXAlignment=Enum.TextXAlignment.
Left b0.AutomaticSize=Enum.AutomaticSize.Y b0.BackgroundColor3=Color3.fromRGB(
255,255,255)b0.BackgroundTransparency=1 b0.BorderColor3=Color3.fromRGB(0,0,0)b0.
BorderSizePixel=0 b0.Size=UDim2.fromScale(1,0)b0.Parent=bZ function bY:
UpdateName(b1)b0.Text=b1 end function bY:SetVisibility(b1)bZ.Visible=b1 end if
bX then c(bX,bY)end return bY end function bQ:Label(bW,bX)local bY,bZ={Settings=
bW},Instance.new'Frame'bZ.Name='Label'bZ.AutomaticSize=Enum.AutomaticSize.Y bZ.
BackgroundColor3=Color3.fromRGB(0,0,0)bZ.BackgroundTransparency=1 bZ.
BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel=0 bZ.Size=UDim2.new(1,0,0,
38)bZ.Parent=bR local b_=Instance.new'TextLabel'b_.Name='LabelText'b_.FontFace=
Font.new(p.interFont)b_.RichText=true b_.Text=bY.Settings.Text or bY.Settings.
Name b_.TextColor3=Color3.fromRGB(255,255,255)b_.TextSize=13 b_.TextTransparency
=0.5 b_.TextWrapped=true b_.TextXAlignment=Enum.TextXAlignment.Left b_.
AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(255,255,
255)b_.BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.
BorderSizePixel=0 b_.Size=UDim2.fromScale(1,1)b_.Parent=bZ function bY:
UpdateName(b0)b_.Text=b0 end function bY:SetVisibility(b0)bZ.Visible=b0 end if
bX then c(bX,bY)end return bY end function bQ:SubLabel(bW,bX)local bY,bZ={
Settings=bW},Instance.new'Frame'bZ.Name='SubLabel'bZ.AutomaticSize=Enum.
AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(0,0,0)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Size=UDim2.new(1,0,0,0)bZ.Parent=bR local b_=Instance.new'TextLabel'b_.
Name='SubLabelText'b_.FontFace=Font.new(p.interFont)b_.RichText=true b_.Text=bY.
Settings.Text or bY.Settings.Name b_.TextColor3=Color3.fromRGB(255,255,255)b_.
TextSize=12 b_.TextTransparency=0.7 b_.TextWrapped=true b_.TextXAlignment=Enum.
TextXAlignment.Left b_.AutomaticSize=Enum.AutomaticSize.Y b_.BackgroundColor3=
Color3.fromRGB(255,255,255)b_.BackgroundTransparency=1 b_.BorderColor3=Color3.
fromRGB(0,0,0)b_.BorderSizePixel=0 b_.Size=UDim2.fromScale(1,1)b_.Parent=bZ
function bY:UpdateName(b0)b_.Text=b0 end function bY:SetVisibility(b0)bZ.Visible
=b0 end if bX then c(bX,bY)end return bY end function bQ:Paragraph(bW,bX)local
bY,bZ={Settings=bW},Instance.new'Frame'bZ.Name='Paragraph'bZ.AutomaticSize=Enum.
AutomaticSize.Y bZ.BackgroundColor3=Color3.fromRGB(0,0,0)bZ.
BackgroundTransparency=1 bZ.BorderColor3=Color3.fromRGB(0,0,0)bZ.BorderSizePixel
=0 bZ.Size=UDim2.new(1,0,0,38)bZ.Parent=bR local b_=Instance.new'TextLabel'b_.
Name='ParagraphHeader'b_.FontFace=Font.new(p.interFont,Enum.FontWeight.Medium,
Enum.FontStyle.Normal)b_.RichText=true b_.Text=bY.Settings.Header b_.TextColor3=
Color3.fromRGB(255,255,255)b_.TextSize=15 b_.TextTransparency=0.4 b_.TextWrapped
=true b_.TextXAlignment=Enum.TextXAlignment.Left b_.AutomaticSize=Enum.
AutomaticSize.Y b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.
BackgroundTransparency=1 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.BorderSizePixel
=0 b_.Size=UDim2.fromScale(1,0)b_.Parent=bZ local b0=Instance.new'UIListLayout'
b0.Name='UIListLayout'b0.Padding=UDim.new(0,5)b0.SortOrder=Enum.SortOrder.
LayoutOrder b0.Parent=bZ local b1=Instance.new'TextLabel'b1.Name='ParagraphBody'
b1.FontFace=Font.new(p.interFont)b1.RichText=true b1.Text=bY.Settings.Body b1.
TextColor3=Color3.fromRGB(255,255,255)b1.TextSize=13 b1.TextTransparency=0.5 b1.
TextWrapped=true b1.TextXAlignment=Enum.TextXAlignment.Left b1.AutomaticSize=
Enum.AutomaticSize.Y b1.BackgroundColor3=Color3.fromRGB(255,255,255)b1.
BackgroundTransparency=1 b1.BorderColor3=Color3.fromRGB(0,0,0)b1.BorderSizePixel
=0 b1.LayoutOrder=1 b1.Size=UDim2.fromScale(1,0)b1.Parent=bZ function bY:
UpdateHeader(b2)b_.Text=b2 end function bY:UpdateBody(b2)b1.Text=b2 end function
bY:SetVisibility(b2)bZ.Visible=b2 end if bX then c(bX,bY)end return bY end
function bQ:Divider()local bW,bX={},Instance.new'Frame'bX.Name='Divider'bX.
AnchorPoint=Vector2.new(0,1)bX.AutomaticSize=Enum.AutomaticSize.Y bX.
BackgroundColor3=Color3.fromRGB(255,255,255)bX.BackgroundTransparency=1 bX.
BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel=0 bX.Position=UDim2.
fromScale(0,1)bX.Size=UDim2.new(1,0,0,1)bX.Parent=bR local bY=Instance.new
'UIPadding'bY.Name='UIPadding'bY.PaddingBottom=UDim.new(0,8)bY.PaddingTop=UDim.
new(0,8)bY.Parent=bX local bZ=Instance.new'UIListLayout'bZ.Name='UIListLayout'bZ
.SortOrder=Enum.SortOrder.LayoutOrder bZ.Parent=bX local b_=Instance.new'Frame'
b_.Name='Line'b_.BackgroundColor3=Color3.fromRGB(255,255,255)b_.
BackgroundTransparency=0.9 b_.BorderColor3=Color3.fromRGB(0,0,0)b_.
BorderSizePixel=0 b_.Size=UDim2.new(1,0,0,1)b_.Parent=bX function bW:Remove()bX:
Destroy()end function bW:SetVisibility(b0)bX.Visible=b0 end return bW end
function bQ:Spacer()local bW,bX={},Instance.new'Frame'bX.Name='Spacer'bX.
AnchorPoint=Vector2.new(0,1)bX.BackgroundColor3=Color3.fromRGB(255,255,255)bX.
BackgroundTransparency=1 bX.BorderColor3=Color3.fromRGB(0,0,0)bX.BorderSizePixel
=0 bX.Position=UDim2.fromScale(0,1)bX.Parent=bR function bW:Remove()bX:Destroy()
end function bW:SetVisibility(bY)bX.Visible=bY end return bW end return bQ end
local bP=function()local bP=0.15 if u then u.Parent=nil end for bQ,bR in pairs(m
)do w(bQ,TweenInfo.new(bP,Enum.EasingStyle.Sine),{BackgroundTransparency=(bQ==bz
and 0.98 or 1)}):Play()if bR.tabStroke then w(bR.tabStroke,TweenInfo.new(bP,Enum
.EasingStyle.Sine),{Transparency=(bQ==bz and 0.95 or 1)}):Play()end if bR.
switcherImage then w(bR.switcherImage,TweenInfo.new(bP,Enum.EasingStyle.Sine),{
ImageTransparency=(bQ==bz and 0.1 or 0.5)}):Play()end if bR.switcherName then w(
bR.switcherName,TweenInfo.new(bP,Enum.EasingStyle.Sine),{TextTransparency=(bQ==
bz and 0.1 or 0.5)}):Play()end end m[bz].tabContent.Parent=aG u=m[bz].tabContent
a3.Text=bx.Name end bz.MouseButton1Click:Connect(function()bP()end)function by:
Select()bP()end function by:InsertConfigSection(bQ)local bR=by:Section{Side=
'Left'}if k then bR:Label{Text=
'Config system unavailable. (Environment isStudio)'}return
'Config system unavailable.'end local bS,bT bR:Input{Name='Config Name',
Placeholder='Name',AcceptedCharacters='All',Callback=function(bU)bS=bU end}local
bU=bR:Dropdown{Name='Select Config',Multi=false,Required=false,Options=b:
RefreshConfigList(),Callback=function(bU)bT=bU end}bR:Button{Name=
'Create Config',Callback=function()if not bS or string.gsub(bS,' ','')==''then y
:Notify{Title='Interface',Description='Config name cannot be empty.'}return end
local bV,bW=b:SaveConfig(bS)if not bV then y:Notify{Title='Interface',
Description='Unable to save config, return error: '..bW}end y:Notify{Title=
'Interface',Description=string.format('Created config %q',bS)}bU:ClearOptions()
bU:InsertOptions(b:RefreshConfigList())end}bR:Button{Name='Load Config',Callback
=function()local bV,bW=b:LoadConfig(bU.Value)if not bV then y:Notify{Title=
'Interface',Description='Unable to load config, return error: '..bW}return end y
:Notify{Title='Interface',Description=string.format('Loaded config %q',bU.Value)
}end}bR:Button{Name='Overwrite Config',Callback=function()local bV,bW=b:
SaveConfig(bU.Value)if not bV then y:Notify{Title='Interface',Description=
'Unable to overwrite config, return error: '..bW}return end y:Notify{Title=
'Interface',Description=string.format('Overwrote config %q',bU.Value)}end}bR:
Button{Name='Refresh Config List',Callback=function()bU:ClearOptions()bU:
InsertOptions(b:RefreshConfigList())end}local bV bR:Button{Name=
'Set as autoload',Callback=function()local bW=bU.Value writefile(b.Folder..
'/settings/autoload.txt',bW)bV:UpdateName('Autoload config: '..bW)y:Notify{Title
='Interface',Description=string.format('Set %q as autoload',bW)}end}bV=bR:Label{
Text='Autoload config: None'}if isfile(b.Folder..'/settings/autoload.txt')then
local bW=readfile(b.Folder..'/settings/autoload.txt')bV:UpdateName(
'Autoload config: '..bW)end end m[bz]={tabContent=bG,tabStroke=bB,switcherImage=
bD,switcherName=bE}return by end return br end local br=function()if
setthreadidentity then pcall(setthreadidentity,7)elseif set_thread_identity then
pcall(set_thread_identity,7)elseif setidentity then pcall(setidentity,7)elseif
syn and syn.set_thread_identity then pcall(syn.set_thread_identity,7)end end
function y:Notify(bs)br()local bt={}local bu,bv=pcall(function()local bu=
Instance.new'Frame'bu.Name='Notification'bu.AnchorPoint=Vector2.new(0.5,0.5)bu.
AutomaticSize=Enum.AutomaticSize.Y bu.BackgroundColor3=Color3.fromRGB(15,15,15)
bu.BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel=0 bu.Position=UDim2.
fromScale(0.5,0.5)bu.Size=UDim2.fromOffset(bs.SizeX or 250,0)bu.Parent=A local
bv=Instance.new'UIStroke'bv.Name='NotificationUIStroke'bv.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border bv.Color=Color3.fromRGB(255,255,255)bv.Transparency=0.9
bv.Parent=bu local bw=Instance.new'UICorner'bw.Name='NotificationUICorner'bw.
CornerRadius=UDim.new(0,10)bw.Parent=bu local bx=Instance.new'UIScale'bx.Name=
'NotificationUIScale'bx.Parent=bu bx.Scale=0 local by=Instance.new'Frame'by.Name
='NotificationInformation'by.AutomaticSize=Enum.AutomaticSize.Y by.
BackgroundColor3=Color3.fromRGB(255,255,255)by.BackgroundTransparency=1 by.
BorderColor3=Color3.fromRGB(0,0,0)by.BorderSizePixel=0 by.Size=UDim2.fromScale(1
,1)local bz=Instance.new'TextLabel'bz.Name='NotificationTitle'bz.FontFace=Font.
new(p.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)bz.RichText=true
bz.Text=bs.Title bz.TextColor3=Color3.fromRGB(255,255,255)bz.TextSize=13 bz.
TextTransparency=0.2 bz.TextTruncate=Enum.TextTruncate.SplitWord bz.
TextXAlignment=Enum.TextXAlignment.Left bz.TextYAlignment=Enum.TextYAlignment.
Top bz.AutomaticSize=Enum.AutomaticSize.XY bz.BackgroundColor3=Color3.fromRGB(
255,255,255)bz.BackgroundTransparency=1 bz.BorderColor3=Color3.fromRGB(0,0,0)bz.
BorderSizePixel=0 bz.Size=UDim2.new(1,-12,0,0)local bA=Instance.new'UIPadding'bA
.Name='NotificationTitleUIPadding'bA.PaddingRight=UDim.new(0,25)bA.Parent=bz bz.
Parent=by local bB=Instance.new'TextLabel'bB.Name='NotificationDescription'bB.
FontFace=Font.new(p.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)bB.
Text=bs.Description bB.TextColor3=Color3.fromRGB(255,255,255)bB.TextSize=11 bB.
TextTransparency=0.5 bB.TextWrapped=true bB.RichText=true bB.TextXAlignment=Enum
.TextXAlignment.Left bB.TextYAlignment=Enum.TextYAlignment.Top bB.AutomaticSize=
Enum.AutomaticSize.XY bB.BackgroundColor3=Color3.fromRGB(255,255,255)bB.
BackgroundTransparency=1 bB.BorderColor3=Color3.fromRGB(0,0,0)bB.BorderSizePixel
=0 bB.Size=UDim2.new(1,-12,0,0)local bC=Instance.new'UIPadding'bC.Name=
'NotificationDescriptionUIPadding'bC.PaddingRight=UDim.new(0,25)bC.PaddingTop=
UDim.new(0,17)bC.Parent=bB bB.Parent=by local bD=Instance.new'UIPadding'bD.Name=
'NotificationUIPadding'bD.PaddingBottom=UDim.new(0,12)bD.PaddingLeft=UDim.new(0,
10)bD.PaddingRight=UDim.new(0,10)bD.PaddingTop=UDim.new(0,10)bD.Parent=by by.
Parent=bu local bE=Instance.new'Frame'bE.Name='NotificationControls'bE.
AutomaticSize=Enum.AutomaticSize.Y bE.BackgroundColor3=Color3.fromRGB(255,255,
255)bE.BackgroundTransparency=1 bE.BorderColor3=Color3.fromRGB(0,0,0)bE.
BorderSizePixel=0 bE.Size=UDim2.fromScale(1,1)local bF=Instance.new'TextButton'
bF.Name='Interactable'bF.FontFace=Font.new(p.interFont)bF.Text='\u{2713}'bF.
TextColor3=Color3.fromRGB(255,255,255)bF.TextSize=17 bF.TextTransparency=0.2 bF.
AnchorPoint=Vector2.new(1,0.5)bF.AutomaticSize=Enum.AutomaticSize.XY bF.
BackgroundColor3=Color3.fromRGB(255,255,255)bF.BackgroundTransparency=1 bF.
BorderColor3=Color3.fromRGB(0,0,0)bF.BorderSizePixel=0 bF.LayoutOrder=1 bF.
Position=UDim2.fromScale(1,0.5)bF.Parent=bE local bG=Instance.new'UIPadding'bG.
Name='UIPadding'bG.PaddingBottom=UDim.new(0,6)bG.PaddingRight=UDim.new(0,13)bG.
PaddingTop=UDim.new(0,6)bG.Parent=bE bE.Parent=bu local bH,bI={In=w(bx,TweenInfo
.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Scale=bs.Scale
or 1}),Out=w(bx,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Scale=0})},{None=function()bF:Destroy()end,Confirm=
function()bF.Text='\u{2713}'end,Cancel=function()bF.Text='\u{2717}'end}local bJ=
bI[bs.Style]or function()bF:Destroy()end bJ()if bF then bF.MouseButton1Click:
Connect(function()bt:Cancel()if bs.Callback then task.spawn(bs.Callback)end end)
end local bK=task.spawn(function()br()bH.In:Play()bs.Lifetime=bs.Lifetime or 3
if bs.Lifetime~=0 then task.wait(bs.Lifetime)local bK=bH.Out bK:Play()bK.
Completed:Wait()br()pcall(function()bu:Destroy()end)end end)function bt:
UpdateTitle(bL)bz.Text=bL end function bt:UpdateDescription(bL)bB.Text=bL end
function bt:Resize(bL)local bM=bL or 250 bu.Size=UDim2.fromOffset(bM,0)end
function bt:Cancel()br()task.cancel(bK)local bL=bH.Out bL:Play()bL.Completed:
Wait()pcall(function()bu:Destroy()end)end end)if not bu then pcall(function()
local bw=b.GetService'StarterGui'or game:GetService'StarterGui'bw:SetCore(
'SendNotification',{Title=bs.Title or'Interface',Text=bs.Description or'',
Duration=bs.Lifetime or 3})end)return{UpdateTitle=function()end,
UpdateDescription=function()end,Resize=function()end,Cancel=function()end}end
return bt end function y:Dialog(bs)local bt,bu={},Instance.new'CanvasGroup'bu.
Name='DialogCanvas'bu.BackgroundColor3=Color3.fromRGB(255,255,255)bu.
BackgroundTransparency=1 bu.BorderColor3=Color3.fromRGB(0,0,0)bu.BorderSizePixel
=0 bu.Size=UDim2.fromScale(1,1)bu.GroupTransparency=1 bu.Parent=D local bv=
Instance.new'Frame'bv.Name='Dialog'bv.BackgroundColor3=Color3.fromRGB(0,0,0)bv.
BackgroundTransparency=0.5 bv.BorderColor3=Color3.fromRGB(0,0,0)bv.
BorderSizePixel=0 bv.Size=UDim2.fromScale(1,1)local bw=Instance.new'UICorner'bw.
Name='BaseUICorner'bw.CornerRadius=UDim.new(0,10)bw.Parent=bv local bx=Instance.
new'Frame'bx.Name='Prompt'bx.AnchorPoint=Vector2.new(0.5,0.5)bx.AutomaticSize=
Enum.AutomaticSize.Y bx.BackgroundColor3=Color3.fromRGB(15,15,15)bx.BorderColor3
=Color3.fromRGB(0,0,0)bx.BorderSizePixel=0 bx.Position=UDim2.fromScale(0.5,0.5)
bx.Size=UDim2.fromOffset(280,0)local by=Instance.new'UIScale'by.Name=
'BaseUIScale'by.Parent=bx by.Scale=0.95 local bz=Instance.new'UIStroke'bz.Name=
'GlobalSettingsUIStroke'bz.ApplyStrokeMode=Enum.ApplyStrokeMode.Border bz.Color=
Color3.fromRGB(255,255,255)bz.Transparency=0.9 bz.Parent=bx local bA=Instance.
new'UICorner'bA.Name='GlobalSettingsUICorner'bA.CornerRadius=UDim.new(0,10)bA.
Parent=bx local bB=Instance.new'UIPadding'bB.Name='GlobalSettingsUIPadding'bB.
PaddingBottom=UDim.new(0,20)bB.PaddingLeft=UDim.new(0,20)bB.PaddingRight=UDim.
new(0,20)bB.PaddingTop=UDim.new(0,20)bB.Parent=bx local bC=Instance.new'Frame'bC
.Name='Paragraph'bC.AutomaticSize=Enum.AutomaticSize.Y bC.BackgroundColor3=
Color3.fromRGB(0,0,0)bC.BackgroundTransparency=1 bC.BorderColor3=Color3.fromRGB(
0,0,0)bC.BorderSizePixel=0 bC.Size=UDim2.new(1,0,0,38)local bD=Instance.new
'TextLabel'bD.Name='ParagraphHeader'bD.FontFace=Font.new(p.interFont,Enum.
FontWeight.Medium,Enum.FontStyle.Normal)bD.RichText=true bD.Text=bs.Title bD.
TextColor3=Color3.fromRGB(255,255,255)bD.TextSize=18 bD.TextTransparency=0.4 bD.
TextWrapped=true bD.AutomaticSize=Enum.AutomaticSize.Y bD.BackgroundColor3=
Color3.fromRGB(255,255,255)bD.BackgroundTransparency=1 bD.BorderColor3=Color3.
fromRGB(0,0,0)bD.BorderSizePixel=0 bD.Size=UDim2.fromScale(1,0)bD.Parent=bC
local bE=Instance.new'UIListLayout'bE.Name='UIListLayout'bE.Padding=UDim.new(0,
15)bE.SortOrder=Enum.SortOrder.LayoutOrder bE.Parent=bC local bF=Instance.new
'TextLabel'bF.Name='ParagraphBody'bF.FontFace=Font.new(p.interFont)bF.RichText=
true bF.Text=bs.Description bF.TextColor3=Color3.fromRGB(255,255,255)bF.TextSize
=14 bF.TextTransparency=0.5 bF.TextWrapped=true bF.AutomaticSize=Enum.
AutomaticSize.Y bF.BackgroundColor3=Color3.fromRGB(255,255,255)bF.
BackgroundTransparency=1 bF.BorderColor3=Color3.fromRGB(0,0,0)bF.BorderSizePixel
=0 bF.LayoutOrder=1 bF.Size=UDim2.fromScale(1,0)bF.Parent=bC bC.Parent=bx local
bG=Instance.new'Frame'bG.Name='Interactions'bG.AutomaticSize=Enum.AutomaticSize.
Y bG.BackgroundColor3=Color3.fromRGB(0,0,0)bG.BackgroundTransparency=1 bG.
BorderColor3=Color3.fromRGB(0,0,0)bG.BorderSizePixel=0 bG.LayoutOrder=1 bG.Size=
UDim2.fromScale(1,0)local bH=Instance.new'UIListLayout'bH.Name='UIListLayout'bH.
Padding=UDim.new(0,10)bH.SortOrder=Enum.SortOrder.LayoutOrder bH.Parent=bG local
bI=Instance.new'UIPadding'bI.Name='UIPadding'bI.PaddingTop=UDim.new(0,20)bI.
Parent=bG bG.Parent=bx local bJ=Instance.new'UIListLayout'bJ.Name='UIListLayout'
bJ.SortOrder=Enum.SortOrder.LayoutOrder bJ.Parent=bx bx.Parent=bv bv.Parent=bu
local bK,bL,bM,bN=w(bu,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=0}),w(bu,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{
GroupTransparency=1}),w(by,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1}),
w(by,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})local bO,bP=function(
)bK:Play()bM:Play()bK.Completed:Wait()bv.Parent=D end,function()if not bv.Parent
then return end bv.Parent=bu bL:Play()bN:Play()bL.Completed:Wait()bu:Destroy()
end for bQ,bR in pairs(bs.Buttons)do local bS=Instance.new'TextButton'bS.Name=
'Button'bS.FontFace=Font.new(p.interFont)bS.Text=bR.Name bS.TextColor3=Color3.
fromRGB(255,255,255)bS.TextSize=15 bS.TextTransparency=0.5 bS.TextTruncate=Enum.
TextTruncate.AtEnd bS.AutoButtonColor=false bS.AutomaticSize=Enum.AutomaticSize.
Y bS.BackgroundColor3=Color3.fromRGB(25,25,25)bS.BorderColor3=Color3.fromRGB(0,0
,0)bS.BorderSizePixel=0 bS.Size=UDim2.fromScale(1,0)local bT=Instance.new
'UIPadding'bT.Name='UIPadding'bT.PaddingBottom=UDim.new(0,9)bT.PaddingLeft=UDim.
new(0,10)bT.PaddingRight=UDim.new(0,10)bT.PaddingTop=UDim.new(0,9)bT.Parent=bS
local bU=Instance.new'UICorner'bU.Name='BaseUICorner'bU.CornerRadius=UDim.new(0,
10)bU.Parent=bS bS.Parent=bG local bV={DefaultTransparency=0,
DefaultTransparency2=0.5,HoverTransparency=0.3,HoverTransparency2=0.6,
EasingStyle=Enum.EasingStyle.Sine}local bW=function(bW)if bW=='Idle'then w(bS,
TweenInfo.new(0.2,bV.EasingStyle),{BackgroundTransparency=bV.DefaultTransparency
,TextTransparency=bV.DefaultTransparency2}):Play()elseif bW=='Hover'then w(bS,
TweenInfo.new(0.2,bV.EasingStyle),{BackgroundTransparency=bV.HoverTransparency,
TextTransparency=bV.HoverTransparency2}):Play()end end bS.MouseButton1Click:
Connect(function()if bu.GroupTransparency~=0 then return end local bX,bY=pcall(
function()if bR.Callback then bR.Callback()end end)bP()if not bX then warn(
'[Dialog] Button callback error: '..tostring(bY))end end)bS.MouseEnter:Connect(
function()bW'Hover'end)bS.MouseLeave:Connect(function()bW'Idle'end)end bO()
function bt:UpdateTitle(bQ)bD.Text=bQ end function bt:UpdateDescription(bQ)bF.
Text=bQ end function bt:Cancel()bP()end return bt end function y:
SetNotificationsState(bs)A.Visible=bs end function y:GetNotificationsState(bs)
return A.Visible end function y:SetState(bs)r=bs D.Visible=bs end function y:
GetState()return r end local bs function y:Unload()if bs then bs()end z:Destroy(
)o=true end function y.onUnloaded(bt)bs=bt end local bt=x.Keybind or Enum.
KeyCode.RightControl local bu=function()local bu=not y:GetState()y:SetState(bu)y
:Notify{Title=x.Title,Description=(bu and'Maximized 'or'Minimized ')..
'the menu. Use '..tostring(bt.Name)..' to toggle it.',Lifetime=5}end h.
InputEnded:Connect(function(bv,bw)if bw then return end if bv.KeyCode==bt then
bu()end end)S.MouseButton1Click:Connect(bu)Q.MouseButton1Click:Connect(function(
)y:Dialog{Title=x.Title,Description=
[[Are you sure you want to exit the menu? You will lose any unsaved configurations.]]
,Buttons={{Name='Confirm',Callback=function()y:Unload()end},{Name='Cancel'}}}end
)function y:SetKeybind(bv)bt=bv end function y:SetAcrylicBlurState(bv)s=bv D.
BackgroundTransparency=bv and 0.05 or 0 end function y:GetAcrylicBlurState()
return s end local bv,bw=function(bv)if bv then as.Image=(ar and aq)or
'rbxassetid://0'az.Text='@'..l.Name aw.Text=l.DisplayName else as.Image=p.
userInfoBlurred local bw,bx=#l.Name,#l.DisplayName az.Text='@'..string.rep('.',
bw)aw.Text=string.rep('.',bx)end end if x.ShowUserInfo~=nil then bw=x.
ShowUserInfo else bw=true end bv(bw)function y:SetUserInfoState(bx)bv(bx)end
function y:GetUserInfoState(bx)return bw end function y:SetSize(bx)D.Size=bx end
function y:GetSize(bx)return D.Size end function y:SetScale(bx)E.Scale=bx end
function y:GetScale()return E.Scale end local bx,by={Toggle={Save=function(bx,by
)return{type='Toggle',flag=bx,state=by.State or false}end,Load=function(bx,by)
br()if b.Options[bx]and by.state~=nil then b.Options[bx]:UpdateState(by.state)
end end},Slider={Save=function(bx,by)return{type='Slider',flag=bx,value=(by.
Value and tostring(by.Value))or false}end,Load=function(bx,by)br()if b.Options[
bx]and by.value~=nil and by.value~=false then b.Options[bx]:UpdateValue(by.value
)local bz=b.Options[bx]if bz.Settings and bz.Settings.Callback then task.spawn(
function()pcall(bz.Settings.Callback,tonumber(by.value)or bz.Value)end)end end
end},Input={Save=function(bx,by)return{type='Input',flag=bx,text=by.Text}end,
Load=function(bx,by)br()if b.Options[bx]and by.text and type(by.text)=='string'
then b.Options[bx]:UpdateText(by.text)end end},Keybind={Save=function(bx,by)
return{type='Keybind',flag=bx,bind=(typeof(by.Bind)=='EnumItem'and by.Bind.Name)
or nil}end,Load=function(bx,by)br()if b.Options[bx]and by.bind then b.Options[bx
]:Bind(Enum.KeyCode[by.bind])end end},Dropdown={Save=function(bx,by)return{type=
'Dropdown',flag=bx,value=by.Value}end,Load=function(bx,by)br()if b.Options[bx]
and by.value then b.Options[bx]:UpdateSelection(by.value)end end},Colorpicker={
Save=function(bx,by)local bz=function(bz)return string.format('#%02X%02X%02X',
math.floor(bz.R*255),math.floor(bz.G*255),math.floor(bz.B*255))end return{type=
'Colorpicker',flag=bx,color=bz(by.Color)or nil,alpha=by.Alpha}end,Load=function(
bx,by)br()local bz=function(bz)local bA,bB,bC=tonumber(bz:sub(2,3),16)/255,
tonumber(bz:sub(4,5),16)/255,tonumber(bz:sub(6,7),16)/255 return Color3.new(bA,
bB,bC)end if b.Options[bx]and by.color then b.Options[bx]:SetColor(bz(by.color))
if by.alpha then b.Options[bx]:SetAlpha(by.alpha)end end end}},function()if k or
not(isfolder and makefolder)then return'Config system unavailable.'end local bx=
{b.Folder,b.Folder..'/settings'}for by=1,#bx do local bz=bx[by]if not isfolder(
bz)then makefolder(bz)end end end function b:LoadAutoLoadConfig()br()if k or not
(isfile and readfile)then return'Config system unavailable.'end local bz,bA=(b.
Folder..'/settings/autoload.txt')if isfile(bz)then local bB,bC=pcall(readfile,bz
)if bB and type(bC)=='string'then bC=string.gsub(bC,'[\r\n%s]+','')if#bC>0 then
bA=bC end end end if not bA then local bB=b.Folder..'/settings/Default.json'if
isfile(bB)then bA='Default'if writefile then pcall(writefile,bz,'Default')end
end end if not bA then print(
'[MacLib] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y autoload config n\u{e0}o trong '..bz)
return end print(string.format(
'[MacLib] Kh\u{1edf}i \u{111}\u{1ed9}ng n\u{1ea1}p autoload config: %q',bA))
local bB,bC=b:LoadConfig(bA)if not bB then pcall(function()y:Notify{Title=
'Interface',Description='Error loading autoload config: '..tostring(bC)}end)
warn(string.format('[MacLib] L\u{1ed7}i khi n\u{1ea1}p autoload config %q: %s',
bA,tostring(bC)))return end print(string.format(
'[MacLib] N\u{1ea1}p autoload config th\u{e0}nh c\u{f4}ng: %q',bA))pcall(
function()y:Notify{Title='Interface',Description=string.format(
'Autoloaded config: %q',bA)}end)end function b:SetFolder(bz)if k then return
'Config system unavailable.'end b.Folder=bz by()end function b:SaveConfig(bz)if
k or not writefile then return'Config system unavailable.'end if(not bz)then
return false,'Please select a config file.'end local bA,bB,bC=b.Folder..
'/settings/'..bz..'.json',{objects={},contextData=b.contextData or{}},{}for bD,
bE in ipairs(b.OptionOrder)do local bF=b.Options[bE]if bF and bx[bF.Class]and
not bF.IgnoreConfig then table.insert(bB.objects,bx[bF.Class].Save(bE,bF))bC[bE]
=true end end for bD,bE in next,b.Options do if not bC[bD]and bx[bE.Class]and
not bE.IgnoreConfig then table.insert(bB.objects,bx[bE.Class].Save(bD,bE))end
end local bD,bE=pcall(f.JSONEncode,f,bB)if not bD then return false,
'Unable to encode into JSON data'end writefile(bA,bE)return true end function b:
LoadConfig(bz)br()if k or not(isfile and readfile)then return
'Config system unavailable.'end if(not bz)then return false,
'Please select a config file.'end bz=string.gsub(tostring(bz),'[\r\n%s]+','')if#
bz==0 then return false,'Please select a config file.'end local bA=b.Folder..
'/settings/'..bz..'.json'if not isfile(bA)then return false,'Invalid file: '..
tostring(bA)end local bB,bC=pcall(f.JSONDecode,f,readfile(bA))if not bB or type(
bC)~='table'then return false,'Unable to decode JSON data.'end b.LoadingConfig=
true b.contextData=bC.contextData or{}local bD,bE=bC.objects or{},0 for bF,bG in
next,bD do if bG and bG.type and bx[bG.type]then local bH,bI=pcall(function()bx[
bG.type].Load(bG.flag,bG)end)if bH then bE=bE+1 else warn(string.format(
'[MacLib:LoadConfig] L\u{1ed7}i khi n\u{1ea1}p option %s (%s): %s',tostring(bG.
flag),tostring(bG.type),tostring(bI)))end end end print(string.format(
'[MacLib:LoadConfig] \u{110}\u{e3} n\u{1ea1}p config %q (%d/%d options th\u{e0}nh c\u{f4}ng)'
,bz,bE,#bD))task.delay(1,function()b.LoadingConfig=false end)return true end
function b:RefreshConfigList()if k or not(isfolder and listfiles)then return
'Config system unavailable.'end local bz,bA=(isfolder(b.Folder)and isfolder(b.
Folder..'/settings'))and listfiles(b.Folder..'/settings')or{},{}for bB=1,#bz do
local bC=bz[bB]if bC:sub(-5)=='.json'then local bD=bC:find('.json',1,true)local
bE,bF=bD,bC:sub(bD,bD)while bF~='/'and bF~='\\'and bF~=''do bD=bD-1 bF=bC:sub(bD
,bD)end if bF=='/'or bF=='\\'then local bG=bC:sub(bD+1,bE-1)if bG~='options'then
table.insert(bA,bG)end end end end return bA end z.Enabled=false local bz={}for
bA,bB in pairs(p)do table.insert(bz,bB)end g:PreloadAsync(bz)z.Enabled=true r=
true return y end function b:Demo()local aa=b:Window{Title='Maclib Demo',
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
{Mob={Min=15,Max=35,BossArea=false,BossAreaRadius=80,DisableDodge=false,
EnableHazardScanner=true},Boss1={Min=25,Max=50,BossArea=false,BossAreaRadius=80,
DisableDodge=false,EnableHazardScanner=true},Boss2={Min=25,Max=50,BossArea=false
,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=true},Boss3={Min=25,
Max=50,BossArea=false,BossAreaRadius=80,DisableDodge=false,EnableHazardScanner=
true}},{Normal='Mob',['Boss 1']='Boss1',['Boss 2']='Boss2',['Boss 3']='Boss3'},{
Mob='Normal',Boss1='Boss 1',Boss2='Boss 2',Boss3='Boss 3'},{},{}function ad.
GetTargetDisplay(aj)return ag[aj]or'Normal'end function ad.GetTargetKey(aj)
return af[aj]or'Mob'end function ad.GetTargetOptions()return{'Normal','Boss 1',
'Boss 2','Boss 3'}end function ad.GetSaveData()return ah end function ad.
LoadData(aj)if type(aj)=='table'then ah=aj else ah={}end aa.contextData=ah for
ak,al in ipairs(ai)do pcall(al)end end function ad.OnDataChanged(aj)if type(aj)
~='function'then return function()end end table.insert(ai,aj)return function()
for ak,al in ipairs(ai)do if al==aj then table.remove(ai,ak)break end end end
end local aj=function()aa.contextData=ah ab.Save()end function ad.
GetCombatDistances(ak,al)local am=al or'Mob'local an=ae[am]or ae.Mob if type(ak)
=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao=ah[ak][am]local ap,aq=(
type(ao.Min)=='number'and ao.Min>0)and ao.Min or an.Min,(type(ao.Max)=='number'
and ao.Max>0)and ao.Max or an.Max return ap,aq end return an.Min,an.Max end
function ad.GetActiveCombatDistances(ak)local al,am,an=ac.GetCurrentDungeonName(
),'Mob',false if ac.IsBossActive and ac.IsBossActive()then an=true am=ac.
GetCombatTargetKey()elseif ak then if ak.Room and type(ak.Room.Name)=='string'
and string.find(string.lower(ak.Room.Name),'boss')then an=true elseif ak.Model
then local ao=string.lower(ak.Model.Name)if string.find(ao,'boss')then an=true
else local ap=ak.Model.Parent if ap and string.find(string.lower(ap.Name),'boss'
)then an=true end end end if an then local ao=ac.GetCurrentBossIndex and ac.
GetCurrentBossIndex()or 1 am='Boss'..tostring(math.clamp(ao,1,3))end end return
ad.GetCombatDistances(al,am)end function ad.GetBossArea(ak,al)local am=al or
'Mob'if am=='Mob'then return false,80 end local an=ae[am]or ae.Boss1 if type(ak)
=='string'and#ak>0 and ah[ak]and ah[ak][am]then local ao=ah[ak][am]local ap,aq=
ao.BossArea==true,(type(ao.BossAreaRadius)=='number'and ao.BossAreaRadius>0)and
ao.BossAreaRadius or(an.BossAreaRadius or 80)return ap,aq end return an.BossArea
or false,an.BossAreaRadius or 80 end function ad.SetBossAreaEnabled(ak,al,am)if
not(type(ak)=='string'and#ak>0)then return end local an=al or'Mob'if an=='Mob'
then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah[ak][an]or{}ah[ak][an].BossArea=am
and true or false aj()end function ad.SetBossAreaRadius(ak,al,am)if not(type(ak)
=='string'and#ak>0)then return end local an=al or'Mob'if an=='Mob'then return
end if type(am)~='number'or am<=0 then return end ah[ak]=ah[ak]or{}ah[ak][an]=ah
[ak][an]or{}ah[ak][an].BossAreaRadius=am aj()end function ad.GetActiveBossArea(
ak)local al,am,an=ac.GetCurrentDungeonName(),'Mob',false if ac.IsBossActive and
ac.IsBossActive()then an=true am=ac.GetCombatTargetKey()elseif ak then if ak.
Room and type(ak.Room.Name)=='string'and string.find(string.lower(ak.Room.Name),
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
StopScan()end)return ak end function a.y()local aa,ab,ac,ad=a.load'e',a.load'f',
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
FindFirstChildOfClass'Humanoid')if aO and aO.Health>0 then aK=true local aP=aN.
Root.Position local aQ,aS=aP.X-aG.X,aP.Z-aG.Z local aT=aQ*aQ+aS*aS if aT<aJ then
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
function a.z()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al=a.load'e',a.load'f',a.
load'b',a.load'h',a.load'g',a.load'i',a.load'j',a.load'k',a.load'l',a.load'x',a.
load'y',a.load'q'local am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG=aa.
RunService,aa.player,{NO_TARGET='NO_TARGET',ACQUIRING_TARGET='ACQUIRING_TARGET',
TRACKING_TARGET='TRACKING_TARGET',CHASE='CHASE',HOLD='HOLD',KITE='KITE',BLOCKED=
'BLOCKED',REPATHING='REPATHING'},{},false,false,1.5,15,35,25,50,true,6,true,true
,true,true,true local aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,aS,aT,aU,aV,aW,aX,aY,aZ,a_,
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
Vector3.new(-bK.Z,0,bK.X)*1.2 for bN,bO in ipairs{3,6,10}do if bO<bz then local
bP=br+bK*bO local bQ,bR=bP+bM,bP-bM if not aj.IsPointSafe(bP,0.5)or not aj.
IsPointSafe(bQ,0.5)or not aj.IsPointSafe(bR,0.5)then bL=true break end end end
end if bL then aH=ao.HOLD aI='Hold (Danger Ahead)'aX=nil aN=0 bh()else aH=ao.
CHASE aI='Chase'local bM=Vector3.new(bv.X,br.Y,bv.Z)aX=bM bg(bK)local bN=bv.Y-br
.Y if bN>1.8 and bz<=8 then bq.Jump=true end local bO=bp.AssemblyLinearVelocity
or bp.Velocity local bP,bQ=bO and Vector3.new(bO.X,0,bO.Z).Magnitude or 0,(type(
bo)=='number'and bo>0)and bo or 0.016 if bP<aQ then aN+=bQ if aP and(bs-aO)>=0.4
then bq.Jump=true pcall(function()bq:ChangeState(Enum.HumanoidStateType.Jumping)
end)aO=bs end else aN=0 end end end end,function()if a2 and a2.Parent then
return a2 end if a2 then pcall(function()a2:Destroy()end)a2=nil end a2=Instance.
new'Highlight'a2.Name='TM_EnemyHighlight_Debug'a2.FillColor=Color3.fromRGB(255,
200,0)a2.FillTransparency=0.5 a2.OutlineColor=Color3.fromRGB(255,0,0)a2.
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
SetAutoJumpOnStuck(bv)aP=bv==true end function ap.IsAutoJumpOnStuckEnabled()
return aP end function ap.SetStuckVelocityThreshold(bv)if type(bv)=='number'and
bv>0 then aQ=bv end end function ap.GetStuckVelocityThreshold()return aQ end
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
false)bu()end)return ap end function a.A()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.
load'b',a.load'z',a.load'x',a.load'h',a.load'c',{},false,true,false,{}local ak=
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
function a.B()local aa={}function aa.PatchSliderLoadCallback(ab)if not ab or
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
ad(ae,af)end return ab end return aa end function a.C()local aa,ab,ac=a.load'e',
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
=false end)return af end function a.D()local aa,ab,ac,ad,ae=a.load'e',a.load'f',
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
.E()local aa,ab,ac,ad,ae=a.load'f',a.load'B',a.load'd',a.load'C',a.load'D'return
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
)ae.ResetNow()end}end end function a.F()local aa,ab,ac,ad,ae,af,ag=game:
GetService'Players',game:GetService'Workspace',game:GetService
'ReplicatedStorage',a.load'e',{},{},{'largeicespikes','mediumicespikes',
'smallicespikes','icespikes'}local ah=function()table.clear(af)local ah={
'abilities','projectiles'}for ai,aj in ipairs(ah)do local ak=ac:FindFirstChild(
aj)if ak then for al,am in ipairs(ak:GetChildren())do local an=am.Name:lower():
gsub('%s+','')af[an]=true end end end end ah()function ae.IsIceSpikes(ai)if not
ai then return false end local aj=typeof(ai)=='Instance'and ai.Name or tostring(
ai)local ak=aj:lower():gsub('%s+','')if#ak==0 then return false end for al,am in
ipairs(ag)do if string.find(ak,am,1,true)then return true end end return false
end function ae.IsFirstBossBigSpike(ai)if not ai then return false end local aj=
typeof(ai)=='Instance'and ai.Name or tostring(ai)local ak=aj:lower():gsub('%s+',
'')if#ak==0 or string.find(ak,'seekingspike',1,true)then return false end return
string.find(ak,'firstbossbigspike',1,true)~=nil or string.find(ak,'bigspike',1,
true)~=nil end function ae.IsPlayerCharacter(ai)if not ai then return true end
for aj,ak in ipairs(aa:GetPlayers())do if ak.Character and(ai==ak.Character or
ai:IsDescendantOf(ak.Character))then return true end end return false end
function ae.IsEnemyModel(ai)if not ai then return false end if ai:IsA'Model'and
ai:FindFirstChildOfClass'Humanoid'then return true end if ai.Parent and ai.
Parent:IsA'Model'and ai.Parent:FindFirstChildOfClass'Humanoid'then return true
end return false end function ae.IsPlayerAbility(ai)if not ai then return false
end local aj=ai.Name:lower():gsub('%s+','')if af[aj]then return true end if ai.
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
ak,'sweepingflames',1,true)~=nil end function ae.IsMemoryModel(ai)if not ai then
return false end local aj=typeof(ai)=='Instance'and ai.Name or tostring(ai)local
ak=aj:lower():gsub('%s+','')return string.find(ak,'bonusbossmemorymodel',1,true)
~=nil or string.find(ak,'memorymodel',1,true)~=nil end function ae.IsHazardPart(
ai,aj)if not ai or not ai:IsA'BasePart'or not ai.Parent then return false end if
ai.Name=='PrimaryPart'then return false end if ae.IsMultiRing(ai)or(ai.Parent
and ae.IsMultiRing(ai.Parent))or(aj and ae.IsMultiRing(aj))then local ak=ai.Name
:lower()if ak=='center'or ak:find'multiring'then return true end return false
end if ae.IsIceSpikes(ai)or(ai.Parent and ae.IsIceSpikes(ai.Parent))or(aj and ae
.IsIceSpikes(aj))then return true end local ak=ae.IsSweepingFlames(ai)or(ai.
Parent and ae.IsSweepingFlames(ai.Parent))or(ai.Parent and ai.Parent.Parent and
ae.IsSweepingFlames(ai.Parent.Parent))or(aj and ae.IsSweepingFlames(aj))if ak
then local al=ai.Name:lower()if al=='precast'then if ai.Transparency<=0.85 then
return true end local am=ai:FindFirstChildWhichIsA'ParticleEmitter'if am and am.
Enabled then return true end return false end return false end local al=ae.
IsMemoryModel(ai)or(ai.Parent and ae.IsMemoryModel(ai.Parent))or(aj and ae.
IsMemoryModel(aj))if al then local am=ai.Name:lower()if am=='primarypart'then
return false end if am:find'precast'or am:find'hitbox'then if ai.Transparency<=
0.85 then return true end local an=ai:FindFirstChildWhichIsA'ParticleEmitter'if
an and an.Enabled then return true end return false end return false end local
am=ae.IsFirstBossBigSpike(ai)or(ai.Parent and ae.IsFirstBossBigSpike(ai.Parent))
or(aj and ae.IsFirstBossBigSpike(aj))if am then local an=ai.Name:lower()if an==
'primarypart'then return false end return true end if ai.Transparency>0.85 then
return false end if ai.Material==Enum.Material.Neon then return true end return
false end ae.IsNeonHazardPart=ae.IsHazardPart function ae.
FindHazardPartsInLevel1Child(ai)local aj={}if not ae.
IsValidLevel1WorkspaceChild(ai)then return aj end if ai:IsA'BasePart'then if ae.
IsHazardPart(ai,ai)then table.insert(aj,ai)end elseif ai:IsA'Model'then if ae.
IsMultiRing(ai)then local ak=ai:FindFirstChild('center',true)or ai:
FindFirstChildWhichIsA'BasePart'if ak and ak.Name~='PrimaryPart'then table.
insert(aj,ak)return aj end end if ae.IsFirstBossBigSpike(ai)then local ak=ai.
PrimaryPart or ai:FindFirstChildWhichIsA'BasePart'if ak and ae.IsHazardPart(ak,
ai)then table.insert(aj,ak)return aj end end for ak,al in ipairs(ai:
GetDescendants())do if al:IsA'BasePart'and ae.IsHazardPart(al,ai)then table.
insert(aj,al)end end end return aj end ae.FindNeonPartsInLevel1Child=ae.
FindHazardPartsInLevel1Child return ae end function a.G()local aa,ab,ac,ad,ae,af
,ag=a.load'F',{},function(aa)if not aa then return'#ff2a55'end local ab,ac,ad=
math.clamp(math.floor(aa.R*255),0,255),math.clamp(math.floor(aa.G*255),0,255),
math.clamp(math.floor(aa.B*255),0,255)return string.format('#%02x%02x%02x',ab,ac
,ad)end,function(aa)if not aa then return 0 end local ab=aa.LookVector if not ab
or ab.Magnitude<0.001 then return 0 end return math.deg(math.atan2(ab.X,-ab.Z))
end,{coreRadius=12.5,maxRadius=105,rings={{rIn=12.5,rOut=25,yawOffset=180,side=1
},{rIn=25,rOut=37.5,yawOffset=0,side=0},{rIn=37.5,rOut=50,yawOffset=180,side=1},
{rIn=50,rOut=62.5,yawOffset=0,side=0},{rIn=62.5,rOut=75,yawOffset=180,side=1},{
rIn=75,rOut=87.5,yawOffset=0,side=0},{rIn=87.5,rOut=105,yawOffset=180,side=1}}},
function(aa,ab,ac,ad,ae,af,ag)ag=ag or 12 local ah,ai={},(af or 180)/2 local aj,
ak=ae-ai,ae+ai local al,am=math.rad(aj),math.rad(ak)local an=am-al for ao=0,ag
do local ap=al+(an*(ao/ag))local aq,ar=aa+math.sin(ap)*ad,ab-math.cos(ap)*ad
table.insert(ah,{x=aq,z=ar})end for ao=ag,0,-1 do local ap=al+(an*(ao/ag))local
aq,ar=aa+math.sin(ap)*ac,ab-math.cos(ap)*ac table.insert(ah,{x=aq,z=ar})end
return ah end,function(aa,ab,ac,ad)ad=ad or 16 local ae={}for af=0,ad-1 do local
ag=(math.pi*2)*(af/ad)local ah,ai=aa+math.sin(ag)*ac,ab-math.cos(ag)*ac table.
insert(ae,{x=ah,z=ai})end return ae end function ab.AnalyzeHazardPart(ah,ai)if
not ah or not ah:IsA'BasePart'or not ah.Parent then return nil end local aj,ak=
ah.Size,ah.CFrame local al,am,an=ak.Position,ad(ak),ac(ah.Color)if aa.
IsIceSpikes(ah)or(ah.Parent and aa.IsIceSpikes(ah.Parent))then an='#38d9ff'end
if aa.IsSweepingFlames(ah)or(ah.Parent and aa.IsSweepingFlames(ah.Parent))or(ah.
Parent and ah.Parent.Parent and aa.IsSweepingFlames(ah.Parent.Parent))then an=
'#ff6b22'end if aa.IsMemoryModel(ah)or(ah.Parent and aa.IsMemoryModel(ah.Parent)
)then local ao=ah.Name:lower()if ao:find'good'then an='#22ff88'else an='#ff2a55'
end end local ao=ah:FindFirstChildWhichIsA('SpecialMesh',true)if ao then local
ap,aq,ar=math.abs(ao.Scale.X),math.abs(ao.Scale.Y),math.abs(ao.Scale.Z)aj=
Vector3.new(aj.X*ap,aj.Y*aq,aj.Z*ar)end local ap,aq=ah.Name:lower(),(ah.Parent
and ah.Parent.Name:lower())or''local ar=aa.IsMultiRing(ah)or aa.IsMultiRing(ah.
Parent)or(ap=='center'and string.find(aq,'ring')~=nil)if ar then local as,at,au=
al,ah,(ah.Parent and ah.Parent:IsA'Model')and ah.Parent or nil if au then local
av=au:FindFirstChild('center',true)if av and av:IsA'BasePart'then as=av.Position
at=av end end local av=am if at and at.CFrame then av=(ad(at.CFrame)+180)%360
end local ax,ay={},{}table.insert(ay,ag(as.X,as.Z,ae.coreRadius,16))for az,aA in
ipairs(ae.rings)do local aB=(av+aA.yawOffset)%360 local aC=af(as.X,as.Z,aA.rIn,
aA.rOut,aB,180,12)table.insert(ax,{rIn=aA.rIn,rOut=aA.rOut,yaw=aB,yawOffset=aA.
yawOffset,span=180,side=aA.side,polygon=aC})table.insert(ay,aC)end return{shape=
'compound_multiring',x=as.X,y=as.Y,z=as.Z,yaw=av,color='#3cd0d0',transparency=ah
.Transparency or 0.5,coreRadius=ae.coreRadius,maxRadius=ae.maxRadius,rings=ax,
polygons=ay,part=ah}end local as=aa.IsFirstBossBigSpike(ah)or(ah.Parent and aa.
IsFirstBossBigSpike(ah.Parent))if as then local at={aj.X,aj.Y,aj.Z}table.sort(at
)local au=math.max(at[2],at[3])local av=math.clamp(au/2,10,35)if av<12 then av=
14 end return{shape='circle',x=al.X,y=al.Y,z=al.Z,radius=av,color=an,
transparency=ah.Transparency,part=ah}end if ah:IsA'Part'and ah.Shape==Enum.
PartType.Ball then local at=math.max(aj.X,aj.Y,aj.Z)/2 return{shape='circle',x=
al.X,y=al.Y,z=al.Z,radius=at,color=an,transparency=ah.Transparency,part=ah}end
if ah:IsA'Part'and ah.Shape==Enum.PartType.Cylinder then if math.abs(ak.
RightVector.Y)>0.75 then local at=math.max(aj.Y,aj.Z)/2 return{shape='circle',x=
al.X,y=al.Y,z=al.Z,radius=at,color=an,transparency=ah.Transparency,part=ah}end
end local at,au=math.max(aj.X,aj.Z),math.min(aj.X,aj.Z)if au>0 and(at/au)<=1.15
and not ah:IsA'WedgePart'and aj.Y<=math.min(aj.X,aj.Z)then return{shape='circle'
,x=al.X,y=al.Y,z=al.Z,radius=at/2,color=an,transparency=ah.Transparency,part=ah}
end local av,ax,ay,az,aA,aB,aC=(ah:IsA'Part'and ah.Shape==Enum.PartType.Cylinder
),(ap:find'movingbeam'~=nil)or(aq:find'movingbeam'~=nil),(ap:find'missile'~=nil)
or(aq:find'missile'~=nil)if ax then aB=math.max(aj.X,aj.Z)/2 aC=math.max(2,math.
min(aj.X,math.max(aj.Y,aj.Z))/2)local aF=Vector3.new(ak.RightVector.X,0,ak.
RightVector.Z)if aF.Magnitude>0.01 then aA=aF.Unit else aA=Vector3.new(1,0,0)end
az=Vector3.new(-aA.Z,0,aA.X)if ai and ai.headingDir and ai.headingDir.Magnitude>
0.1 then if az:Dot(ai.headingDir)<0 then az=-az aA=-aA end end elseif ay then
local aF,aG=math.max(aj.X,math.max(aj.Y,aj.Z)),math.min(aj.X,math.min(aj.Y,aj.Z)
)aC=math.max(0.5,aF/2)aB=math.max(1.5,aG/2)if ai and ai.speed and ai.speed>=1
and ai.headingDir and ai.headingDir.Magnitude>0.1 then az=Vector3.new(ai.
headingDir.X,0,ai.headingDir.Z).Unit aA=Vector3.new(-az.Z,0,az.X)else local aH=
ak.LookVector local aI=Vector3.new(-aH.X,0,-aH.Z)if aI.Magnitude>0.01 then az=aI
.Unit else az=Vector3.new(0,0,-1)end aA=Vector3.new(-az.Z,0,az.X)end elseif av
then local aF=ak.RightVector local aG=Vector3.new(aF.X,0,aF.Z)if aG.Magnitude>
0.01 then az=aG.Unit else az=Vector3.new(0,0,-1)end aA=Vector3.new(-az.Z,0,az.X)
aC=math.max(0.5,aj.X/2)aB=math.max(0.5,math.max(aj.Y,aj.Z)/2)else local aF,aG=
math.max(0.5,aj.X/2),math.max(0.5,aj.Z/2)aB=aF aC=aG local aH=ak.LookVector
local aI=Vector3.new(aH.X,0,aH.Z)if aI.Magnitude>0.01 then az=aI.Unit else az=
Vector3.new(0,0,-1)end aA=Vector3.new(-az.Z,0,az.X)end local aF,aG,aH=math.deg(
math.atan2(az.X,-az.Z)),al.X,al.Z local aI,aJ,aK,aL=Vector3.new(aG,al.Y,aH)+aA*
aB+az*aC,Vector3.new(aG,al.Y,aH)-aA*aB+az*aC,Vector3.new(aG,al.Y,aH)-aA*aB-az*aC
,Vector3.new(aG,al.Y,aH)+aA*aB-az*aC local aM={{x=aI.X,z=aI.Z},{x=aJ.X,z=aJ.Z},{
x=aK.X,z=aK.Z},{x=aL.X,z=aL.Z}}return{shape='box',x=al.X,y=al.Y,z=al.Z,halfX=aB,
halfZ=aC,halfWidth=aB,halfLength=aC,fwd2D=az,right2D=aA,yaw=aF,vertices=aM,color
=an,transparency=ah.Transparency,part=ah}end ab.AnalyzeNeonPart=ab.
AnalyzeHazardPart return ab end function a.H()local aa,ab,ac,ad,ae,af=a.load'e',
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
speed>0.1 then al.headingDir=al.velocity.Unit end if al.speed>=ae then local at=
ag()if at and(at-ai).Magnitude<100 then local au=(at-ai).Unit local av=al.
headingDir:Dot(au)if av>0.85 then al.motionType='HOMING'else al.motionType=
'LINEAR'end else al.motionType='LINEAR'end al.angularVel=0 elseif math.abs(al.
angularVel)>=af then al.motionType='SPINNING'else al.motionType='STATIC'end al.
lastPos=ai al.lastYaw=aj or 0 al.lastTime=ak end return al end function ac.
GetRecord(ah)return ad[ah]end function ac.GetTrajectoryProjection(ah,ai)local aj
=ad[ah]if not aj or aj.motionType=='STATIC'then return nil end ai=ai or 1.5
local ak,al={},5 local am=ai/al for an=1,al do local ao=an*am if aj.motionType==
'SPINNING'then local ap=aj.lastYaw+(aj.angularVel*ao)table.insert(ak,{time=ao,x=
aj.lastPos.X,z=aj.lastPos.Z,yaw=ap})else local ap=aj.lastPos+(aj.velocity*ao)
table.insert(ak,{time=ao,x=ap.X,z=ap.Z,yaw=aj.lastYaw})end end return{motionType
=aj.motionType,speed=aj.speed,angularVel=aj.angularVel,dirX=aj.headingDir.X,dirZ
=aj.headingDir.Z,futurePoints=ak}end function ac.RemoveRecord(ah)ad[ah]=nil end
function ac.ClearAll()table.clear(ad)end return ac end function a.I()local aa,ab
,ac=a.load'f',a.load'q',{}local ad,ae,af=function()if not aa.GetTrackedEnemyData
then return nil end local ad=aa.GetTrackedEnemyData()for ae,af in ipairs(ad)do
if af and af.Model and af.Humanoid and af.Humanoid.Health>0 then local ag=af.
Model.Name:lower()local ah=string.find(ag,'boss')~=nil or(af.Room and string.
find(af.Room.Name:lower(),'boss')~=nil)or(af.Model.Parent and string.find(af.
Model.Parent.Name:lower(),'boss')~=nil)if ah or(aa.IsBossActive and aa.
IsBossActive())then return af.Model,af.Humanoid,af.Root end end end return nil,
nil,nil end,function(ad)local ae={}if not ad then return ae end local af,ag=ad:
FindFirstChildOfClass'Animator'or ad,{}pcall(function()ag=af:
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
.J()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am=game:GetService'Workspace',a.
load'F',{},false,{},0,'IDLE',0,0,0.25 local an,ao=function(an)if not an or not
an:IsA'BasePart'or not an:IsDescendantOf(aa)then return false end if an.
Transparency<=0.85 then return true end local ao=an:FindFirstChildWhichIsA
'ParticleEmitter'if ao and ao.Enabled then return true end return false end,
function()for an,ao in ipairs(aa:GetChildren())do if ab.IsMemoryModel(ao)and ao:
IsA'Model'then return ao end end return nil end function ac.Reset()ad=false
table.clear(ae)af=0 ag='IDLE'ak=nil ah=0 ai=0 al=nil am=nil end function ac.
Update(ap)local aq=ao()if not aq then if ad then ac.Reset()end return end if not
ad then ad=true ai=ap table.clear(ae)af=0 ag='HINT'end local ar,as,at,au,av,ax=
aq:FindFirstChild'leftPrecast',aq:FindFirstChild'rightPrecast',aq:FindFirstChild
'leftHitbox',aq:FindFirstChild'rightHitbox',aq:FindFirstChild'leftPrecastGood',
aq:FindFirstChild'rightPrecastGood'local ay,az,aA,aB=an(ar)or an(av),an(as)or
an(ax),an(at),an(au)local aC=aA or aB if aC and ag~='EXECUTION'then ag=
'EXECUTION'af=1 ak=nil ah=0 end if ag=='HINT'then local aF if ay and not az then
aF='LEFT'elseif az and not ay then aF='RIGHT'end if aF and aF~=ak and(ap-ah>aj)
then table.insert(ae,aF)ak=aF ah=ap elseif not aF and ak and(ap-ah>aj)then ak=
nil end elseif ag=='EXECUTION'then local aF if aA then aF='LEFT'elseif aB then
aF='RIGHT'end al=aF if aF=='LEFT'then am='RIGHT'elseif aF=='RIGHT'then am='LEFT'
else local aG=math.clamp(af,1,math.max(1,#ae))am=ae[aG]or nil end if aF and aF~=
ak and(ap-ah>aj)then ak=aF ah=ap elseif not aF and ak and(ap-ah>aj)then af=math.
min(#ae,af+1)ak=nil end end end function ac.GetMemoryTelemetry()if not ad and#ae
==0 then return nil end local ap='Waiting...'if ag=='HINT'then ap=string.format(
'\u{1f9e0} Phase 1: Recorded %d steps',#ae)elseif ag=='EXECUTION'then local aq,
ar=math.clamp(af,1,math.max(1,#ae)),math.max(1,#ae)if am then local as=(am==
'LEFT')and'RIGHT'or'LEFT'ap=string.format(
'\u{1f7e2} SAFE: %s | \u{1f534} DANGER: %s (Step %d/%d)',am,as,aq,ar)else ap=
string.format('\u{26a1} Preparing Strike (Step %d/%d)',aq,ar)end end return{
active=ad,phase=ag,sequence=ae,currentStep=math.clamp(af,1,math.max(1,#ae)),
totalSteps=#ae,currentAttackSide=al,safeSide=am,hintText=ap}end return ac end
function a.K()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an=game:GetService
'Workspace',game:GetService'RunService',game:GetService'Players',a.load'e',{},
false,{},0.22,0.85,0.48,Color3.fromRGB(255,220,20),(Color3.fromRGB(34,255,136))
local ao,ap,aq=function(ao)if ao and ao.color=='#22ff88'then return al end
return ak end,function(ao)local ap=ad.player or ac.LocalPlayer local aq=ap and
ap.Character local ar,as=aq and(aq:FindFirstChild'HumanoidRootPart'or aq.
PrimaryPart),aq and aq:FindFirstChildOfClass'Humanoid'if ar then local at,au=(ar
.Size and ar.Size.Y>0)and(ar.Size.Y/2)or 1,(as and as.HipHeight and as.HipHeight
>0)and as.HipHeight or 1.8 return ar.Position.Y-(au+at)+0.1 end return(ao and(ao
.Y-1.5)or 0)+0.1 end,function()if an and an.Parent then return an end local ao=
aa.Terrain:FindFirstChild'HazardVisualizerV2'if ao then an=ao return an end
local ap=Instance.new'Folder'ap.Name='HazardVisualizerV2'ap.Parent=aa.Terrain an
=ap return ap end function ae.Detach(ar)if not ar then return end local as=ag[ar
]if not as then return end if as.adornments then for at,au in ipairs(as.
adornments)do pcall(function()au:Destroy()end)end table.clear(as.adornments)end
ag[ar]=nil end function ae.ClearAll()for ar,as in pairs(ag)do ae.Detach(ar)end
table.clear(ag)if an then pcall(function()an:ClearAllChildren()end)end end
function ae.Update(ar,as)if not af or not ar or not ar.Parent or not as then
return end if ar.Transparency>ai then ae.Detach(ar)return end local at=as.shape
if not at then return end local au=Vector3.new(at.x,at.y,at.z)local av,ax,ay,az=
ap(au),ao(at),aq(),ag[ar]if not az then az={part=ar,adornments={},shapeType=at.
shape,lastFloorY=av}ag[ar]=az else az.lastFloorY=av if az.shapeType~=at.shape
then for aA,aB in ipairs(az.adornments)do pcall(function()aB:Destroy()end)end
table.clear(az.adornments)az.shapeType=at.shape end end if at.shape=='circle'
then local aA=az.adornments[1]if not aA or not aA.Parent or not aA:IsA
'CylinderHandleAdornment'then if aA then pcall(function()aA:Destroy()end)end aA=
Instance.new'CylinderHandleAdornment'aA.Name='GroundCircle_'..ar.Name aA.Adornee
=aa.Terrain aA.AlwaysOnTop=true aA.ZIndex=2 aA.Transparency=aj aA.Parent=ay az.
adornments[1]=aA end aA.Radius=at.radius or 5 aA.Height=ah aA.Color3=ax aA.
CFrame=CFrame.new(at.x,av,at.z)*CFrame.Angles(math.rad(90),0,0)elseif at.shape==
'box'then local aA=az.adornments[1]if not aA or not aA.Parent or not aA:IsA
'BoxHandleAdornment'then if aA then pcall(function()aA:Destroy()end)end aA=
Instance.new'BoxHandleAdornment'aA.Name='GroundBox_'..ar.Name aA.Adornee=aa.
Terrain aA.AlwaysOnTop=true aA.ZIndex=2 aA.Transparency=aj aA.Parent=ay az.
adornments[1]=aA end local aB,aC,aF=at.halfWidth or at.halfX or 2,at.halfLength
or at.halfZ or 2,at.fwd2D or Vector3.new(0,0,-1)if aF.Magnitude<0.001 then aF=
Vector3.new(0,0,-1)else aF=aF.Unit end local aG=at.right2D if not aG or aG.
Magnitude<0.001 then aG=Vector3.new(-aF.Z,0,aF.X)else aG=aG.Unit end aA.Size=
Vector3.new(aB*2,ah,aC*2)aA.Color3=ax local aH,aI=pcall(function()return CFrame.
fromMatrix(Vector3.new(at.x,av,at.z),aG,Vector3.yAxis,-aF)end)if aH and aI then
aA.CFrame=aI else aA.CFrame=CFrame.new(at.x,av,at.z)end elseif at.shape==
'compound_multiring'then local aA=az.adornments[1]if not aA or not aA.Parent or
not aA:IsA'CylinderHandleAdornment'then if aA then pcall(function()aA:Destroy()
end)end aA=Instance.new'CylinderHandleAdornment'aA.Name='MultiRingCore'aA.
Adornee=aa.Terrain aA.AlwaysOnTop=true aA.ZIndex=3 aA.Transparency=0.45 aA.
Color3=Color3.fromRGB(255,235,60)aA.Parent=ay az.adornments[1]=aA end aA.Radius=
at.coreRadius or 12.5 aA.Height=ah aA.CFrame=CFrame.new(at.x,av,at.z)*CFrame.
Angles(math.rad(90),0,0)local aB,aC,aF=at.rings or{},2,5 for aG,aH in ipairs(aB)
do local aI,aJ=aH.rIn or 12.5,aH.rOut or 25 local aK,aL,aM,aN=(aI+aJ)/2,aJ-aI,aH
.yaw or 0,math.pi local aO,aP=aN/aF,math.rad(aM-90)local aQ=aK*aO*1.08 for aS=1,
aF do local aT=aP+(aS-0.5)*aO local aU,aV,aW,aX,aY=at.x+math.sin(aT)*aK,at.z-
math.cos(aT)*aK,Vector3.new(math.cos(aT),0,math.sin(aT)),Vector3.new(math.sin(aT
),0,-math.cos(aT)),az.adornments[aC]if not aY or not aY.Parent or not aY:IsA
'BoxHandleAdornment'then if aY then pcall(function()aY:Destroy()end)end aY=
Instance.new'BoxHandleAdornment'aY.Name='RingArcSeg'aY.Adornee=aa.Terrain aY.
AlwaysOnTop=true aY.ZIndex=2 aY.Transparency=0.55 aY.Color3=ak aY.Parent=ay az.
adornments[aC]=aY end aY.Size=Vector3.new(aL,ah,aQ)local aZ,a_=pcall(function()
return CFrame.fromMatrix(Vector3.new(aU,av,aV),aX,Vector3.yAxis,-aW)end)if aZ
and a_ then aY.CFrame=a_ else aY.CFrame=CFrame.new(aU,av,aV)end aC+=1 end end
for aG=aC,#az.adornments do if az.adornments[aG]then pcall(function()az.
adornments[aG]:Destroy()end)az.adornments[aG]=nil end end end end local ar=
function()if not af then return end local ar={}for as,at in pairs(ag)do if not
as or not as:IsDescendantOf(aa)or as.Transparency>ai then table.insert(ar,as)end
end for as,at in ipairs(ar)do ae.Detach(at)end end function ae.SetEnabled(as)if
af==as then return end af=as if af then ae.ClearAll()if not am then am=ab.
Heartbeat:Connect(ar)end else if am then am:Disconnect()am=nil end ae.ClearAll()
end end function ae.IsEnabled()return af end return ae end function a.L()local
aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao=game:GetService'Workspace',a.load
'e',a.load'b',a.load'F',a.load'G',a.load'H',a.load'I',a.load'J',a.load'K',{},
false,{},{},{}local ap,aq=function(ap,aq)if not ap or not ap:IsA'BasePart'then
return end if not ad.IsHazardPart(ap,aq)then return end if al[ap]then return end
local ar=aq and aq.Name or(ap.Parent and ap.Parent.Name)or ap.Name local as=ad.
IsMultiRing(ar)or ad.IsMultiRing(ap)or(ap.Parent and ad.IsMultiRing(ap.Parent.
Name))or(aq and ad.IsMultiRing(aq))if as then for at,au in pairs(al)do if au.
level1Parent==aq or(aq and at:IsDescendantOf(aq))or at==ap then return end end
end local at=ae.AnalyzeHazardPart(ap)if not at then return end local au,av=os.
clock(),Vector3.new(at.x,at.y,at.z)local ax,ay=af.UpdateRecord(ap,av,at.yaw or 0
),(ap.Name==ar)and ar or(ar..'/'..ap.Name)if as then ay=ar elseif ad.
IsSweepingFlames(ar)and ap.Parent and ap.Parent~=aq then ay=ar..'/'..ap.Parent.
Name elseif ad.IsMemoryModel(ar)then ay=ar..'/'..ap.Name end local az={part=ap,
level1Parent=aq or ap,name=ay,spawnTime=au,shape=at,motion=ax}al[ap]=az if ai.
IsEnabled()then ai.Update(ap,az)end end,function(ap)if al[ap]then ai.Detach(ap)
al[ap]=nil af.RemoveRecord(ap)end end local ar,as,at,au=function(ar)if not ad.
IsValidLevel1WorkspaceChild(ar)then return end local as=ad.
FindHazardPartsInLevel1Child(ar)for at,au in ipairs(as)do ap(au,ar)end if ar:IsA
'Model'then am[ar]=ar.DescendantAdded:Connect(function(at)if at:IsA'BasePart'
then if ad.IsMultiRing(ar)then local au=false for av,ax in pairs(al)do if ax.
level1Parent==ar or av:IsDescendantOf(ar)or av==ar then au=true break end end if
not au and ad.IsHazardPart(at,ar)then ap(at,ar)end elseif ad.IsHazardPart(at,ar)
then ap(at,ar)end end end)end end,function(ar)if am[ar]then am[ar]:Disconnect()
am[ar]=nil end local as={}for at,au in pairs(al)do if au.level1Parent==ar or at
==ar or(ar:IsA'Instance'and at:IsDescendantOf(ar))then table.insert(as,at)end
end for at,au in ipairs(as)do aq(au)end end,function()for ar,as in ipairs(aa:
GetChildren())do if ad.IsValidLevel1WorkspaceChild(as)then local at=ad.
FindHazardPartsInLevel1Child(as)for au,av in ipairs(at)do ap(av,as)end end end
end,function()if not ak then return end local ar,as={},os.clock()ah.Update(as)
for at,au in pairs(al)do if not at or not at:IsDescendantOf(aa)then table.
insert(ar,at)continue end if au.level1Parent and not au.level1Parent:
IsDescendantOf(aa)then table.insert(ar,at)continue end local av,ax,ay,az=ad.
IsMultiRing(au.name)or ad.IsMultiRing(at)or(au.level1Parent and ad.IsMultiRing(
au.level1Parent)),ad.IsSweepingFlames(au.name)or ad.IsSweepingFlames(at)or(au.
level1Parent and ad.IsSweepingFlames(au.level1Parent)),ad.IsMemoryModel(au.name)
or ad.IsMemoryModel(at)or(au.level1Parent and ad.IsMemoryModel(au.level1Parent))
,ad.IsFirstBossBigSpike(au.name)or ad.IsFirstBossBigSpike(at)or(au.level1Parent
and ad.IsFirstBossBigSpike(au.level1Parent))if av then local aA=as-au.spawnTime
if aA>4.5 then table.insert(ar,at)continue end local aB=(au.level1Parent and au.
level1Parent:IsA'Model'and au.level1Parent)or(at.Parent and at.Parent:IsA'Model'
and at.Parent)if aB then local aC=false for aF,aG in ipairs(aB:GetDescendants())
do if aG:IsA'BasePart'and aG.Name~='PrimaryPart'then if aG.Transparency<=0.85
then aC=true break end end end if not aC then table.insert(ar,at)continue end
elseif at.Transparency>0.85 then table.insert(ar,at)continue end elseif ax then
local aA=false if at.Transparency<=0.85 then aA=true else local aB=at:
FindFirstChildWhichIsA'ParticleEmitter'if aB and aB.Enabled then aA=true end end
local aB=as-au.spawnTime if not aA or aB>2 then table.insert(ar,at)continue end
elseif ay then local aA=false if at.Transparency<=0.85 then aA=true else local
aB=at:FindFirstChildWhichIsA'ParticleEmitter'if aB and aB.Enabled then aA=true
end end local aB=as-au.spawnTime if not aA or aB>2.5 then table.insert(ar,at)
continue end elseif az then local aA=false if at.Transparency<=0.85 then aA=true
else local aB=aa:FindFirstChild'firstBossBeamPart'if aB then aA=true end end
local aB=as-au.spawnTime if not aA or aB>5 then table.insert(ar,at)continue end
else if at.Transparency>0.85 then table.insert(ar,at)continue end end local aA=
af.GetRecord(at)local aB=ae.AnalyzeHazardPart(at,aA)if aB then au.shape=aB local
aC=Vector3.new(aB.x,aB.y,aB.z)au.motion=af.UpdateRecord(at,aC,aB.yaw or 0)if ai.
IsEnabled()then ai.Update(at,au)end else table.insert(ar,at)end end for at,au in
ipairs(ar)do aq(au)end for at,au in ipairs(aa:GetChildren())do if ad.
IsSweepingFlames(au)and au:IsA'Model'then for av,ax in ipairs(au:GetDescendants(
))do if ax:IsA'BasePart'and ax.Name:lower()=='precast'and not al[ax]then if ad.
IsHazardPart(ax,au)then ap(ax,au)end end end elseif ad.IsMemoryModel(au)and au:
IsA'Model'then for av,ax in ipairs(au:GetDescendants())do if ax:IsA'BasePart'and
not al[ax]then if ad.IsHazardPart(ax,au)then ap(ax,au)end end end elseif ad.
IsFirstBossBigSpike(au)then local av=ad.FindHazardPartsInLevel1Child(au)for ax,
ay in ipairs(av)do if not al[ay]and ad.IsHazardPart(ay,au)then ap(ay,au)end end
end end end function aj.StartScan()if ak then return end ak=true table.clear(al)
table.clear(am)af.ClearAll()ah.Reset()table.insert(an,aa.ChildAdded:Connect(ar))
table.insert(an,aa.ChildRemoved:Connect(as))local av=ab.RunService or game:
GetService'RunService'ao=av.Heartbeat:Connect(au)at()end function aj.StopScan()
if not ak then return end ak=false if ao then ao:Disconnect()ao=nil end for av,
ax in ipairs(an)do if ax and ax.Disconnect then ax:Disconnect()end end table.
clear(an)for av,ax in pairs(am)do if ax and ax.Disconnect then ax:Disconnect()
end end table.clear(am)ai.ClearAll()table.clear(al)af.ClearAll()ah.Reset()end
function aj.IsEnabled()return ak end function aj.SetVisualizerEnabled(av)if av
then aj.StartScan()ai.SetEnabled(true)for ax,ay in pairs(al)do ai.Update(ax,ay)
end else ai.SetEnabled(false)end end function aj.IsVisualizerEnabled()return ai.
IsEnabled()end function aj.GetActiveHazardsTelemetry()local av,ax={},os.clock()
for ay,az in pairs(al)do local aA=az.shape if not aA then continue end local aB,
aC=af.GetTrajectoryProjection(ay,1.5),ax-az.spawnTime if aA.shape==
'compound_multiring'then table.insert(av,{id=tostring(ay),name=az.name,shape=
'compound_multiring',x=aA.x,y=aA.y,z=aA.z,yaw=aA.yaw or 0,coreRadius=aA.
coreRadius or 12.5,maxRadius=aA.maxRadius or 105,rings=aA.rings,polygons=aA.
polygons,color=aA.color or'#3cd0d0',transparency=aA.transparency or 0.5,age=aC,
motionType=az.motion and az.motion.motionType or'STATIC',speed=az.motion and az.
motion.speed or 0,angularVel=az.motion and az.motion.angularVel or 0,trajectory=
aB})elseif aA.shape=='circle'then table.insert(av,{id=tostring(ay),name=az.name,
shape='circle',x=aA.x,y=aA.y,z=aA.z,radius=aA.radius,color=aA.color or'#ff2a55',
age=aC,motionType=az.motion and az.motion.motionType or'STATIC',speed=az.motion
and az.motion.speed or 0,angularVel=az.motion and az.motion.angularVel or 0,
trajectory=aB})elseif aA.shape=='box'then table.insert(av,{id=tostring(ay),name=
az.name,shape='box',x=aA.x,y=aA.y,z=aA.z,halfX=aA.halfX,halfZ=aA.halfZ,yaw=aA.
yaw,vertices=aA.vertices,color=aA.color or'#ff2a55',age=aC,motionType=az.motion
and az.motion.motionType or'STATIC',speed=az.motion and az.motion.speed or 0,
angularVel=az.motion and az.motion.angularVel or 0,trajectory=aB})elseif aA.
shape=='polygon'then table.insert(av,{id=tostring(ay),name=az.name,shape=
'polygon',x=aA.x,y=aA.y,z=aA.z,vertices=aA.vertices,color=aA.color or'#ff2a55',
age=aC,motionType=az.motion and az.motion.motionType or'STATIC',speed=az.motion
and az.motion.speed or 0,angularVel=az.motion and az.motion.angularVel or 0,
trajectory=aB})end end return av end function aj.GetBossTelegraphTelemetry()
return ag.GetBossTelegraphData()end function aj.GetMemoryGameTelemetry()return
ah.GetMemoryTelemetry()end ac.Register(function()aj.StopScan()end)return aj end
function a.M()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an=game:GetService
'HttpService',game:GetService'Players',a.load'e',a.load'f',a.load'q',a.load'L',a
.load'b',{},false,'ws://127.0.0.1:8765',30,'Disconnected',{},function()if
typeof(WebSocket)=='table'and typeof(WebSocket.connect)=='function'then return
WebSocket.connect elseif typeof(WebSocket)=='table'and typeof(WebSocket.Connect)
=='function'then return WebSocket.Connect elseif typeof(websocket)=='table'and
typeof(websocket.connect)=='function'then return websocket.connect elseif
typeof(syn)=='table'and typeof(syn.websocket)=='table'and typeof(syn.websocket.
connect)=='function'then return syn.websocket.connect end return nil end local
ao,ap=function(ao)if al==ao then return end al=ao for ap,aq in ipairs(am)do
pcall(aq,al)end end,function(ao)if not ao or ao.Magnitude<0.001 then return 0
end return math.deg(math.atan2(ao.X,-ao.Z))end local aq=function()local aq={}if
not ad.GetTrackedEnemyData then return aq end local ar=ad.GetTrackedEnemyData()
for as,at in ipairs(ar)do if at and at.Model and at.Root and at.Humanoid and at.
Humanoid.Health>0 then local au=at.Model.Name local av=string.find(au:lower(),
'boss')~=nil table.insert(aq,{name=au,x=at.Root.Position.X,y=at.Root.Position.Y,
z=at.Root.Position.Z,yaw=at.Root and ap(at.Root.CFrame.LookVector)or 0,health=
math.max(0,at.Humanoid.Health),maxHealth=math.max(1,at.Humanoid.MaxHealth),
isBoss=av})end end return aq end local ar,as,at=function()local ar=ac.player or
ab.LocalPlayer local as=ar and ar.Character local at,au=as and(as:FindFirstChild
'HumanoidRootPart'or as.PrimaryPart),as and as:FindFirstChildOfClass'Humanoid'
local av,ax,ay,az,aA=at and at.Position or Vector3.zero,at and ap(at.CFrame.
LookVector)or 0,au and au.MoveDirection or Vector3.zero,false if ad.
IsInvulnerable then az,aA=ad.IsInvulnerable()end local aB,aC,aF=af.
GetActiveHazardsTelemetry(),af.GetBossTelegraphTelemetry(),af.
GetMemoryGameTelemetry and af.GetMemoryGameTelemetry()or nil local aG={type=
'TELEMETRY',version='V2',timestamp=os.clock(),dungeon=(ad.GetCurrentDungeonName
and ad.GetCurrentDungeonName())or'Unknown',inLobby=(ad.IsInLobby and ad.
IsInLobby())or false,room=(ad.GetCurrentRoomIndex and ad.GetCurrentRoomIndex())
or 0,player={name=ar and ar.Name or'Player',x=av.X,y=av.Y,z=av.Z,yaw=ax,moveX=ay
.X,moveZ=ay.Z,health=au and math.max(0,au.Health)or 100,maxHealth=au and math.
max(1,au.MaxHealth)or 100,healthPercent=au and math.clamp((au.Health/au.
MaxHealth)*100,0,100)or 100,isInvulnerable=az,invulnReason=aA,isDead=(ad.IsDead
and ad.IsDead())or(au and au.Health<=0)or false},boss=aC,enemies=aq(),hazards=aB
,memory=aF}return aG end,function(ar,as)if not ar then return false,
'No websocket instance'end if typeof(ar.Send)=='function'then return pcall(
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
return ah end function a.N()local aa,ab,ac,ad,ae,af,ag=a.load'd',a.load'A',a.
load'x',a.load'L',a.load'M',a.load'f',a.load'B'return function(ah,ai)local aj=ai
:Section{Side='Left'}aj:Header{Name='Hazard Scanner Controls'}local ak=ai:
Section{Side='Right'}ak:Header{Name='Real-time Hazard Monitor'}local al,am,an,ao
,ap,aq=ak:Label{Text="Detector: <font color='rgb(255,80,80)'>Disabled</font>"},
ak:Label{Text="Player: <font color='rgb(0,255,170)'>SAFE</font>"},ak:Label{Text=
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]},ak:Label{Text=
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"},ak:Label{Text=
"Active Hazards: <font color='rgb(160,160,160)'>0</font>"},ak:Label{Text=
"Last Detected: <font color='rgb(160,160,160)'>None</font>"}local ar=function(ar
,as,at)if ar then local au,av=as and as.Name or'Unknown Threat',at and(' ['..at
..']')or''pcall(function()am:UpdateName((
[[Player: <font color='rgb(255,50,50)'><b>DANGER</b></font> (%s%s)]]):format(au,
av))end)else pcall(function()am:UpdateName
"Player: <font color='rgb(0,255,170)'><b>SAFE</b></font>"end)end end ac.
OnPlayerDangerChanged(function(as,at,au)ar(as,at,au)end)ac.OnSafeSpotChanged(
function(as,at,au)if as and at then pcall(function()an:UpdateName((
[[Safe Spot: <font color='rgb(0,255,120)'><b>Found (%.1f studs)</b></font>]]):
format(au))end)else pcall(function()an:UpdateName
[[Safe Spot: <font color='rgb(160,160,160)'>None Needed</font>]]end)end end)ac.
OnDodgeStateChanged(function(as,at,au)if as and at then pcall(function()ao:
UpdateName((
[[Auto Dodge: <font color='rgb(0,255,200)'><b>Dodging (%.1f studs)</b></font>]])
:format(au))end)else pcall(function()ao:UpdateName
"Auto Dodge: <font color='rgb(160,160,160)'>Idle</font>"end)end end)local as=
function(as,at)as=as or ac.GetHazardCount()at=at or ac.GetLastHazardInfo()local
au=ac.IsEnabled()local av,ax=au and'0, 255, 0'or'255, 80, 80',au and
'Active (Scanning & SelectionBox)'or'Disabled'pcall(function()al:UpdateName(
"Detector: <font color='rgb("..av..")'>"..ax..'</font>')end)local ay=as>0 and
'255, 60, 60'or'0, 255, 0'pcall(function()ap:UpdateName(
"Active Hazards: <font color='rgb("..ay..")'>"..tostring(as)..'</font>')end)if
at then pcall(function()aq:UpdateName((
[[Last Detected: <font color='rgb(255,220,120)'>%s</font> (%s, %d studs)]]):
format(at.Name,at.Class,at.Distance))end)else pcall(function()aq:UpdateName
"Last Detected: <font color='rgb(160,160,160)'>None</font>"end)end end ak:Header
{Name='Specific Skill Inspector'}ak:Toggle({Name='Enable Deep Inspector',Default
=ac.IsInspectEnabled(),Callback=aa.Wrap(function(at)ac.SetInspectEnabled(at)end)
},'Toggle_HazardDeepInspector')ak:Input{Name='Target Skill Name',Placeholder=
'e.g. Meteor, Spike, Flame...',AcceptedCharacters='All',Default=ac.
GetInspectTarget(),Callback=aa.Wrap(function(at)ac.SetInspectTarget(at)end)}
local at=ai:Section{Side='Right'}at:Header{Name='Custom Trajectory Dimensions'}
ag.PatchSliderLoadCallback(at:Slider({Name='Second Boss Moving Beam (studs)',
Default=ac.GetSecondBossBeamLength(),Minimum=10,Maximum=250,DisplayMethod=
'Value',Precision=0,Callback=aa.Wrap(function(au)ac.SetSecondBossBeamLength(au)
end)},'Slider_HazardSecondBossBeamLength'))ag.PatchSliderLoadCallback(at:Slider(
{Name='First Boss Big Spike Width (studs)',Default=ac.GetFirstBossBigSpikeWidth(
),Minimum=10,Maximum=60,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(
function(au)ac.SetFirstBossBigSpikeWidth(au)end)},
'Slider_HazardFirstBossBigSpikeWidth'))ag.PatchSliderLoadCallback(at:Slider({
Name='First Boss Seeking Spike Width (studs)',Default=ac.
GetFirstBossSeekingSpikeWidth(),Minimum=4,Maximum=30,DisplayMethod='Value',
Precision=0,Callback=aa.Wrap(function(au)ac.SetFirstBossSeekingSpikeWidth(au)end
)},'Slider_HazardFirstBossSeekingSpikeWidth'))ag.PatchSliderLoadCallback(at:
Slider({Name='Second Boss Circle Chain Lifetime (s)',Default=ac.
GetSecondBossCircleDuration(),Minimum=0.5,Maximum=4,DisplayMethod='Value',
Precision=1,Callback=aa.Wrap(function(au)ac.SetSecondBossCircleDuration(au)end)}
,'Slider_HazardSecondBossCircleDuration'))local au=ai:Section{Side='Right'}au:
Header{Name='Live 2D Top-Down Radar (WebSocket)'}local av=au:Label{Text=
[[Radar Server: <font color='rgb(255,80,80)'>Disconnected</font>]]}local ax=
function(ax)local ay='255,80,80'if ax=='Connected'then ay='0,255,136'elseif ax==
'Connecting'then ay='255,170,0'end pcall(function()av:UpdateName(
"Radar Server: <font color='rgb("..ay..")'><b>"..tostring(ax)..'</b></font>')end
)end ae.OnStatusChanged(function(ay)ax(ay)end)au:Toggle({Name=
'Enable Live 2D Radar Stream',Default=ae.IsEnabled(),Callback=aa.Wrap(function(
ay)ae.SetEnabled(ay)ax(ae.GetStatus())end)},'Toggle_LiveRadarEnabled')au:Input{
Name='WebSocket Server URL',Placeholder='ws://127.0.0.1:8765',AcceptedCharacters
='All',Default=ae.GetUrl(),Callback=aa.Wrap(function(ay)ae.SetUrl(ay)end)}ag.
PatchSliderLoadCallback(au:Slider({Name='Stream Refresh Rate (FPS)',Default=ae.
GetFps(),Minimum=10,Maximum=60,DisplayMethod='Value',Precision=0,Callback=aa.
Wrap(function(ay)ae.SetFps(ay)end)},'Slider_LiveRadarFps'))ac.OnHazardChanged(
function(ay,az)as(ay,az)end)local ay=aj:Toggle({Name='Enable Hazard Scanner',
Default=ac.IsEnabled(),Callback=aa.Wrap(function(ay)ac.Toggle(ay)as()end)},
'Toggle_SmartDodgeThreatDetection')aj:Toggle({Name=
'Show Player 2D Hitbox (Ground Visual)',Default=ac.IsPlayerVisualEnabled(),
Callback=aa.Wrap(function(az)ac.SetPlayerVisualEnabled(az)end)},
'Toggle_HazardPlayer2DVisual')ag.PatchSliderLoadCallback(aj:Slider({Name=
'Player 2D Hitbox Radius (studs)',Default=ac.GetPlayerHitboxRadius(),Minimum=0.5
,Maximum=8,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(az)ac.
SetPlayerHitboxRadius(az)end)},'Slider_HazardPlayer2DHitboxRadius'))aj:Toggle({
Name='Show 3D Selection Boxes (Parts)',Default=ac.IsSelectionBoxesEnabled(),
Callback=aa.Wrap(function(az)ac.SetSelectionBoxesEnabled(az)end)},
'Toggle_HazardSelectionBoxes')aj:Toggle({Name=
'Show Lifespan Timer (3D Duration)',Default=ac.IsTimerVisualEnabled(),Callback=
aa.Wrap(function(az)ac.SetTimerVisualEnabled(az)end)},
'Toggle_HazardLifespanTimer')aj:Toggle({Name=
'Show Danger Zones (Ground Visualizer)',Default=ac.IsVisualizerEnabled(),
Callback=aa.Wrap(function(az)ac.SetVisualizerEnabled(az)end)},
'Toggle_HazardGroundVisualizer')aj:Toggle({Name=
'Show Ground Visualizer V2 (2D Shadows)',Default=ad.IsVisualizerEnabled(),
Callback=aa.Wrap(function(az)ad.SetVisualizerEnabled(az)end)},
'Toggle_HazardGroundVisualizerV2')aj:Toggle({Name=
'Show Trajectory Paths (Orange)',Default=ac.IsTrajectoryEnabled(),Callback=aa.
Wrap(function(az)ac.SetTrajectoryEnabled(az)end)},
'Toggle_HazardTrajectoryVisualizer')aj:Toggle({Name=
'Show Safe Spot Marker (Green Visual)',Default=ac.IsSafeSpotVisualEnabled(),
Callback=aa.Wrap(function(az)ac.SetSafeSpotVisualEnabled(az)end)},
'Toggle_HazardSafeSpotVisual')aj:Toggle({Name=
'Show Candidate Points & Rays (Scan Grid)',Default=ac.IsShowCandidates(),
Callback=aa.Wrap(function(az)ac.SetShowCandidates(az)end)},
'Toggle_HazardShowCandidates')ag.PatchSliderLoadCallback(aj:Slider({Name=
'Safe Spot Safety Margin (studs)',Default=ac.GetSafeSpotBuffer(),Minimum=0,
Maximum=6,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(az)ac.
SetSafeSpotBuffer(az)end)},'Slider_HazardSafeSpotBuffer'))local az=aj:Toggle({
Name='Enable Auto Dodge (Move + Snap)',Default=ac.IsAutoDodgeEnabled(),Callback=
aa.Wrap(function(az)ac.SetAutoDodgeEnabled(az)end)},
'Toggle_HazardAutoDodgeEnabled')aj:Header{Name='Sampling Pass Tiers'}aj:Toggle({
Name='Enable Fine Pass (Tier 2 - Max 45s)',Default=ac.IsFinePassEnabled(),
Callback=aa.Wrap(function(aA)ac.SetFinePassEnabled(aA)end)},
'Toggle_HazardFinePassEnabled')aj:Toggle({Name=
'Enable Emergency Fallback (Tier 3 - Max 55s)',Default=ac.IsFallbackPassEnabled(
),Callback=aa.Wrap(function(aA)ac.SetFallbackPassEnabled(aA)end)},
'Toggle_HazardFallbackPassEnabled')ab.OnStateChanged(function(aA)pcall(function(
)ay:UpdateState(aA,true)end)pcall(function()az:UpdateState(aA,true)end)as()end)
ag.PatchSliderLoadCallback(aj:Slider({Name='Dodge Snap Distance (studs)',Default
=ac.GetDodgeSnapDistance(),Minimum=0.5,Maximum=5,DisplayMethod='Value',Precision
=1,Callback=aa.Wrap(function(aA)ac.SetDodgeSnapDistance(aA)end)},
'Slider_HazardDodgeSnapDistance'))ag.PatchSliderLoadCallback(aj:Slider({Name=
'Respawn Invulnerability Time (s)',Default=af.GetRespawnProtectionDuration(),
Minimum=0.5,Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(
function(aA)af.SetRespawnProtectionDuration(aA)end)},
'Slider_HazardRespawnInvulnerabilityTime'))ag.PatchSliderLoadCallback(aj:Slider(
{Name='Trajectory Length (studs)',Default=ac.GetTrajectoryLength(),Minimum=10,
Maximum=150,DisplayMethod='Value',Precision=0,Callback=aa.Wrap(function(aA)ac.
SetTrajectoryLength(aA)end)},'Slider_HazardTrajectoryLength'))aj:Toggle({Name=
'Log Hazards (Spawns / Despawns)',Default=ac.IsLogHazardsEnabled(),Callback=aa.
Wrap(function(aA)ac.SetLogHazards(aA)end)},'Toggle_SmartDodgeLogHazards')aj:
Toggle({Name='Log Rejected (Unrenderable)',Default=ac.IsLogFailedEnabled(),
Callback=aa.Wrap(function(aA)ac.SetLogFailed(aA)end)},
'Toggle_SmartDodgeLogRejected')ag.PatchSliderLoadCallback(aj:Slider({Name=
'Blue Danger Zone Margin (studs)',Default=ac.GetTrajectoryMargin(),Minimum=0,
Maximum=10,DisplayMethod='Value',Precision=1,Callback=aa.Wrap(function(aA)ac.
SetTrajectoryMargin(aA)end)},'Slider_HazardTrajectoryMargin'))aj:Button{Name=
'Clear Console',Callback=function()pcall(function()if rconsoleclear then
rconsoleclear()end end)end}as()end end function a.O()local aa,ab,ac,ad,ae,af,ag,
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
end return 0 end ad.DUNGEONS=ab ad.DIFFICULTIES=aa return ad end function a.P()
local aa,ab,ac,ad,ae,af,ag,ah,ai=a.load'd',a.load'z',a.load'A',a.load'q',a.load
'O',a.load'f',a.load'e',a.load'B',a.load'b'local aj=ag.RunService return
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
aN.." | <font color='rgb(255,160,50)'>No Scanner</font>"end pcall(function()aC:
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
Register(function()pcall(a0)pcall(a1)pcall(a2)pcall(a3)end)aS()end end function
a.Q()local aa,ab,ac,ad,ae=a.load'd',a.load'A',a.load'E',a.load'N',a.load'P'
return function(af,ag)local ah=ag:Section{Side='Left'}ah:Header{Name=
'Combat Master'}local ai=ah:Toggle({Name='Enable Combat Master',Default=ab.
IsEnabled(),Callback=aa.Wrap(function(ai)ab.Toggle(ai)end)},
'Toggle_CombatMaster')ah:Toggle({Name='Auto Boss Combat (Skip Boss Macro)',
Default=ab.IsAutoBossCombatEnabled(),Callback=aa.Wrap(function(aj)ab.
SetAutoBossCombat(aj)end)},'Toggle_AutoBossCombat')ab.OnStateChanged(function(aj
)pcall(function()ai:UpdateState(aj,true)end)end)ac(af,ag)ad(af,ag)ae(af,ag)end
end function a.R()local aa,ab,ac,ad,ae,af=a.load'e',a.load'c',a.load'O',a.load
'f',a.load'b',a.load'g'local ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.player.Name,
false,false,false,'Desert Temple','Easy',false,true,false,3,{[77649408247578]=
true,[3220968688]=true,[2414851778]=true},{}local as,at,au=function()return aq[
game.PlaceId]==true end,function()for as,at in ipairs(ar)do pcall(at,ak,ac.
GetAllowedDifficulties(ak))end end,function()if not af.IsLobby()then return end
if ai then return end ai=true aj=false task.spawn(function()local as,at=pcall(
function()local as=game:GetService'ReplicatedStorage':WaitForChild('remotes',15)
if not as then error'remotes not found'end local at=ac.GetLevelReq(ak,al)pcall(
function()as:WaitForChild('createLobby',10):InvokeServer(ak,al,at,am,an,ao)end)
if aj or not af.IsLobby()then return end task.wait(ap)if aj or not af.IsLobby()
then return end if an then pcall(function()as:WaitForChild(
'addPlayerToWhitelist',10):FireServer(ag)end)if aj or not af.IsLobby()then
return end task.wait(ap)if aj or not af.IsLobby()then return end end local au=0
while au<10 do local av=workspace:FindFirstChild'games'and workspace.games:
FindFirstChild'inLobby'if av then break end task.wait(0.5)au=au+0.5 if aj or not
af.IsLobby()then return end end if aj or not af.IsLobby()then return end task.
wait(ap)if aj or not af.IsLobby()then return end pcall(function()as:
WaitForChild('startDungeon',10):FireServer()end)end)ai=false if aj or not af.
IsLobby()then return end if as then ab.Notify('Auto Join','Joined: '..ak,3)else
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
false)end)return ax end function a.S()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj=a.load
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
)return an end function a.T()local aa,ab,ac=a.load'b',a.load'g',{[77649408247578
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
function()ae=false end)return ak end function a.U()local aa,ab,ac,ad=a.load'e',a
.load'c',a.load'b',a.load'g'local ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq=aa.
player,2,false,false,false,false,60,false,
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
end)return au end function a.V()local aa,ab,ac,ad,ae,af,ag,ah=a.load'B',a.load
'R',a.load'S',a.load'T',a.load'U',a.load'd',a.load'O',a.load'g'return function(
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
GetSelectedDifficulty())end)ar()end)end end function a.W()local aa,ab,ac,ad,ae,
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
aO,aP in pairs(aK)do if an[aO]then aJ(aP,aO,nil,nil)elseif type(aP)=='table'and
aG(aP)then local aQ,aS=aH(aO)aJ(aP,aL,aQ,aS)else aJ(aP,aL,aM,aN)end end end aJ(
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
ae.LEVEL_REQ_MODE_OPTIONS=aq return ae end function a.X()local aa,ab,ac=a.load
'd',a.load'W',a.load'c'return function(ad,ae)local af=ae:Section{Side='Left'}af:
Header{Name='AutoSell'}local ag=ae:Section{Side='Right'}ag:Header{Name=
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
end)end)end},{Name='Cancel'}}}end)end}ap()end end function a.Y()local aa,ab,ac,
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
=aC aO.SurfaceTransparency=0.8 aO.Parent=aN end local aO,aP=function()if not aH
then return end local aO=game:GetService'Workspace'for aP,aQ in ipairs(aO:
GetChildren())do if aQ:IsA'BasePart'then aN(aQ)end for aS,aT in ipairs(aQ:
GetDescendants())do if aT:IsA'BasePart'then aN(aT)end end end end,function()if
aJ then task.cancel(aJ)aJ=nil end local aO=game:GetService'Workspace'for aP,aQ
in ipairs(aO:GetDescendants())do local aS=aQ:FindFirstChild(aF)if aS then aS:
Destroy()end end end function ac.ToggleSkillHitbox(aQ)if aQ==aI then return end
aI=aQ if aI then if aJ then task.cancel(aJ)aJ=nil end aJ=task.spawn(function()
while aI do local aS,aT=pcall(aO)if not aS and os.clock()-(ac.lastSkillWarnH or
0)>5 then ac.lastSkillWarnH=os.clock()warn('[SkillHitbox] error:',tostring(aT))
end task.wait(aj)end end)else aP()end end function ac.IsSkillHitboxEnabled()
return aI end return ac end function a.Z()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
,al,am=a.load'e',a.load'f',a.load'b',a.load'g',{},Color3.fromRGB(255,170,0),0.55
,'Enemy_ESP',0.5,{Orange=Color3.fromRGB(255,170,0),Red=Color3.fromRGB(255,0,0),
Yellow=Color3.fromRGB(255,255,0),Green=Color3.fromRGB(0,255,0),Cyan=Color3.
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
end}ac.Register(function()ae.Toggle(false)end)return ae end function a._()local
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
function()ac.Toggle(false)end)return ac end function a.aa()local aa,ab,ac,ad,ae,
af,ag=a.load'd',a.load'Y',a.load'Z',a.load'_',a.load'B',{'Custom Hitbox',
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
function a.ab()local aa,ab,ac,ad,ae=a.load'a',a.load'c',a.load'f',a.load'b',game
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
end local function aM(aN,aO,aP)aP=aP or 12 if aP<0 then return nil end local aQ=
aN:FindFirstChild(aO)if aQ then return aQ end for aS,aT in ipairs(aN:
GetChildren())do local aU=aM(aT,aO,aP-1)if aU then return aU end end return nil
end local aN local aO,aP=function()if ac and type(ac.GetRealPlayerLevel)==
'function'then local aO=ac.GetRealPlayerLevel()if aO then local aP=tonumber(
tostring(aO):match'%d+')if aP and aP>0 then aN=tostring(aP)return aN end end end
local aO=_G.RealPlayerLevel or(type(getgenv)=='function'and getgenv().
RealPlayerLevel)if aO then local aP=tonumber(tostring(aO):match'%d+')if aP and
aP>0 then aN=tostring(aP)return aN end end local aP=game:GetService'Players'.
LocalPlayer if not aP then return aN or'?'end local aQ=aP:FindFirstChild
'leaderstats'if aQ then for aS,aT in ipairs(aQ:GetChildren())do local aU=string.
lower(aT.Name)if string.find(aU,'level')or string.find(aU,'lvl')then local aV=
tonumber(tostring(aT.Value):match'%d+')if aV and aV>0 then aN=tostring(aV)if ac
and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end
end end for aS,aT in ipairs(aP:GetChildren())do local aU=string.lower(aT.Name)if
aU=='level'or aU=='lvl'or string.find(aU,'level')then if aT:IsA'ValueBase'then
local aV=tonumber(tostring(aT.Value):match'%d+')if aV and aV>0 then aN=tostring(
aV)if ac and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN
end end end end for aS,aT in pairs(aP:GetAttributes())do local aU=string.lower(
aS)if string.find(aU,'level')or string.find(aU,'lvl')then local aV=tonumber(
tostring(aT):match'%d+')if aV and aV>0 then aN=tostring(aV)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end end if aP
:FindFirstChild'PlayerGui'then local aS=aP.PlayerGui:FindFirstChild
'playerStatus'if aS then local aT=aM(aS,'levelBorder')if aT then local aU=aT:
FindFirstChild'level'if aU and aU:IsA'TextLabel'then local aV=aU:GetAttribute
'RealLevel'or aU:GetAttribute'OriginalText'if aV then local aW=tonumber(
tostring(aV):match'%d+')if aW and aW>0 then aN=tostring(aW)if ac and ac.
SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end return aN end end local aW=
aU.Text local aX=tonumber(tostring(aW):match'%d+')if aX and aX>0 then aN=
tostring(aX)if ac and ac.SetRealPlayerLevel then ac.SetRealPlayerLevel(aN)end
return aN end end end end end return aN or'?'end,false local aQ,aS,aT=function()
if aL~=nil or aP then return end aP=true task.spawn(function()local aQ=os.clock(
)+8 while aL==nil and os.clock()<aQ do aL=aK()if aL~=nil then break end task.
wait(0.25)end aP=false end)end,function()local aQ,aS=pcall(function()return game
:GetService'ReplicatedStorage':WaitForChild('remotes',5):WaitForChild(
'reloadInvy',5)end)if not aQ or not aS or not aS:IsA'RemoteFunction'then return
nil end local aT,aU=pcall(function()return aS:InvokeServer()end)if not aT or aU
==nil then return nil end if type(aU)=='table'and aU['1']and type(aU['1'])==
'table'then return aU['1']end return aU end,function(aQ)return type(aQ)=='table'
and(aQ.sellPrice~=nil or aQ.UniqueItemID~=nil or aQ.rarity~=nil or aQ.name~=nil)
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
false end)end local aW,aX=function()aL=aK()if aL==nil then aQ()end ac.
SetDungeonStartTime(nil)if an then aV()end end,function()if not ac.
GetDungeonStartTime()then ac.SetDungeonStartTime(os.clock())end if aL==nil then
aQ()end if an then aV()end end local aY,aZ,a_,a0=function()if ax then return end
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
Connect(function(bb)if not ai then return end aQ()local bc=ac.
GetDungeonStartTime()and ac.GetDungeonElapsed()or 0 task.spawn(function()task.
wait(1.5)local bd,be=(aK())if aL~=nil and bd~=nil then be=math.max(0,bd-aL)end
if an then pcall(a1,bb)end local bf,bg=a8(bb,{level=aO(),expGained=be,duration=
bc})if not bf then ab.Notify('Webhook WIN','Send failed: '..tostring(bg),4)end
end)end)aj=true ab.Notify('Webhook','Webhook notifications ready',2)aY()if an
then aV()end end a2()ad.Register(function()if av then av:Disconnect()av=nil end
if ax then ax()ax=nil end aj=false end)return ag end function a.ac()local aa=a.
load'ab'return function(ab,ac)local ad=ac:Section{Side='Right'}ad:Header{Name=
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
}end end function a.ad()local aa={}function aa.Apply(ab,ac,ad)for ae,af in
pairs(ab)do if ad and table.find(ad,ae)then continue end pcall(function()ac[ae]=
af end)end return ac end function aa.Wrap(ab,ac,ad,ae)local af={}setmetatable(af
,{__index=function(ag,ah)if ab[ah]~=nil then return ab[ah]elseif ae then local
ai,aj=pcall(function()return ae[ah]end)if ai then return aj end end return end,
__newindex=function(ag,ah,ai)local aj=ac[ah]if aj then aj(ai)if not(ad and table
.find(ad,ah))then ab[ah]=ai end elseif ae then local ak,al=pcall(function()ae[ah
]=ai end)if not ak then ab[ah]=ai end else ab[ah]=ai end end})return af end
return aa end function a.ae()local aa,ab,ac,ad,ae,af=a.load'ad',game:GetService
'VirtualUser',{},false,60 local ag=function()pcall(function()ab:
CaptureController()ab:Button1Down(Vector2.new(0,0))ab:Button1Up(Vector2.new(0,0)
)ab:Button2Down(Vector2.new(0,0))ab:Button2Up(Vector2.new(0,0))end)end local ah=
function()while ad do ag()local ah=ae while ah>0 and ad do local ai=math.min(ah,
0.5)task.wait(ai)ah-=ai end end af=nil end function ac.Start()if ad or af then
return end ad=true task.spawn(ag)af=task.spawn(ah)end function ac.Stop()ad=false
end function ac.IsEnabled()return ad end function ac.SetInterval(ai)ai=tonumber(
ai)if ai and ai>0 then ae=ai else ae=60 end end function ac.GetInterval()return
ae end return(aa.Wrap(ac,{Enabled=function(ai)if ai then ac.Start()else ac.Stop(
)end end,Interval=function(ai)ac.SetInterval(ai)end}))end function a.af()local
aa,ab,ac,ad,ae,af,ag=a.load'a',a.load'b',a.load'ad',a.load'f',game:GetService
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
aO for aP,aQ in ipairs(aH)do local aS,aT=string.find(aJ,string.lower(aQ),aL,true
)if aS then if aM==nil or aS<aM or(aS==aM and#aQ>#aO)then aM=aS aN=aT aO=aQ end
end end if not aM then table.insert(aK,string.sub(aG,aL))break end if aM>aL then
table.insert(aK,string.sub(aG,aL,aM-1))end table.insert(aK,aI)aL=aN+1 end return
table.concat(aK)end local aK,aL,aM=function(aK,aL,aM)if#aK==0 or#aL==0 then
return aK end if not string.find(aK,'<')or not string.find(aK,'>')then return
aJ(aK,aL,aM)end local aN,aO={},1 while aO<=#aK do local aP,aQ=string.find(aK,
'<[^>]->',aO)if not aP then local aS=string.sub(aK,aO)table.insert(aN,aJ(aS,aL,
aM))break end if aP>aO then local aS=string.sub(aK,aO,aP-1)table.insert(aN,aJ(aS
,aL,aM))end table.insert(aN,string.sub(aK,aP,aQ))aO=aQ+1 end return table.
concat(aN)end,function(aK)return aK:IsA'TextLabel'or aK:IsA'TextButton'or aK:IsA
'TextBox'end,function()local aK={}pcall(function()if typeof(gethui)=='function'
then local aL=gethui()if aL and aL~=game:GetService'CoreGui'then table.insert(aK
,aL)end end end)pcall(function()local aL=game:GetService'CoreGui'if aL then
table.insert(aK,aL)end end)return aK end local aN=function(aN)if not aL(aN)then
return end if aN:IsA'TextBox'and aN:IsFocused()then return end local aO=aI()if#
aO==0 then return end local aP=aq[aN]if aP then local aQ=aN.Text local aS=aK(aQ,
aO,am)if aS~=aQ then aP.original=aQ an=true aN.Text=aS an=false end return end
local aQ=aN.Text local aS,aT=aK(aQ,aO,am),{original=aQ,conns={}}if aS~=aQ then
an=true aN.Text=aS an=false end local aU=aN:GetPropertyChangedSignal'Text':
Connect(function()if an then return end if not al then return end local aU,aV=aN
.Text,aI()local aW=aK(aU,aV,am)if aW~=aU then aT.original=aU an=true aN.Text=aW
an=false else aT.original=aU end end)table.insert(aT.conns,aU)if aN:IsA'TextBox'
then local aV=aN.FocusLost:Connect(function()if not al then return end local aV,
aW=aN.Text,aI()local aX=aK(aV,aW,am)if aX~=aV then aT.original=aV an=true aN.
Text=aX an=false end end)table.insert(aT.conns,aV)end local aV aV=aN.
AncestryChanged:Connect(function(aW,aX)if not aX then for aY,aZ in ipairs(aT.
conns)do pcall(function()aZ:Disconnect()end)end aq[aN]=nil end end)table.insert(
aT.conns,aV)aq[aN]=aT end local aO,aP,aQ,aS=function(aO)if not aO then return
end pcall(function()for aP,aQ in ipairs(aO:GetDescendants())do if aL(aQ)then aN(
aQ)end end end)end,function(aO)if not aO then return end local aP,aQ=pcall(
function()return aO.DescendantAdded:Connect(function(aP)if not al then return
end task.spawn(aN,aP)end)end)if aP and aQ then table.insert(ar,aQ)end end,
function()local aO=aI()for aP,aQ in pairs(aq)do for aS,aT in ipairs(aQ.conns)do
pcall(function()aT:Disconnect()end)end pcall(function()if aP and aP.Parent and
aQ.original then local aS,aT=aP.Text,aK(aQ.original,aO,am)if aS==aT then an=true
aP.Text=aQ.original an=false end end end)end table.clear(aq)end,function()if aB
and typeof(aB.SetUserInfoState)=='function'then pcall(function()aB:
SetUserInfoState(not ak)end)end end function aj.Start()ak=true aH()if al then
return end al=true local aT=az()if aT then local aU=aT:FindFirstChild'PlayerGui'
if aU then aO(aU)aP(aU)else local aV aV=aT.ChildAdded:Connect(function(aW)if aW.
Name=='PlayerGui'then if aV then aV:Disconnect()end if al then aO(aW)aP(aW)end
end end)table.insert(ar,aV)end if aT.Character then aO(aT.Character)aP(aT.
Character)end local aV=aT.CharacterAdded:Connect(function(aV)if not al then
return end task.wait(0.2)if not al then return end aO(aV)aP(aV)end)table.insert(
ar,aV)end pcall(function()local aU=workspace.DescendantAdded:Connect(function(aU
)if not al then return end if aU:IsA'BillboardGui'or aU:IsA'SurfaceGui'then for
aV,aW in ipairs(aU:GetDescendants())do aN(aW)end local aV=aU.DescendantAdded:
Connect(function(aV)if not al then return end aN(aV)end)table.insert(ar,aV)end
end)table.insert(ar,aU)end)for aU,aV in ipairs(aM())do aO(aV)aP(aV)end aS()task.
spawn(function()for aU,aV in ipairs{0.3,0.8,1.5,3}do task.wait(aV)if not al then
break end local aW=az()if aW then local aX=aW:FindFirstChild'PlayerGui'if aX
then aO(aX)end if aW.Character then aO(aW.Character)end end for aX,aY in ipairs(
aM())do aO(aY)end end end)if aC then pcall(task.cancel,aC)end aC=task.spawn(
function()while al do task.wait(0.5)if not al then break end local aU=az()if aU
then local aV=aU:FindFirstChild'PlayerGui'if aV then aO(aV)end if aU.Character
then aO(aU.Character)end end for aV,aW in ipairs(aM())do aO(aW)end end end)end
function aj.Stop()ak=false aH()if not al then return end al=false if aC then
pcall(task.cancel,aC)aC=nil end for aT,aU in ipairs(ar)do pcall(function()aU:
Disconnect()end)end table.clear(ar)aQ()aS()end function aj.IsEnabled()return ak
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
=function(a9)aj.SetMaskStats(a9)end}))end function a.ag()local aa,ab,ac,ad=a.
load'd',a.load'B',a.load'ae',a.load'af'return function(ae,af)local ag=af:Section
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
function a.ah()return function(aa,ab)a.load'aa'(aa,ab)a.load'ac'(aa,ab)a.load
'ag'(aa,ab)end end function a.ai()local aa,ab,ac=a.load'a',a.load'c',game:
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
Hide()end)end ah()return ae end function a.aj()local aa,ab,ac,ad=a.load'a',a.
load'd',a.load'ai',a.load'h'return function(ae,af)local ag=aa.Folder local ah=ag
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
'Press RightControl to show the window again.'}end end function a.ak()local aa,
ab,ac,ad,ae,af=a.load'f',a.load'U','Boss Active','Boss','Dungeon','Time Left'
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
end end end}end end function a.al()return function(aa,ab)a.load'aj'(aa,ab)a.load
'ak'(aa,ab)end end function a.am()local aa,ab,ac=a.load'e',a.load'a',a.load'd'
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
end return au.Unit end local az,aA,aB,aC,aF,aG=function(az)if type(az)~='table'
then return nil end local aA={}for aB,aC in ipairs(az.dwells or{})do local aF=
av(aC.pos)if aF then aA[#aA+1]={pos=aF,dur=tonumber(aC.dur)or 0,facing=ay(aC.
facing)}end end local aB={}for aC,aF in ipairs(az.skills or{})do local aG=av(aF.
pos)if aG then aB[#aB+1]={pos=aG,facing=ay(aF.facing),key=aF.key,dw=math.floor(
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
aJ-1 do local aN,aO,aP=aH[aM-1],aH[aM],aH[aM+1]local aQ,aS=aO.X-aN.X,aO.Z-aN.Z
local aT,aU,aV=math.sqrt(aQ*aQ+aS*aS),aP.X-aO.X,aP.Z-aO.Z local aW=math.sqrt(aU*
aU+aV*aV)if aT>=aF and aW>=aF then local aX=(aQ*aU+aS*aV)/(aT*aW)if aX<aC then
aK[aM]=true table.insert(aL,aM)end end end table.insert(aL,aJ)local aM,aN=aI*aI,
{}for aO=1,#aL-1 do local aP,aQ=aL[aO],aL[aO+1]if aQ-aP>1 then table.insert(aN,{
aP,aQ})end end while#aN>0 do local aO=table.remove(aN)local aP,aQ=aO[1],aO[2]
local aS,aT,aU,aV=aH[aP].X,aH[aP].Z,aH[aQ].X,aH[aQ].Z local aW,aX=aU-aS,aV-aT
local aY,aZ,a_=aW*aW+aX*aX,-1,0 for a0=aP+1,aQ-1 do local a1=0 if aY>0 then a1=(
(aH[a0].X-aS)*aW+(aH[a0].Z-aT)*aX)/aY a1=math.clamp(a1,0,1)end local a2,a3=aH[a0
].X-(aS+aW*a1),aH[a0].Z-(aT+aX*a1)local a4=a2*a2+a3*a3 if a4>aZ then aZ=a4 a_=a0
end end if a_>0 and aZ>aM then aK[a_]=true table.insert(aN,{aP,a_})table.insert(
aN,{a_,aQ})end end local aO={}for aP=1,aJ do if aK[aP]and(#aO==0 or aG(aO[#aO],
aH[aP])>=aB or aP==aJ)then table.insert(aO,aH[aP])end end if#aO==1 then table.
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
,rooms={}}am[aH]=aO end if type(aO.rooms)~='table'then aO.rooms={}end local aP={
}for aQ,aS in ipairs(aK)do aP[#aP+1]=au(aS)end local aQ={startPos=au(aJ)or aP[1]
,points=aP}if aN then aQ.boss=true end if type(aM)=='number'and aM>0 then aQ.
speed=aM end local aS=function(aS)if not aS or type(aS)~='table'then return nil
end local aT,aU=#(aS.dwells or{}),#(aS.skills or{})if aT==0 and aU==0 then
return nil end local aV={dwells={},skills={}}for aW,aX in ipairs(aS.dwells or{})
do aV.dwells[#aV.dwells+1]={pos=au(aX.pos),dur=aX.dur or 0,facing=aX.facing}end
for aW,aX in ipairs(aS.skills or{})do aV.skills[#aV.skills+1]={pos=au(aX.pos),
facing=aX.facing,key=aX.key,dw=aX.dw or 0,dwT=aX.dwT or 0}end return aV end if
aL and type(aL)=='table'then local aT=aS(aL)if aT then aQ.events=aT end end aO.
rooms[tostring(aI)]=aQ aO.version=ah aO.map=aH aO.updated=os.time()if al then
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
end function a.an()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'am',a.load'd'
,a.load'c'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar=aa.RunService,aa.player,
aa.UserInputService,0.1,8000,0.4,0.1,1.5,1,6,{},true,true function ap.SetCapture
(as)as=as and true or false aq=as ar=as end function ap.IsCaptureEnabled()return
aq or ar end local as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG,aH,aI,aJ,aK,aL,aM,aN,aO,
aP,aQ,aS,aT,aU,aV,aW,aX,aY,aZ=false,0,{},0,{},{},0,false,0,0,false,false,false,0
,0,0,{}local a_,a0=function()local a_={recording=as,map=aM,room=at,pointCount=#
au,dwellCount=#ax,skillCount=#ay,savedRooms=aI}for a0,a1 in ipairs(aL)do pcall(
a1,a_)end end,function()local a_=ag and ag.Character local a0=a_ and a_:
FindFirstChild'HumanoidRootPart'if a0 and a0.Parent then return a0 end return
nil end local a1,a2,a3,a4=function()local a1=a0()if not a1 then return nil end
local a2=a1.CFrame.LookVector if a2.Magnitude<0.001 then return nil end return{X
=a2.X/a2.Magnitude,Z=a2.Z/a2.Magnitude}end,function()if aO then aO:Disconnect()
aO=nil end if aP then aP:Disconnect()aP=nil end if aQ then aQ()aQ=nil end if aS
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
end table.insert(au,ba)end)if ar then aP=ah.InputBegan:Connect(function(b,ba)if
not as or not ar then return end if ah:GetFocusedTextBox()then return end if ab.
IsDead()then return end local bb if b.UserInputType==Enum.UserInputType.
MouseButton2 then if ba then return end bb='QE'elseif b.UserInputType==Enum.
UserInputType.Keyboard and(b.KeyCode==Enum.KeyCode.Q or b.KeyCode==Enum.KeyCode.
E)then bb=b.KeyCode==Enum.KeyCode.Q and'Q'or'E'else return end local bc=a0()if
not bc then return end local bd=aq and(aU~=nil)local be={pos=bd and aU.pos or bc
.Position,facing=a1(),key=bb,dw=0,dwT=0,_castAt=os.clock()}if bd then be.dw=aU.
index be.dwT=math.max(0,(os.clock()-av)-az)aU.facing=be.facing or aU.facing end
table.insert(ay,be)end)end aQ=ab.OnRoomIndexChanged(function()if as then local b
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
end function a.ao()local aa,ab,ac,ad,ae=a.load'e',a.load'f',a.load'am',a.load'c'
,a.load'U'local af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,
aB,aC,aF,aG,aH,aI=aa.player,aa.VirtualInputManager,aa.UserInputService,aa.
RunService or game:GetService'RunService',0.4,0.5,8,2,4.5,8,14,8,2,0.5,2,0.001,
0.1,{},true,true,true,0.6,0.005,0.45,0.2,false,true function ax.SetAimSkillQ(aJ)
aH=aJ and true or false end function ax.IsAimSkillQEnabled()return aH end
function ax.SetAimSkillE(aJ)aI=aJ and true or false end function ax.
IsAimSkillEEnabled()return aI end local aJ=function(aJ)if aJ=='Q'then return aH
elseif aJ=='E'then return aI end return aH or aI end function ax.
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
function ax.IsUseFastSpeedEnabled()return aL end local aO,aP=false,5 function ax
.SetAutoRetryOnDeathLimit(aQ)aO=aQ and true or false end function ax.
IsAutoRetryOnDeathLimitEnabled()return aO end local aQ,aS,aT,aU,aV,aW,aX,aY,aZ,
a_,a0=function(aQ)local aS if aL then local aT=ab.GetFastSpeed()if type(aT)==
'number'and aT>0 then aS=aT end elseif aK then if type(aQ)=='number'and aQ>0
then aS=aQ end end if not aS or aS<=0 then return end local aT=ab.GetHumanoid()
if not aT then return end if aM==nil then aN=aT.WalkSpeed end aM=aS if aT.
WalkSpeed~=aS then aT.WalkSpeed=aS end end,function()if aM==nil then return end
local aQ=ab.GetHumanoid()if aN and aQ and aQ.WalkSpeed~=aN then aQ.WalkSpeed=aN
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
bn then return end aQ(bj.speed)local bo=ac.SimplifyPath(bj.points,aj)local bp=#
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
IsBossActive()and bk>0 then bn+=1 if bn>=aP then ad.Notify('Path Record',string.
format('Exceeded %d deaths in Room %d. Retrying dungeon...',aP,bk),3)bn=0 ae.
RetryNow()end end end task.wait(0.25)continue end if bm then bm=false end if ab.
IsInLobby()then aU=false aT=false break end if ab.IsBossActive()and not aV then
task.wait(0.25)continue end local bo=ab.GetCurrentRoomIndex()if bo<=0 then task.
wait(0.1)continue end if bo~=bk then bk=bo bn=0 bl=false aW=0 aX=0 aY=0 end
local bp=ac.GetRoomSegment(a_,bo)if not bp then task.wait(0.1)continue end if bl
then task.wait(0.1)continue end local bq,br=bj(bp,bo,aV)bi()if bq then bl=true
aW=aX aY=100 else if br=='dead'then if not bm then bm=true if aO and not aV and
not ab.IsBossActive()and bo>0 then bn+=1 if bn>=aP then ad.Notify('Path Record',
string.format('Exceeded %d deaths in Room %d. Retrying dungeon...',aP,bo),3)bn=0
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
end return ax end function a.ap()local aa,ab,ac,ad,ae,af,ag=a.load'e',a.load'f',
a.load'am',a.load'an',a.load'ao',a.load'b',game:GetService'Workspace'local ah,ai
,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,aB,aC,aF,aG=aa.RunService,{}
,'PR_PathVisual_Container','PR_PathVisual_Anchor',Color3.fromRGB(255,60,60),
Color3.fromRGB(255,90,90),Color3.fromRGB(0,255,120),Color3.fromRGB(0,220,110),
Color3.fromRGB(0,230,255),Color3.fromRGB(255,80,180),Color3.fromRGB(255,190,30),
Color3.fromRGB(200,70,255),Color3.fromRGB(220,100,255),Color3.fromRGB(255,210,60
),0.35,0.55,2.5,3,0.35,true,true,true,true local aH,aI,aJ,aK,aL,aM,aN,aO,aP,aQ,
aS=av,true,0,{},{},{},{},{}local aT,aU,aV,aW,aX,aY,aZ,a_=function()if aP and aP.
Parent and aQ and aQ.Parent then return aQ end ai.Clear()local aT=Instance.new
'Folder'aT.Name=aj aT.Parent=ag local aU=Instance.new'Part'aU.Name=ak aU.
Anchored=true aU.CanCollide=false aU.CanQuery=false aU.CanTouch=false aU.
Transparency=1 aU.Size=Vector3.new(1,1,1)aU.CFrame=CFrame.new(0,0,0)aU.Parent=aT
aP=aT aQ=aU table.clear(aK)table.clear(aL)table.clear(aM)table.clear(aN)table.
clear(aO)return aQ end,function(aT,aU)local aV=aK[aT]if not aV or not aV.Parent
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
MaxDistance=180 aX.LightInfluence=0 aX.Parent=aP local aY=Instance.new'Frame'aY.
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
)a1:Destroy()end)end aP=nil aQ=nil end function ai.Destroy()if aS then aS:
Disconnect()aS=nil end ai.Clear()end ai.Clear()a0()af.Register(function()ai.
Destroy()end)return ai end function a.aq()local aa,ab,ac=a.load'e',a.load'f',a.
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
,aN,aO=ab.GetTrackedEnemyData(),aJ.Position,ak*ak,{},aC()for aP,aQ in ipairs(aK)
do local aS,aT,aU=aQ.Model,aQ.Root,aQ.Humanoid if aS and aS.Parent and aT and aT
.Parent and aU and aU.Health>0 then local aV,aW=aT.Position.X-aL.X,aT.Position.Z
-aL.Z if(aV*aV+aW*aW)<=aM then aN[aS]=true end end end for aP,aQ in pairs(av)do
if not aN[aP]or not aP.Parent then pcall(function()aQ:Destroy()end)av[aP]=nil
end end for aP in pairs(aN)do if not av[aP]or not av[aP].Parent then local aQ=aP
:FindFirstChild(as)local aS=(aQ and aQ:IsA'Highlight')and aQ or Instance.new
'Highlight'aS.Name=as aS.Adornee=aP aS.FillColor=aO aS.FillTransparency=0.35 aS.
OutlineColor=Color3.fromRGB(255,255,255)aS.OutlineTransparency=0.1 aS.DepthMode=
Enum.HighlightDepthMode.AlwaysOnTop aS.Parent=aP av[aP]=aS else local aQ=av[aP]
if aQ.FillColor~=aO then aQ.FillColor=aO end if not aQ.Enabled then aQ.Enabled=
true end end end end local aL=function()if not aj then return end local aL=aF()
if not aL then if ax then ax.Visible=false end if ay then ay.Visible=false end
if next(av)~=nil then aG()end aA=nil return end local aM=2.6 local aN=Vector3.
new(aL.Position.X,aL.Position.Y-aM,aL.Position.Z)local aO=CFrame.new(aN)*CFrame.
Angles(math.rad(90),0,0)local aP=aL.CFrame:ToObjectSpace(aO)if not ax or not ax.
Parent or aL~=aA then aA=aL aJ(aL)else if ax.Adornee~=aL then ax.Adornee=aL end
ax.CFrame=aP if not ax.Visible then ax.Visible=true end if am then if not ay or
not ay.Parent then aJ(aL)else if ay.Adornee~=aL then ay.Adornee=aL end ay.CFrame
=aP if not ay.Visible then ay.Visible=true end end elseif ay and ay.Visible then
ay.Visible=false end end local aQ=os.clock()if aQ-au>=at then au=aQ aK(aL)end
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
false)aH()end)return ah end function a.ar()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,
ak,al,am,an,ao=a.load'e',a.load'f',a.load'b',a.load'h',a.load'c',a.load'A',a.
load'g',a.load'am',a.load'an',a.load'ao',a.load'ap',a.load'aq',{},false,{}local
ap,aq,ar=function(ap)local aq=ai.GetStatus()local ar={recording=ai.IsRecording()
,playing=aj.IsPlaying(),resume=aj.ResumeWanted(),autoPlayWanted=an,inLobby=ab.
IsInLobby(),map=ab.GetCurrentDungeonName(),room=ab.GetCurrentRoomIndex(),boss=ab
.IsBossActive(),recordedMaps=ah.Count(),pointCount=ai.IsRecording()and aq.
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
a.as()local aa,ab,ac,ad,ae,af=a.load'e',a.load'b',a.load'ar',a.load'd',a.load'B'
,a.load'c'local ag=aa.RunService return function(ah,ai)local aj=ai:Section{Side=
'Left'}aj:Header{Name='Path Record Controls'}aj:Label{Text=
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
Maximum=0.1,DisplayMethod='Value',Precision=3,Callback=ad.Wrap(function(aF)ac.
SetDoubleClickDelay(aF)end),onInputComplete=function(aF)ad.SaveNow()af.Notify(
'Path Record',('Saved Double Click Delay = %ss'):format(tostring(aF)),2)end},
'Slider_PR_DoubleClickDelay'))ae.PatchSliderLoadCallback(aC:Slider({Name=
'Start / Finish Pause Time (s)',Default=ac.GetStartPauseTime(),Minimum=0,Maximum
=3,DisplayMethod='Value',Precision=2,Callback=ad.Wrap(function(aF)ac.
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
{Side='Right'}aO:Header{Name='Status Monitor & Live HUD'}local aP,aQ,aS,aT,aU,aV
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
"<font color='rgb(160,160,160)'>Idle</font>"end pcall(function()aP:UpdateName(
'State: '..be)end)if ba.playing then local bf,bg=a7(ba.progressPercent),(
'(%.1f / %.1f studs)'):format(ba.progressStuds or 0,ba.totalStuds or 0)pcall(
function()aQ:UpdateName('Progress: '..bf..' '..bg)end)elseif ba.recording then
pcall(function()aQ:UpdateName(
[[Progress: <font color='rgb(255,90,90)'>Recording Segment...</font> (]]..
tostring(ba.pointCount or 0)..' pts)')end)else pcall(function()aQ:UpdateName
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
aq(ac.GetStatus())end end function a.at()local aa,ab,ac,ad,ae,af,ag=a.load'b',a.
load'e',{},{'inventory','inspectGui','sellShop','tradingGui','blacksmith'},{
'armorMain','weaponMain'},10,{warrior={className='Warrior',primaryStat=
'physicalDamage'},mage={className='Mage',primaryStat='spellPower'},guardian={
className='Guardian',primaryStat='health'}}local ah,ai=function(ah)if not ah
then return nil,nil end local ai=string.lower(ah)for aj,ak in pairs(ag)do if
string.find(ai,aj)then return ak.className,ak.primaryStat end end return nil,nil
end,function(ah)if not ah then return nil end local ai=string.match(ah,
'^%s*([%d,.-]+)')if not ai then return nil end local aj=string.gsub(ai,',','')
return tonumber(aj)end local aj,ak,al,am,an,ao,ap,aq,ar,as,at,au,av,ax,ay,az,aA,
aB=function(aj)if not aj then return 0,0 end local ak=string.gsub(aj,',','')
local al,am=string.match(ak,'(%d+)%s*/%s*(%d+)')if al and am then return
tonumber(al)or 0,tonumber(am)or 0 end local an=ai(ak)return 0,an or 0 end,
function(aj)if not aj then return''end local ak=string.match(aj,'^([^\n\r]+)')
local al=ak or aj local am=string.match(al,'^(.-)%s*[%(\\[]')if am and am~=''
then return string.gsub(am,'%s+$','')end return string.gsub(al,'%s+$','')end,
function(aj)if not aj then return false end if string.find(aj,
'[\n\r]%s*[%(\\[].-[%)\\]]')then return true end return string.find(aj,
'%s*[%(\\[].-[%)\\]]%s*$')~=nil end,true,{},'',false,{},{},{},{},{},{},{},{}
local aC=function(aC)local aF=aq[aC]if aF and aC and aC.Parent then ap=true
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
then if aN:IsA'TextLabel'then local aP,aQ=(aN.Parent~=aH and aN.Parent.Name..'/'
..aN.Name)or aN.Name,ak(aN.Text)table.insert(aK,{name=aN.Name,value=aQ,kind=
'TextLabel',path=aP,instance=aN})table.insert(aL,aP..'='..aQ)elseif aN:IsA
'ValueBase'then local aP,aQ=tostring(aN.Value),(aN.Parent~=aH and aN.Parent.Name
..'/'..aN.Name)or aN.Name table.insert(aK,{name=aN.Name,value=aP,kind=
'ValueBase',path=aQ})table.insert(aL,aQ..'='..aP)end end end local aM=aG(aH,
'name')local aN=(aM and ak(aM.Text))or nil if not aN then for aO,aP in ipairs(aK
)do if string.lower(aP.name)=='name'then aN=aP.value break end end end local aO=
aG(aH,'upgrades')local aP=(aO and ak(aO.Text))or nil if not aP then for aQ,aS in
ipairs(aK)do if string.lower(aS.name)=='upgrades'or string.find(aS.value,
'%d+%s*/%s*%d+')then aP=aS.value break end end end local aQ,aS,aT=aG(aH,
'physicalDamage')or aG(aH,'physicalPower'),aG(aH,'spellPower'),aG(aH,'health')
local aU,aV,aW,aX,aY,aZ=aQ and ai(ak(aQ.Text)),aS and ai(ak(aS.Text)),aT and ai(
ak(aT.Text))if aJ=='weaponMain'then if(aV or 0)>(aU or 0)then aX='Mage'aY=
'spellPower'aZ=aS else aX='Warrior'aY='physicalDamage'aZ=aQ end else aX,aY=ah(aN
)if aX=='Warrior'then aZ=aQ elseif aX=='Mage'then aZ=aS elseif aX=='Guardian'
then aZ=aT else if(aW or 0)>10000 and(aW or 0)>((aU or 0)*10)then aX='Guardian'
aY='health'aZ=aT elseif(aV or 0)>(aU or 0)then aX='Mage'aY='spellPower'aZ=aS
else aX='Warrior'aY='physicalDamage'aZ=aQ end end end local a_,a0=aj(aP)local a1
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
aO=aL.AncestryChanged:Connect(function(aO,aP)if not aP then av[aL]=nil aF()end
end)table.insert(ar,aO)end local aM,aN=function()local aM=ab.player or ab.
Players.LocalPlayer if not aM then return end local aN=aM:FindFirstChild
'PlayerGui'if not aN then return end for aO,aP in ipairs(ad)do local aQ=aN:
FindFirstChild(aP)if not aQ then for aS,aT in ipairs(aN:GetChildren())do if
string.lower(aT.Name)==string.lower(aP)then aQ=aT break end end end if aQ then
aL(aQ)end end local aO=aN.ChildAdded:Connect(function(aO)for aP,aQ in ipairs(ad)
do if string.lower(aO.Name)==string.lower(aQ)then aL(aO)end end end)table.
insert(ar,aO)end,function()if az then task.cancel(az)az=nil end for aM,aN in
ipairs(ar)do pcall(function()aN:Disconnect()end)end table.clear(ar)table.clear(
as)table.clear(at)table.clear(au)table.clear(av)aF()aA=nil an={}aB=nil ao=''for
aM,aN in ipairs(ay)do pcall(aN,nil,{},nil)end end local aO=function()if az then
return end aM()az=task.spawn(function()while am do task.wait(1.5)if not am then
break end local aO,aP=false,ab.player or ab.Players.LocalPlayer if aP then local
aQ=aP:FindFirstChild'PlayerGui'if aQ then for aS,aT in ipairs(ad)do local aU=aQ:
FindFirstChild(aT)if not aU then for aV,aW in ipairs(aQ:GetChildren())do if
string.lower(aW.Name)==string.lower(aT)then aU=aW break end end end if aU then
if not av[aU]then aL(aU)end local aV=aU:FindFirstChild'itemStatFrame'if aV and
aV:IsA'GuiObject'then if not au[aV]then aK(aV)end if aV.Visible then for aW,aX
in ipairs(ae)do local aY=aV:FindFirstChild(aX)if aY and aY:IsA'GuiObject'then if
not as[aY]then aJ(aY)end if aY.Visible then aO=true aH(aY)end end end end end
end end end end if not aO and next(aq)~=nil then aF()if aA~=nil then aA=nil an={
}aB=nil ao=''for aQ,aS in ipairs(ay)do pcall(aS,nil,{},nil)end end end end az=
nil end)end function ac.IsEnabled()return am end function ac.GetActiveInspector(
)return aA,an,aB end function ac.SetEnabled(aP)local aQ=aP and true or false if
am==aQ then return end am=aQ if am then aO()else aN()end for aS,aT in ipairs(ax)
do pcall(aT,am)end end function ac.OnChanged(aP)if type(aP)=='function'then
table.insert(ax,aP)end end function ac.OnInspectorChanged(aP)if type(aP)==
'function'then table.insert(ay,aP)end end function ac.GetActiveFrame()local aP
for aQ,aS in ipairs(an)do if aS.name=='name'and aS.value~=''then aP=aS.value
break end end return aA,aP end function ac.OnFrameChanged(aP)if type(aP)==
'function'then table.insert(ay,function(aQ,aS,aT)local aU for aV,aW in ipairs(aS
)do if aW.name=='name'and aW.value~=''then aU=aW.value break end end pcall(aP,aQ
,aU)end)end end function ac.Init()if not am then am=true end aO()end aa.
Register(function()am=false aN()table.clear(ax)table.clear(ay)end)aO()return ac
end function a.au()local aa=function(aa)local ab=Instance.new'Frame'ab.Name=
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
'rbxassetid://109718589733073')return ab end return aa end function a.av()local
aa,ab,ac,ad,ae=a.load'b',a.load'e',a.load'c',a.load'au',a.load'a'local af,ag,ah,
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
Scale=aN local aP=aN/1.25 local aQ,aS,aT=math.clamp(math.round(30*aP),8,30),math
.clamp(math.round(15*aP),0,15),ax.AbsolutePosition.X local aU,aV=aT+ax.
AbsoluteSize.X,50*aN+aQ local aW,aX=(aU+aV)<=(aB-4),(aT-aV)>=4 if not aW and aX
then av.AnchorPoint=Vector2.new(1,1)av.Position=UDim2.new(0,-aQ,1,aS)else av.
AnchorPoint=Vector2.new(0,1)av.Position=UDim2.new(1,aQ,1,aS)end end local av,ax,
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
fromRGB(215,125,255)}},{},false,{},{},{},{},{},{}local aP,aQ=function(aP)local
aQ={}if type(aP)~='table'then return aQ end for aS,aT in pairs(aP)do if type(aT)
=='table'then local aU=aB[aS]or aS for aV,aW in pairs(aT)do local aX=tostring(aV
)aQ[aX]=aW local aY=string.match(aX,'_(%d+)$')if aY then aQ[aS..'_'..aY]=aW aQ[
aU..'_'..aY]=aW local aZ=string.match(aX,'^(.-)_')if aZ then aQ[aZ..'_'..aY]=aW
end end end end end return aQ end,function(aP)local aQ=os.clock()if not aP and
cachedInventoryData and(aQ-av)<ax then return cachedInventoryData end if
cachedInventoryData and(aQ-av)<ay then return cachedInventoryData end if(aQ-av)<
3 then return cachedInventoryData end if az then return cachedInventoryData end
az=true local aS,aT=pcall(function()local aS=ab.ReplicatedStorage or game:
GetService'ReplicatedStorage'local aT=aS and aS:FindFirstChild'remotes'if not aT
then return nil end local aU=aT:FindFirstChild'reloadInvy'if not aU or not aU:
IsA'RemoteFunction'then return nil end return aU:InvokeServer()end)az=false av=
os.clock()if aS and aT then if type(aT)=='table'and aT['1']and type(aT['1'])==
'table'then cachedInventoryData=aT['1']else cachedInventoryData=aT end
cachedLookupMap=nil return cachedInventoryData end return cachedInventoryData
end local aS,aT,aU=function(aS,aT,aU)if not aS or type(aS)~='table'then return
nil end if not cachedLookupMap then cachedLookupMap=aP(aS)end return
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
SortOrder=Enum.SortOrder.LayoutOrder end local a3,a4,a5=aQ(),{},0 for a6,a7 in
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
function a.aw()return function(aa)pcall(function()local ab=setthreadidentity or
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
'Combat',Image='rbxassetid://10734975692'},Dungeon=ak:Tab{Name='Dungeon Joiner',
Image='rbxassetid://10734886202'},Inventory=ak:Tab{Name='Inventory',Image=
'rbxassetid://10709769841'},Utilities=ak:Tab{Name='Utilities',Image=
'rbxassetid://10747383470'},Configs=ak:Tab{Name='Configs',Image=
'rbxassetid://10734950309'},PathRecord=ak:Tab{Name='Path Record',Image=
'rbxassetid://10734950309'}}ae:SetFolder'EsclipseHub'local am,an,ao,ap,aq,ar=a.
load'Q',a.load'V',a.load'X',a.load'ah',a.load'al',a.load'as'am(ai,al.Combat)an(
ai,al.Dungeon)ao(ai,al.Inventory)ap(ai,al.Utilities)aq(ai,al.Configs)ar(ai,al.
PathRecord)local as=a.load'C'as.Init()local at=a.load'ab'at.Init()a.load'Z'a.
load'at'a.load'av'local au=a.load'ai'au.SetWindow(ai)au.Execute()local av=a.load
'af'av.SetWindow(ai)av.Init()al.Combat:Select()local ax=a.load'h'ax.SetLocked(
true)if ae.Elevate then ae.Elevate()end local ay,az=pcall(function()ae:
LoadAutoLoadConfig()end)if not ay then warn(
'[DungeonQuest] Error during LoadAutoLoadConfig:',az)end local aA=function()
local aA=ae.Folder..'/settings/autoload.txt'if isfile and isfile(aA)then local
aB,aC=pcall(readfile,aA)if aB and type(aC)=='string'then aC=string.gsub(aC,
'[\r\n%s]+','')if#aC>0 then ag.SetActive(aC)return end end end if not ag.
GetActive()then local aB=ae.Folder..'/settings/Default.json'if isfile and
isfile(aB)then ag.SetActive'Default'end end end aA()local aB=a.load'q'aB.
LoadData(ae.contextData)task.delay(0.3,function()ax.SetLocked(false)end)task.
delay(1.5,function()ag.Resume()end)end end function a.ax()local aa={cleaned=
false,callbacks={}}function aa.Register(ab)if type(ab)~='function'then return
function()end end if aa.cleaned then pcall(ab)return function()end end table.
insert(aa.callbacks,ab)return function()for ac,ad in ipairs(aa.callbacks)do if
ad==ab then table.remove(aa.callbacks,ac)break end end end end function aa.
Cleanup()if aa.cleaned then return end aa.cleaned=true for ab=#aa.callbacks,1,-1
do pcall(aa.callbacks[ab])end table.clear(aa.callbacks)end function aa.IsActive(
)return not aa.cleaned end aa.OnCleanup=aa.Register return aa end function a.ay(
)local aa,ab={}function aa:SetWindow(ac)ab=ac end function aa.Notify(ac,ad,ae)ae
=ae or 3 if ab then local af=pcall(function()ab:Notify{Title=ac,Description=ad,
Lifetime=ae}end)if af then return end end pcall(function()game:GetService
'StarterGui':SetCore('SendNotification',{Title=ac,Text=ad,Duration=ae})end)end
return aa end function a.az()local aa,ab,ac,ad,ae=a.load'a',a.load'ay',{},false,
false function ac.Suspend()ae=true ad=false end function ac.Resume()ae=false end
function ac.IsSuspended()return ae or(aa.LoadingConfig==true)end function ac.
SetActive(af)activeConfig=(typeof(af)=='string'and#af>0)and string.gsub(af,
'[\r\n%s]+','')or nil if activeConfig and writefile then pcall(function()local
ag=aa.Folder if isfolder and not isfolder(ag)then makefolder(ag)end if isfolder
and not isfolder(ag..'/settings')then makefolder(ag..'/settings')end writefile(
ag..'/settings/autoload.txt',activeConfig)end)end end function ac.GetActive()
return activeConfig end local af=function()if activeConfig then return
activeConfig end local af=aa.Folder local ag=af..'/settings/autoload.txt'if
isfile and isfile(ag)then local ah,ai=pcall(readfile,ag)if ah and typeof(ai)==
'string'then ai=string.gsub(ai,'[\r\n%s]+','')if#ai>0 then activeConfig=ai
return activeConfig end end end activeConfig='Default'pcall(function()if
writefile and makefolder and isfolder then if not isfolder(af)then makefolder(af
)end if not isfolder(af..'/settings')then makefolder(af..'/settings')end if not
isfile(ag)then writefile(ag,'Default')end end end)return activeConfig end
function ac.SaveNow()if ac.IsSuspended()then return end local ag=af()if not ag
then return end local ah,ai=aa:SaveConfig(ag)if not ah and ai and ai~=
'Please select a config file.'then warn(
'[SlopTD - AutoSave] Failed to save config:',ai)end end function ac.Save()if ac.
IsSuspended()then return end if not af()then return end if ad then return end ad
=true task.delay(0.5,function()ad=false if not ac.IsSuspended()and ac.GetActive(
)then ac.SaveNow()end end)end function ac.Wrap(ag)if type(ag)~='function'then
return ag end return function(...)local ah={ag(...)}ac.Save()return table.
unpack(ah)end end return ac end function a.aA()local aa={UNIVERSE_ID=10529769390
,LOBBY_PLACE_ID=134459712190924}function aa.IsLobby()return game.PlaceId==aa.
LOBBY_PLACE_ID end function aa.IsInGame()return game.PlaceId~=aa.LOBBY_PLACE_ID
end function aa.GetLocation()return aa.IsLobby()and'Lobby'or'InGame'end function
aa.GetLocationName()return aa.IsLobby()and'Lobby'or'In-Game'end return aa end
function a.aB()local aa,ab,ac,ad=a.load'aA',a.load'ax',{},{}function ac.
GetCurrentZone()return aa.IsLobby()and'Lobby'or'InGame'end function ac.IsInZone(
ae)if ae=='Global'then return true end return ac.GetCurrentZone()==ae end
function ac.IsLobby()return aa.IsLobby()end function ac.IsInGame()return aa.
IsInGame()end function ac.Guard(ae,af,ag)return function(...)if not ac.IsInZone(
ae)then return ag end return af(...)end end function ac.Register(ae)if not ae or
type(ae.Name)~='string'or not ae.Zone then return end ad[ae.Name]=ae if ac.
IsInZone(ae.Zone)and ae.OnEnter then task.spawn(function()pcall(ae.OnEnter)end)
end end function ac.Unregister(ae)ad[ae]=nil end ab.Register(function()table.
clear(ad)end)return ac end function a.aC()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak
,al=game:GetService'Players',a.load'aB',a.load'ax',{},false,{Cash=0,
CashFormatted='$0',Wave=0,MaxWave=0,WaveFormatted='0/0',ElapsedTime=0,
ElapsedTimeFormatted='00:00.00',IsMatchActive=false,WaveTimerSeconds=0,
WaveTimerFormatted='0:00',BaseHp=100,BaseMaxHp=100,BaseHealthFormatted='100/100'
,Message=''},{},{},false,function(aa)aa=math.max(0,aa)local ab,ac=math.floor(aa/
60),aa%60 if ab>=60 then local ad=math.floor(ab/60)ab=ab%60 return string.
format('%02d:%02d:%05.2f',ad,ab,ac)end return string.format('%02d:%05.2f',ab,ac)
end local am=function()local am=aa.LocalPlayer if not am then return nil end
local an=am:FindFirstChild'PlayerGui'if not an then return nil end local ao=an:
FindFirstChild'GameGui'if not ao then return nil end local ap=ao:FindFirstChild(
'Info',true)if ap and ap:IsA'Frame'then return ap end return nil end local an,ao
,ap,aq,ar,as=function()local an=am()if not an then return nil,nil,nil,nil,nil
end local ao=an:FindFirstChild'Stats'local ap,aq,ar,as=ao and(ao:FindFirstChild
'Gold'),ao and(ao:FindFirstChild'Wave'),ao and(ao:FindFirstChild'Timer'),an:
FindFirstChild'Health'local at,au=as and(as:FindFirstChild'Title'),(an:
FindFirstChild'Message')return ap,aq,ar,at,au end,function(an)if not an or an==
''then return 0,'$0'end local ao=an:gsub('[^%d]','')local ap=tonumber(ao)or 0
local aq=an:match'%$[0-9,]+'or string.format('$%d',ap)return ap,aq end,function(
an)if not an or an==''then return 0,0,'0/0'end local ao,ap=an:match
'Wave:%s*(%d+)%s*/%s*(.+)'if not ao then ao,ap=an:match'(%d+)%s*/%s*(.+)'end
local aq,ar=tonumber(ao)or 0,ap or'?'if ap and ap:find'\u{221e}'then ar=
'\u{221e}'else ar=tonumber(ap)or(ap or'?')end local as=string.format('%d/%s',aq,
tostring(ar))return aq,ar,as end,function(an)if not an or an==''then return 0,
'0:00'end local ao,ap=an:match'(%d+):(%d+)'if ao and ap then local aq=(tonumber(
ao)or 0)*60+(tonumber(ap)or 0)return aq,an end return 0,an end,function(an)if
not an or an==''then return 100,100,'100/100'end local ao,ap=an:match
'(%d+)%s*/%s*(%d+)'local aq,ar=tonumber(ao)or 100,tonumber(ap)or 100 return aq,
ar,string.format('%d/%d',aq,ar)end,function()local an=aa.LocalPlayer local ao=an
and an:FindFirstChild'PlayerGui'local ap=ao and ao:FindFirstChild'GameGui'if not
ap then return nil end local aq=ap:FindFirstChild('EndScreen',true)if aq and aq:
IsA'GuiObject'then return aq end return nil end local at=function()local at=as()
return at~=nil and at.Visible==true end local ay=function()if not ab.IsInGame()
then ak=nil al=nil ae=false af.ElapsedTime=0 af.ElapsedTimeFormatted='00:00.00'
af.IsMatchActive=false return end local au,av,ax,ay,az=an()local aA=am()local aB
,aC,aF=aA and aA.Visible~=false,az and az.Visible~=false and az.TextTransparency
<1,af.Message:lower()local aG=tonumber(aF:match'starting in[^%d]*(%d+)')local aH
,aI=aB and aC and(aG~=nil and aG>0),(af.Wave>=1 and af.Message=='')or af.Wave>=2
if aH and al then al=nil ak=nil ae=false end if not ae and not al then if aH or
aI then ak=os.clock()ae=true af.IsMatchActive=true end end if ae then if(af.
BaseHp<=0 and af.Wave>=1)or at()then al=os.clock()ae=false af.IsMatchActive=
false end end local aJ=0 if ak then if ae then aJ=os.clock()-ak elseif al then
aJ=al-ak end end af.ElapsedTime=math.round(aJ*100)/100 af.ElapsedTimeFormatted=
aj(aJ)af.IsMatchActive=ae end local az,aA=function()local az,aA,aB,aC,aF=an()if
not az and not aA and not aB and not aC then return false end local aG=false if
az then local aH,aI=ao(az.Text)if af.Cash~=aH or af.CashFormatted~=aI then af.
Cash=aH af.CashFormatted=aI aG=true end end if aA then local aH,aI,aJ=ap(aA.Text
)if af.Wave~=aH or af.WaveFormatted~=aJ then af.Wave=aH af.MaxWave=aI af.
WaveFormatted=aJ aG=true end end if aB then local aH,aI=aq(aB.Text)if af.
WaveTimerSeconds~=aH or af.WaveTimerFormatted~=aI then af.WaveTimerSeconds=aH af
.WaveTimerFormatted=aI aG=true end end if aC then local aH,aI,aJ=ar(aC.Text)if
af.BaseHp~=aH or af.BaseHealthFormatted~=aJ then af.BaseHp=aH af.BaseMaxHp=aI af
.BaseHealthFormatted=aJ aG=true end end if aF then local aH=aF.Text or''if af.
Message~=aH then af.Message=aH aG=true end end local aH=af.ElapsedTimeFormatted
ay()if aH~=af.ElapsedTimeFormatted then aG=true end if aG then for aI,aJ in
ipairs(ag)do task.spawn(aJ,af)end end return true end,function()for az,aA in
pairs(ah)do pcall(function()aA:Disconnect()end)ah[az]=nil end end local aB=
function()aA()local aB,aC,aF,aG,aH=an()if aB then ah.Gold=aB:
GetPropertyChangedSignal'Text':Connect(function()az()end)end if aC then ah.Wave=
aC:GetPropertyChangedSignal'Text':Connect(function()az()end)end if aF then ah.
Timer=aF:GetPropertyChangedSignal'Text':Connect(function()az()end)end if aG then
ah.Health=aG:GetPropertyChangedSignal'Text':Connect(function()az()end)end local
aI=am()if aI then ah.InfoVisible=aI:GetPropertyChangedSignal'Visible':Connect(
function()az()end)end if aH then ah.Message=aH:GetPropertyChangedSignal'Text':
Connect(function()az()end)ah.MessageVisible=aH:GetPropertyChangedSignal'Visible'
:Connect(function()az()end)end local aJ=as()if aJ then ah.EndScreenVisible=aJ:
GetPropertyChangedSignal'Visible':Connect(function()az()end)end az()end local aC
=function()if ai then return end ai=true task.spawn(function()while ai and ac.
IsActive()do if ab.IsInGame()then local aC=an()if aC and not ah.Gold then aB()
else az()end else aA()if ak then ak=nil al=nil ae=false az()end end task.wait(ae
and 0.1 or 0.5)end aA()ai=false end)end aC()function ad.GetCash()az()return af.
Cash end function ad.GetCashFormatted()az()return af.CashFormatted end function
ad.GetWave()az()return af.Wave,af.MaxWave end function ad.GetWaveFormatted()az()
return af.WaveFormatted end function ad.GetElapsedTime()az()return af.
ElapsedTime end function ad.GetElapsedTimeFormatted()az()return af.
ElapsedTimeFormatted end function ad.IsMatchActive()return ae end function ad.
GetWaveTimer()az()return af.WaveTimerSeconds end function ad.
GetWaveTimerFormatted()az()return af.WaveTimerFormatted end function ad.
GetBaseHealth()az()return af.BaseHp,af.BaseMaxHp end function ad.
GetBaseHealthFormatted()az()return af.BaseHealthFormatted end function ad.
GetMessage()az()return af.Message end function ad.StartMatch()ak=os.clock()al=
nil ae=true az()end function ad.EndMatch()al=os.clock()ae=false az()end function
ad.GetAll()az()return{Cash=af.Cash,CashFormatted=af.CashFormatted,Wave=af.Wave,
MaxWave=af.MaxWave,WaveFormatted=af.WaveFormatted,ElapsedTime=af.ElapsedTime,
ElapsedTimeFormatted=af.ElapsedTimeFormatted,IsMatchActive=af.IsMatchActive,
WaveTimerSeconds=af.WaveTimerSeconds,WaveTimerFormatted=af.WaveTimerFormatted,
BaseHp=af.BaseHp,BaseMaxHp=af.BaseMaxHp,BaseHealthFormatted=af.
BaseHealthFormatted,Message=af.Message}end function ad.Subscribe(aF)table.
insert(ag,aF)task.spawn(aF,ad.GetAll())return function()local aG=table.find(ag,
aF)if aG then table.remove(ag,aG)end end end ac.Register(function()ai=false aA()
table.clear(ag)end)return ad end function a.aD()return{}end function a.aE()local
aa,ab,ac,ad,ae,af,ag=game:GetService'HttpService',a.load'aD',a.load'a',{},(
isfile~=nil and writefile~=nil and makefolder~=nil and isfolder~=nil),{},false
local ah=function()local ah=ac.Folder or'EsclipseHub/SlopTowerDefense'if not ah:
find'SlopTowerDefense'then ah=ah..'/SlopTowerDefense'end return ah..'/Macros'end
local ai,aj=function(ai)return string.format('%s/%s.json',ah(),ai)end,function()
if not ae then return end pcall(function()local ai=ah()local aj,ak=ai:split'/',
''for al,am in ipairs(aj)do ak=(ak=='')and am or(ak..'/'..am)if not isfolder(ak)
then makefolder(ak)end end end)end local ak=function()if ag then return end ag=
true aj()if ae and listfiles then pcall(function()local ak=ah()if isfolder(ak)
then local al=listfiles(ak)for am,an in ipairs(al)do if an:sub(-5)=='.json'then
local ao=an:match'([^/\\]+)%.json$'if ao and#ao>0 then pcall(function()local ap=
readfile(an)local aq=(aa:JSONDecode(ap))if aq and aq.Metadata then af[ao]=aq end
end)end end end end end)end end function ad.ListMacros()ak()local al={}for am in
pairs(af)do table.insert(al,am)end table.sort(al)return al end function ad.
HasMacro(al)ak()return af[al]~=nil end function ad.GetMacro(al)ak()return af[al]
end function ad.CreateMacro(al)ak()al=al:gsub('[%s/\\]+','_')local am={Metadata=
{Name=al,CreatedAt=os.time(),UpdatedAt=os.time(),TotalSteps=0,TotalDuration=0},
Steps={}}af[al]=am ad.SaveMacro(al,am)return am end function ad.SaveMacro(al,am)
ak()am.Metadata.UpdatedAt=os.time()am.Metadata.TotalSteps=#am.Steps af[al]=am if
ae then aj()local an,ao,ap=ai(al),pcall(function()return aa:JSONEncode(am)end)if
ao and ap then local aq=pcall(function()writefile(an,ap)end)return aq end end
return true end function ad.DeleteMacro(al)ak()af[al]=nil if ae and delfile then
local am=ai(al)if isfile(am)then pcall(function()delfile(am)end)end end return
true end return ad end function a.aF()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,
am,an,ao,ap,aq,ar=a.load'aD',a.load'aE',a.load'aC',a.load'aB',a.load'ay',a.load
'ax',game:GetService'ReplicatedStorage',{},false,false,0,0,'Hybrid',0.1,true,{},
{IsEnabled=false,IsPlaying=false,MacroName=nil,CurrentStep=0,TotalSteps=0,
NextAction='None',StatusText='Idle',TimingMode='Hybrid',StepDelay=0.1,ApplySpeed
=true},{}local as=function()aq.IsEnabled=ai aq.IsPlaying=aj aq.MacroName=
activeMacroName aq.CurrentStep=ak aq.TotalSteps=al aq.TimingMode=am aq.StepDelay
=an aq.ApplySpeed=ao for as,at in ipairs(ar)do pcall(at,aq)end end local at,ay,
az=function(at,ay)aq.StatusText=at if ay then aq.NextAction=ay end as()end,
function()if not spawnRemote or not sellRemote or not upgradeRemote or not
changeModeRemote or not changeSpeedRemote then local at=ag:FindFirstChild
'Functions'if at then spawnRemote=(at:FindFirstChild'SpawnTower')sellRemote=(at:
FindFirstChild'SellTower')upgradeRemote=(at:FindFirstChild'UpgradeTower')
changeModeRemote=(at:FindFirstChild'ChangeTowerMode')changeSpeedRemote=(at:
FindFirstChild'ChangeSpeed')end end return spawnRemote,sellRemote,upgradeRemote,
changeModeRemote,changeSpeedRemote end,function(at,ay,az)az=az or 3.5 local aA,
aB,aC=az,{workspace:FindFirstChild'Towers',workspace:FindFirstChild
'PlacedTowers',workspace:FindFirstChild'Units',workspace}for aF,aG in ipairs(aB)
do if aG then for aH,aI in ipairs(aG:GetChildren())do if aI:IsA'Model'then local
aJ if aI.PrimaryPart then aJ=aI.PrimaryPart.Position else pcall(function()aJ=aI:
GetPivot().Position end)end if aJ then local aK=(aJ-ay).Magnitude if aK<aA then
if not at or aI.Name:lower():find(at:lower())then aA=aK aC=aI end end end end
end end if aC then break end end return aC end function ah.PlaceTower(aA,aB,aC,
aF,aG)local aH,aI=ay()if not aH then warn
'[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y RemoteFunction: Functions.SpawnTower'
return false,nil end aC=aC==true aF=aF or aA aG=aG or{}local aJ,aK=pcall(
function()return aH:InvokeServer(aA,aB,aC,aF,aG)end)if not aJ then warn(
'[Macro Player] L\u{1ed7}i g\u{1ecd}i SpawnTower:',tostring(aK))return false,nil
end if aK==false then return false,nil end local aL if typeof(aK)=='Instance'
then aL=aK else for aM=1,8 do task.wait(0.15)aL=az(aA,aB.Position)if aL then
break end end end return true,aL end function ah.SellTower(aA)local aB,aC=ay()if
not aC then warn
'[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y RemoteFunction: Functions.SellTower'
return false end if not aA or not aA.Parent then warn
'[Macro Player] Th\u{e1}p m\u{1ee5}c ti\u{ea}u \u{111}\u{1ec3} b\u{e1}n kh\u{f4}ng t\u{1ed3}n t\u{1ea1}i ho\u{1eb7}c \u{111}\u{e3} b\u{1ecb} h\u{1ee7}y!'
return false end local aF,aG=pcall(function()return aC:InvokeServer(aA)end)if
not aF then warn('[Macro Player] L\u{1ed7}i g\u{1ecd}i SellTower:',tostring(aG))
return false end return true end function ah.UpgradeTower(aA,aB)local aC,aF,aG=
ay()if not aG then warn
'[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y RemoteFunction: Functions.UpgradeTower'
return false end if not aA or not aA.Parent then warn
'[Macro Player] Th\u{e1}p m\u{1ee5}c ti\u{ea}u \u{111}\u{1ec3} n\u{e2}ng c\u{1ea5}p kh\u{f4}ng t\u{1ed3}n t\u{1ea1}i ho\u{1eb7}c \u{111}\u{e3} b\u{1ecb} h\u{1ee7}y!'
return false end aB=aB or aA.Name local aH,aI=pcall(function()return aG:
InvokeServer(aA,aB)end)if not aH then warn(
'[Macro Player] L\u{1ed7}i g\u{1ecd}i UpgradeTower:',tostring(aI))return false
end if aI==false then return false end return true end function ah.
ChangeTowerMode(aA)local aB,aF,aG,aH=ay()if not aH then warn
'[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y RemoteFunction: Functions.ChangeTowerMode'
return false end if not aA or not aA.Parent then warn
'[Macro Player] Th\u{e1}p m\u{1ee5}c ti\u{ea}u \u{111}\u{1ec3} \u{111}\u{1ed5}i Target kh\u{f4}ng t\u{1ed3}n t\u{1ea1}i ho\u{1eb7}c \u{111}\u{e3} b\u{1ecb} h\u{1ee7}y!'
return false end local aI,aJ=pcall(function()return aH:InvokeServer(aA)end)if
not aI then warn('[Macro Player] L\u{1ed7}i g\u{1ecd}i ChangeTowerMode:',
tostring(aJ))return false end if aJ==false then return false end return true end
function ah.ChangeSpeed(aA)local aG,aH,aI,aJ,aK=ay()if not aK then aK=(ag:
FindFirstChild('ChangeSpeed',true))end if not aK then warn
'[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y RemoteFunction: Functions.ChangeSpeed'
return false end local aL,aM=pcall(function()return aK:InvokeServer(aA)end)if
not aL then warn('[Macro Player] L\u{1ed7}i g\u{1ecd}i ChangeSpeed:',tostring(aM
))return false end if aM==false then return false end return true end function
ah.ExecuteStep(aA)if aA.Type=='Place'then if not aA.CFrame then warn
'[Macro Player] B\u{1b0}\u{1edb}c Place thi\u{1ebf}u d\u{1eef} li\u{1ec7}u CFrame!'
return false end local aJ=CFrame.new(table.unpack(aA.CFrame))local aK,aL=ah.
PlaceTower(aA.TowerName,aJ,aA.Arg3,aA.Arg4,aA.Arg5)if aK then if aL then ap[aA.
TowerId]=aL end ae.Notify('Macro Play',string.format('Placed %s (%s) [%.2fs]',aA
.TowerName,aA.TowerId,aA.Time),1.5)return true end elseif aA.Type=='Sell'then
local aJ=ap[aA.TowerId]if not aJ or not aJ.Parent then if aA.Position then local
aK=Vector3.new(aA.Position[1],aA.Position[2],aA.Position[3])aJ=az(aA.TowerName,
aK)end end if aJ then local aK=ah.SellTower(aJ)if aK then ap[aA.TowerId]=nil ae.
Notify('Macro Play',string.format('Sold %s (%s) [%.2fs]',aA.TowerName,aA.TowerId
,aA.Time),1.5)return true end else warn(string.format(
"[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y th\u{e1}p '%s' \u{111}\u{1ec3} b\u{e1}n!"
,aA.TowerId))end elseif aA.Type=='Upgrade'then local aJ=ap[aA.TowerId]if not aJ
or not aJ.Parent then if aA.Position then local aK=Vector3.new(aA.Position[1],aA
.Position[2],aA.Position[3])aJ=az(aA.TowerName,aK)end end if aJ then local aK=aA
.Arg4 or aJ.Name local aL=ah.UpgradeTower(aJ,aK)if aL then ae.Notify(
'Macro Play',string.format('Upgraded %s (%s) [%.2fs]',aA.TowerName,aA.TowerId,aA
.Time),1.5)return true end else warn(string.format(
"[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y th\u{e1}p '%s' \u{111}\u{1ec3} n\u{e2}ng c\u{1ea5}p!"
,aA.TowerId))end elseif aA.Type=='Target'then local aJ=ap[aA.TowerId]if not aJ
or not aJ.Parent then if aA.Position then local aK=Vector3.new(aA.Position[1],aA
.Position[2],aA.Position[3])aJ=az(aA.TowerName,aK)end end if aJ then local aK=ah
.ChangeTowerMode(aJ)if aK then ae.Notify('Macro Play',string.format(
'Changed Target: %s (%s) [%.2fs]',aA.TowerName,aA.TowerId,aA.Time),1.5)return
true end else warn(string.format(
"[Macro Player] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y th\u{e1}p '%s' \u{111}\u{1ec3} \u{111}\u{1ed5}i Target!"
,aA.TowerId))end elseif aA.Type=='Speed'then if not ao then return true end
local aJ=aA.Speed or 1 local aK=ah.ChangeSpeed(aJ)if aK then ae.Notify(
'Macro Play',string.format(
'\u{110}\u{e3} \u{111}\u{1ed5}i Speed sang: x%d [%.2fs]',aJ,aA.Time),1.5)return
true end end return false end local aA=function()if activePlaybackThread then
pcall(task.cancel,activePlaybackThread)activePlaybackThread=nil end
activePlaybackThread=task.spawn(function()while ai do if not ad.IsInGame()then
aj=false at('Waiting for in-game...','None')task.wait(1)continue end if not ac.
IsMatchActive()then aj=false at('Waiting for match to start...','None')task.
wait(0.5)continue end local aA=activeMacroName if not aA or aA==''or aA=='None'
then aj=false at('No macro selected!','None')task.wait(1)continue end local aJ=
ab.GetMacro(aA)if not aJ or not aJ.Steps or#aJ.Steps==0 then aj=false at(
'Macro is empty!','None')task.wait(1)continue end aj=true ak=0 al=#aJ.Steps
table.clear(ap)if ao then local aK=(aJ.Metadata and aJ.Metadata.InitialSpeed)or
1 ah.ChangeSpeed(aK)ae.Notify('Macro Player',string.format(
'B\u{1eaf}t \u{111}\u{1ea7}u Play: %s (Speed ban \u{111}\u{1ea7}u: x%d, %d b\u{1b0}\u{1edb}c)'
,aA,aK,al),2.5)else ae.Notify('Macro Player',string.format(
'B\u{1eaf}t \u{111}\u{1ea7}u Play: %s (%d b\u{1b0}\u{1edb}c, b\u{1ecf} qua Speed)'
,aA,al),2.5)end for aK,aL in ipairs(aJ.Steps)do if not ai or not aj then break
end if not ac.IsMatchActive()then at('Match ended early','None')break end if aL.
Type=='Speed'and not ao then continue end ak=aK-1 local aM=string.format(
'%s %s (%s) [W%d - %.2fs]',aL.Type,aL.TowerName,aL.TowerId,aL.Wave,aL.Time)at(
string.format('Waiting for Step %d/%d (Wave %d)',aK,al,aL.Wave),aM)local aN=
false while ai and aj and ac.IsMatchActive()do local aO,aP=ac.GetWave()local aQ,
aS,aT,aU=ac.GetCash(),ac.GetElapsedTime(),aO>=aL.Wave,false if am==
'Cash (Timed Sell)'then if aL.Type=='Sell'then aU=aT and aS>=aL.Time elseif aL.
Type=='Target'then aU=aT elseif aL.Type=='Speed'then aU=aT and(aO>aL.Wave or aS
>=aL.Time)else local aV=aL.Cost or 0 aU=aT and aQ>=aV end elseif aL.Type=='Sell'
or aL.Type=='Target'or aL.Type=='Speed'then aU=aT and(aO>aL.Wave or aS>=aL.Time)
else local aV=aL.Cost or 0 if am=='Timer'then aU=aT and aS>=aL.Time elseif am==
'Wave & Cash'then aU=aT and aQ>=aV else local aW,aX=aV==0 or aQ>=aV,aS>=aL.Time
aU=aT and(aW or aX)end end if aU then aN=true break end task.wait(0.05)end if
not aN or not ai or not aj or not ac.IsMatchActive()then break end at(string.
format('Executing Step %d/%d...',aK,al),aM)local aO=false for aP=1,3 do if not
ai or not ac.IsMatchActive()then break end aO=ah.ExecuteStep(aL)if aO then break
end task.wait(0.3)end ak=aK task.wait(math.max(0.02,an))end if ai and ak>=al
then at(string.format('Completed (%d/%d steps)',al,al),'All done')ae.Notify(
'Macro Player',string.format('Ho\u{e0}n th\u{e0}nh Macro: %s!',aA),3)end aj=
false while ai and ac.IsMatchActive()do task.wait(1)end at(
'Match finished. Waiting for next match...','None')task.wait(2)end aj=false ak=0
at('Idle','None')end)end function ah.IsEnabled()return ai end function ah.
SetEnabled(aJ)if ai==aJ then return end ai=aJ if ai then aA()else ah.Stop()end
end function ah.IsPlaying()return aj end function ah.GetActiveMacro()return
activeMacroName end function ah.SetActiveMacro(aJ)activeMacroName=aJ aq.
MacroName=aJ as()end function ah.GetTimingMode()return am end function ah.
SetTimingMode(aJ)am=aJ aq.TimingMode=aJ as()end function ah.GetStepDelay()return
an end function ah.SetStepDelay(aJ)an=math.clamp(aJ,0,5)aq.StepDelay=an as()end
function ah.IsSpeedSyncEnabled()return ao end function ah.SetSpeedSync(aJ)ao=aJ
aq.ApplySpeed=aJ as()end function ah.GetCurrentStepIndex()return ak end function
ah.GetTotalSteps()return al end function ah.GetStatus()return aq end function ah
.Restart()if not ai then return end table.clear(ap)ak=0 aj=false aA()end
function ah.Stop()ai=false aj=false ak=0 table.clear(ap)if activePlaybackThread
then pcall(task.cancel,activePlaybackThread)activePlaybackThread=nil end at(
'Idle','None')end function ah.Subscribe(aJ)table.insert(ar,aJ)pcall(aJ,aq)return
function()local aK=table.find(ar,aJ)if aK then table.remove(ar,aK)end end end af
.Register(function()ah.Stop()end)return ah end function a.aG()local aa,ab,ac,ad,
ae,af,ag,ah,ai=game:GetService'Players',game:GetService'ReplicatedStorage',game:
GetService'VirtualInputManager',game:GetService'GuiService',a.load'aB',a.load
'aC',a.load'ay',a.load'ax',{}ai.AutoReplayEnabled=false ai.AutoSpeedEnabled=
false ai.SelectedSpeed='x2'ai.Speeds={'x1','x2','x3','x4','x5'}local aj,ak,al,am
,an,ao=true,0,function(aj)if not aj or not aj:IsA'GuiButton'then return false
end pcall(function()local ak=(getconnections or(syn and syn.getconnections)or(
getgenv and getgenv().getconnections))if ak then for al,am in ipairs(ak(aj.
MouseButton1Click))do if am.Fire then am:Fire()elseif am.fire then am:fire()end
end for al,am in ipairs(ak(aj.Activated))do if am.Fire then am:Fire()elseif am.
fire then am:fire()end end for al,am in ipairs(ak(aj.MouseButton1Up))do if am.
Fire then am:Fire()elseif am.fire then am:fire()end end end end)pcall(function()
local ak=(firesignal or(syn and syn.firesignal)or(getgenv and getgenv().
firesignal))if ak then ak(aj.MouseButton1Click)ak(aj.Activated)ak(aj.
MouseButton1Down)ak(aj.MouseButton1Up)end end)pcall(function()local ak,al=aj.
AbsolutePosition,aj.AbsoluteSize if al.X>0 and al.Y>0 then local am,an=ak.X+al.X
/2,ak.Y+al.Y/2 ac:SendMouseButtonEvent(am,an,0,true,game,1)task.wait(0.05)ac:
SendMouseButtonEvent(am,an,0,false,game,1)end end)pcall(function()ad.
SelectedObject=aj task.wait(0.05)ac:SendKeyEvent(true,Enum.KeyCode.Return,false,
game)task.wait(0.05)ac:SendKeyEvent(false,Enum.KeyCode.Return,false,game)ad.
SelectedObject=nil end)return true end,function()local aj=aa.LocalPlayer local
ak=aj and aj:FindFirstChild'PlayerGui'local al=ak and ak:FindFirstChild'GameGui'
if not al then return nil end local am=al:FindFirstChild'EndScreen'if am and am:
IsA'GuiObject'then return am end return nil end,function(aj)if not aj or not aj:
IsA'GuiObject'then return false end return aj.Visible==true end,function(aj)if
not aj then return nil end local ak=aj:FindFirstChild'Replay'if ak and ak:IsA
'GuiButton'then return ak end local al=aj:FindFirstChild('Replay',true)if al and
al:IsA'GuiButton'then return al end return nil end local ap=function()if not ai.
AutoReplayEnabled then return false end local ap=am()if not ap or not an(ap)then
return false end local aq=ao(ap)if not aq then return false end local ar=os.
clock()if ar-ak<2 then return false end ak=ar task.spawn(function()task.wait(0.1
)if ai.AutoReplayEnabled and an(ap)and aq and aq.Parent then al(aq)ag.Notify(
'Auto Replay',
'\u{110}\u{e3} t\u{1ef1} \u{111}\u{1ed9}ng nh\u{1ea5}n n\u{fa}t Replay!',2.5)end
end)return true end local aq,ar=function()if endScreenConn and endScreenConn.
Connected then return end local aq=am()if aq then endScreenConn=aq:
GetPropertyChangedSignal'Visible':Connect(function()if aq.Visible and ai.
AutoReplayEnabled then ap()end end)end end,function(aq)local ar,as=aq or
tonumber(ai.SelectedSpeed:match'%d+')or 2,ab:FindFirstChild'Functions'local at=
as and as:FindFirstChild'ChangeSpeed'if not at then at=ab:FindFirstChild(
'ChangeSpeed',true)end if at and at:IsA'RemoteFunction'then task.spawn(function(
)pcall(function()at:InvokeServer(ar)end)end)return true end return false end
function ai.ApplySpeed(as)local at=as or tonumber(ai.SelectedSpeed:match'%d+')or
2 ar(at)end function ai.GetCurrentSpeed()local as=aa.LocalPlayer local at=as and
as:FindFirstChild'PlayerGui'local ay=at and at:FindFirstChild'GameGui'if not ay
then return 1 end local az=ay:FindFirstChild'SpeedUp'local aA=az and az:
FindFirstChild'Message'if aA and aA:IsA'TextLabel'then local aJ=tonumber(aA.Text
:match'%d+')if aJ and aJ>=1 and aJ<=5 then return aJ end end local aJ=ay:
FindFirstChild('SpeedUp',true)if aJ then local aK=aJ:FindFirstChild'Message'if
aK and aK:IsA'TextLabel'then local aL=tonumber(aK.Text:match'%d+')if aL and aL>=
1 and aL<=5 then return aL end end end return 1 end local as,at,ay=function()
local as,at=pcall(function()return a.load'aF'end)if as and at then if at.
IsEnabled and at.IsEnabled()then if at.IsSpeedSyncEnabled and at.
IsSpeedSyncEnabled()then return true end end end return false end,false,0 local
az=function(az)if not ai.AutoSpeedEnabled or as()then at=az.IsMatchActive return
end if not ae.IsInGame()then at=false ay=0 return end local aA=tonumber(ai.
SelectedSpeed:match'%d+')or 2 if az.IsMatchActive and not at then at=true task.
spawn(function()task.wait(0.2)if ai.AutoSpeedEnabled and not as()and ae.
IsInGame()then ar(aA)ag.Notify('Auto Speed',string.format(
'\u{110}\u{e3} g\u{1eed}i Remote ChangeSpeed: x%d',aA),2)end end)elseif not az.
IsMatchActive then at=false ay=0 end if az.IsMatchActive and az.Wave==1 and ay~=
1 then ay=1 task.spawn(function()task.wait(0.1)if ai.AutoSpeedEnabled and not
as()and ae.IsInGame()then ar(aA)end end)end end local aA=af.Subscribe(az)task.
spawn(function()while aj and ah.IsActive()do aq()if ai.AutoReplayEnabled then
ap()end if ai.AutoSpeedEnabled and not as()and ae.IsInGame()and af.
IsMatchActive()and not at then at=true local aJ=tonumber(ai.SelectedSpeed:match
'%d+')or 2 ar(aJ)end task.wait(0.25)end end)function ai.SetAutoReplay(aJ)ai.
AutoReplayEnabled=aJ if aJ then ak=0 aq()ap()end end function ai.SetAutoSpeed(aJ
)ai.AutoSpeedEnabled=aJ if aJ and not as()and ae.IsInGame()and af.IsMatchActive(
)then local aK=tonumber(ai.SelectedSpeed:match'%d+')or 2 ar(aK)ag.Notify(
'Auto Speed',string.format('\u{110}\u{e3} g\u{1eed}i Remote ChangeSpeed: x%d',aK
),2)end end function ai.SetSpeed(aJ)if table.find(ai.Speeds,aJ)then ai.
SelectedSpeed=aJ if ai.AutoSpeedEnabled and not as()and ae.IsInGame()and af.
IsMatchActive()then local aK=tonumber(aJ:match'%d+')or 2 ar(aK)ag.Notify(
'Auto Speed',string.format('\u{110}\u{e3} g\u{1eed}i Remote ChangeSpeed: x%d',aK
),2)end end end ah.Register(function()aj=false if endScreenConn then
endScreenConn:Disconnect()endScreenConn=nil end if aA then aA()end end)return ai
end function a.aH()local aa,ab,ac,ad,ae,af=a.load'aA',a.load'aC',a.load'aB',a.
load'aG',a.load'az',a.load'ax'return function(ag,ah)local ai=ah:Section{Side=
'Left'}ai:Header{Name='Status & Display'}ai:Label{Text='<b>Location:</b> '..aa.
GetLocationName()}local aj,ak,al,am=ai:Label{Text=
"\u{23f1}\u{fe0f} <b>Timer:</b> <font color='rgb(255,220,100)'>00:00.00</font>"}
,ai:Label{Text="\u{1f4b0} <b>Cash:</b> <font color='rgb(85,255,120)'>$0</font>"}
,ai:Label{Text=
"\u{2764}\u{fe0f} <b>Base HP:</b> <font color='rgb(255,100,100)'>100/100</font>"
},ai:Label{Text=
"\u{1f30a} <b>Wave:</b> <font color='rgb(100,200,255)'>0/0</font>"}local an=
function(an)if not ac.IsInGame()then aj:UpdateName
"\u{23f1}\u{fe0f} <b>Timer:</b> <font color='rgb(150,150,150)'>In Lobby</font>"
ak:UpdateName
"\u{1f4b0} <b>Cash:</b> <font color='rgb(150,150,150)'>In Lobby</font>"al:
UpdateName
"\u{2764}\u{fe0f} <b>Base HP:</b> <font color='rgb(150,150,150)'>In Lobby</font>"
am:UpdateName
"\u{1f30a} <b>Wave:</b> <font color='rgb(150,150,150)'>In Lobby</font>"return
end local ao=an.IsMatchActive and'rgb(255,220,100)'or'rgb(150,220,255)'aj:
UpdateName(string.format(
"\u{23f1}\u{fe0f} <b>Timer:</b> <font color='%s'>%s</font>",ao,an.
ElapsedTimeFormatted))ak:UpdateName(string.format(
"\u{1f4b0} <b>Cash:</b> <font color='rgb(85,255,120)'>%s</font>",an.
CashFormatted))al:UpdateName(string.format(
"\u{2764}\u{fe0f} <b>Base HP:</b> <font color='rgb(255,100,100)'>%s</font>",an.
BaseHealthFormatted))am:UpdateName(string.format(
"\u{1f30a} <b>Wave:</b> <font color='rgb(100,200,255)'>Wave %s</font>",an.
WaveFormatted))end local ao=ab.Subscribe(an)af.Register(ao)local ap=ah:Section{
Side='Right'}ap:Header{Name='Match Automation'}ap:Toggle({Name='Auto Replay',
Default=ad.AutoReplayEnabled,Callback=ae.Wrap(function(aq)ad.SetAutoReplay(aq)
end)},'Toggle_AutoReplay')ap:Toggle({Name='Auto Speed',Default=ad.
AutoSpeedEnabled,Callback=ae.Wrap(function(aq)ad.SetAutoSpeed(aq)end)},
'Toggle_AutoSpeed')ap:Dropdown({Name='Game Speed',Options=ad.Speeds,Default=ad.
SelectedSpeed,Required=true,Callback=ae.Wrap(function(aq)if not aq or aq==''then
return end ad.SetSpeed(aq)end)},'Dropdown_GameSpeed')end end function a.aI()
local aa,ab,ac,ad,ae,af,ag,ah=game:GetService'Players',game:GetService
'GuiService',game:GetService'VirtualInputManager',a.load'aB',a.load'ax',a.load
'ay',{Enabled=false,Mode='Normal',StartDelay=2}local ai,aj,ak,al,am,an=function(
ai)if not ai then return end pcall(function()local aj=(firesignal or(syn and syn
.firesignal))if aj then aj(ai.MouseButton1Click)aj(ai.Activated)aj(ai.
MouseButton1Up)end end)pcall(function()local aj,ak=ai.AbsolutePosition,ai.
AbsoluteSize local al,am=aj.X+ak.X/2,aj.Y+ak.Y/2 ac:SendMouseButtonEvent(al,am,0
,true,game,1)task.wait(0.05)ac:SendMouseButtonEvent(al,am,0,false,game,1)end)
pcall(function()ab.SelectedObject=ai task.wait(0.05)ac:SendKeyEvent(true,Enum.
KeyCode.Return,false,game)task.wait(0.05)ac:SendKeyEvent(false,Enum.KeyCode.
Return,false,game)task.wait(0.05)ab.SelectedObject=nil end)end,function(ai)if ai
=='Raid'then return{'Elevator1','Elevator2','Elevator3','Elevator4'}else return{
'Elevator5','Elevator6','Elevator7','Elevator8'}end end,function(ai)if not ai
then return nil,Vector3.zero end local aj for ak,al in ipairs{'Hitbox','Floor',
'Zone','Trigger','Pad','Base','Primary'}do local am=ai:FindFirstChild(al,true)if
am and am:IsA'BasePart'then aj=am break end end if not aj and ai:IsA'Model'and
ai.PrimaryPart then aj=ai.PrimaryPart end if not aj then aj=ai:
FindFirstChildWhichIsA('BasePart',true)end if not aj then return nil,Vector3.
zero end local ak=aj.Position+Vector3.new(0,3,0)return aj,ak end,function(ai,aj,
ak)local al,am=Vector3.new(0,0,1),workspace:FindFirstChildOfClass'SpawnLocation'
if am then local an=am.Position.Z-ak.Z if an<-5 then al=Vector3.new(0,0,-1)
elseif an>5 then al=Vector3.new(0,0,1)end else pcall(function()local an=
RaycastParams.new()an.FilterType=RaycastFilterType.Exclude local ao,ap=aa.
LocalPlayer and aa.LocalPlayer.Character,{ai}if ao then table.insert(ap,ao)end
an.FilterDescendantsInstances=ap local aq,ar=ak+Vector3.new(0,5,11.5),ak+Vector3
.new(0,5,-11.5)local as,at=workspace:Raycast(aq,Vector3.new(0,-15,0),an),
workspace:Raycast(ar,Vector3.new(0,-15,0),an)if at and not as then al=Vector3.
new(0,0,-1)elseif as and not at then al=Vector3.new(0,0,1)end end)end local an=
Vector3.new(ak.X,ak.Y,ak.Z+al.Z*11.5)return al,an end,function()local ai=aa.
LocalPlayer if not ai then return nil end local aj=ai:FindFirstChild'PlayerGui'
if not aj then return nil end local ak=aj:FindFirstChild'Elevator'if not ak then
return nil end local al=ak:FindFirstChild'MainUI'if al and al:IsA'GuiObject'and
al.Visible then return al end return nil end,function(ai,aj)local ak=(ai:
FindFirstChild'HumanoidRootPart')if not ak then return end local al=(
firetouchinterest or(syn and syn.firetouchinterest))if not al then return end
pcall(function()for am,an in ipairs(aj:GetDescendants())do if an:IsA'BasePart'
then al(ak,an,0)task.wait()al(ak,an,1)end end end)end local ao=function(ao,ap,aq
,ar)local as,at=(ao:FindFirstChild'HumanoidRootPart'),ao:FindFirstChildOfClass
'Humanoid'if not as or not at then return false end local ay,az=al(ap,aq,ar)
local aA={az,Vector3.new(ar.X,ar.Y,ar.Z-ay.Z*11.5)}for aJ,aK in ipairs(aA)do if
not ag.Enabled or not ad.IsLobby()then return false end local aL=Vector3.new(ar.
X,aK.Y,ar.Z)as.CFrame=CFrame.lookAt(aK,aL)pcall(function()as.
AssemblyLinearVelocity=Vector3.zero as.AssemblyAngularVelocity=Vector3.zero end)
at.PlatformStand=false at.Sit=false if at.WalkSpeed<16 then at.WalkSpeed=16 end
pcall(at.ChangeState,at,Enum.HumanoidStateType.GettingUp)task.wait(0.05)at:
MoveTo(ar)local aM=os.clock()while(os.clock()-aM)<1.8 and ag.Enabled and ad.
IsLobby()do if am()then pcall(function()at:MoveTo(as.Position)end)return true
end local aN=(as.Position-ar).Magnitude if aN<4 then an(ao,ap)end task.wait(0.1)
end if am()then pcall(function()at:MoveTo(as.Position)end)return true end end
return false end local ap=function()while ag.Enabled and ae.IsActive()do if not
ad.IsLobby()then task.wait(1)continue end local ap=aa.LocalPlayer local aq=ap
and ap.Character local ar,as=aq and(aq:FindFirstChild'HumanoidRootPart'),aq and
aq:FindFirstChildOfClass'Humanoid'if not ar or not as or as.Health<=0 then task.
wait(0.5)continue end local at=am()if at then if ag.StartDelay>0 then task.wait(
ag.StartDelay)end at=am()if at and ag.Enabled and ad.IsLobby()then local ay=at:
FindFirstChild('Start',true)if ay and ay:IsA'GuiButton'then ai(ay)af.Notify(
'Elevator','Pressed Start button!',2)task.wait(3)end end task.wait(1)continue
end local ay=workspace:FindFirstChild'Elevators'if ay then local az=aj(ag.Mode)
for aA,aJ in ipairs(az)do if not ag.Enabled or not ad.IsLobby()then break end if
am()then break end local aK=ay:FindFirstChild(aJ)if aK then local aL,aM=ak(aK)if
aL and ar then local aN=ao(aq,aK,aL,aM)if aN then break end end end end end task
.wait(0.5)end ah=nil end function ag.SetEnabled(aq)if ag.Enabled==aq then return
end ag.Enabled=aq if aq then if not ah then ah=task.spawn(ap)end end end
function ag.SetMode(aq)if aq=='Raid'or aq=='Normal'then ag.Mode=aq end end
function ag.SetStartDelay(aq)aq=tonumber(aq)or 0 ag.StartDelay=math.clamp(aq,0,
30)end function ag.GetStartDelay()return ag.StartDelay end ae.Register(function(
)ag.Enabled=false end)return ag end function a.aJ()local aa,ab,ac,ad,ae,af,ag,ah
,ai,aj=game:GetService'Players',game:GetService'GuiService',game:GetService
'VirtualInputManager',a.load'aB',a.load'ax',a.load'ay',{AutoPickMapEnabled=false
,SelectedUniverse='Brainrot Bases',Universes={'Brainrot Bases',
'Toilet Territory','Retro Revival','Garden','Backrooms'},UniverseMaps={[
'Brainrot Bases']={'Night Base','Base','Gold Base','BrainrotEndless'},[
'Toilet Territory']={'Desert','Toilet City','Ruined City','ToiletEndless'},[
'Retro Revival']={'Happy Home','Crossroads','Doomspire','RetroEndless'},Garden={
'Plot','NightPlot','RichPlot','GardenEndless'},Backrooms={'Level0','Poolrooms',
'Level94','BackroomsEndless'}},SelectedMap='Night Base',AutoDifficultyEnabled=
false,SelectedDifficulty='Normal',Difficulties={'Normal','Hard','Nightmare',
'Chaos'},VoteDelay=2},false,false,false local ak,al,am,an=function(ak)if not ak
then return end print(
'[MatchSetup] \u{110}ang th\u{1ef1}c hi\u{1ec7}n click v\u{e0}o n\u{fa}t:',ak.
Name)pcall(function()local al=(firesignal or(syn and syn.firesignal))if al and
ak:IsA'GuiButton'then al(ak.MouseButton1Click)al(ak.Activated)al(ak.
MouseButton1Up)end end)pcall(function()if ak:IsA'GuiObject'then local al,am=ak.
AbsolutePosition,ak.AbsoluteSize local an,ao=al.X+am.X/2,al.Y+am.Y/2 ac:
SendMouseButtonEvent(an,ao,0,true,game,1)task.wait(0.05)ac:SendMouseButtonEvent(
an,ao,0,false,game,1)end end)pcall(function()if ak:IsA'GuiButton'then ab.
SelectedObject=ak task.wait(0.05)ac:SendKeyEvent(true,Enum.KeyCode.Return,false,
game)task.wait(0.05)ac:SendKeyEvent(false,Enum.KeyCode.Return,false,game)task.
wait(0.05)ab.SelectedObject=nil end end)end,function(ak,al)if not ak then return
nil end local am=ak:FindFirstChild(al)if am and(am:IsA'GuiButton'or am:IsA
'ImageButton'or am:IsA'TextButton')then return am end local an=string.lower(al)
for ao,ap in ipairs(ak:GetChildren())do if ap:IsA'GuiButton'or ap:IsA
'ImageButton'or ap:IsA'TextButton'then if string.lower(ap.Name)==an then return
ap end end end for ao,ap in ipairs(ak:GetChildren())do if ap:IsA'GuiButton'or ap
:IsA'ImageButton'or ap:IsA'TextButton'then local aq=ap:FindFirstChild'Title'or
ap:FindFirstChildWhichIsA('TextLabel',true)if aq and string.lower(aq.Text)==an
then return ap end end end return nil end,function(ak)if not ak then return
false end if ak:IsA'GuiObject'and not ak.Visible then return false end local al=
ak:FindFirstChild'Universes'if al then for am,an in ipairs(al:GetChildren())do
if(an:IsA'GuiButton'or an:IsA'ImageButton')and an.Visible then return true end
end end local am=ak:FindFirstChild'Maps'if am then for an,ao in ipairs(am:
GetChildren())do if(ao:IsA'GuiButton'or ao:IsA'ImageButton')and ao.Visible then
return true end end end return false end,function(ak)if not ak then return false
end if ak:IsA'GuiObject'and not ak.Visible then return false end local al=ak:
FindFirstChild'Modes'if al then for am,an in ipairs(al:GetChildren())do if(an:
IsA'GuiButton'or an:IsA'ImageButton')and an.Visible then return true end end end
return false end local ao=function()if aj then return end aj=true print
'[MatchSetup] Tr\u{ec}nh theo d\u{f5}i Match Setup \u{111}\u{e3} kh\u{1edf}i \u{111}\u{1ed9}ng.'
while ae.IsActive()and ad.IsInGame()do local ao,ap=ag.AutoPickMapEnabled and not
ah,ag.AutoDifficultyEnabled and not ai if not ao and not ap then task.wait(1)
continue end local aq=aa.LocalPlayer local ar=aq and aq:FindFirstChild
'PlayerGui'local as=ar and ar:FindFirstChild'GameGui'if ao and as then local at=
as:FindFirstChild'Voting'if at and am(at)then print(string.format(
'[MatchSetup] Ph\u{e1}t hi\u{1ec7}n giao di\u{1ec7}n Voting! Ch\u{1edd} Vote Delay %d gi\u{e2}y...'
,ag.VoteDelay))if ag.VoteDelay>0 then task.wait(ag.VoteDelay)end if not ae.
IsActive()or not ad.IsInGame()then break end local ay,az=at:FindFirstChild
'Universes',at:FindFirstChild'Maps'if ay then print(
'[MatchSetup] \u{110}ang t\u{ec}m Universe:',ag.SelectedUniverse)local aA=al(ay,
ag.SelectedUniverse)if aA then ak(aA)print(
'[MatchSetup] -> \u{110}\u{e3} click Universe:',ag.SelectedUniverse)else warn(
'[MatchSetup] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y n\u{fa}t Universe:',ag.
SelectedUniverse)end end task.wait(0.4)if az then print(
'[MatchSetup] \u{110}ang ch\u{1edd} v\u{e0} t\u{ec}m n\u{fa}t Map:',ag.
SelectedMap)local aA,aJ=(ag.SelectedMap)for aK=1,40 do aJ=al(az,aA)if aJ and aJ.
Visible then break end task.wait(0.1)end if aJ then ak(aJ)ah=true print(
'[MatchSetup] -> \u{110}\u{e3} click Map th\u{e0}nh c\u{f4}ng:',aA)af.Notify(
'Match Setup',string.format('\u{110}\u{e3} ch\u{1ecd}n: %s - %s',ag.
SelectedUniverse,aA),3)else for aK,aL in ipairs(az:GetChildren())do if(aL:IsA
'GuiButton'or aL:IsA'ImageButton')and aL.Visible then ak(aL)ah=true print(
'[MatchSetup] -> \u{110}\u{e3} click Map fallback:',aL.Name)af.Notify(
'Match Setup',string.format('\u{110}\u{e3} ch\u{1ecd}n Map fallback: %s',aL.Name
),3)break end end if not ah then warn
'[MatchSetup] Kh\u{f4}ng t\u{ec}m th\u{1ea5}y n\u{fa}t Map n\u{e0}o \u{111}ang hi\u{1ec3}n th\u{1ecb} trong Voting.Maps!'
end end end end end if ap and as then local at=as:FindFirstChild
'ComplicationVoting'if at and an(at)then print
'[MatchSetup] Ph\u{e1}t hi\u{1ec7}n giao di\u{1ec7}n ComplicationVoting!'local
ay=at:FindFirstChild'Modes'if ay then local az=ag.SelectedDifficulty print(
'[MatchSetup] \u{110}ang t\u{ec}m Difficulty:',az)local aA=al(ay,az)if aA then
task.wait(0.2)ak(aA)ai=true print(
'[MatchSetup] -> \u{110}\u{e3} click Difficulty th\u{e0}nh c\u{f4}ng:',az)af.
Notify('Match Setup',string.format(
'\u{110}\u{e3} ch\u{1ecd}n \u{111}\u{1ed9} kh\u{f3}: %s',az),3)else for aJ,aK in
ipairs(ay:GetChildren())do if(aK:IsA'GuiButton'or aK:IsA'ImageButton')and aK.
Visible then ak(aK)ai=true print(
'[MatchSetup] -> \u{110}\u{e3} click Difficulty fallback:',aK.Name)af.Notify(
'Match Setup',string.format(
'\u{110}\u{e3} ch\u{1ecd}n \u{111}\u{1ed9} kh\u{f3} fallback: %s',aK.Name),3)
break end end end end end end task.wait(0.5)end aj=false print
'[MatchSetup] Tr\u{ec}nh theo d\u{f5}i Match Setup \u{111}\u{e3} k\u{1ebf}t th\u{fa}c v\u{f2}ng l\u{1eb7}p.'
end function ag.StartVotingWatcher()ah=false ai=false if not aj then task.spawn(
ao)end end function ag.StopVotingWatcher()ah=false ai=false end function ag.
GetMapsForUniverse(ap)return ag.UniverseMaps[ap]or{}end function ag.
SetAutoPickMap(ap)ag.AutoPickMapEnabled=ap print(
'[MatchSetup] C\u{1ead}p nh\u{1ead}t Auto Pick Map:',ap)if ap and ad.IsInGame()
then ag.StartVotingWatcher()end end function ag.SetUniverse(ap)ag.
SelectedUniverse=ap print(
'[MatchSetup] \u{110}\u{e3} ch\u{1ecd}n Universe m\u{1ee5}c ti\u{ea}u:',ap)end
function ag.SetMap(ap)ag.SelectedMap=ap print(
'[MatchSetup] \u{110}\u{e3} ch\u{1ecd}n Map m\u{1ee5}c ti\u{ea}u:',ap)end
function ag.SetAutoDifficulty(ap)ag.AutoDifficultyEnabled=ap print(
'[MatchSetup] C\u{1ead}p nh\u{1ead}t Auto Select Difficulty:',ap)if ap and ad.
IsInGame()then ag.StartVotingWatcher()end end function ag.SetDifficulty(ap)ag.
SelectedDifficulty=ap print(
'[MatchSetup] \u{110}\u{e3} ch\u{1ecd}n Difficulty m\u{1ee5}c ti\u{ea}u:',ap)end
function ag.SetVoteDelay(ap)ag.VoteDelay=math.clamp(tonumber(ap)or 0,0,30)end
function ag.GetVoteDelay()return ag.VoteDelay end ad.Register{Name='MatchSetup',
Zone='InGame',OnEnter=function()print
'[MatchSetup] V\u{e0}o In-Game -> Kh\u{1edf}i \u{111}\u{1ed9}ng Match Setup.'ag.
StartVotingWatcher()end,OnLeave=function()print
'[MatchSetup] R\u{1edd}i In-Game -> Reset tr\u{1ea1}ng th\u{e1}i Match Setup.'ag
.StopVotingWatcher()end}ae.Register(function()ag.StopVotingWatcher()end)return
ag end function a.aK()local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak=game:GetService
'ReplicatedStorage',game:GetService'Players',game:GetService'GuiService',game:
GetService'VirtualInputManager',a.load'aB',a.load'ax',a.load'ay',{Enabled=false,
VoteDelay=1,Catalog={{Id='None',Name='No Mutator',DefaultPriority=100,
Description='B\u{ec}nh th\u{1b0}\u{1edd}ng (Kh\u{f4}ng bonus)'},{Id='Brainrot',
Name='Brainrot',DefaultPriority=80,Description=
'Random t\u{1ed1}c \u{111}\u{1ed9} qu\u{e1}i (+20% Rewards)'},{Id='Blackout',
Name='Blackout',DefaultPriority=70,Description=
'T\u{1eaf}t \u{111}\u{e8}n, ch\u{1ec9} s\u{e1}ng m\u{1eaf}t qu\u{e1}i (+25% Rewards)'
},{Id='Gigantism',Name='Gigantism',DefaultPriority=60,Description=
'Qu\u{e1}i x1.5 k\u{ed}ch th\u{1b0}\u{1edb}c & m\u{e1}u (+30% Rewards)'},{Id=
'Speedrun',Name='Speedrun',DefaultPriority=50,Description=
'Qu\u{e1}i ch\u{1ea1}y nhanh +40%'},{Id='ArmoredSlop',Name='Armored Slop',
DefaultPriority=40,Description=
'Qu\u{e1}i x2.5 m\u{e1}u, -20% t\u{1ed1}c \u{111}\u{1ed9}'},{Id='Regeneration',
Name='Regeneration',DefaultPriority=30,Description=
'Qu\u{e1}i h\u{1ed3}i 2% m\u{e1}u m\u{1ed7}i gi\u{e2}y'},{Id='BossRush',Name=
'Boss Rush',DefaultPriority=20,Description=
'Boss x2 m\u{e1}u, qu\u{e1}i th\u{1b0}\u{1edd}ng +25% m\u{e1}u'},{Id='TinySlop',
Name='Tiny Slop',DefaultPriority=10,Description=
'Qu\u{e1}i t\u{ed} hon, +20% t\u{1ed1}c \u{111}\u{1ed9} ch\u{1ea1}y'}},
Priorities={None=100,Brainrot=80,Blackout=70,Gigantism=60,Speedrun=50,
ArmoredSlop=40,Regeneration=30,BossRush=20,TinySlop=10}},false local al,am=
function(al)if not al then return end pcall(function()local am=(firesignal or(
syn and syn.firesignal))if am and al:IsA'GuiButton'then am(al.MouseButton1Click)
am(al.Activated)am(al.MouseButton1Up)end end)pcall(function()if al:IsA
'GuiObject'then local am,an=al.AbsolutePosition,al.AbsoluteSize local ao,ap=am.X
+an.X/2,am.Y+an.Y/2 ad:SendMouseButtonEvent(ao,ap,0,true,game,1)task.wait(0.05)
ad:SendMouseButtonEvent(ao,ap,0,false,game,1)end end)pcall(function()if al:IsA
'GuiButton'then ac.SelectedObject=al task.wait(0.05)ad:SendKeyEvent(true,Enum.
KeyCode.Return,false,game)task.wait(0.05)ad:SendKeyEvent(false,Enum.KeyCode.
Return,false,game)task.wait(0.05)ac.SelectedObject=nil end end)end,function()
local al=aa:FindFirstChild'Events'if not al then return nil end local am=al:
FindFirstChild'SlopMutator'if am and am:IsA'RemoteEvent'then return am end
return nil end local an=function(an)if not ah.Enabled or not ae.IsInGame()then
return end if ai or#an==0 then return end local ao,ap=(-999999)for aq,ar in
ipairs(an)do local as=ar.Id local at=ah.Priorities[as]if at==nil then at=50 end
if at>ao then ao=at ap=ar end end if not ap then ap=an[1]end ai=true task.spawn(
function()if ah.VoteDelay>0 then task.wait(ah.VoteDelay)end if not ah.Enabled or
not ae.IsInGame()then return end local aq=am()if aq then pcall(function()aq:
FireServer('Vote',ap.Id)end)end pcall(function()local ar=ab.LocalPlayer local as
=ar and ar:FindFirstChild'PlayerGui'local at=as and as:FindFirstChild
'SlopMutatorGui'local ay=at and at:FindFirstChild'MutatorVoting'if ay then local
az=ay:FindFirstChild(ap.Id)if az and(az:IsA'GuiButton'or az:IsA'GuiObject')then
al(az)end end end)local ar=ap.Title or ap.Id print(string.format(
'[SlopMutator] \u{110}\u{e3} vote Mutator: %q (%s) v\u{1edb}i \u{111}i\u{1ec3}m \u{1b0}u ti\u{ea}n: %d'
,ap.Id,ar,ao))ag.Notify('Slop Mutator',string.format(
'\u{110}\u{e3} vote: %s (\u{1af}u ti\u{ea}n: %d)',ar,ao),3)end)end local ao,ap=
function()if aj then aj:Disconnect()aj=nil end local ao=am()if not ao then
return end aj=ao.OnClientEvent:Connect(function(ap,aq)if not ah.Enabled or not
ae.IsInGame()then return end if ap=='Vote'and typeof(aq)=='table'then print
'[SlopMutator] Nh\u{1ead}n \u{111}\u{1b0}\u{1ee3}c danh s\u{e1}ch b\u{ec}nh ch\u{1ecd}n Mutator t\u{1eeb} Server...'
an(aq)elseif ap=='Active'then ai=false end end)end,function()if ak then return
end ak=task.spawn(function()while af.IsActive()and ae.IsInGame()do if ah.Enabled
and not ai then local ao=ab.LocalPlayer local ap=ao and ao:FindFirstChild
'PlayerGui'local aq=ap and ap:FindFirstChild'SlopMutatorGui'local ar=aq and aq:
FindFirstChild'MutatorVoting'if ar and ar:IsA'GuiObject'and ar.Visible then
local as={}for at,ay in ipairs(ar:GetChildren())do if ay:IsA'GuiButton'and ay.
Visible then table.insert(as,{Id=ay.Name,Title=ay.Name})end end if#as>0 then
print
'[SlopMutator] Ph\u{e1}t hi\u{1ec7}n b\u{1ea3}ng MutatorVoting tr\u{ea}n GUI, chu\u{1ea9}n b\u{1ecb} vote...'
an(as)end end end task.wait(0.5)end ak=nil end)end function ah.SetEnabled(aq)ah.
Enabled=aq print('[SlopMutator] C\u{1ead}p nh\u{1ead}t Auto Slop Mutator:',aq)if
aq and ae.IsInGame()then ao()ap()end end function ah.SetVoteDelay(aq)ah.
VoteDelay=math.clamp(tonumber(aq)or 0,0,10)end function ah.GetVoteDelay()return
ah.VoteDelay end function ah.SetPriority(aq,ar)ah.Priorities[aq]=math.clamp(
tonumber(ar)or 0,0,100)end function ah.GetPriority(aq)return ah.Priorities[aq]or
50 end function ah.Reset()ai=false if aj then aj:Disconnect()aj=nil end ak=nil
end ae.Register{Name='SlopMutator',Zone='InGame',OnEnter=function()ai=false if
ah.Enabled then ao()ap()end end,OnLeave=function()ah.Reset()end}af.Register(
function()ah.Reset()end)return ah end function a.aL()local aa,ab,ac,ad=a.load
'aI',a.load'aJ',a.load'aK',a.load'az'return function(ae,af)local ag=af:Section{
Side='Left'}ag:Header{Name='Auto Joiner'}ag:Toggle({Name='Game Joiner',Default=
aa.Enabled,Callback=ad.Wrap(function(ah)aa.SetEnabled(ah)end)},
'Toggle_GameJoiner')ag:Dropdown({Name='Game Mode',Options={'Normal','Raid'},
Default=aa.Mode,Required=true,Callback=ad.Wrap(function(ah)aa.SetMode(ah)end)},
'Dropdown_GameMode')ag:Slider({Name='Start Delay (s)',Default=aa.GetStartDelay()
,Minimum=0,Maximum=10,DisplayMethod='Round',Precision=0,Callback=ad.Wrap(
function(ah)aa.SetStartDelay(ah)end)},'Slider_ElevatorStartDelay')ag:Header{Name
='Match Setup'}local ah ag:Toggle({Name='Auto Pick Map',Default=ab.
AutoPickMapEnabled,Callback=ad.Wrap(function(ai)ab.SetAutoPickMap(ai)end)},
'Toggle_AutoPickMap')ag:Dropdown({Name='Select Universe',Options=ab.Universes,
Default=ab.SelectedUniverse,Required=true,Callback=ad.Wrap(function(ai)if not ai
or#ai==0 then return end ab.SetUniverse(ai)if ah then local aj=ab.
GetMapsForUniverse(ai)pcall(function()ah:ClearOptions()ah:InsertOptions(aj)local
ak=ab.SelectedMap if not table.find(aj,ak)then ak=aj[1]or''end ab.SetMap(ak)ah:
UpdateSelection(ak)end)end end)},'Dropdown_SelectUniverse')local ai=ab.
GetMapsForUniverse(ab.SelectedUniverse)ah=ag:Dropdown({Name='Select Map',Options
=ai,Default=ab.SelectedMap,Required=true,Callback=ad.Wrap(function(aj)if not aj
or#aj==0 then return end if table.find(ab.Universes,aj)then ab.SetUniverse(aj)
local ak=ab.GetMapsForUniverse(aj)if ah then pcall(function()ah:ClearOptions()ah
:InsertOptions(ak)local al=ak[1]or''ab.SetMap(al)ah:UpdateSelection(al)end)end
return end ab.SetMap(aj)end)},'Dropdown_SelectMap')if ah and type(ah.
UpdateSelection)=='function'then local aj=ah.UpdateSelection ah.UpdateSelection=
function(ak,al)if type(al)=='string'and al~=''and not ak:IsOption(al)then pcall(
function()ak:InsertOptions{al}end)end aj(ak,al)end end ag:Toggle({Name=
'Auto Select Difficulty',Default=ab.AutoDifficultyEnabled,Callback=ad.Wrap(
function(aj)ab.SetAutoDifficulty(aj)end)},'Toggle_AutoDifficulty')ag:Dropdown({
Name='Difficulty',Options=ab.Difficulties,Default=ab.SelectedDifficulty,Required
=true,Callback=ad.Wrap(function(aj)if aj and#aj>0 then ab.SetDifficulty(aj)end
end)},'Dropdown_Difficulty')ag:Slider({Name='Vote Delay (s)',Default=ab.
GetVoteDelay(),Minimum=0,Maximum=10,DisplayMethod='Round',Precision=0,Callback=
ad.Wrap(function(aj)ab.SetVoteDelay(aj)end)},'Slider_VoteDelay')local aj=af:
Section{Side='Right'}aj:Header{Name='Auto Slop Mutator'}aj:Toggle({Name=
'Auto Slop Mutator',Default=ac.Enabled,Callback=ad.Wrap(function(ak)ac.
SetEnabled(ak)end)},'Toggle_AutoSlopMutator')aj:Slider({Name='Vote Delay (s)',
Default=ac.GetVoteDelay(),Minimum=0,Maximum=5,DisplayMethod='Round',Precision=0,
Callback=ad.Wrap(function(ak)ac.SetVoteDelay(ak)end)},'Slider_MutatorVoteDelay')
aj:Header{Name='Mutator Priority (100 = Cao nh\u{1ea5}t)'}for ak,al in ipairs(ac
.Catalog)do aj:Slider({Name=al.Name,Default=al.DefaultPriority,Minimum=0,Maximum
=100,DisplayMethod='Round',Precision=0,Callback=ad.Wrap(function(am)ac.
SetPriority(al.Id,am)end)},'Slider_Mutator_'..al.Id)end end end function a.aM()
local aa,ab,ac,ad,ae,af,ag,ah=a.load'aD',a.load'aE',a.load'aC',a.load'ay',a.load
'ax',game:GetService'Players',game:GetService'ReplicatedStorage',{}ah.
InitialSpeed=1 local ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at=false,{},0,{},{},{}
local ay,az,aA=function()if not ap or not aq or not ar or not as or not at then
local ay=ag:FindFirstChild'Functions'if ay then ap=(ay:FindFirstChild
'SpawnTower')aq=(ay:FindFirstChild'SellTower')ar=(ay:FindFirstChild
'UpgradeTower')as=(ay:FindFirstChild'ChangeTowerMode')at=(ay:FindFirstChild
'ChangeSpeed')end end return ap,aq,ar,as,at end,function()local ay=af.
LocalPlayer local az=ay and ay:FindFirstChild'PlayerGui'local aA=az and az:
FindFirstChild'GameGui'if not aA then return 1 end local aJ=aA:FindFirstChild
'SpeedUp'local aK=aJ and aJ:FindFirstChild'Message'if aK and aK:IsA'TextLabel'
then local aL=tonumber(aK.Text:match'%d+')if aL and aL>=1 and aL<=5 then return
aL end end local aL=aA:FindFirstChild('SpeedUp',true)if aL then local aM=aL:
FindFirstChild'Message'if aM and aM:IsA'TextLabel'then local aN=tonumber(aM.Text
:match'%d+')if aN and aN>=1 and aN<=5 then return aN end end end return 1 end,
function(ay,az,aA)aA=aA or 3.5 local aJ,aK,aL=aA,{workspace:FindFirstChild
'Towers',workspace:FindFirstChild'PlacedTowers',workspace:FindFirstChild'Units',
workspace}for aM,aN in ipairs(aK)do if aN then for aO,aP in ipairs(aN:
GetChildren())do if aP:IsA'Model'then local aQ if aP.PrimaryPart then aQ=aP.
PrimaryPart.Position else pcall(function()aQ=aP:GetPivot().Position end)end if
aQ then local aS=(aQ-az).Magnitude if aS<aJ then if not ay or aP.Name:lower():
find(ay:lower())then aJ=aS aL=aP end end end end end end if aL then break end
end return aL end function ah.AddStep(aJ,aK)if not ai then return end local aL,
aM=ac.GetWave()local aN,aO,aP=ac.GetElapsedTime(),ac.GetCash(),#aj+1 local aQ={
Index=aP,Type=aJ,TowerId=aK.TowerId or('T'..tostring(aP)),TowerName=aK.TowerName
or'Unknown',CFrame=aK.CFrame,Position=aK.Position,Arg3=aK.Arg3,Arg4=aK.Arg4,Arg5
=aK.Arg5,Wave=aL,Time=aN,Cost=aK.Cost or aO,TargetMode=aK.TargetMode,RawData=aK.
RawData}table.insert(aj,aQ)if aJ=='Place'then ad.Notify('Macro Record',string.
format('Recorded Place: %s (%s) [%.2fs]',aQ.TowerName,aQ.TowerId,aQ.Time),1.5)
elseif aJ=='Sell'then ad.Notify('Macro Record',string.format(
'Recorded Sell: %s (%s) [%.2fs]',aQ.TowerName,aQ.TowerId,aQ.Time),1.5)elseif aJ
=='Upgrade'then ad.Notify('Macro Record',string.format(
'Recorded Upgrade: %s (%s) [%.2fs]',aQ.TowerName,aQ.TowerId,aQ.Time),1.5)elseif
aJ=='Target'then ad.Notify('Macro Record',string.format(
'Recorded Target: %s (%s) [%.2fs]',aQ.TowerName,aQ.TowerId,aQ.Time),1.5)end end
local aJ,aK,aL,aM,aN,aO,aP=function(aJ)local aK,aL=pcall(function()local aK,aL,
aM=type(aJ[1])=='string'and aJ[1]or'Unknown',typeof(aJ[2])=='CFrame'and aJ[2]or
nil if aL then aM=aL.Position elseif typeof(aJ[2])=='Vector3'then aM=aJ[2]aL=
CFrame.new(aM)end local aN,aO,aP,aQ,aS=aJ[3]==true,type(aJ[4])=='string'and aJ[4
]or nil,type(aJ[5])=='table'and aJ[5]or nil,aL and{aL:GetComponents()}or nil,aM
and{aM.X,aM.Y,aM.Z}or nil ak+=1 local aT='T'..tostring(ak)if aM then an[aT]={
TowerName=aK,Position=aM}end ah.AddStep('Place',{TowerId=aT,TowerName=aK,CFrame=
aQ,Position=aS,Arg3=aN,Arg4=aO,Arg5=aP,RawData={Arg1=aJ[1],Arg2=tostring(aJ[2]),
Arg3=aJ[3],Arg4=aJ[4],Arg5=aJ[5]}})if aM then task.spawn(function()for aU=1,15
do task.wait(0.2)if not ai then break end local aV=aA(aK,aM)if aV then al[aV]=aT
am[aT]=aV break end end end)end end)if not aK then warn(
'[Recorder] L\u{1ed7}i ghi nh\u{1ead}n SpawnTower:',tostring(aL))end end,
function(aJ)local aK,aL=pcall(function()local aK,aL,aM,aN=typeof(aJ[1])==
'Instance'and aJ[1]or nil,'Unknown'if aK then aL=aK.Name if al[aK]then aM=al[aK]
else pcall(function()aN=aK:GetPivot().Position end)if not aN and aK:IsA'Model'
and aK.PrimaryPart then aN=aK.PrimaryPart.Position end if aN then local aO=5 for
aP,aQ in pairs(an)do local aS=(aQ.Position-aN).Magnitude if aS<aO then aO=aS aM=
aP aL=aQ.TowerName end end end end end if not aM then aM='T_Sold_'..tostring(#aj
+1)end local aO if aM and an[aM]then local aP=an[aM].Position aO={aP.X,aP.Y,aP.Z
}elseif aN then aO={aN.X,aN.Y,aN.Z}end ah.AddStep('Sell',{TowerId=aM,TowerName=
aL,Position=aO,RawData={InstanceName=aK and aK.Name}})if aK then al[aK]=nil end
if aM then am[aM]=nil an[aM]=nil end end)if not aK then warn(
'[Recorder] L\u{1ed7}i ghi nh\u{1ead}n SellTower:',tostring(aL))end end,function
(aJ)local aK,aL=pcall(function()local aK,aL,aM,aN,aO=typeof(aJ[1])=='Instance'
and aJ[1]or nil,type(aJ[2])=='string'and aJ[2]or nil,'Unknown'if aK then aM=aK.
Name if al[aK]then aN=al[aK]else pcall(function()aO=aK:GetPivot().Position end)
if not aO and aK:IsA'Model'and aK.PrimaryPart then aO=aK.PrimaryPart.Position
end if aO then local aP=5 for aQ,aS in pairs(an)do local aT=(aS.Position-aO).
Magnitude if aT<aP then aP=aT aN=aQ aM=aS.TowerName end end end end end if not
aN then aN='T_Upgraded_'..tostring(#aj+1)end local aP if aN and an[aN]then local
aQ=an[aN].Position aP={aQ.X,aQ.Y,aQ.Z}elseif aO then aP={aO.X,aO.Y,aO.Z}end ah.
AddStep('Upgrade',{TowerId=aN,TowerName=aM,Arg4=aL,Position=aP,RawData={
InstanceName=aK and aK.Name,Variant=aL}})end)if not aK then warn(
'[Recorder] L\u{1ed7}i ghi nh\u{1ead}n UpgradeTower:',tostring(aL))end end,
function(aJ)local aK,aL=pcall(function()local aK,aL,aM,aN=typeof(aJ[1])==
'Instance'and aJ[1]or nil,'Unknown'if aK then aL=aK.Name if al[aK]then aM=al[aK]
else pcall(function()aN=aK:GetPivot().Position end)if not aN and aK:IsA'Model'
and aK.PrimaryPart then aN=aK.PrimaryPart.Position end if aN then local aO=5 for
aP,aQ in pairs(an)do local aS=(aQ.Position-aN).Magnitude if aS<aO then aO=aS aM=
aP aL=aQ.TowerName end end end end end if not aM then aM='T_Target_'..tostring(#
aj+1)end local aO if aM and an[aM]then local aP=an[aM].Position aO={aP.X,aP.Y,aP
.Z}elseif aN then aO={aN.X,aN.Y,aN.Z}end local aP if aK then pcall(function()aP=
aK:GetAttribute'TargetMode'or aK:GetAttribute'Target'or aK:GetAttribute'Mode'end
)end ah.AddStep('Target',{TowerId=aM,TowerName=aL,TargetMode=aP,Position=aO,
RawData={InstanceName=aK and aK.Name,TargetMode=aP}})end)if not aK then warn(
'[Recorder] L\u{1ed7}i ghi nh\u{1ead}n ChangeTowerMode:',tostring(aL))end end,
function(aJ)local aK,aL=pcall(function()local aK=aJ[1]local aL=tonumber(aK)if
not aL then return end if#aj>0 then local aM=aj[#aj]if aM.Type=='Speed'and aM.
Speed==aL then return end end ah.AddStep('Speed',{TowerId='SPEED',TowerName=
'GameSpeed',Speed=aL,Cost=0,RawData={Speed=aL}})ad.Notify('Macro Recorder',
string.format('Ghi nh\u{1ead}n \u{111}\u{1ed5}i t\u{1ed1}c \u{111}\u{1ed9}: x%d'
,aL),1.5)end)if not aK then warn(
'[Recorder] L\u{1ed7}i ghi nh\u{1ead}n ChangeSpeed:',tostring(aL))end end,false
local aQ=function()if aO then return end ay()local aQ,aS=newcclosure or function
(aQ)return aQ end,setnamecallmethod or function(...)end if hookmetamethod then
aO=true aP=hookmetamethod(game,'__namecall',aQ(function(aT,...)local aU=
getnamecallmethod and getnamecallmethod()if ai and typeof(aT)=='Instance'and aU
=='InvokeServer'then local aV pcall(function()aV=aT.Name end)if aV=='SpawnTower'
or(ap and aT==ap)then if not ap then ap=aT end local aW={...}task.spawn(aJ,aW)
elseif aV=='SellTower'or(aq and aT==aq)then if not aq then aq=aT end local aW={
...}task.spawn(aK,aW)elseif aV=='UpgradeTower'or(ar and aT==ar)then if not ar
then ar=aT end local aW={...}task.spawn(aL,aW)elseif aV=='ChangeTowerMode'or(as
and aT==as)then if not as then as=aT end local aW={...}task.spawn(aM,aW)elseif
aV=='ChangeSpeed'or(at and aT==at)then if not at then at=aT end local aW={...}
task.spawn(aN,aW)end end if aS and aU then aS(aU)end return aP(aT,...)end))
elseif hookfunction and ap and aq then aO=true local aT aT=hookfunction(ap.
InvokeServer,aQ(function(aU,...)if ai then local aV={...}task.spawn(aJ,aV)end
return aT(aU,...)end))local aU aU=hookfunction(aq.InvokeServer,aQ(function(aV,
...)if ai then local aW={...}task.spawn(aK,aW)end return aU(aV,...)end))if ar
then local aV aV=hookfunction(ar.InvokeServer,aQ(function(aW,...)if ai then
local aX={...}task.spawn(aL,aX)end return aV(aW,...)end))end if as then local aV
aV=hookfunction(as.InvokeServer,aQ(function(aW,...)if ai then local aX={...}task
.spawn(aM,aX)end return aV(aW,...)end))end if at then local aV aV=hookfunction(
at.InvokeServer,aQ(function(aW,...)if ai then local aX={...}task.spawn(aN,aX)end
return aV(aW,...)end))end else warn
'[Recorder] Executor kh\u{f4}ng h\u{1ed7} tr\u{1ee3} hookmetamethod ho\u{1eb7}c hookfunction!'
end end function ah.IsRecording()return ai end function ah.GetActiveMacro()
return ao end function ah.SetActiveMacro(aS)ao=aS end function ah.GetSteps()
return aj end function ah.ClearSteps()table.clear(aj)table.clear(al)table.clear(
am)table.clear(an)ak=0 end function ah.StartRecording(aS)local aT=aS or ao if
not aT or aT==''or aT=='None'then ad.Notify('Macro',
'Vui l\u{f2}ng ch\u{1ecd}n ho\u{1eb7}c t\u{1ea1}o Macro tr\u{1b0}\u{1edb}c!',2)
return false end ao=aT ah.ClearSteps()ah.InitialSpeed=az()ai=true aQ()ad.Notify(
'Macro',string.format(
'B\u{1eaf}t \u{111}\u{1ea7}u Record: %s (Speed ban \u{111}\u{1ea7}u: x%d)',aT,ah
.InitialSpeed),2)return true end function ah.StopRecording()if not ai then
return 0 end ai=false local aS=#aj if ao and aS>0 then local aT=ab.GetMacro(ao)
or ab.CreateMacro(ao)aT.Steps=aj aT.Metadata.TotalSteps=aS aT.Metadata.
TotalDuration=ac.GetElapsedTime()aT.Metadata.InitialSpeed=ah.InitialSpeed or 1
ab.SaveMacro(ao,aT)ad.Notify('Macro',string.format(
"\u{110}\u{e3} l\u{1b0}u %d b\u{1b0}\u{1edb}c v\u{e0}o '%s' (Speed x%d)!",aS,ao,
aT.Metadata.InitialSpeed or 1),2.5)else ad.Notify('Macro',
'\u{110}\u{e3} d\u{1eeb}ng Record (0 b\u{1b0}\u{1edb}c)',2)end return aS end ae.
Register(function()if ai then ah.StopRecording()end end)return ah end function a
.aN()local aa,ab,ac,ad,ae,af,ag,ah=a.load'aC',a.load'aB',a.load'aE',a.load'aM',a
.load'aF',a.load'az',a.load'ay',a.load'ax'return function(ai,aj)local ak=aj:
Section{Side='Left'}ak:Header{Name='Match Status'}local al,am,an,ao,ap=ak:Label{
Text=
"\u{23f1}\u{fe0f} <b>Timer:</b> <font color='rgb(255,220,100)'>00:00</font>"},ak
:Label{Text="\u{1f4b0} <b>Cash:</b> <font color='rgb(85,255,120)'>$0</font>"},ak
:Label{Text=
"\u{2764}\u{fe0f} <b>Base HP:</b> <font color='rgb(255,100,100)'>100/100</font>"
},ak:Label{Text=
"\u{1f30a} <b>Wave:</b> <font color='rgb(100,200,255)'>0/0</font>"},ak:Label{
Text="\u{1f4e2} <b>Status:</b> <font color='rgb(180,180,180)'>Ready</font>"}
local aq=function(aq)if not ab.IsInGame()then al:UpdateName
"\u{23f1}\u{fe0f} <b>Timer:</b> <font color='rgb(150,150,150)'>In Lobby</font>"
am:UpdateName
"\u{1f4b0} <b>Cash:</b> <font color='rgb(150,150,150)'>In Lobby</font>"an:
UpdateName
"\u{2764}\u{fe0f} <b>Base HP:</b> <font color='rgb(150,150,150)'>In Lobby</font>"
ao:UpdateName
"\u{1f30a} <b>Wave:</b> <font color='rgb(150,150,150)'>In Lobby</font>"ap:
UpdateName
"\u{1f4e2} <b>Status:</b> <font color='rgb(150,150,150)'>Waiting for match...</font>"
return end local ar,as=aq.IsMatchActive and'rgb(255,220,100)'or
'rgb(150,220,255)',aq.IsMatchActive and''or' (Ended)'al:UpdateName(string.
format("\u{23f1}\u{fe0f} <b>Timer:</b> <font color='%s'>%s%s</font>",ar,aq.
ElapsedTimeFormatted,as))am:UpdateName(string.format(
"\u{1f4b0} <b>Cash:</b> <font color='rgb(85,255,120)'>%s</font>",aq.
CashFormatted))an:UpdateName(string.format(
"\u{2764}\u{fe0f} <b>Base HP:</b> <font color='rgb(255,100,100)'>%s</font>",aq.
BaseHealthFormatted))ao:UpdateName(string.format(
"\u{1f30a} <b>Wave:</b> <font color='rgb(100,200,255)'>Wave %s</font>",aq.
WaveFormatted))local at=(aq.Message and aq.Message~='')and aq.Message or(aq.
IsMatchActive and'Match in progress'or'Finished')ap:UpdateName(string.format(
"\u{1f4e2} <b>Status:</b> <font color='rgb(200,200,200)'>%s</font>",at))end
local ar=aa.Subscribe(aq)ah.Register(ar)local as=aj:Section{Side='Left'}as:
Header{Name='Macro Player'}local at,ay,az,aA,aJ=as:Label{Text=
"\u{1f4c1} <b>Macro:</b> <font color='rgb(100,200,255)'>None</font>"},as:Label{
Text=
"\u{25b6}\u{fe0f} <b>Status:</b> <font color='rgb(180,180,180)'>Idle</font>"},as
:Label{Text="\u{1f4cb} <b>Step:</b> <font color='rgb(150,150,150)'>0 / 0</font>"
},as:Label{Text=
"\u{1f3af} <b>Next Action:</b> <font color='rgb(150,150,150)'>None</font>"},
false as:Toggle({Name='Play Macro',Default=ae.IsEnabled(),Callback=af.Wrap(
function(aK)if aJ then return end if aK then if ad.IsRecording()then aJ=true
pcall(function()playToggle:UpdateState(false,true)end)aJ=false ag.Notify('Macro'
,'Vui l\u{f2}ng t\u{1eaf}t Record Macro tr\u{1b0}\u{1edb}c khi Play!',2)return
end local aL=ae.GetActiveMacro()or ad.GetActiveMacro()if not aL or aL==''or aL==
'None'then aJ=true pcall(function()playToggle:UpdateState(false,true)end)aJ=
false ag.Notify('Macro',
'Vui l\u{f2}ng ch\u{1ecd}n ho\u{1eb7}c t\u{1ea1}o Macro tr\u{1b0}\u{1edb}c khi Play!'
,2)return end local aM=ac.GetMacro(aL)if not aM or not aM.Steps or#aM.Steps==0
then aJ=true pcall(function()playToggle:UpdateState(false,true)end)aJ=false ag.
Notify('Macro',string.format(
"Macro '%s' ch\u{1b0}a c\u{f3} b\u{1b0}\u{1edb}c n\u{e0}o \u{111}\u{1ec3} ch\u{1ea1}y!"
,aL),2.5)return end ae.SetActiveMacro(aL)ae.SetEnabled(true)else ae.SetEnabled(
false)end end)},'Toggle_PlayMacro')as:Toggle({Name='Apply Macro Speed',Default=
ae.IsSpeedSyncEnabled(),Callback=af.Wrap(function(aK)ae.SetSpeedSync(aK)end)},
'Toggle_ApplyMacroSpeed')as:Dropdown({Name='Timing Mode',Options={'Hybrid',
'Timer','Wave & Cash','Cash (Timed Sell)'},Default=ae.GetTimingMode(),Required=
true,Callback=af.Wrap(function(aK)if not aK or aK==''then return end ae.
SetTimingMode(aK)end)},'Dropdown_MacroTimingMode')as:Slider({Name=
'Step Delay (s)',Minimum=0,Maximum=2,Default=ae.GetStepDelay(),Precision=2,
DisplayMethod='Value',Callback=af.Wrap(function(aK)ae.SetStepDelay(aK)end)},
'Slider_MacroStepDelay')as:Button{Name='Restart Playback',Callback=function()if
not ae.IsEnabled()then ag.Notify('Macro Player',
"Vui l\u{f2}ng b\u{1ead}t 'Play Macro' tr\u{1b0}\u{1edb}c khi Restart!",2)return
end ae.Restart()ag.Notify('Macro Player',
'\u{110}ang kh\u{1edf}i \u{111}\u{1ed9}ng l\u{1ea1}i ti\u{1ebf}n tr\u{ec}nh Macro...'
,1.5)end}local aK=function(aK)local aL,aM=aK.MacroName or'None',aK.TotalSteps if
aM==0 and aL~='None'then local aN=ac.GetMacro(aL)if aN and aN.Steps then aM=#aN.
Steps end end at:UpdateName(string.format(
"\u{1f4c1} <b>Macro:</b> <font color='rgb(100,200,255)'>%s</font> <font color='rgb(150,150,150)'>(%d steps)</font>"
,aL,aM))local aN=aK.IsPlaying and'rgb(85,255,120)'or(aK.IsEnabled and
'rgb(255,220,100)'or'rgb(180,180,180)')ay:UpdateName(string.format(
"\u{25b6}\u{fe0f} <b>Status:</b> <font color='%s'>%s</font>",aN,aK.StatusText))
az:UpdateName(string.format(
"\u{1f4cb} <b>Step:</b> <font color='rgb(200,200,255)'>%d / %d</font>",aK.
CurrentStep,aM))aA:UpdateName(string.format(
"\u{1f3af} <b>Next Action:</b> <font color='rgb(220,220,220)'>%s</font>",aK.
NextAction or'None'))end local aL=ae.Subscribe(aK)ah.Register(aL)local aM=aj:
Section{Side='Right'}aM:Header{Name='Macro Recorder'}local aN,aO,aP=''local aQ=
aM:Input({Name='Macro Name',Placeholder='Enter macro name...',AcceptedCharacters
='AlphaNumeric',Callback=af.Wrap(function(aQ)aN=aQ or''end)},'Input_MacroName')
aM:Button{Name='Create Macro',Callback=function()local aS=aN if not aS or aS==''
then if aQ and type(aQ.GetInput)=='function'then aS=aQ:GetInput()end end local
aT=(aS or''):gsub('^%s+',''):gsub('%s+$','')if#aT==0 then ag.Notify('Macro',
'T\u{ea}n Macro kh\u{f4}ng \u{111}\u{1b0}\u{1ee3}c \u{111}\u{1ec3} tr\u{1ed1}ng!'
,2)return end ac.CreateMacro(aT)ad.SetActiveMacro(aT)ae.SetActiveMacro(aT)if aO
then pcall(function()local aU=aO:GetOptions()or{}if not table.find(aU,aT)then aO
:InsertOptions{aT}end aO:UpdateSelection(aT)end)end ag.Notify('Macro',
'\u{110}\u{e3} t\u{1ea1}o Macro: '..aT,2)end}local aS=ac.ListMacros()if#aS==0
then aS={'None'}end local aT=aS[1]or'None'if aT~='None'then ad.SetActiveMacro(aT
)ae.SetActiveMacro(aT)end aO=aM:Dropdown({Name='Select Macro',Options=aS,Default
=aT,Required=true,Callback=af.Wrap(function(aU)if not aU or aU==''or aU=='None'
then return end ad.SetActiveMacro(aU)ae.SetActiveMacro(aU)end)},
'Dropdown_SelectMacro')local aU=false aP=aM:Toggle({Name='Record Macro',Default=
ad.IsRecording(),Callback=af.Wrap(function(aV)if aU then return end if aV then
if ae.IsEnabled()then aU=true pcall(function()aP:UpdateState(false,true)end)aU=
false ag.Notify('Macro',
'Vui l\u{f2}ng t\u{1eaf}t Play Macro tr\u{1b0}\u{1edb}c khi Record!',2)return
end local aW=ad.GetActiveMacro()if not aW or aW==''or aW=='None'then aU=true
pcall(function()aP:UpdateState(false,true)end)aU=false ag.Notify('Macro',
'Vui l\u{f2}ng ch\u{1ecd}n ho\u{1eb7}c t\u{1ea1}o Macro tr\u{1b0}\u{1edb}c khi Record!'
,2)return end local aX=ad.StartRecording(aW)if not aX then aU=true pcall(
function()aP:UpdateState(false,true)end)aU=false end else ad.StopRecording()
local aW=ad.GetActiveMacro()if aW then ae.SetActiveMacro(aW)end end end)},
'Toggle_RecordMacro')end end function a.aO()return function(aa,ab)ab:
InsertConfigSection'Left'end end function a.aP()return function(aa)pcall(
function()local ab=setthreadidentity or set_thread_identity or setidentity or(
syn and syn.set_thread_identity)if ab then local ac=pcall(ab,7)if not ac then
pcall(ab,8)end end end)local ab,ac=game:GetService'Players',os.clock()+15 while
not ab.LocalPlayer do if os.clock()>ac then break end task.wait(0.1)end local ad
=ab.LocalPlayer if not ad then return warn
[[[SlopTowerDefense] Failed to retrieve LocalPlayer, aborting initialization.]]
end local ae,af,ag,ah=a.load'a',a.load'ax',a.load'az',a.load'ay'ag.Suspend()
local ai=ae:Window{Title='Slop Tower Defense',Subtitle='EsclipseHub',Size=UDim2.
fromOffset(920,560),SidebarWidth=240,DragStyle=1,DisabledWindowControls={},
ShowUserInfo=true,Keybind=Enum.KeyCode.RightControl,AcrylicBlur=false}ah:
SetWindow(ai)_G.ScriptHub_UI=ai _G.ScriptHub_Cleanup=function()af.Cleanup()end
ai.onUnloaded(function()af.Cleanup()if _G.ScriptHub_UI==ai then _G.ScriptHub_UI=
nil end end)ae:SetFolder'EsclipseHub/SlopTowerDefense'local aj=ai:TabGroup()
local ak,al,am,an,ao={Main=aj:Tab{Name='Main',Image='rbxassetid://10734886202'},
Game=aj:Tab{Name='Game',Image='rbxassetid://10734975692'},Macro=aj:Tab{Name=
'Macro',Image='rbxassetid://10734950309'},Config=aj:Tab{Name='Config',Image=
'rbxassetid://10709769841'}},a.load'aH',a.load'aL',a.load'aN',a.load'aO'al(ai,ak
.Main)am(ai,ak.Game)an(ai,ak.Macro)ao(ai,ak.Config)ak.Main:Select()pcall(
function()ae:LoadAutoLoadConfig()end)ag.Resume()print
'[SlopTowerDefense] Initialized successfully.'end end function a.aQ()local aa={}
function aa:Export()local ab={}for ac,ad in pairs(self)do if typeof(ad)==
'Instance'or type(ad)=='table'then local ae,af=pcall(function()end)if ae and af
~=nil then ab[ac]=af end end end return ab end function aa:Import(ab)for ac,ad
in pairs(ab)do local ae=self[ac]if ae and ae.Value~=nil then local af=pcall(
function()end)if not af then warn(`Failed to import value for flag "{ac}"`)end
end end end function aa:Reset()for ab in pairs(self)do self[ab]=nil end end
return aa end function a.aR()local aa,ab=a.load'ad',{}function ab:Window(ac)ac=
ac or{}print'Made a window'local ad=aa.Wrap(ac,{Visible=function(ad)print(
'Set window visibility to:',ad)end})return aa.Apply(ac,ad)end return ab end
function a.aS()local aa,ab=a.load'ad',{}return(aa.Wrap(ab,{Enabled=function(ac)
print(`{ac and'Enabled'or'Disabled'} ESP.`)end}))end function a.aT()local aa,ab,
ac=a.load'aQ',a.load'aR',a.load'aS'local ad=ab:Window{Visible=true}return{Flags=
aa,Esp=ac,Interface=ab,Window=ad,Tabs={Home=function(ae)end,Visuals=function(ae)
end,Settings=function(ae)end,Config=function(ae)end}}end function a.aU()local aa
={}function aa.GetPlayer()local ab,ac=pcall(function()return game:GetService
'Players'end)return ab and(ac).LocalPlayer end function aa.GetCharacter(ab)local
ac,ad=pcall(function()return ab and ab.Character end)return ac and ad end
function aa.GetHumanoid(ab)local ac,ad=pcall(function()local ac=aa.GetCharacter(
ab)return ac and ac:FindFirstChildOfClass'Humanoid'end)return ac and ad end
return aa end function a.aV()local aa=function(aa)return game:GetService(aa)end
return{Players=(aa'Players')}end function a.aW()return function(aa)local ab,ac,
ad=a.load'aT',a.load'aU',a.load'aV'local ae,af,ag,ah,ai,aj,ak=ab.Flags,ab.Esp,ab
.Interface,ab.Window,ab.Tabs,ac.GetPlayer(),ad.Players do ai.Home(aa)end do
local al=ah:Tab{Name='Exploits'}al:Toggle{Name='Flight'}end do ai.Visuals(aa)end
do local al=ai.Settings(aa)al:Toggle{Name='Dark Mode'}end do ai.Config(aa)end ah
.Title=aa.Name end end end local aa=_G.ScriptHub_Cleanup if typeof(aa)==
'function'then pcall(aa)end _G.ScriptHub_Cleanup=nil local ab=_G.ScriptHub_UI if
typeof(ab)=='table'and typeof(ab.Unload)=='function'then pcall(ab.Unload,ab)end
_G.ScriptHub_UI=nil local ac={{Name='DungeonQuest',Load=a.load'aw',UniverseId=
9931749389,Places={77649408247578,3220968688,2414851778}},{Name=
'SlopTowerDefense',Load=a.load'aP',UniverseId=10529769390,Places={
134459712190924,85247278545351,119785202494667}},{Name='Game 2',Load=a.load'aW',
Places={123456789,987654321}}}for ad=1,300 do if game.GameId~=0 and game.PlaceId
~=0 then break end task.wait(0.1)end for ad,ae in pairs(ac)do if ae.Places then
for af,ag in ipairs(ae.Places)do if ag==game.PlaceId then return ae:Load()end
end end if ae.UniverseId and ae.UniverseId==game.GameId then return ae:Load()end
end