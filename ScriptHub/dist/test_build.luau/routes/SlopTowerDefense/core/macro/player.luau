type TowerInfo__DARKLUA_TYPE_a = {
	Instance: Instance,
	Id: string,
	Name: string,
	Level: number,
	Position: Vector3,
	Owner: Player?,
	TargetMode: string?
}
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
end function __DIST.d()-- Scanner: Quét và quản lý danh sách tháp đang có trên bản đồ.


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
end function __DIST.e()-- Upgrader: Logic nâng cấp tháp theo thuật toán / độ ưu tiên.


local remotes = __DIST.load('b')
local scanner = __DIST.load('d')

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
end end-- Player: Thực thi kịch bản macro đã ghi (chờ đúng wave hoặc thời gian để đặt/nâng tháp).


local lifecycle = __DIST.load('a')
local placement = __DIST.load('c')
local upgrader = __DIST.load('e')

local player = {
	IsPlaying = false,
	CurrentMacro = nil,
	CurrentIndex = 1,
}

function player.Play(macroData: any)
	player.CurrentMacro = macroData
	player.CurrentIndex = 1
	player.IsPlaying = true
	-- Vòng lặp kiểm tra wave / time sẽ được kết nối ở đây
end

function player.Stop()
	player.IsPlaying = false
	player.CurrentMacro = nil
end

return player
