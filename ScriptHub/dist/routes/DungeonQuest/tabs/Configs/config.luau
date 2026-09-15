




local a=require"@packages/Maclib"
local b=require"@routes/DungeonQuest/core/autoSave"
local c=require"@routes/DungeonQuest/core/autoHide"

return function(d,e)
local f=a.Folder
local g=f.."/settings/autoload.txt"

local function getAutoloadName()
if isfile and isfile(g)then
return readfile(g)
end
return nil
end

local function activate(h)
b.SetActive(h)
end

local h=e:Section{Side="Left"}
h:Header{Name="Configs"}

local i
local j
local k

local function refreshOptions(l)
local m=a:RefreshConfigList()
j:ClearOptions()
j:InsertOptions(m)
if l then
if not j:IsOption(l)then
j:InsertOptions{l}
end
j:UpdateSelection(l)
end
end

h:Input{
Name="Config Name",
Placeholder="Name",
AcceptedCharacters="All",
Callback=function(l)
i=l
end,
}

j=h:Dropdown{
Name="Select Config",
Multi=false,
Required=false,
Options=a:RefreshConfigList(),
Callback=function(l)
activate(l)
end,
}


local l=getAutoloadName()
if l and l~=""then
if not j:IsOption(l)then
j:InsertOptions{l}
end
j:UpdateSelection(l)
activate(l)
end

h:Button{
Name="Create Config",
Callback=function()
if not i or string.gsub(i," ","")==""then
d:Notify{Title="Interface",Description="Config name cannot be empty."}
return
end

local m,n=a:SaveConfig(i)
if not m then
d:Notify{Title="Interface",Description="Unable to save config: "..tostring(n)}
return
end

d:Notify{Title="Interface",Description=string.format("Created config %q",i)}
refreshOptions(i)
activate(i)
end,
}

h:Button{
Name="Load Config",
Callback=function()
local m=j.Value
local n,o=a:LoadConfig(m)
if not n then
d:Notify{Title="Interface",Description="Unable to load config: "..tostring(o)}
return
end

d:Notify{Title="Interface",Description=string.format("Loaded config %q",m)}
activate(m)
end,
}

h:Button{
Name="Overwrite Config",
Callback=function()
local m=j.Value
local n,o=a:SaveConfig(m)
if not n then
d:Notify{Title="Interface",Description="Unable to overwrite config: "..tostring(o)}
return
end

d:Notify{Title="Interface",Description=string.format("Overwrote config %q",m)}
activate(m)
end,
}

h:Button{
Name="Set as autoload",
Callback=function()
local m=j.Value
if not m then
d:Notify{Title="Interface",Description="Please select a config first."}
return
end

writefile(g,m)
k:UpdateName("Autoload config: "..m)
d:Notify{Title="Interface",Description=string.format("Set %q as autoload",m)}
activate(m)
end,
}

h:Button{
Name="Refresh Config List",
Callback=function()
refreshOptions(j.Value)
end,
}

k=h:Label{Text="Autoload config: None"}
local m=getAutoloadName()
if m and m~=""then
k:UpdateName("Autoload config: "..m)
end

h:Header{Name="Auto Hide UI"}
h:Toggle({
Name="Hide window after execute",
Default=c.IsEnabled(),
Callback=function(n)
c.SetEnabled(n)
end,
},"Toggle_AutoHide")

h:Label{
Text="Press RightControl to show the window again.",
}
end