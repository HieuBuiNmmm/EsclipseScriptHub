local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e=game:GetService
'Players',game:GetService'UserInputService',game:GetService'RunService',game:
GetService'VirtualInputManager'local f=b.LocalPlayer if not f then local g=os.
clock()+5 repeat f=b.LocalPlayer if f then break end task.wait(0.1)until os.
clock()>g end return{Players=b,UserInputService=c,RunService=d,
VirtualInputManager=e,player=f}end function a.b()local b,c={}function b:
SetWindow(d)c=d end function b.Notify(d,e,f)f=f or 3 if c then local g=pcall(
function()c:Notify{Title=d,Description=e,Lifetime=f}end)if g then return end end
pcall(function()game:GetService'StarterGui':SetCore('SendNotification',{Title=d,
Text=e,Duration=f})end)end return b end end local b,c=a.load'a',a.load'b'local d
,e,f,g,h,i,j,k,l,m,n,o,p=b.player,2,false,false,false,false,60,false,
'\r\nlocal ReplayDungeon = game:GetService("ReplicatedStorage"):WaitForChild("remotes"):WaitForChild("replayDungeon")\r\n\r\nlocal payload = {}\r\nlocal function collectValue(name)\r\n\tlocal value = workspace:FindFirstChild(name)\r\n\tif value and value:IsA("ValueBase") then\r\n\t\tpayload[name] = value.Value\r\n\tend\r\nend\r\n\r\ncollectValue("dungeonName")\r\ncollectValue("dungeonProgress")\r\ncollectValue("dungeonStarted")\r\n\r\nlocal hardcore = workspace:FindFirstChild("hardcore")\r\nif hardcore and hardcore:IsA("BoolValue") then\r\n\tpayload.hardcore = hardcore.Value\r\n\tpayload.isHardcore = hardcore.Value\r\nend\r\n\r\nlocal dungeon = workspace:FindFirstChild("dungeon")\r\nif dungeon then\r\n\tfor _, value in ipairs(dungeon:GetChildren()) do\r\n\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\tend\r\n\tlocal bossRoom = dungeon:FindFirstChild("bossRoom")\r\n\tif bossRoom then\r\n\t\tfor _, value in ipairs(bossRoom:GetChildren()) do\r\n\t\t\tif value:IsA("ValueBase") then payload[value.Name] = value.Value end\r\n\t\tend\r\n\tend\r\nend\r\n\r\nif not payload.dungeonName then return end\r\nReplayDungeon:FireServer(payload)\r\n'
,[[game:GetService("Players").LocalPlayer.PlayerGui.rewardGuiHolder.holder]],
function(d)local e,f=pcall(loadstring,'return '..d)if e and type(f)=='function'
then return f end return nil end local q,r=pcall(loadstring,l)if q and type(r)==
'function'then o=r end p=n(m)if not p then p=function()return d:FindFirstChild
'PlayerGui'and d.PlayerGui:FindFirstChild'rewardGuiHolder'and d.PlayerGui.
rewardGuiHolder:FindFirstChild'holder'end end local s,t,u=function()local s,t=
pcall(function()local s=d:FindFirstChild'PlayerGui'local t=s and s:
FindFirstChild'timeLeftGui'local u=t and t:FindFirstChild'Frame'return u and u:
FindFirstChild'time'end)if not s or typeof(t)~='Instance'then return nil end
local u if t:IsA'ValueBase'then u=t.Value else u=t.Text end if type(u)=='number'
then return u end if type(u)=='string'then local v=u:gsub('%s+',''):gsub('^%[',
''):gsub('%]$','')local w,x=v:match'^(%d+):(%d+)$'if w and x then return
tonumber(w)*60+tonumber(x)end local y=tonumber(v)if y then return y end end
return nil end,{},function()if not o then c.Notify('Auto Retry',
'Remote command invalid',3)return false end local s,t=pcall(o)if s then c.
Notify('Auto Retry','Retrying dungeon!',3)return true end c.Notify('Auto Retry',
'Trigger failed: '..tostring(t),3)return false end function t.Start()if g then
return end g=true h=false k=false task.spawn(function()while f or i do if f then
local v=0 if p then local w,x=pcall(p)if w and typeof(x)=='Instance'and x.Parent
then v=#x:GetChildren()end end if v>=e and not h then h=true u()elseif v<e then
h=false end end if i then local v=s()if v and v<j and not k then k=true u()
elseif v and v>=j then k=false end end if not f and not i then break end task.
wait(0.75)end g=false end)end function t.Stop()f=false end function t.Toggle(v)f
=v if v then k=false t.Start()c.Notify('Auto Retry','Watching reward holder...',
2)else t.Stop()c.Notify('Auto Retry','Stopped',2)end end function t.
SetTimeRetryEnabled(v)i=v==true if i then k=false t.Start()c.Notify('Auto Retry'
,'Watching time left...',2)else c.Notify('Auto Retry','Time retry stopped',2)end
end function t.GetTimeRetryEnabled()return i end function t.
SetTimeRetryThreshold(v)j=v end function t.GetTimeRetryThreshold()return j end
function t.GetTimeLeft()return s()end function t.RetryNow()task.spawn(function()
u()end)end return t