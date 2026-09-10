-- Smart Dodge – Module 6: Engine Orchestrator (DungeonQuest).
-- Chuyên trách: kết nối Detection + SafeSpot + Dodge. Vòng lặp đánh giá nguy hiểm theo thời
-- gian thực (safe spot loop), quản lý vòng đời engine (Start/Stop/Toggle), trạng thái danger
-- hiện tại, fire callbacks SafeSpotChanged, coordinator.Register + dodge runtime bơm cho Module 5.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local coordinator = require("@routes/DungeonQuest/core/coordinator")
local detection = require("@routes/DungeonQuest/core/smartDodge/detection")
local geometry = require("@routes/DungeonQuest/core/smartDodge/geometry")
local safeSpot = require("@routes/DungeonQuest/core/smartDodge/safeSpot")
local dodge = require("@routes/DungeonQuest/core/smartDodge/dodge")

--// Bơm data hiểm họa cho module Geometry (đứt vòng phụ thuộc — geometry không require detection).
geometry.BindDetection({
	GetActiveHazardsMap = detection.GetActiveHazardsMap,
	GetLockedProjectiles = detection.GetLockedProjectiles,
	GetTrajectoryConfigForPart = detection.GetTrajectoryConfigForPart,
	LockTrajectoryForPart = detection.LockTrajectoryForPart,
	IsIgnoredPart = detection.IsIgnoredPart,
	GetFadeThreshold = detection.GetFadeThreshold,
})

--// References
local player = services.player

--// State
local isEngineActive = false
local isPlayerInDanger = false
local currentSafeSpot = nil
local currentDangerHazardName = nil
local currentEscapeDist = 0
local safeSpotCallbacks = {}
local safeSpotLoopThread = nil
local logInDanger = true
local ignoreDodgeWhenInvulnerable = false

--// Bơm runtime cho module Dodge: đọc trạng thái danger & log trực tiếp từ engine (tránh vòng require)
dodge.SetRuntime({
	getInDanger = function()
		return isPlayerInDanger
	end,
	getLogInDanger = function()
		return logInDanger
	end,
	getActiveBossOrb = detection.GetActiveBossOrb,
})

local engine = {}

local lastDeadState = false
local lastInvulnState = false
local lastUIUpdateTime = 0

local function fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
	for _, cb in ipairs(safeSpotCallbacks) do
		pcall(cb, inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)
	end
end

--// Vòng lặp đánh giá nguy hiểm và cập nhật Safe Spot theo thời gian thực
local function startSafeSpotLoop()
	if safeSpotLoopThread then return end
	safeSpotLoopThread = task.spawn(function()
		local lastLogTime = 0
		while isEngineActive do
			-- Tầng 1: Nếu không ở Boss Room và toàn bộ quái trong phòng đã chết -> Dọn sạch toàn bộ hazard tồn đọng
			if not shared.IsBossActive() and shared.GetEnemyCount() == 0 and detection.GetHazardCount() > 0 then
				detection.ClearAllHazards("Room Cleared")
			end

			-- 0. Luôn cập nhật quỹ đạo đạn bay & moving beam toán học TRƯỚC KHI tính Safe Spot (độc lập 100% với Visual ESP)
			detection.UpdateTrajectories()

			local isDead = shared.IsDead and shared.IsDead() or false
			local inDanger, safePos, hazardName, escapeDist
			if isDead then
				inDanger = false
				safePos = nil
				hazardName = "Dead"
				escapeDist = 0
			else
				inDanger, safePos, hazardName, escapeDist = safeSpot.CalculateSafeSpot()
			end

			local isInvulnerable, invulnReason = shared.IsInvulnerable()

			isPlayerInDanger = inDanger
			currentSafeSpot = safePos
			currentDangerHazardName = hazardName
			currentEscapeDist = escapeDist or 0

			safeSpot.UpdateMarker(safePos, inDanger, escapeDist)

			local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local pPos = rootPart and rootPart.Position
			safeSpot.UpdateHitbox(pPos)
			safeSpot.UpdatePlayerRadar(pPos, inDanger)
			detection.UpdateTrajectoryVisuals()
			detection.UpdateHazardTimers()

			-- Kích hoạt Thực thi Né Chiêu (Bài toán 3)
			if inDanger and safePos and dodge.IsAutoDodgeEnabled() then
				dodge.Perform(safePos, escapeDist, hazardName)
			end

			local now = os.clock()
			local invulnTimeTick = isInvulnerable and (now - lastUIUpdateTime >= 0.25)
			local stateChanged = (inDanger ~= isPlayerInDanger)
				or (safePos ~= currentSafeSpot)
				or (isDead ~= lastDeadState)
				or (isInvulnerable ~= lastInvulnState)
				or invulnTimeTick

			if stateChanged then
				lastUIUpdateTime = now
				lastDeadState = isDead
				lastInvulnState = isInvulnerable

				fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist, isInvulnerable, invulnReason, isDead)

				if logInDanger and inDanger and safePos and (os.clock() - lastLogTime > 0.5) then
					lastLogTime = os.clock()
					if isInvulnerable and ignoreDodgeWhenInvulnerable then
						print(("[SmartDodge][Invulnerable] 🛡️ IN DANGER (%s) but INVULNERABLE (%s) -> Dodge Paused")
							:format(hazardName, invulnReason or "Protection"))
					else
						print(("[SmartDodge][InDanger] ⚠️ IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)")
							:format(hazardName, escapeDist, safePos.X, safePos.Y, safePos.Z))
					end
				end
			end

			task.wait(0.05)
		end
	end)
