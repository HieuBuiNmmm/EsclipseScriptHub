-- Player: Module tái hiện (Playback) các thao tác SpawnTower và SellTower từ file Macro đã ghi.
local types = require("./types")
local storage = require("./storage")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

export type PlaybackSnapshot = {
	IsEnabled: boolean,
	IsPlaying: boolean,
	MacroName: string?,
	CurrentStep: number,
	TotalSteps: number,
	NextAction: string,
	StatusText: string,
	TimingMode: string,
	StepDelay: number,
	ApplySpeed: boolean,
}

local player = {}

local isEnabled = false
local isPlaying = false
local activeMacroName: string? = nil
local currentStepIndex = 0
local totalSteps = 0
local timingMode = "Hybrid" -- "Hybrid" | "Timer" | "Wave & Cash"
local stepDelay = 0.1 -- Khoảng trễ (giây) sau khi thực hiện mỗi bước
local applyMacroSpeed = true -- Bật/Tắt đồng bộ hóa Speed theo Macro
local activePlaybackThread: thread? = nil

-- Ánh xạ giữa TowerId ("T1", "T2") và Instance tháp trong ván đấu hiện tại
local idToTowerInstance: { [string]: Instance } = {}

-- Tham chiếu RemoteFunction
local spawnRemote: RemoteFunction? = nil
local sellRemote: RemoteFunction? = nil
local upgradeRemote: RemoteFunction? = nil
local changeModeRemote: RemoteFunction? = nil
local changeSpeedRemote: RemoteFunction? = nil
local voteSkipRemote: RemoteFunction? = nil

local currentSnapshot: PlaybackSnapshot = {
	IsEnabled = false,
	IsPlaying = false,
	MacroName = nil,
	CurrentStep = 0,
	TotalSteps = 0,
	NextAction = "None",
	StatusText = "Idle",
	TimingMode = "Hybrid",
	StepDelay = 0.1,
	ApplySpeed = true,
}

local subscribers: { (PlaybackSnapshot) -> () } = {}

local function notifySubscribers()
	currentSnapshot.IsEnabled = isEnabled
	currentSnapshot.IsPlaying = isPlaying
	currentSnapshot.MacroName = activeMacroName
	currentSnapshot.CurrentStep = currentStepIndex
	currentSnapshot.TotalSteps = totalSteps
	currentSnapshot.TimingMode = timingMode
	currentSnapshot.StepDelay = stepDelay
	currentSnapshot.ApplySpeed = applyMacroSpeed

	for _, sub in ipairs(subscribers) do
		pcall(sub, currentSnapshot)
	end
end

local function updateStatus(statusText: string, nextAction: string?)
	currentSnapshot.StatusText = statusText
	if nextAction then
		currentSnapshot.NextAction = nextAction
	end
	notifySubscribers()
end

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
	local playerInstance = Players.LocalPlayer
	local playerGui = playerInstance and playerInstance:FindFirstChild("PlayerGui")
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

-- Kiểm tra xem Model tháp đã được gán cho bất kỳ TowerId nào chưa
local function isInstanceClaimed(inst: Instance): boolean
	for _, mapped in pairs(idToTowerInstance) do
		if mapped == inst then
			return true
		end
	end
	return false
end

-- Tìm Model tháp trong workspace gần tọa độ (ưu tiên khoảng cách ngang XZ và hỗ trợ variant/skin)
local function findTowerNearPosition(name: string?, targetPos: Vector3, maxHorizontalDist: number?, excludeClaimed: boolean?, variantName: string?): Model?
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
			if excludeClaimed and isInstanceClaimed(child) then return end

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
					-- Khác tên nhưng nằm cực gần vị trí đặt và chưa bị tháp nào nhận
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

