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
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Lifecycle: Quản lý đăng ký và giải phóng tài nguyên (Connections, Tasks, Objects) khi script unload hoặc reload.


local lifecycle = {
	cleaned = false,
	callbacks = {},
}

function lifecycle.Register(callback: () -> ()): () -> ()
	if type(callback) ~= "function" then
		return function() end
	end
	if lifecycle.cleaned then
		pcall(callback)
		return function() end
	end

	table.insert(lifecycle.callbacks, callback)
	return function()
		for index, registered in ipairs(lifecycle.callbacks) do
			if registered == callback then
				table.remove(lifecycle.callbacks, index)
				break
			end
		end
	end
end

function lifecycle.Cleanup(): ()
	if lifecycle.cleaned then return end
	lifecycle.cleaned = true
	for index = #lifecycle.callbacks, 1, -1 do
		pcall(lifecycle.callbacks[index])
	end
	table.clear(lifecycle.callbacks)
end

function lifecycle.IsActive(): boolean
	return not lifecycle.cleaned
end

lifecycle.OnCleanup = lifecycle.Register

return lifecycle
end function __DIST.b()-- Tracker: Giám sát trạng thái trận đấu (Wave, Máu Base, Trạng thái trận đấu)


local lifecycle = __DIST.load('a')

local tracker = {
	Wave = 0,
	MaxWave = 0,
	BaseHealth = 100,
	MaxBaseHealth = 100,
	GameActive = false,
	AutoSkipEnabled = false,
}

local callbacks = {}

function tracker.OnWaveChanged(fn: (number) -> ()): () -> ()
	table.insert(callbacks, fn)
	return function()
		local idx = table.find(callbacks, fn)
		if idx then table.remove(callbacks, idx) end
	end
end

function tracker.SetWave(wave: number)
	if tracker.Wave ~= wave then
		tracker.Wave = wave
		for _, fn in ipairs(callbacks) do
			pcall(fn, wave)
		end
	end
end

function tracker.Init()
	-- Kết nối tự động phát hiện wave / match state khi vào game
	-- (Sẽ được bổ sung path cụ thể sau khi kiểm tra hierarchy trong game)
end

return tracker
end function __DIST.c()-- Scanner: Quét và quản lý danh sách tháp đang có trên bản đồ.


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
end function __DIST.d()-- Remotes: Wrapper quản lý tương tác mạng và RemoteEvents/Functions trong game.


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
end function __DIST.e()-- Placement: Logic đặt tháp (tính toạ độ, kiểm tra hợp lệ và gọi remote).


local remotes = __DIST.load('d')

local placement = {}

function placement.PlaceTower(towerName: string, position: Vector3, rotation: number?): boolean
	-- Gọi remote đặt tháp (sẽ gắn tên remote cụ thể)
	return remotes.FireServer("PlaceTower", towerName, position, rotation or 0)
end

return placement
end function __DIST.f()-- Upgrader: Logic nâng cấp tháp theo thuật toán / độ ưu tiên.


local remotes = __DIST.load('d')
local scanner = __DIST.load('c')

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
end function __DIST.g()-- Targeting: Quản lý chế độ nhắm bắn của tháp (First, Last, Strongest, Weakest).


local remotes = __DIST.load('d')

local targeting = {}



function targeting.SetTargetMode(towerInstance: Instance, mode: TargetPriority__DARKLUA_TYPE_b): boolean
	return remotes.FireServer("SetTargetMode", towerInstance, mode)
end

return targeting
end function __DIST.h()-- Towers Facade


local scanner = __DIST.load('c')
local placement = __DIST.load('e')
local upgrader = __DIST.load('f')
local targeting = __DIST.load('g')

return {
	Scanner = scanner,
	Placement = placement,
	Upgrader = upgrader,
	Targeting = targeting,
}
end end-- Tab Game: Tự động hóa trong trận đấu (Match Flow & Tower Management).


local tracker = __DIST.load('b')
local towers = __DIST.load('h')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Match Automation" })

	leftSection:Toggle({
		Name = "Auto Skip Wave",
		Default = false,
		Callback = function(state)
			tracker.AutoSkipEnabled = state
		end,
	}, "Toggle_AutoSkipWave")

	leftSection:Toggle({
		Name = "Auto Vote Start",
		Default = false,
		Callback = function(state)
			-- Toggle auto vote start
		end,
	}, "Toggle_AutoVoteStart")

	leftSection:Toggle({
		Name = "Auto Replay (On Win/Loss)",
		Default = false,
		Callback = function(state)
			-- Toggle auto replay
		end,
	}, "Toggle_AutoReplay")

	leftSection:Toggle({
		Name = "Auto Return to Lobby (On Finish)",
		Default = false,
		Callback = function(state)
			-- Toggle return to lobby
		end,
	}, "Toggle_AutoReturnLobby")

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Tower Management" })

	rightSection:Toggle({
		Name = "Auto Place Towers",
		Default = false,
		Callback = function(state)
			-- Toggle auto place
		end,
	}, "Toggle_AutoPlaceTowers")

	rightSection:Dropdown({
		Name = "Placement Mode",
		Options = { "Smart Auto", "Grid", "Macro" },
		Default = "Smart Auto",
		Callback = function(option)
			-- Mode selection
		end,
	}, "Dropdown_PlacementMode")

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
