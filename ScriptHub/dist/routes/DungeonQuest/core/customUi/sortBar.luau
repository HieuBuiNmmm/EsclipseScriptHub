local a=function(a)local b=Instance.new'Frame'b.Name='sortBarFrame'b.Size=UDim2.
new(0,50,0,0)b.AutomaticSize=Enum.AutomaticSize.Y b.AnchorPoint=Vector2.new(0,1)
b.Position=UDim2.new(1,30,1,15)b.BackgroundColor3=Color3.fromRGB(18,20,26)b.
BackgroundTransparency=0.15 b.BorderSizePixel=0 b.LayoutOrder=0 b.ZIndex=2 b.
Visible=true b.Parent=a local c=Instance.new'UICorner'c.CornerRadius=UDim.new(0,
8)c.Parent=b local d=Instance.new'UIStroke'd.Name='DockStroke'd.Thickness=1.2 d.
Color=Color3.fromRGB(65,72,90)d.Transparency=0.3 d.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border d.Parent=b local e=Instance.new'UIPadding'e.PaddingTop=
UDim.new(0,5)e.PaddingBottom=UDim.new(0,5)e.PaddingLeft=UDim.new(0,5)e.
PaddingRight=UDim.new(0,5)e.Parent=b local f=Instance.new'UIScale'f.Name=
'SortBarUIScale'f.Scale=0.75 f.Parent=b local g=Instance.new'UIListLayout'g.Name
='UIListLayout'g.Padding=UDim.new(0,6)g.FillDirection=Enum.FillDirection.
Vertical g.HorizontalAlignment=Enum.HorizontalAlignment.Center g.
VerticalAlignment=Enum.VerticalAlignment.Top g.SortOrder=Enum.SortOrder.
LayoutOrder g.Parent=b local h=function(h,i,j,k)local l=Instance.new
'ImageButton'l.Name=h l.Size=UDim2.new(0,40,0,40)l.Position=UDim2.new(0,0,0,0)l.
AnchorPoint=Vector2.new(0,0)l.BackgroundColor3=Color3.fromRGB(25,28,36)l.
BackgroundTransparency=0.65 l.BorderSizePixel=0 l.LayoutOrder=i l.ZIndex=2 l.
Visible=true l.Image=''l.AutoButtonColor=false l.Parent=b local m=Instance.new
'UICorner'm.CornerRadius=UDim.new(0,6)m.Parent=l local n=Instance.new'UIStroke'n
.Thickness=1.2 n.ApplyStrokeMode=Enum.ApplyStrokeMode.Border n.Transparency=0.85
n.Color=Color3.fromRGB(60,66,82)n.Parent=l local o=Instance.new'UIPadding'o.
PaddingTop=UDim.new(0,7)o.PaddingBottom=UDim.new(0,7)o.PaddingLeft=UDim.new(0,7)
o.PaddingRight=UDim.new(0,7)o.Parent=l local p=Instance.new'ImageLabel'p.Name=j
p.Size=UDim2.new(1,0,1,0)p.Position=UDim2.new(0.5,0,0.5,0)p.AnchorPoint=Vector2.
new(0.5,0.5)p.BackgroundColor3=Color3.fromRGB(255,255,255)p.
BackgroundTransparency=1 p.BorderSizePixel=0 p.LayoutOrder=0 p.ZIndex=2 p.
Visible=true p.Image=k p.ImageColor3=Color3.fromRGB(255,255,255)p.
ImageTransparency=0.35 p.ScaleType=Enum.ScaleType.Fit p.Parent=l return l end h(
'IBmainFilter',1,'imageSort','rbxassetid://73746166761985')h('IBrarity',2,
'imageRarity','rbxassetid://105634041692696')h('IBphysic',3,'imagePhysic',
'rbxassetid://121406454377051')h('IBspell',4,'imageSpell',
'rbxassetid://125012650497883')h('IBhealth',5,'imageHealth',
'rbxassetid://88525382655929')h('IBability',6,'imageAbility',
'rbxassetid://109718589733073')return b end return a