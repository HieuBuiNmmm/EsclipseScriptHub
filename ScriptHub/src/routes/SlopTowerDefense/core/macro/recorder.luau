-- Recorder: Ghi lại các thao tác SpawnTower và SellTower của người chơi khi bật Record.
local types = require("./types")
local storage = require("./storage")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local recorder = {}

recorder.InitialSpeed = 1

local isRecording = false
local activeMacroName: string? = nil
local recordedSteps: { types.MacroStep } = {}
local towerIndexCounter = 0

-- Bảng tra cứu định danh tháp giữa Instance và TowerId ("T1", "T2")
local instanceToId: { [Instance]: string } = {}
local idToInstance: { [string]: Instance } = {}
local idToInfo: { [string]: { TowerName: string, Position: Vector3 } } = {}

-- Tham chiếu RemoteFunction từ ReplicatedStorage.Functions
local spawnRemote: RemoteFunction? = nil
local sellRemote: RemoteFunction? = nil
local upgradeRemote: RemoteFunction? = nil
local changeModeRemote: RemoteFunction? = nil
local changeSpeedRemote: RemoteFunction? = nil
local voteSkipRemote: RemoteFunction? = nil

local function getRemotes()
	if not spawnRemote or not sellRemote or not upgradeRemote or not changeModeRemote or not changeSpeedRemote or not voteSkipRemote then
		local functions = ReplicatedStorage:FindFirstChild("Functions")
		if functions then
			spawnRemote = functions:FindFirstChild("SpawnTower") :: RemoteFunction?
			sellRemote = functions:FindFirstChild("SellTower") :: RemoteFunction?
			upgradeRemote = functions:FindFirstChild("UpgradeTower") :: RemoteFunction?
			changeModeRemote = functions:FindFirstChild("ChangeTowerMode") :: RemoteFunction?
			changeSpeedRemote = functions:FindFirstChild("ChangeSpeed") :: RemoteFunction?
			voteSkipRemote = functions:FindFirstChild("VoteSkip") :: RemoteFunction?
		end
	end
	return spawnRemote, sellRemote, upgradeRemote, changeModeRemote, changeSpeedRemote, voteSkipRemote
end

-- Lấy tốc độ trận đấu hiện tại từ GameGui.SpeedUp.Message (định dạng ": x1", ": x2", ...)
local function getCurrentGameSpeed(): number
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return 1 end

	local speedUp = gameGui:FindFirstChild("SpeedUp")
	local messageLabel = speedUp and speedUp:FindFirstChild("Message")
	if messageLabel and messageLabel:IsA("TextLabel") then
		local num = tonumber(messageLabel.Text:match("%d+"))
		if num and num >= 1 and num <= 5 then
			return num
		end
	end

	-- Fallback nếu SpeedUp nằm sâu hơn
	local deepSpeedUp = gameGui:FindFirstChild("SpeedUp", true)
	if deepSpeedUp then
		local deepMsg = deepSpeedUp:FindFirstChild("Message")
		if deepMsg and deepMsg:IsA("TextLabel") then
			local num = tonumber(deepMsg.Text:match("%d+"))
			if num and num >= 1 and num <= 5 then
				return num
			end
		end
	end

	return 1
end

