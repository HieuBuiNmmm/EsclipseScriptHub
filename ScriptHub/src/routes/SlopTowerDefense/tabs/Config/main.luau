-- Tab Config: Quản lý cấu hình (Create, Save, Load, Overwrite, Autoload) qua Maclib built-in.
-- Cột phải: Section 1 - Utility (Auto Hide, Auto Anti Macro), Section 2 - Discord Webhook.

local utility = require("@routes/SlopTowerDefense/core/system/utility")
local webhook = require("@routes/SlopTowerDefense/core/system/webhook")
local autoSave = require("@routes/SlopTowerDefense/core/system/autoSave")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")

return function(window, tab)
	--// ====================================================================
	--// CỘT TRÁI: Quản lý Config Maclib built-in
	--// ====================================================================
	tab:InsertConfigSection("Left")

	--// ====================================================================
	--// CỘT PHẢI: Section 1 - Utility
	--// ====================================================================
	local utilitySection = tab:Section({ Side = "Right" })
	utilitySection:Header({ Name = "Utility" })

	utilitySection:Keybind({
		Name = "Menu Keybind",
		Default = Enum.KeyCode.RightShift,
		onBinded = autoSave.Wrap(function(key)
			if key and typeof(key) == "EnumItem" then
				window:SetKeybind(key)
				notifier.Notify("Menu Keybind", "Menu keybind changed to: " .. key.Name, 2)
			end
		end),
	}, "Keybind_MenuToggle")

	utilitySection:Toggle({
		Name = "Auto Hide",
		Default = utility.IsAutoHideEnabled(),
		Callback = autoSave.Wrap(function(state)
			utility.SetAutoHide(state)
		end),
	}, "Toggle_AutoHide")

	utilitySection:Toggle({
		Name = "Auto Anti Macro",
		Default = utility.IsAutoAntiMacroEnabled(),
		Callback = autoSave.Wrap(function(state)
			utility.SetAutoAntiMacro(state)
		end),
	}, "Toggle_AutoAntiMacro")

	utilitySection:Toggle({
		Name = "Debug Logs",
		Default = utility.IsDebugLogsEnabled(),
		Callback = autoSave.Wrap(function(state)
			utility.SetDebugLogs(state)
		end),
	}, "Toggle_DebugLogs")

	--// ====================================================================
	--// CỘT PHẢI: Section 2 - Discord Webhook
	--// ====================================================================
	local webhookSection = tab:Section({ Side = "Right" })
	webhookSection:Header({ Name = "Discord Webhook" })

	webhookSection:Input({
		Name = "Webhook URL",
		Placeholder = "Enter Discord Webhook URL...",
		AcceptedCharacters = "All",
		Callback = autoSave.Wrap(function(text)
			webhook.SetUrl(text)
		end),
	}, "Input_WebhookUrl")

	webhookSection:Toggle({
		Name = "Enable Webhook",
		Default = webhook.IsEnabled(),
		Callback = autoSave.Wrap(function(state)
			webhook.SetEnabled(state)
		end),
	}, "Toggle_WebhookEnabled")

	webhookSection:Toggle({
		Name = "Notify Match End",
		Default = webhook.IsNotifyMatchEnd(),
		Callback = autoSave.Wrap(function(state)
			webhook.SetNotifyMatchEnd(state)
		end),
	}, "Toggle_WebhookNotifyMatchEnd")

	webhookSection:Input({
		Name = "Discord User ID (Ping)",
		Placeholder = "Optional: 123456789...",
		AcceptedCharacters = "Numeric",
		Callback = autoSave.Wrap(function(text)
			webhook.SetPingUserId(text)
		end),
	}, "Input_WebhookPingUserId")

	webhookSection:Button({
		Name = "Test Webhook",
		Callback = function()
			local ok, err = webhook.SendTest()
			if ok then
				notifier.Notify("Webhook", "Test message sent successfully!", 2.5)
			else
				notifier.Notify("Webhook", "Failed to send: " .. tostring(err), 3)
			end
		end,
	})
end
