type TowerInfo__DARKLUA_TYPE_a = {
	Instance: Instance,
	Id: string,
	Name: string,
	Level: number,
	Position: Vector3,
	Owner: Player?,
	TargetMode: string?
}

type TargetPriority__DARKLUA_TYPE_b = "First" | "Last" | "Strongest" | "Weakest"
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Scanner: Quét và quản lý danh sách tháp đang có trên bản đồ.


local scanner = {
	Towers = {},
}











function scanner.GetMyTowers(): { [string]: TowerInfo__DARKLUA_TYPE_a }
	return scanner.Towers
end

function scanner.Clear()
	table.clear(scanner.Towers)
end

function scanner.Refresh()
	-- Quét thư mục chứa tower trong Workspace (cần điền đúng Folder name sau khi inspect game)
end

return scanner
end function __DIST.b()-- Remotes: Wrapper quản lý tương tác mạng và RemoteEvents/Functions trong game.


local remotes = {
	-- Placeholder các instance Remote tìm thấy trong game
	Instances = {},
}

-- Gọi RemoteEvent an toàn
function remotes.FireServer(remoteName: string, ...: any): boolean
	local targetRemote = remotes.Instances[remoteName]
	if not targetRemote then
		-- Fallback tìm trong ReplicatedStorage nếu chưa cache
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		targetRemote = ReplicatedStorage:FindFirstChild(remoteName, true)
		if targetRemote and targetRemote:IsA("RemoteEvent") then
			remotes.Instances[remoteName] = targetRemote
		end
	end

	if targetRemote and targetRemote:IsA("RemoteEvent") then
		local ok, err = pcall(targetRemote.FireServer, targetRemote, ...)
		if not ok then
			warn("[SlopTD - Remotes] FireServer error on", remoteName, ":", err)
		end
		return ok
	end

	warn("[SlopTD - Remotes] RemoteEvent not found:", remoteName)
	return false
end

-- Gọi RemoteFunction an toàn
function remotes.InvokeServer(remoteName: string, ...: any): any
	local targetRemote = remotes.Instances[remoteName]
	if not targetRemote then
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		targetRemote = ReplicatedStorage:FindFirstChild(remoteName, true)
		if targetRemote and targetRemote:IsA("RemoteFunction") then
			remotes.Instances[remoteName] = targetRemote
		end
	end

	if targetRemote and targetRemote:IsA("RemoteFunction") then
		local ok, result = pcall(targetRemote.InvokeServer, targetRemote, ...)
		if not ok then
			warn("[SlopTD - Remotes] InvokeServer error on", remoteName, ":", result)
			return nil
		end
		return result
	end

	warn("[SlopTD - Remotes] RemoteFunction not found:", remoteName)
	return nil
end

return remotes
end function __DIST.c()-- Placement: Logic đặt tháp (tính toạ độ, kiểm tra hợp lệ và gọi remote).


local remotes = __DIST.load('b')

local placement = {}

function placement.PlaceTower(towerName: string, position: Vector3, rotation: number?): boolean
	-- Gọi remote đặt tháp (sẽ gắn tên remote cụ thể)
	return remotes.FireServer("PlaceTower", towerName, position, rotation or 0)
end

return placement
end function __DIST.d()-- Upgrader: Logic nâng cấp tháp theo thuật toán / độ ưu tiên.


local remotes = __DIST.load('b')
local scanner = __DIST.load('a')

local upgrader = {
	AutoUpgradeEnabled = false,
	Strategy = "Balanced", -- "MaxFirst", "Balanced", "CheapestFirst"
}

function upgrader.Upgrade(towerInstance: Instance): boolean
	return remotes.FireServer("UpgradeTower", towerInstance)
end

function upgrader.SetEnabled(state: boolean)
	upgrader.AutoUpgradeEnabled = state
end

return upgrader
end function __DIST.e()-- Targeting: Quản lý chế độ nhắm bắn của tháp (First, Last, Strongest, Weakest).


local remotes = __DIST.load('b')

local targeting = {}



function targeting.SetTargetMode(towerInstance: Instance, mode: TargetPriority__DARKLUA_TYPE_b): boolean
	return remotes.FireServer("SetTargetMode", towerInstance, mode)
end

return targeting
end function __DIST.f()-- Towers Facade


local scanner = __DIST.load('a')
local placement = __DIST.load('c')
local upgrader = __DIST.load('d')
local targeting = __DIST.load('e')

return {
	Scanner = scanner,
	Placement = placement,
	Upgrader = upgrader,
	Targeting = targeting,
}
end end-- Tab Towers: Quản lý đặt tháp, nâng cấp, đổi mục tiêu bắn và bán tháp.


local towers = __DIST.load('f')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Auto Placement" })

	leftSection:Toggle({
		Name = "Auto Place Towers",
		Default = false,
		Callback = function(state)
			-- Toggle auto place
		end,
	}, "Toggle_AutoPlaceTowers")

	leftSection:Dropdown({
		Name = "Placement Mode",
		Options = { "Smart Auto", "Grid", "Macro" },
		Default = "Smart Auto",
		Callback = function(option)
			-- Mode selection
		end,
	}, "Dropdown_PlacementMode")

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Auto Upgrade & Target" })

	rightSection:Toggle({
		Name = "Auto Upgrade",
		Default = false,
		Callback = function(state)
			towers.Upgrader.SetEnabled(state)
		end,
	}, "Toggle_AutoUpgrade")

	rightSection:Dropdown({
		Name = "Upgrade Priority",
		Options = { "Balanced", "MaxFirst", "CheapestFirst" },
		Default = "Balanced",
		Callback = function(option)
			towers.Upgrader.Strategy = option
		end,
	}, "Dropdown_UpgradePriority")

	rightSection:Dropdown({
		Name = "Default Target Priority",
		Options = { "First", "Last", "Strongest", "Weakest" },
		Default = "First",
		Callback = function(option)
			-- Set default target mode
		end,
	}, "Dropdown_TargetPriority")
end
