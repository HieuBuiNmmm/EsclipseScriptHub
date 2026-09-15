



local a=require"@routes/DungeonQuest/core/webhook"

return function(b,c)
local d=c:Section{Side="Right"}
d:Header{Name="Discord Webhook"}

d:Input{
Name="Webhook URL",
Placeholder="https://discord.com/api/webhooks/...",
AcceptedCharacters="All",
Default=a.GetUrl(),
Callback=function(e)
a.SetUrl(e)
end,
}

d:Toggle({
Name="Enable Notifications",
Default=a.IsEnabled(),
Callback=function(e)
a.SetEnabled(e)
end,
},"Toggle_Webhook")

d:Button{
Name="Send Test Notification",
Callback=function()
a.Send()
end,
}

local e=c:Section{Side="Right"}
e:Header{Name="Ping on Drops"}

e:Toggle({
Name="Enable Ping",
Default=a.IsPingEnabled(),
Callback=function(f)
a.SetPingEnabled(f)
end,
},"Toggle_Ping")

e:Input{
Name="Mention (User/Role ID)",
Placeholder="<@123456789012345678>",
AcceptedCharacters="All",
Default=a.GetPingMention(),
Callback=function(f)
a.SetPingMention(f)
end,
}

e:Dropdown{
Name="Ping Tier",
Multi=true,
Required=false,
Options=a.GetPingTierOptions(),
Default=a.GetPingTiers(),
Callback=function(f)
a.SetPingTiers(f)
end,
}

e:Label{
Text="Ping triggers when a reward item matches any selected Tier (multi-select, Secret = Tier6).",
}
end