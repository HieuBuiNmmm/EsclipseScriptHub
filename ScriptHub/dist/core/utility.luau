local a={}function a.GetPlayer()local b,c=pcall(function()return game:GetService
'Players'end)return b and(c).LocalPlayer end function a.GetCharacter(b)local c,d
=pcall(function()return b and b.Character end)return c and d end function a.
GetHumanoid(b)local c,d=pcall(function()local c=a.GetCharacter(b)return c and c:
FindFirstChildOfClass'Humanoid'end)return c and d end return a