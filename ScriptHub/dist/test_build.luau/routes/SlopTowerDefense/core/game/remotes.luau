-- Remotes: Wrapper quản lý tương tác mạng và RemoteEvents/Functions trong game.

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
