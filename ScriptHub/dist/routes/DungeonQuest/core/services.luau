local a,b,c,d=game:GetService'Players',game:GetService'UserInputService',game:
GetService'RunService',game:GetService'VirtualInputManager'local e=a.LocalPlayer
if not e then local f=os.clock()+5 repeat e=a.LocalPlayer if e then break end
task.wait(0.1)until os.clock()>f end return{Players=a,UserInputService=b,
RunService=c,VirtualInputManager=d,player=e}