-- Tìm Model tháp trong workspace gần tọa độ đặt (ưu tiên khoảng cách ngang XZ và hỗ trợ variant/skin)
local function findTowerNearPosition(name: string?, targetPos: Vector3, maxHorizontalDist: number?, variantName: string?): Model?
	maxHorizontalDist = maxHorizontalDist or 3.8
	local maxVerticalDist = 12.0
	local bestModel: Model? = nil
	local bestDist = maxHorizontalDist
	local bestMatchScore = -1

	local searchContainers = {
		workspace:FindFirstChild("Towers"),
		workspace:FindFirstChild("PlacedTowers"),
		workspace:FindFirstChild("Units"),
		workspace,
	}

	for _, container in ipairs(searchContainers) do
		if not container then continue end

		local function checkCandidate(child: Instance)
			if not child:IsA("Model") or child.Parent == nil then return end

			local pos: Vector3? = nil
			if child.PrimaryPart then
				pos = child.PrimaryPart.Position
			else
				pcall(function()
					pos = child:GetPivot().Position
				end)
			end

			if not pos then return end

			local xzDist = math.sqrt((pos.X - targetPos.X)^2 + (pos.Z - targetPos.Z)^2)
			local yDist = math.abs(pos.Y - targetPos.Y)

			if xzDist <= maxHorizontalDist and yDist <= maxVerticalDist then
				local childNameLower = child.Name:lower()
				local matchScore = 0

				if name and (childNameLower:find(name:lower(), 1, true) or name:lower():find(childNameLower, 1, true)) then
					matchScore = 100
				elseif variantName and (childNameLower:find(variantName:lower(), 1, true) or variantName:lower():find(childNameLower, 1, true)) then
					matchScore = 90
				elseif not name then
					matchScore = 50
				else
					matchScore = (xzDist <= 2.5) and 40 or 10
				end

				if matchScore > bestMatchScore or (matchScore == bestMatchScore and xzDist < bestDist) then
					bestMatchScore = matchScore
					bestDist = xzDist
					bestModel = child
				end
			end
		end

		for _, child in ipairs(container:GetChildren()) do
			checkCandidate(child)
			if child:IsA("Folder") or child:IsA("Configuration") then
				for _, subChild in ipairs(child:GetChildren()) do
					checkCandidate(subChild)
				end
			end
		end

		if bestModel and bestMatchScore >= 50 then break end
	end

	return bestModel
end

