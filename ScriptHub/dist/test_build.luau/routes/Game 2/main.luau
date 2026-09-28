--// Types
type Window__DARKLUA_TYPE_a = { Visible: boolean? }
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()local flags = {}

function flags:Export()
    local result = {}

    for key, component in pairs(self) do
        if typeof(component) == "Instance" or type(component) == "table" then
            local success, value = pcall(function()
                -- return component.Value
            end)

            if success and value ~= nil then
                result[key] = value
            end
        end
    end

    return result
end

function flags:Import(data)
	for key, value in pairs(data) do
		local component = self[key]

		if component and component.Value ~= nil then
			local success = pcall(function()
				-- component:SetValue(value)
			end)

			if not success then
				warn(`Failed to import value for flag "{key}"`)
			end
		end
	end
end

function flags:Reset()
	for k in pairs(self) do
		self[k] = nil
	end
end

return flags end function __DIST.b()
local binder = {}

function binder.Apply(properties: { [string]: any }, object: any, excludes: { [number]: string }?): any
	for property, value in pairs(properties) do
		if excludes and table.find(excludes, property) then
			continue
		end

		pcall(function()
			object[property] = value
		end)
	end

	return object
end

function binder.Wrap(
	object: { [string]: any },
	bindings: { [string]: (any) -> () },
	excludes: { [number]: any }?,
	instance: Instance?
): any
	local proxy = {}

	setmetatable(proxy, {
		__index = function(_, key)
			if object[key] ~= nil then
				return object[key]
			elseif instance then
				local ok, value = pcall(function()
					return instance[key]
				end)

				if ok then
					return value
				end
			end

			return
		end,

		__newindex = function(_, key, value)
			local handler = bindings[key]

			if handler then
				handler(value)

				if not (excludes and table.find(excludes, key)) then
					object[key] = value
				end
			elseif instance then
				local ok, _ = pcall(function()
					instance[key] = value
				end)

				if not ok then
					object[key] = value
				end
			else
				object[key] = value
			end
		end,
	})

	return proxy
end

return binder
end function __DIST.c()
--// Imports



local binder = __DIST.load('b')

--// Variables
local interface = {}

--// Initialize
function interface:Window(properties: Window__DARKLUA_TYPE_a): Window__DARKLUA_TYPE_a
	properties = properties or {}
	print("Made a window")

	local object = binder.Wrap(properties, {
		Visible = function(value: boolean)
			print("Set window visibility to:", value)
		end,
	})

	return binder.Apply(properties, object)
end

return interface
end function __DIST.d()--// Imports

local binder = __DIST.load('b')

--// Variables
local esp = {}

--// Initialize
return binder.Wrap(esp, {
	Enabled = function(value: boolean)
		print(`{value and "Enabled" or "Disabled"} ESP.`)
	end,
}) :: { Enabled: boolean }
end function __DIST.e()--// Imports

local flags = __DIST.load('a')
local interface = __DIST.load('c')
local esp = __DIST.load('d')

--// Initialize
local window = interface:Window({
	Visible = true,
})

return {
	Flags = flags,
	Esp = esp,
	Interface = interface,
	Window = window,

	Tabs = {
		Home = function(self)
			-- ....

			-- return tab
		end,

		Visuals = function(self)
			-- ....

			-- return tab
		end,

		Settings = function(self)
			-- ....

			-- return tab
		end,

		Config = function(self)
			-- ....

			-- return tab
		end,
	},
}
end function __DIST.f()--// Variables

local utility = {}

--// Initialize
function utility.GetPlayer(): Player?
	local success, result = pcall(function()
		return game:GetService("Players")
	end)

	return success and (result :: Players).LocalPlayer
end

function utility.GetCharacter(player: Player?): Model?
	local success, result = pcall(function()
		return player and player.Character
	end)

	return success and result
end

function utility.GetHumanoid(player: Player?): Humanoid?
	local success, result = pcall(function()
		local character = utility.GetCharacter(player)
		
		return character and character:FindFirstChildOfClass("Humanoid")
	end)

	return success and result
end

return utility
end function __DIST.g()--// Functions

local function cast(service: string): any
	return game:GetService(service)
end

--// Initialize
return {
	Players = cast("Players") :: Players,
}
end end-- You can go even further by seperating tabs into different files, eg, Game 1/tabs/exploits.luau


return function(self)
	--// Imports
	local base = __DIST.load('e')
	local utility = __DIST.load('f')
	local services = __DIST.load('g')

	--// References
	local flags = base.Flags
	local esp = base.Esp
	local interface = base.Interface
	local window = base.Window
	local tabs = base.Tabs

	local localPlayer = utility.GetPlayer()

	local players = services.Players

	--// UI
	do -- Home
		tabs.Home(self)
	end

	do -- Exploits
		local tab = window:Tab({ Name = "Exploits" })

		tab:Toggle({
			Name = "Flight",
		})
	end

	do -- Visuals
		tabs.Visuals(self)
	end

	do -- Settings
		local tab = tabs.Settings(self)

		tab:Toggle({
			Name = "Dark Mode",
		})
	end

	do -- Config
		tabs.Config(self)
	end

	--// Initialize
	window.Title = self.Name
end
