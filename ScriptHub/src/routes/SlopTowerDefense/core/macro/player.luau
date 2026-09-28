-- Player: Module tái hiện (Playback) các thao tác SpawnTower và SellTower từ file Macro đã ghi.
local types = require("./types")
local storage = require("./storage")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")

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
	if not spawnRemote or not sellRemote or not upgradeRemote or not changeModeRemote or not changeSpeedRemote then
		local functions = ReplicatedStorage:FindFirstChild("Functions")
		if functions then
			spawnRemote = functions:FindFirstChild("SpawnTower") :: RemoteFunction?
			sellRemote = functions:FindFirstChild("SellTower") :: RemoteFunction?
			upgradeRemote = functions:FindFirstChild("UpgradeTower") :: RemoteFunction?
			changeModeRemote = functions:FindFirstChild("ChangeTowerMode") :: RemoteFunction?
			changeSpeedRemote = functions:FindFirstChild("ChangeSpeed") :: RemoteFunction?
		end
	end
	return spawnRemote, sellRemote, upgradeRemote, changeModeRemote, changeSpeedRemote
end

-- Tìm Model tháp trong workspace gần tọa độ
local function findTowerNearPosition(name: string?, targetPos: Vector3, maxDist: number?): Model?
	maxDist = maxDist or 3.5
	local bestModel: Model? = nil
	local bestDist = maxDist

	local searchContainers = {
		workspace:FindFirstChild("Towers"),
		workspace:FindFirstChild("PlacedTowers"),
		workspace:FindFirstChild("Units"),
		workspace,
	}

	for _, container in ipairs(searchContainers) do
		if container then
			for _, child in ipairs(container:GetChildren()) do
				if child:IsA("Model") then
					local pos: Vector3? = nil
					if child.PrimaryPart then
						pos = child.PrimaryPart.Position
					else
						pcall(function()
							pos = child:GetPivot().Position
						end)
					end

					if pos then
						local dist = (pos - targetPos).Magnitude
						if dist < bestDist then
							if not name or child.Name:lower():find(name:lower()) then
								bestDist = dist
								bestModel = child
							end
						end
					end
				end
			end
		end
		if bestModel then break end
	end

	return bestModel
end

-- Thực thi lệnh đặt tháp (SpawnTower)
function player.PlaceTower(towerName: string, cf: CFrame, arg3: boolean?, arg4: string?, arg5: { any }?): (boolean, Instance?)
	local sRemote, _ = getRemotes()
	if not sRemote then
		warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.SpawnTower")
		return false, nil
	end

	arg3 = arg3 == true
	arg4 = arg4 or towerName
	arg5 = arg5 or {}

	local success, result = pcall(function()
		return sRemote:InvokeServer(towerName, cf, arg3, arg4, arg5)
	end)

	if not success then
		warn("[Macro Player] Lỗi gọi SpawnTower:", tostring(result))
		return false, nil
	end

	if result == false then
		return false, nil
	end

	local spawnedInstance: Instance? = nil
	if typeof(result) == "Instance" then
		spawnedInstance = result
	else
		-- Chờ ngắn và tìm model vừa xuất hiện ở vị trí đặt (thử tối đa 8 lần)
		for _ = 1, 8 do
			task.wait(0.15)
			spawnedInstance = findTowerNearPosition(towerName, cf.Position)
			if spawnedInstance then break end
		end
	end

	return true, spawnedInstance
end

-- Thực thi lệnh bán tháp (SellTower)
function player.SellTower(target: Instance): boolean
	local _, selRemote = getRemotes()
	if not selRemote then
		warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.SellTower")
		return false
	end

	if not target or not target.Parent then
		warn("[Macro Player] Tháp mục tiêu để bán không tồn tại hoặc đã bị hủy!")
		return false
	end

	local success, err = pcall(function()
		return selRemote:InvokeServer(target)
	end)

	if not success then
		warn("[Macro Player] Lỗi gọi SellTower:", tostring(err))
		return false
	end

	return true
end

-- Thực thi lệnh nâng cấp tháp (UpgradeTower)
function player.UpgradeTower(target: Instance, variantName: string?): boolean
	local _, _, upRemote = getRemotes()
	if not upRemote then
		warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.UpgradeTower")
		return false
	end

	if not target or not target.Parent then
		warn("[Macro Player] Tháp mục tiêu để nâng cấp không tồn tại hoặc đã bị hủy!")
		return false
	end

	variantName = variantName or target.Name

	local success, result = pcall(function()
		return upRemote:InvokeServer(target, variantName)
	end)

	if not success then
		warn("[Macro Player] Lỗi gọi UpgradeTower:", tostring(result))
		return false
	end

	if result == false then
		return false
	end

	return true
end