-- Thực thi lệnh đặt tháp (SpawnTower) với cơ chế xác thực đa tầng thông minh
function player.PlaceTower(towerName: string, cf: CFrame, arg3: boolean?, arg4: string?, arg5: { any }?): (boolean, Instance?)
	local sRemote, _ = getRemotes()
	if not sRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.SpawnTower")
		return false, nil
	end

	arg3 = arg3 == true
	arg4 = arg4 or towerName
	arg5 = arg5 or {}

	-- 1. Tiền kiểm tra (Pre-check): Nếu đã có tháp tại vị trí này (từ lần gọi trước hoặc lag), nhận luôn!
	local existing = findTowerNearPosition(towerName, cf.Position, 3.5, true, arg4)
	if existing then
		logger.Log(string.format("[Macro Player] Tháp %s đã tồn tại sẵn tại vị trí (%.1f, %.1f), nhận diện ngay lập tức.",
			towerName, cf.Position.X, cf.Position.Z))
		return true, existing
	end

	local oldCash = gameStats.GetCash()

	local success, result = pcall(function()
		return sRemote:InvokeServer(towerName, cf, arg3, arg4, arg5)
	end)

	if not success then
		logger.Warn("[Macro Player] Lỗi gọi SpawnTower:", tostring(result))
		return false, nil
	end

	-- Nếu server trả về false, kiểm tra xem có phải do tháp đã xuất hiện khiến server báo trùng chỗ không
	if result == false then
		task.wait(0.1)
		local checkAgain = findTowerNearPosition(towerName, cf.Position, 3.5, true, arg4)
		if checkAgain then
			return true, checkAgain
		end
		return false, nil
	end

	-- 2. Xác thực cấp 1: Remote trả về trực tiếp Instance Model hợp lệ (như trích xuất Cobalt xác nhận)
	if typeof(result) == "Instance" then
		local modelInst: Model? = result:IsA("Model") and result or result:FindFirstAncestorOfClass("Model")
		if modelInst then
			-- Chờ tối đa 0.4s nếu Parent chưa kịp replicate vào workspace.Towers
			if not modelInst.Parent then
				local tEnd = os.clock() + 0.4
				while not modelInst.Parent and os.clock() < tEnd do
					task.wait(0.05)
				end
			end
			return true, modelInst
		end
	end

	-- 3. Xác thực cấp 2: Quét Workspace tìm Model mới xuất hiện tại vị trí đặt
	for _ = 1, 8 do
		task.wait(0.15)
		local spawnedInstance = findTowerNearPosition(towerName, cf.Position, 4.0, true, arg4)
		if spawnedInstance then
			return true, spawnedInstance
		end
	end

	-- 4. Xác thực cấp 3: Kiểm tra biến động tiền (Cash Deduction Guard)
	local currentCash = gameStats.GetCash()
	local cashDecreased = (currentCash < oldCash)

	if cashDecreased or result == true then
		-- Chờ thêm chút để Model kịp replicate sang client
		for _ = 1, 6 do
			task.wait(0.2)
			local spawnedInstance = findTowerNearPosition(towerName, cf.Position, 4.5, true, arg4)
			if spawnedInstance then
				return true, spawnedInstance
			end
		end

		-- Dù Model replicate chậm, nhưng tiền ĐÃ TRỪ hoặc Remote ĐÃ TRẢ VỀ TRUE -> Chắc chắn server đã tạo tháp!
		-- Trả về true để không retry đè vị trí, để background thread tiếp tục dò Model
		logger.Log(string.format("[Macro Player] SpawnTower %s thành công (tiền giảm: %d -> %d), đang đợi Model hiển thị.",
			towerName, oldCash, currentCash))
		return true, nil
	end

	logger.Warn(string.format("[Macro Player] Xác thực Spawn thất bại cho %s tại vị trí (%.1f, %.1f, %.1f) - không tìm thấy Model và không trừ tiền!",
		towerName, cf.Position.X, cf.Position.Y, cf.Position.Z))
	return false, nil
end

-- Thực thi lệnh bán tháp (SellTower)
function player.SellTower(target: Instance): boolean
	local _, selRemote = getRemotes()
	if not selRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.SellTower")
		return false
	end

	if not target or not target.Parent then
		logger.Warn("[Macro Player] Tháp mục tiêu để bán không tồn tại hoặc đã bị hủy!")
		return false
	end

	local success, err = pcall(function()
		return selRemote:InvokeServer(target)
	end)

	if not success then
		logger.Warn("[Macro Player] Lỗi gọi SellTower:", tostring(err))
		return false
	end

	return true
end

-- Thực thi lệnh nâng cấp tháp (UpgradeTower)
function player.UpgradeTower(target: Instance, variantName: string?): (boolean, Instance?)
	local _, _, upRemote = getRemotes()
	if not upRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.UpgradeTower")
		return false, nil
	end

	if not target or not target.Parent then
		logger.Warn("[Macro Player] Tháp mục tiêu để nâng cấp không tồn tại hoặc đã bị hủy!")
		return false, nil
	end

	variantName = variantName or target.Name

	local success, result = pcall(function()
		return upRemote:InvokeServer(target, variantName)
	end)

	if not success then
		logger.Warn("[Macro Player] Lỗi gọi UpgradeTower:", tostring(result))
		return false, nil
	end

	if result == false or result == nil then
		return false, nil
	end

	local updatedModel: Instance? = nil
	if typeof(result) == "Instance" then
		updatedModel = result:IsA("Model") and result or result:FindFirstAncestorOfClass("Model")
	end

	return true, updatedModel or target
