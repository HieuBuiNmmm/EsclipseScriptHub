-- Tab Notifications (DungeonQuest): cấu hình thông báo Webhook Discord.
-- Input webhook URL + toggle bật/tắt + nút test gửi thử + cấu hình ping.

--// Imports
local webhook = require("@routes/DungeonQuest/core/webhook")

return function(window, tab)
	local section = tab:Section({ Side = "Left" })
	section:Header({ Name = "Discord Webhook" })

	section:Input({
		Name = "Webhook URL",
		Placeholder = "https://discord.com/api/webhooks/...",
		AcceptedCharacters = "All",
		Default = webhook.GetUrl(),
		Callback = function(input)
			webhook.SetUrl(input)
		end,
	})

	section:Toggle({
		Name = "Enable Notifications",
		Default = webhook.IsEnabled(),
		Callback = function(state)
			webhook.SetEnabled(state)
		end,
	}, "Toggle_Webhook")

	section:Button({
		Name = "Send Test Notification",
		Callback = function()
			webhook.Send()
		end,
	})

	local pingSection = tab:Section({ Side = "Left" })
	pingSection:Header({ Name = "Ping on Drops" })

	pingSection:Toggle({
		Name = "Enable Ping",
		Default = webhook.IsPingEnabled(),
		Callback = function(state)
			webhook.SetPingEnabled(state)
		end,
	}, "Toggle_Ping")

	pingSection:Input({
		Name = "Mention (User/Role ID)",
		Placeholder = "<@123456789012345678>",
		AcceptedCharacters = "All",
		Default = webhook.GetPingMention(),
		Callback = function(input)
			webhook.SetPingMention(input)
		end,
	})

	pingSection:Dropdown({
		Name = "Ping Tier",
		Multi = true,
		Required = false,
		Options = webhook.GetPingTierOptions(),
		Default = webhook.GetPingTiers(),
		Callback = function(value)
			webhook.SetPingTiers(value)
		end,
	})

	pingSection:Label({
		Text = "Ping triggers when a reward item matches any selected Tier (multi-select, Secret = Tier6).",
	})
end
