type TowerInfo__DARKLUA_TYPE_a = {
	Instance: Instance,
	Id: string,
	Name: string,
	Level: number,
	Position: Vector3,
	Owner: Player?,
	TargetMode: string?
}
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Remotes: Wrapper quản lý tương tác mạng và RemoteEvents/Functions trong game.


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
end function __DIST.b()-- Scanner: Quét và quản lý danh sách tháp đang có trên bản đồ.


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
end end-- Upgrader: Logic nâng cấp tháp theo thuật toán / độ ưu tiên.


local remotes = __DIST.load('a')
local scanner = __DIST.load('b')

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