end

-- Thực thi lệnh đổi chế độ ngắm bắn của tháp (ChangeTowerMode)
function player.ChangeTowerMode(target: Instance): boolean
	local _, _, _, modeRemote = getRemotes()
	if not modeRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.ChangeTowerMode")
		return false
	end

	if not target or not target.Parent then
		logger.Warn("[Macro Player] Tháp mục tiêu để đổi Target không tồn tại hoặc đã bị hủy!")
		return false
	end

	local success, result = pcall(function()
		return modeRemote:InvokeServer(target)
	end)

	if not success then
		logger.Warn("[Macro Player] Lỗi gọi ChangeTowerMode:", tostring(result))
		return false
	end

	if result == false then
		return false
	end

	return true
end

-- Thay đổi tốc độ trận đấu
function player.ChangeSpeed(speedNum: number): boolean
	local _, _, _, _, csRemote = getRemotes()
	if not csRemote then
		csRemote = ReplicatedStorage:FindFirstChild("ChangeSpeed", true) :: RemoteFunction?
	end

	if not csRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.ChangeSpeed")
		return false
	end

	local success, result = pcall(function()
		return csRemote:InvokeServer(speedNum)
	end)

	if not success then
		logger.Warn("[Macro Player] Lỗi gọi ChangeSpeed:", tostring(result))
		return false
	end

	if result == false then
		return false
	end

	return true
end

-- Bỏ phiếu Skip Wave (VoteSkip)
function player.VoteSkip(): boolean
	local _, _, _, _, _, vsRemote = getRemotes()
	if not vsRemote then
		vsRemote = ReplicatedStorage:FindFirstChild("VoteSkip", true) :: RemoteFunction?
	end

	if not vsRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.VoteSkip")
		return false
	end

	local success, result = pcall(function()
		return vsRemote:InvokeServer()
	end)

	if not success then
		logger.Warn("[Macro Player] Lỗi gọi VoteSkip:", tostring(result))
		return false
	end

	return true
end