-- Thêm 1 bước hành động vào danh sách ghi nhận
function recorder.AddStep(actionType: types.ActionType, details: { [string]: any })
	if not isRecording then return end

	local wave, _ = gameStats.GetWave()
	local elapsedTime = gameStats.GetElapsedTime()
	local cash = gameStats.GetCash()

	local stepIndex = #recordedSteps + 1
	local currentSpeed = getCurrentGameSpeed()
	local step: types.MacroStep = {
		Index = stepIndex,
		Type = actionType,
		TowerId = details.TowerId or ("T" .. tostring(stepIndex)),
		TowerName = details.TowerName or "Unknown",
		Speed = details.Speed,
		RecordSpeed = currentSpeed,
		CFrame = details.CFrame,
		Position = details.Position,
		Arg3 = details.Arg3,
		Arg4 = details.Arg4,
		Arg5 = details.Arg5,
		Wave = wave,
		Time = elapsedTime,
		Cost = details.Cost or cash,
		TowerCost = details.TowerCost,
		TargetMode = details.TargetMode,
		RawData = details.RawData,
	}

	table.insert(recordedSteps, step)

	if actionType == "Place" then
		notifier.Notify("Macro Record", string.format("Recorded Place: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
	elseif actionType == "Sell" then
		notifier.Notify("Macro Record", string.format("Recorded Sell: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
	elseif actionType == "Upgrade" then
		notifier.Notify("Macro Record", string.format("Recorded Upgrade: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
	elseif actionType == "Target" then
		notifier.Notify("Macro Record", string.format("Recorded Target: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
	elseif actionType == "VoteSkip" then
		notifier.Notify("Macro Record", string.format("Recorded VoteSkip [%.2fs]", step.Time), 1.5)
	end
end

-- Xử lý ghi nhận SpawnTower khi Remote được gọi
local function handleSpawnTower(args: { any }, returnedModel: any)
	local ok, err = pcall(function()
		local towerName = type(args[1]) == "string" and args[1] or "Unknown"
		local cf = typeof(args[2]) == "CFrame" and args[2] or nil
		local pos: Vector3? = nil
		if cf then
			pos = cf.Position
		elseif typeof(args[2]) == "Vector3" then
			pos = args[2]
			cf = CFrame.new(pos)
		end

		local arg3 = args[3] == true
		local arg4 = type(args[4]) == "string" and args[4] or nil
		local arg5 = type(args[5]) == "table" and args[5] or nil

		local cfComponents = cf and { cf:GetComponents() } or nil
		local posTable = pos and { pos.X, pos.Y, pos.Z } or nil

		towerIndexCounter += 1
		local towerId = "T" .. tostring(towerIndexCounter)

		if pos then
			idToInfo[towerId] = {
				TowerName = towerName,
				Position = pos,
			}
		end

		local initialCash = gameStats.GetCash()
		local stepIndex = #recordedSteps + 1

		recorder.AddStep("Place", {
			TowerId = towerId,
			TowerName = towerName,
			CFrame = cfComponents,
			Position = posTable,
			Arg3 = arg3,
			Arg4 = arg4,
			Arg5 = arg5,
			RawData = {
				Arg1 = args[1],
				Arg2 = tostring(args[2]),
				Arg3 = args[3],
				Arg4 = args[4],
				Arg5 = args[5],
			},
		})

		-- 1. Nếu server trả về trực tiếp Instance Model, gán định danh ngay lập tức!
		if typeof(returnedModel) == "Instance" then
			local m = returnedModel:IsA("Model") and returnedModel or returnedModel:FindFirstAncestorOfClass("Model")
			if m then
				instanceToId[m] = towerId
				idToInstance[towerId] = m
			end
		end

		-- 2. Theo dõi biến động tiền và liên kết Model dự phòng nếu chưa có
		if pos then
			task.spawn(function()
				for _ = 1, 20 do
					task.wait(0.2)
					if not isRecording then break end

					local curCash = gameStats.GetCash()
					if curCash < initialCash and recordedSteps[stepIndex] then
						local exactPrice = initialCash - curCash
						if exactPrice > 0 and not recordedSteps[stepIndex].TowerCost then
							recordedSteps[stepIndex].TowerCost = exactPrice
						end
					end

					if not idToInstance[towerId] then
						local model = findTowerNearPosition(towerName, pos, 4.0, arg4)
						if model then
							instanceToId[model] = towerId
							idToInstance[towerId] = model
						end
					end
				end
			end)
		end
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận SpawnTower:", tostring(err))
	end
end

-- Xử lý ghi nhận SellTower khi Remote được gọi
local function handleSellTower(args: { any })
	local ok, err = pcall(function()
		local towerInstance = typeof(args[1]) == "Instance" and args[1] or nil
		local matchedId: string? = nil
		local towerName = "Unknown"
		local targetPos: Vector3? = nil

		if towerInstance then
			towerName = towerInstance.Name
			if instanceToId[towerInstance] then
				matchedId = instanceToId[towerInstance]
			else
				-- Thử tìm theo khoảng cách gần nhất với các tháp đã lưu
				pcall(function()
					targetPos = towerInstance:GetPivot().Position
				end)
				if not targetPos and towerInstance:IsA("Model") and towerInstance.PrimaryPart then
					targetPos = towerInstance.PrimaryPart.Position
				end

				if targetPos then
					local bestDist = 5.0
					for id, info in pairs(idToInfo) do
						local xzDist = math.sqrt((info.Position.X - targetPos.X)^2 + (info.Position.Z - targetPos.Z)^2)
						local yDist = math.abs(info.Position.Y - targetPos.Y)
						if xzDist < bestDist and yDist <= 12.0 then
							bestDist = xzDist
							matchedId = id
							towerName = info.TowerName
						end
					end
				end
			end
		end

		if not matchedId then
			matchedId = "T_Sold_" .. tostring(#recordedSteps + 1)
		end

		local posTable: { number }? = nil
		if matchedId and idToInfo[matchedId] then
			local p = idToInfo[matchedId].Position
			posTable = { p.X, p.Y, p.Z }
		elseif targetPos then
			posTable = { targetPos.X, targetPos.Y, targetPos.Z }
		end

		recorder.AddStep("Sell", {
			TowerId = matchedId,
			TowerName = towerName,
			Position = posTable,
			RawData = {
				InstanceName = towerInstance and towerInstance.Name,
			},
		})

		if towerInstance then
			instanceToId[towerInstance] = nil
		end
		if matchedId then
			idToInstance[matchedId] = nil
			idToInfo[matchedId] = nil
		end
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận SellTower:", tostring(err))
	end
end

-- Xử lý ghi nhận UpgradeTower khi Remote được gọi
local function handleUpgradeTower(args: { any }, returnedModel: any)
	local ok, err = pcall(function()
		local towerInstance = typeof(args[1]) == "Instance" and args[1] or nil
		local variantName = type(args[2]) == "string" and args[2] or nil
		local matchedId: string? = nil
		local towerName = "Unknown"
		local targetPos: Vector3? = nil

		if towerInstance then
			towerName = towerInstance.Name
			if instanceToId[towerInstance] then
				matchedId = instanceToId[towerInstance]
			else
				-- Thử tìm theo khoảng cách gần nhất với các tháp đã lưu
				pcall(function()
					targetPos = towerInstance:GetPivot().Position
				end)
				if not targetPos and towerInstance:IsA("Model") and towerInstance.PrimaryPart then
					targetPos = towerInstance.PrimaryPart.Position
				end

				if targetPos then
					local bestDist = 5.0
					for id, info in pairs(idToInfo) do
						local xzDist = math.sqrt((info.Position.X - targetPos.X)^2 + (info.Position.Z - targetPos.Z)^2)
						local yDist = math.abs(info.Position.Y - targetPos.Y)
						if xzDist < bestDist and yDist <= 12.0 then
							bestDist = xzDist
							matchedId = id
							towerName = info.TowerName
						end
					end
				end
			end
		end

		if not matchedId then
			matchedId = "T_Upgraded_" .. tostring(#recordedSteps + 1)
		end

		-- Nếu server trả về Model mới của tháp sau nâng cấp, cập nhật ngay mapping
		if typeof(returnedModel) == "Instance" then
			local m = returnedModel:IsA("Model") and returnedModel or returnedModel:FindFirstAncestorOfClass("Model")
			if m and matchedId then
				instanceToId[m] = matchedId
				idToInstance[matchedId] = m
			end
		end

		local posTable: { number }? = nil
		if matchedId and idToInfo[matchedId] then
			local p = idToInfo[matchedId].Position
			posTable = { p.X, p.Y, p.Z }
		elseif targetPos then
			posTable = { targetPos.X, targetPos.Y, targetPos.Z }
		end

		recorder.AddStep("Upgrade", {
			TowerId = matchedId,
			TowerName = towerName,
			Arg4 = variantName,
			Position = posTable,
			RawData = {
				InstanceName = towerInstance and towerInstance.Name,
				Variant = variantName,
			},
		})
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận UpgradeTower:", tostring(err))
	end
end

-- Xử lý ghi nhận VoteSkip khi Remote được gọi
local function handleVoteSkip()
	local ok, err = pcall(function()
		recorder.AddStep("VoteSkip", {
			TowerId = "SKIP",
			TowerName = "VoteSkip",
			Cost = 0,
		})
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận VoteSkip:", tostring(err))
	end
end

-- Xử lý ghi nhận ChangeTowerMode khi Remote được gọi
local function handleChangeTowerMode(args: { any })
	local ok, err = pcall(function()
		local towerInstance = typeof(args[1]) == "Instance" and args[1] or nil
		local matchedId: string? = nil
		local towerName = "Unknown"
		local targetPos: Vector3? = nil

		if towerInstance then
			towerName = towerInstance.Name
			if instanceToId[towerInstance] then
				matchedId = instanceToId[towerInstance]
			else
				-- Thử tìm theo khoảng cách gần nhất với các tháp đã lưu
				pcall(function()
					targetPos = towerInstance:GetPivot().Position
				end)
				if not targetPos and towerInstance:IsA("Model") and towerInstance.PrimaryPart then
					targetPos = towerInstance.PrimaryPart.Position
				end

				if targetPos then
					local bestDist = 5.0
					for id, info in pairs(idToInfo) do
						local xzDist = math.sqrt((info.Position.X - targetPos.X)^2 + (info.Position.Z - targetPos.Z)^2)
						local yDist = math.abs(info.Position.Y - targetPos.Y)
						if xzDist < bestDist and yDist <= 12.0 then
							bestDist = xzDist
							matchedId = id
							towerName = info.TowerName
						end
					end
				end
			end
		end

		if not matchedId then
			matchedId = "T_Target_" .. tostring(#recordedSteps + 1)
		end

		local posTable: { number }? = nil
		if matchedId and idToInfo[matchedId] then
			local p = idToInfo[matchedId].Position
			posTable = { p.X, p.Y, p.Z }
		elseif targetPos then
			posTable = { targetPos.X, targetPos.Y, targetPos.Z }
		end

		-- Thử đọc thuộc tính TargetMode nếu có
		local targetModeStr: string? = nil
		if towerInstance then
			pcall(function()
				targetModeStr = towerInstance:GetAttribute("TargetMode")
					or towerInstance:GetAttribute("Target")
					or towerInstance:GetAttribute("Mode")
			end)
		end

		recorder.AddStep("Target", {
			TowerId = matchedId,
			TowerName = towerName,
			TargetMode = targetModeStr,
			Position = posTable,
			RawData = {
				InstanceName = towerInstance and towerInstance.Name,
				TargetMode = targetModeStr,
			},
		})
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận ChangeTowerMode:", tostring(err))
	end
end

-- Xử lý ghi nhận đổi Speed trận đấu
local function handleChangeSpeed(args: { any })
	local ok, err = pcall(function()
		local speedArg = args[1]
		local speedNum = tonumber(speedArg)
		if not speedNum then return end

		-- Tránh duplicate nếu spam cùng một tốc độ liên tiếp
		if #recordedSteps > 0 then
			local last = recordedSteps[#recordedSteps]
			if last.Type == "Speed" and last.Speed == speedNum then
				return
			end
		end

		recorder.AddStep("Speed", {
			TowerId = "SPEED",
			TowerName = "GameSpeed",
			Speed = speedNum,
			Cost = 0,
			RawData = {
				Speed = speedNum,
			},
		})
		notifier.Notify("Macro Recorder", string.format("Ghi nhận đổi tốc độ: x%d", speedNum), 1.5)
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận ChangeSpeed:", tostring(err))
	end
end

-- Hook Remote an toàn, không block main thread và không làm biến đổi Namecall register
local isHookInstalled = false
local oldNamecall

local function setupRemoteHook()
	if isHookInstalled then return end

	getRemotes()

	local wrapC = newcclosure or function(f) return f end
	local setnc = setnamecallmethod or function(...) end

	if hookmetamethod then
		isHookInstalled = true
		oldNamecall = hookmetamethod(game, "__namecall", wrapC(function(self, ...)
			local method = getnamecallmethod and getnamecallmethod()
			if isRecording and typeof(self) == "Instance" and method == "InvokeServer" then
				local remoteName = nil
				pcall(function()
					remoteName = self.Name
				end)

				if remoteName == "SpawnTower" or (spawnRemote and self == spawnRemote) then
					if not spawnRemote then spawnRemote = self end
					local args = { ... }
					if setnc and method then setnc(method) end
					local res = table.pack(oldNamecall(self, ...))
					task.spawn(handleSpawnTower, args, res[1])
					return table.unpack(res, 1, res.n)
				elseif remoteName == "SellTower" or (sellRemote and self == sellRemote) then
					if not sellRemote then sellRemote = self end
					local args = { ... }
					task.spawn(handleSellTower, args)
				elseif remoteName == "UpgradeTower" or (upgradeRemote and self == upgradeRemote) then
					if not upgradeRemote then upgradeRemote = self end
					local args = { ... }
					if setnc and method then setnc(method) end
					local res = table.pack(oldNamecall(self, ...))
					task.spawn(handleUpgradeTower, args, res[1])
					return table.unpack(res, 1, res.n)
				elseif remoteName == "ChangeTowerMode" or (changeModeRemote and self == changeModeRemote) then
					if not changeModeRemote then changeModeRemote = self end
					local args = { ... }
					task.spawn(handleChangeTowerMode, args)
				elseif remoteName == "ChangeSpeed" or (changeSpeedRemote and self == changeSpeedRemote) then
					if not changeSpeedRemote then changeSpeedRemote = self end
					local args = { ... }
					task.spawn(handleChangeSpeed, args)
				elseif remoteName == "VoteSkip" or (voteSkipRemote and self == voteSkipRemote) then
					if not voteSkipRemote then voteSkipRemote = self end
					task.spawn(handleVoteSkip)
				end
			end

			if setnc and method then
				setnc(method)
			end
			return oldNamecall(self, ...)
		end))
	elseif hookfunction and spawnRemote and sellRemote then
		isHookInstalled = true
		local oldSpawnInvoke
		oldSpawnInvoke = hookfunction(spawnRemote.InvokeServer, wrapC(function(self, ...)
			if isRecording then
				local args = { ... }
				local res = table.pack(oldSpawnInvoke(self, ...))
				task.spawn(handleSpawnTower, args, res[1])
				return table.unpack(res, 1, res.n)
			end
			return oldSpawnInvoke(self, ...)
		end))

		local oldSellInvoke
		oldSellInvoke = hookfunction(sellRemote.InvokeServer, wrapC(function(self, ...)
			if isRecording then
				local args = { ... }
				task.spawn(handleSellTower, args)
			end
			return oldSellInvoke(self, ...)
		end))

		if upgradeRemote then
			local oldUpgradeInvoke
			oldUpgradeInvoke = hookfunction(upgradeRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					local args = { ... }
					local res = table.pack(oldUpgradeInvoke(self, ...))
					task.spawn(handleUpgradeTower, args, res[1])
					return table.unpack(res, 1, res.n)
				end
				return oldUpgradeInvoke(self, ...)
			end))
		end

		if changeModeRemote then
			local oldChangeModeInvoke
			oldChangeModeInvoke = hookfunction(changeModeRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					local args = { ... }
					task.spawn(handleChangeTowerMode, args)
				end
				return oldChangeModeInvoke(self, ...)
			end))
		end

		if changeSpeedRemote then
			local oldChangeSpeedInvoke
			oldChangeSpeedInvoke = hookfunction(changeSpeedRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					local args = { ... }
					task.spawn(handleChangeSpeed, args)
				end
				return oldChangeSpeedInvoke(self, ...)
			end))
		end

		if voteSkipRemote then
			local oldVoteSkipInvoke
			oldVoteSkipInvoke = hookfunction(voteSkipRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					task.spawn(handleVoteSkip)
				end
				return oldVoteSkipInvoke(self, ...)
			end))
		end
	else
		logger.Warn("[Recorder] Executor không hỗ trợ hookmetamethod hoặc hookfunction!")
	end
end

function recorder.IsRecording(): boolean
	return isRecording
end

function recorder.GetActiveMacro(): string?
	return activeMacroName
end

function recorder.SetActiveMacro(name: string)
	activeMacroName = name
end

function recorder.GetSteps(): { types.MacroStep }
	return recordedSteps
end

function recorder.ClearSteps()
	table.clear(recordedSteps)
	table.clear(instanceToId)
	table.clear(idToInstance)
	table.clear(idToInfo)
	towerIndexCounter = 0
end

-- Bắt đầu ghi lại hành động
function recorder.StartRecording(macroName: string?): boolean
	local targetName = macroName or activeMacroName
	if not targetName or targetName == "" or targetName == "None" then
		notifier.Notify("Macro", "Vui lòng chọn hoặc tạo Macro trước!", 2)
		return false
	end

	activeMacroName = targetName
	recorder.ClearSteps()
	recorder.InitialSpeed = getCurrentGameSpeed()
	isRecording = true
	setupRemoteHook()

	notifier.Notify("Macro", string.format("Bắt đầu Record: %s (Speed ban đầu: x%d)", targetName, recorder.InitialSpeed), 2)
	return true
end

-- Dừng ghi và tự động lưu vào storage
function recorder.StopRecording(): number
	if not isRecording then return 0 end
	isRecording = false

	local count = #recordedSteps
	if activeMacroName and count > 0 then
		local existing = storage.GetMacro(activeMacroName) or storage.CreateMacro(activeMacroName)
		existing.Steps = recordedSteps
		existing.Metadata.TotalSteps = count
		existing.Metadata.TotalDuration = gameStats.GetElapsedTime()
		existing.Metadata.InitialSpeed = recorder.InitialSpeed or 1
		storage.SaveMacro(activeMacroName, existing)
		notifier.Notify("Macro", string.format("Đã lưu %d bước vào '%s' (Speed x%d)!", count, activeMacroName, existing.Metadata.InitialSpeed or 1), 2.5)
	else
		notifier.Notify("Macro", "Đã dừng Record (0 bước)", 2)
	end

	return count
end

lifecycle.Register(function()
	if isRecording then
		recorder.StopRecording()
	end
end)

return recorder
