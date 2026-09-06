-- Smart Dodge – Module 6: Engine Orchestrator (DungeonQuest).
-- Chuyên trách: kết nối Detection + SafeSpot + Dodge. Vòng lặp đánh giá nguy hiểm theo thời
-- gian thực (safe spot loop), quản lý vòng đời engine (Start/Stop/Toggle), trạng thái danger
-- hiện tại, fire callbacks SafeSpotChanged, coordinator.Register + dodge runtime bơm cho Module 5.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
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
local isPlayerInDanger = false
local currentSafeSpot = nil
local currentDangerHazardName = nil
local currentEscapeDist = 0
local safeSpotCallbacks = {}
local safeSpotLoopThread = nil
local logInDanger = true

--// Bơm runtime cho module Dodge: đọc trạng thái danger & log trực tiếp từ engine (tránh vòng require)
dodge.SetRuntime({
	getInDanger = function()
		return isPlayerInDanger
	end,
	getLogInDanger = function()
		return logInDanger
	end,
})

local engine = {}

local function fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist)
	for _, cb in ipairs(safeSpotCallbacks) do
		pcall(cb, inDanger, safePos, hazardName, escapeDist)
	end
end

--// Vòng lặp đánh giá nguy hiểm và cập nhật Safe Spot theo thời gian thực
local function startSafeSpotLoop()
	if safeSpotLoopThread then return end
	safeSpotLoopThread = task.spawn(function()
		local lastLogTime = 0
		while detection.IsEnabled() do
			local inDanger, safePos, hazardName, escapeDist = safeSpot.CalculateSafeSpot()
			local stateChanged = (inDanger ~= isPlayerInDanger) or (safePos ~= currentSafeSpot)

			isPlayerInDanger = inDanger
			currentSafeSpot = safePos
			currentDangerHazardName = hazardName
			currentEscapeDist = escapeDist or 0

			safeSpot.UpdateMarker(safePos, inDanger, escapeDist)

			local rootPart = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			local pPos = rootPart and rootPart.Position
			safeSpot.UpdateHitbox(pPos)
			detection.UpdateTrajectoryVisuals()

			-- Kích hoạt Thực thi Né Chiêu (Bài toán 3)
			if inDanger and safePos and dodge.IsAutoDodgeEnabled() then
				dodge.Perform(safePos, escapeDist)
			end

			if stateChanged then
				fireSafeSpotChanged(inDanger, safePos, hazardName, escapeDist)

				if logInDanger and inDanger and safePos and (os.clock() - lastLogTime > 0.5) then
					lastLogTime = os.clock()
					print(("[SmartDodge][InDanger] ⚠️ IN DANGER: %s | Escape Dist: %.1f studs -> SafePos: (%.1f, %.1f, %.1f)")
						:format(hazardName, escapeDist, safePos.X, safePos.Y, safePos.Z))
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
	if detection.IsEnabled() then return end
	detection.SetEnabled(true)
	startTracking()
end

function engine.StopEngine()
	if not detection.IsEnabled() then return end
	detection.SetEnabled(false)
	stopTracking()
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
	return detection.IsEnabled()
end

--// Dọn dẹp toàn diện khi shutdown (lifecycle): dừng tracking + hủy visual hoàn toàn
function engine.Shutdown()
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