-- Thực thi 1 bước cụ thể
function player.ExecuteStep(step: types.MacroStep): boolean
	if step.Type == "Place" then
		if not step.CFrame then
			logger.Warn("[Macro Player] Bước Place thiếu dữ liệu CFrame!")
			return false
		end

		local cf = CFrame.new(table.unpack(step.CFrame))
		local ok, inst = player.PlaceTower(step.TowerName, cf, step.Arg3, step.Arg4, step.Arg5)
		if ok then
			if inst and inst.Parent then
				idToTowerInstance[step.TowerId] = inst
			else
				-- Nếu Model chưa kịp replicate, task nền sẽ tự động tìm và bind ngay khi xuất hiện
				task.spawn(function()
					for _ = 1, 30 do
						task.wait(0.3)
						if not isEnabled or not isPlaying then break end
						local found = findTowerNearPosition(step.TowerName, cf.Position, 4.5, true, step.Arg4)
						if found then
							idToTowerInstance[step.TowerId] = found
							break
						end
					end
				end)
			end
			notifier.Notify("Macro Play", string.format("Placed %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
			return true
		end

		return false

	elseif step.Type == "Sell" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			local pos = step.Position and Vector3.new(step.Position[1], step.Position[2], step.Position[3])
			for _ = 1, 5 do
				inst = idToTowerInstance[step.TowerId]
				if (not inst or not inst.Parent) and pos then
					inst = findTowerNearPosition(step.TowerName, pos, 4.5, false, step.Arg4)
				end
				if inst and inst.Parent then
					idToTowerInstance[step.TowerId] = inst
					break
				end
				task.wait(0.15)
			end
		end

		if inst then
			local ok = player.SellTower(inst)
			if ok then
				idToTowerInstance[step.TowerId] = nil
				notifier.Notify("Macro Play", string.format("Sold %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
				return true
			end
		else
			logger.Warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để bán!", step.TowerId))
		end

	elseif step.Type == "Upgrade" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			local pos = step.Position and Vector3.new(step.Position[1], step.Position[2], step.Position[3])
			for _ = 1, 5 do
				inst = idToTowerInstance[step.TowerId]
				if (not inst or not inst.Parent) and pos then
					inst = findTowerNearPosition(step.TowerName, pos, 4.5, false, step.Arg4)
				end
				if inst and inst.Parent then
					idToTowerInstance[step.TowerId] = inst
					break
				end
				task.wait(0.15)
			end
		end

		if inst then
			local variant = step.Arg4 or inst.Name
			local ok, updatedInst = player.UpgradeTower(inst, variant)
			if ok then
				if updatedInst and updatedInst:IsA("Model") and updatedInst.Parent ~= nil then
					idToTowerInstance[step.TowerId] = updatedInst
				end
				notifier.Notify("Macro Play", string.format("Upgraded %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
				return true
			end
		else
			logger.Warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để nâng cấp!", step.TowerId))
		end

	elseif step.Type == "Target" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			local pos = step.Position and Vector3.new(step.Position[1], step.Position[2], step.Position[3])
			for _ = 1, 5 do
				inst = idToTowerInstance[step.TowerId]
				if (not inst or not inst.Parent) and pos then
					inst = findTowerNearPosition(step.TowerName, pos, 4.5, false, step.Arg4)
				end
				if inst and inst.Parent then
					idToTowerInstance[step.TowerId] = inst
					break
				end
				task.wait(0.15)
			end
		end

		if inst then
			local ok = player.ChangeTowerMode(inst)
			if ok then
				notifier.Notify("Macro Play", string.format("Changed Target: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
				return true
			end
		else
			logger.Warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để đổi Target!", step.TowerId))
		end

	elseif step.Type == "Speed" then
		if not applyMacroSpeed then
			return true
		end
		local speedNum = step.Speed or 1
		local ok = player.ChangeSpeed(speedNum)
		if ok then
			notifier.Notify("Macro Play", string.format("Đã đổi Speed sang: x%d [%.2fs]", speedNum, step.Time), 1.5)
			return true
		end

	elseif step.Type == "VoteSkip" then
		local ok = player.VoteSkip()
		if ok then
			notifier.Notify("Macro Play", string.format("Vote Skip Wave [%.2fs]", step.Time), 1.5)
			return true
		end
	end

	return false
end

-- Vòng lặp quản lý Playback tự động xuyên suốt các ván đấu
local function startRunnerLoop()
	if activePlaybackThread then
		pcall(task.cancel, activePlaybackThread)
		activePlaybackThread = nil
	end

	activePlaybackThread = task.spawn(function()
		while isEnabled do
			-- 1. Kiểm tra đã ở trong ván đấu chưa
			if not zoneGuard.IsInGame() then
				isPlaying = false
				updateStatus("Waiting for in-game...", "None")
				task.wait(1.0)
				continue
			end

			-- 2. Kiểm tra trận đấu đã bắt đầu chưa (Timer đếm, wave >= 1)
			if not gameStats.IsMatchActive() then
				isPlaying = false
				updateStatus("Waiting for match to start...", "None")
				task.wait(0.5)
				continue
			end

			-- 3. Kiểm tra macro được chọn
			local macroName = activeMacroName
			if not macroName or macroName == "" or macroName == "None" then
				isPlaying = false
				updateStatus("No macro selected!", "None")
				task.wait(1.0)
				continue
			end

			local macroData = storage.GetMacro(macroName)
			if not macroData or not macroData.Steps or #macroData.Steps == 0 then
				isPlaying = false
				updateStatus("Macro is empty!", "None")
				task.wait(1.0)
				continue
			end

			-- 4. Bắt đầu phiên Playback cho ván đấu này
			isPlaying = true
			currentStepIndex = 0
			totalSteps = #macroData.Steps
			table.clear(idToTowerInstance)

			-- Khôi phục tốc độ ban đầu của Macro nếu bật đồng bộ Speed
			if applyMacroSpeed then
				local initialSpeed = (macroData.Metadata and macroData.Metadata.InitialSpeed) or 1
				player.ChangeSpeed(initialSpeed)
				notifier.Notify("Macro Player", string.format("Bắt đầu Play: %s (Speed ban đầu: x%d, %d bước)", macroName, initialSpeed, totalSteps), 2.5)
			else
				notifier.Notify("Macro Player", string.format("Bắt đầu Play: %s (%d bước, bỏ qua Speed)", macroName, totalSteps), 2.5)
			end

			-- Khởi tạo đồng hồ thời gian ảo (Virtual Elapsed Time) tự động co giãn theo tốc độ trận đấu
			local macroBaseSpeed = (macroData.Metadata and macroData.Metadata.InitialSpeed) or 1
			if macroBaseSpeed <= 0 then macroBaseSpeed = 1 end

			local startPlaySpeed = getCurrentGameSpeed()
			if startPlaySpeed <= 0 then startPlaySpeed = 1 end

			local lastTickClock = os.clock()
			local realElapsedOnStart = gameStats.GetElapsedTime()
			local virtualElapsedTime = realElapsedOnStart * (startPlaySpeed / macroBaseSpeed)

			for i, step in ipairs(macroData.Steps) do
				if not isEnabled or not isPlaying then break end
				if not gameStats.IsMatchActive() then
					updateStatus("Match ended early", "None")
					break
				end

				-- Nếu step là Speed nhưng người dùng tắt Apply Macro Speed -> Bỏ qua
				if step.Type == "Speed" and not applyMacroSpeed then
					continue
				end

				currentStepIndex = i - 1
				local nextDesc = string.format("%s %s (%s) [W%d - %.2fs]", step.Type, step.TowerName, step.TowerId, step.Wave, step.Time)
				updateStatus(string.format("Waiting for Step %d/%d (Wave %d)", i, totalSteps, step.Wave), nextDesc)

				-- Chờ điều kiện thực thi bước i
				local canExecute = false
				while isEnabled and isPlaying and gameStats.IsMatchActive() do
					-- Tích lũy Virtual Elapsed Time theo nhịp thực tế và tốc độ game hiện tại
					local now = os.clock()
					local dt = now - lastTickClock
					lastTickClock = now

					local curPlaySpeed = getCurrentGameSpeed()
					if curPlaySpeed <= 0 then curPlaySpeed = 1 end

					local stepRecordSpeed = step.RecordSpeed or macroBaseSpeed
					if stepRecordSpeed <= 0 then stepRecordSpeed = 1 end

					-- Co giãn thời gian: Tốc độ hiện tại càng cao thì đồng hồ ảo chạy càng nhanh tương ứng
					virtualElapsedTime += dt * (curPlaySpeed / stepRecordSpeed)

					local curWave, _ = gameStats.GetWave()
					local curCash = gameStats.GetCash()

					local waveMet = curWave >= step.Wave
					local timePassed = virtualElapsedTime >= step.Time

					-- Giá tiền thực tế (ưu tiên TowerCost nếu có, nếu không thì dùng Cost làm mốc tham khảo)
					local cost = step.TowerCost or step.Cost or 0
					local hasCash = (cost == 0 or curCash >= cost)

					local requirementMet = false
					if timingMode == "Cash (Timed Sell)" then
						if step.Type == "Sell" then
							-- Sell: Bắt buộc đúng thời gian co giãn tương đương
							requirementMet = waveMet and timePassed
						elseif step.Type == "Target" then
							-- Target: Thuần theo nhịp trận, đổi ngay khi đạt Wave
							requirementMet = waveMet
						elseif step.Type == "Speed" or step.Type == "VoteSkip" then
							requirementMet = waveMet and (curWave > step.Wave or timePassed)
						else
							-- Place / Upgrade: Đủ tiền là đặt/nâng ngay
							requirementMet = waveMet and hasCash
						end
					elseif step.Type == "Sell" or step.Type == "Target" or step.Type == "Speed" or step.Type == "VoteSkip" then
						requirementMet = waveMet and (curWave > step.Wave or timePassed)
					else
						if timingMode == "Timer" then
							-- Chế độ Timer: Thực thi chuẩn xác theo nhịp thời gian
							requirementMet = waveMet and timePassed
						elseif timingMode == "Wave & Cash" then
							requirementMet = waveMet and hasCash
						else
							-- Hybrid (Mặc định):
							-- Đạt Wave VÀ (Đã tới mốc thời gian HOẶC tiền hiện tại đã đạt mốc ghi nhận)
							-- Không bao giờ để mốc tiền làm nghẽn nếu thời gian đã trôi qua!
							if step.Type == "Place" or step.Type == "Upgrade" then
								requirementMet = waveMet and (timePassed or (cost > 0 and curCash >= cost))
							else
								requirementMet = waveMet and (hasCash or timePassed)
							end
						end
					end

					if requirementMet then
						canExecute = true
						break
					end

					task.wait(0.05)
				end

				if not canExecute or not isEnabled or not isPlaying or not gameStats.IsMatchActive() then
					break
				end

				-- Thực thi bước i với cơ chế Smart Retry
				updateStatus(string.format("Executing Step %d/%d...", i, totalSteps), nextDesc)

				local execOk = false
				local maxAttempts = (step.Type == "Place") and 5 or 3

				for attempt = 1, maxAttempts do
					if not isEnabled or not gameStats.IsMatchActive() then break end

					if attempt > 1 then
						updateStatus(string.format("Retrying %s %s (lần %d/%d)...", step.Type, step.TowerName, attempt, maxAttempts), nextDesc)
					end

					execOk = player.ExecuteStep(step)
					if execOk then break end

					task.wait(0.35)
				end

				if not execOk then
					logger.Warn(string.format("[Macro Player] Thất bại thực thi Step %d (%s %s) sau %d lần thử!", i, step.Type, step.TowerName, maxAttempts))
					if step.Type == "Place" then
						notifier.Notify("Macro Player", string.format("⚠️ Không thể đặt %s (%s) sau %d lần thử!", step.TowerName, step.TowerId, maxAttempts), 3)
					end
				end

				currentStepIndex = i
				task.wait(math.max(0.02, stepDelay))
			end

			if isEnabled and currentStepIndex >= totalSteps then
				updateStatus(string.format("Completed (%d/%d steps)", totalSteps, totalSteps), "All done")
				notifier.Notify("Macro Player", string.format("Hoàn thành Macro: %s!", macroName), 3)
				pcall(function()
					local webhook = require("@routes/SlopTowerDefense/core/system/webhook")
					webhook.SendMacro(macroName, totalSteps, "Completed")
				end)
			end

			isPlaying = false

			-- Chờ trận đấu hiện tại kết thúc hẳn trước khi lặp lại ở ván tiếp theo
			while isEnabled and gameStats.IsMatchActive() do
				task.wait(1.0)
			end

			updateStatus("Match finished. Waiting for next match...", "None")
			task.wait(2.0)
		end

		isPlaying = false
		currentStepIndex = 0
		updateStatus("Idle", "None")
	end)
end

function player.IsEnabled(): boolean
	return isEnabled
end

function player.SetEnabled(state: boolean)
	if isEnabled == state then return end
	isEnabled = state

	if isEnabled then
		startRunnerLoop()
	else
		player.Stop()
	end
end

function player.IsPlaying(): boolean
	return isPlaying
end

function player.GetActiveMacro(): string?
	return activeMacroName
end

function player.SetActiveMacro(name: string)
	activeMacroName = name
	currentSnapshot.MacroName = name
	notifySubscribers()
end

function player.GetTimingMode(): string
	return timingMode
end

function player.SetTimingMode(mode: string)
	timingMode = mode
	currentSnapshot.TimingMode = mode
	notifySubscribers()
end

function player.GetStepDelay(): number
	return stepDelay
end

function player.SetStepDelay(delaySec: number)
	stepDelay = math.clamp(delaySec, 0, 5)
	currentSnapshot.StepDelay = stepDelay
	notifySubscribers()
end

function player.IsSpeedSyncEnabled(): boolean
	return applyMacroSpeed
end

function player.SetSpeedSync(enabled: boolean)
	applyMacroSpeed = enabled
	currentSnapshot.ApplySpeed = enabled
	notifySubscribers()
end

function player.GetCurrentStepIndex(): number
	return currentStepIndex
end

function player.GetTotalSteps(): number
	return totalSteps
end

function player.GetStatus(): PlaybackSnapshot
	return currentSnapshot
end

function player.Restart()
	if not isEnabled then return end
	table.clear(idToTowerInstance)
	currentStepIndex = 0
	isPlaying = false
	startRunnerLoop()
end

function player.Stop()
	isEnabled = false
	isPlaying = false
	currentStepIndex = 0
	table.clear(idToTowerInstance)
	if activePlaybackThread then
		pcall(task.cancel, activePlaybackThread)
		activePlaybackThread = nil
	end
	updateStatus("Idle", "None")
end

function player.Subscribe(callback: (PlaybackSnapshot) -> ()): () -> ()
	table.insert(subscribers, callback)
	pcall(callback, currentSnapshot)

	return function()
		local idx = table.find(subscribers, callback)
		if idx then
			table.remove(subscribers, idx)
		end
	end
end

lifecycle.Register(function()
	player.Stop()
end)

return player