end

local function stopSafeSpotLoop()
	if safeSpotLoopThread then
		task.cancel(safeSpotLoopThread)
		safeSpotLoopThread = nil
	end
	dodge.Cancel()
	safeSpot.HideVisuals()
	detection.ClearTrajectoryVisuals()
	safeSpot.ResetLock()
	isPlayerInDanger = false
	currentSafeSpot = nil
	currentDangerHazardName = nil
	fireSafeSpotChanged(false, nil, nil, 0)
	dodge.FireStatus("Idle")
end

local function startTracking()
	detection.StartScan()
	startSafeSpotLoop()
end

local function stopTracking()
	detection.StopScan()
	stopSafeSpotLoop()
end

--// Bật/thay đổi engine KHÔNG liên quan tới độc quyền coordinator: Auto Farm có thể điều khiển
--// Smart Dodge làm chủ di chuyển (Mode 2) mà không đụng chạy tới các hệ thống khác.
function engine.StartEngine()
	if isEngineActive then return end
	isEngineActive = true
	detection.SetEnabled(true)
	startTracking()
end

function engine.StopEngine()
	if not isEngineActive then return end
	isEngineActive = false
	stopSafeSpotLoop()

	-- Chỉ dừng bộ quét detection nếu tính năng Record cũng không đang chạy
	local skillTimingManager = detection.skillTimingManager
	if not (skillTimingManager and skillTimingManager.IsRecording()) then
		detection.SetEnabled(false)
		detection.StopScan()
	end
end

--// Toggle độc lập (UI): bật engine + tự tuyên bố độc quyền (tắt các hệ thống điều khiển nhân vật khác).
function engine.Toggle(state)
	if state then
		engine.StartEngine()
		coordinator.EnableExclusive("SmartDodge")
	else
		engine.StopEngine()
	end
end

function engine.IsEnabled()
	return isEngineActive
end

--// Dọn dẹp toàn diện khi shutdown (lifecycle): dừng tracking + hủy visual hoàn toàn
function engine.Shutdown()
	isEngineActive = false
	stopTracking()
	safeSpot.DestroyVisuals()
	detection.ClearTrajectoryVisuals()
	dodge.Cancel()
end

--// Accessors

function engine.SetLogInDanger(state)
	logInDanger = state and true or false
end

function engine.IsLogInDangerEnabled()
	return logInDanger
end

function engine.SetIgnoreDodgeWhenInvulnerable(state)
	ignoreDodgeWhenInvulnerable = state and true or false
end

function engine.IsIgnoreDodgeWhenInvulnerableEnabled()
	return ignoreDodgeWhenInvulnerable
end

function engine.IsDead()
	return shared.IsDead and shared.IsDead() or false
end

function engine.IsInDanger()
	return isPlayerInDanger
end

function engine.GetCurrentSafeSpot()
	return currentSafeSpot, isPlayerInDanger, currentDangerHazardName, currentEscapeDist
end

function engine.OnSafeSpotChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(safeSpotCallbacks, callback)
end

return engine