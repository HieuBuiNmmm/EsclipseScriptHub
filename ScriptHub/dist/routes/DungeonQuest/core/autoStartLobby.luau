local a={[77649408247578]=true,[115445507767090]=true}local b,c,d,e,f=function()
return a[game.PlaceId]==true end,false,game:GetService'VirtualInputManager',game
:GetService'GuiService',function()local b=game:GetService'Players'.LocalPlayer
if not b then return nil end local c=b:FindFirstChild'PlayerGui'if not c then
return nil end local d=c:FindFirstChild'introGui'if not d or not d:IsA
'ScreenGui'or not d.Enabled then return nil end local e=d:FindFirstChild'title'
if not e then return nil end local f=e:FindFirstChild'Frame'if not f then return
nil end local g=f:FindFirstChild'TextButton'if not g or not g:IsA'TextButton'or
not g.Visible then return nil end local h=''if g.Text and type(g.Text)=='string'
then h=g.Text end if not string.find(string.lower(h),'play')then return nil end
return g end local g=function(g)pcall(function()e.SelectedObject=g end)task.
wait(0.1)d:SendKeyEvent(true,Enum.KeyCode.Return,false,game)task.wait()d:
SendKeyEvent(false,Enum.KeyCode.Return,false,game)task.wait(0.1)pcall(function()
e.SelectedObject=nil end)end local h,i=function()task.spawn(function()local h=
false while c do if not b()then task.wait(1)continue end local i=f()if i then g(
i)h=true elseif h then print'[AutoStartLobby] Pressed Start'break end if not c
then break end task.wait(0.2)end end)end,{}function i.Toggle(j)c=j if c then h()
end end return i