-- Thực thi lệnh đổi chế độ ngắm bắn của tháp (ChangeTowerMode)
function player.ChangeTowerMode(target: Instance): boolean
	local _, _, _, modeRemote = getRemotes()
	if not modeRemote then
		warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.ChangeTowerMode")
		return false
	end

	if not target or not target.Parent then
		warn("[Macro Player] Tháp mục tiêu để đổi Target không tồn tại hoặc đã bị hủy!")
		return false
	end

	local success, result = pcall(function()
		return modeRemote:InvokeServer(target)
	end)

	if not success then
		warn("[Macro Player] Lỗi gọi ChangeTowerMode:", tostring(result))
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
		warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.ChangeSpeed")
		return false
	end

	local success, result = pcall(function()
		return csRemote:InvokeServer(speedNum)
	end)

	if not success then
		warn("[Macro Player] Lỗi gọi ChangeSpeed:", tostring(result))
		return false
	end

	if result == false then
		return false
	end

	return true
end

-- Thực thi 1 bước cụ thể
function player.ExecuteStep(step: types.MacroStep): boolean
	if step.Type == "Place" then
		if not step.CFrame then
			warn("[Macro Player] Bước Place thiếu dữ liệu CFrame!")
			return false
		end

		local cf = CFrame.new(table.unpack(step.CFrame))
		local ok, inst = player.PlaceTower(step.TowerName, cf, step.Arg3, step.Arg4, step.Arg5)
		if ok then
			if inst then
				idToTowerInstance[step.TowerId] = inst
			end
			notifier.Notify("Macro Play", string.format("Placed %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
			return true
		end

	elseif step.Type == "Sell" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			-- Thử tìm lại theo vị trí nếu có
			if step.Position then
				local pos = Vector3.new(step.Position[1], step.Position[2], step.Position[3])
				inst = findTowerNearPosition(step.TowerName, pos)
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
			warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để bán!", step.TowerId))
		end

	elseif step.Type == "Upgrade" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			-- Thử tìm lại theo vị trí nếu có
			if step.Position then
				local pos = Vector3.new(step.Position[1], step.Position[2], step.Position[3])
				inst = findTowerNearPosition(step.TowerName, pos)
			end
		end

		if inst then
			local variant = step.Arg4 or inst.Name
			local ok = player.UpgradeTower(inst, variant)
			if ok then
				notifier.Notify("Macro Play", string.format("Upgraded %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
				return true
			end
		else
			warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để nâng cấp!", step.TowerId))
		end

	elseif step.Type == "Target" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			-- Thử tìm lại theo vị trí nếu có
			if step.Position then
				local pos = Vector3.new(step.Position[1], step.Position[2], step.Position[3])
				inst = findTowerNearPosition(step.TowerName, pos)
			end
		end

		if inst then
			local ok = player.ChangeTowerMode(inst)
			if ok then
				notifier.Notify("Macro Play", string.format("Changed Target: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
				return true
			end
		else
			warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để đổi Target!", step.TowerId))
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
					local curWave, _ = gameStats.GetWave()
					local curCash = gameStats.GetCash()
					local curTime = gameStats.GetElapsedTime()

					local waveMet = curWave >= step.Wave

					local requirementMet = false
					if timingMode == "Cash (Timed Sell)" then
						if step.Type == "Sell" then
							-- Sell: Bắt buộc đúng thời gian ghi nhận (không bán sớm trước giờ)
							requirementMet = waveMet and curTime >= step.Time
						elseif step.Type == "Target" then
							-- Target: Thuần theo nhịp trận, đổi ngay khi đạt Wave
							requirementMet = waveMet
						elseif step.Type == "Speed" then
							requirementMet = waveMet and (curWave > step.Wave or curTime >= step.Time)
						else
							-- Place / Upgrade: Thuần theo CASH (đủ tiền là đặt/nâng ngay)
							local cost = step.Cost or 0
							requirementMet = waveMet and curCash >= cost
						end
					elseif step.Type == "Sell" or step.Type == "Target" or step.Type == "Speed" then
						requirementMet = waveMet and (curWave > step.Wave or curTime >= step.Time)
					else
						local cost = step.Cost or 0
						if timingMode == "Timer" then
							requirementMet = waveMet and curTime >= step.Time
						elseif timingMode == "Wave & Cash" then
							requirementMet = waveMet and curCash >= cost
						else
							-- Hybrid (Mặc định): Đủ tiền HOẶC đã chạm mốc thời gian ghi nhận
							local hasCash = cost == 0 or curCash >= cost
							local timePassed = curTime >= step.Time
							requirementMet = waveMet and (hasCash or timePassed)
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

				-- Thực thi bước i
				updateStatus(string.format("Executing Step %d/%d...", i, totalSteps), nextDesc)

				local execOk = false
				for attempt = 1, 3 do
					if not isEnabled or not gameStats.IsMatchActive() then break end
					execOk = player.ExecuteStep(step)
					if execOk then break end
					task.wait(0.3)
				end

				currentStepIndex = i
				task.wait(math.max(0.02, stepDelay))
			end

			if isEnabled and currentStepIndex >= totalSteps then
				updateStatus(string.format("Completed (%d/%d steps)", totalSteps, totalSteps), "All done")
				notifier.Notify("Macro Player", string.format("Hoàn thành Macro: %s!", macroName), 3)
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
