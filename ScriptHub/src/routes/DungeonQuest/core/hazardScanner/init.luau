-- HazardScanner (DungeonQuest) – Facade: quét hiểm họa + vẽ/highlight vùng nguy hiểm của skill.
-- Chỉ giữ lại phần DETECTION & VISUAL (SelectionBox ESP, hành lang quỹ đạo, đếm ngược 3D)
-- từ hệ thống Smart Dodge cũ. Toàn bộ phần né chiêu (safe spot, dodge, panic), radar và
-- target facing đã bị gỡ bỏ.
-- Đường dẫn require "@routes/DungeonQuest/core/hazardScanner" vẫn giữ nguyên (init.luau).

--// Imports
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local shared = require("@routes/DungeonQuest/core/shared")
local detection = require("@routes/DungeonQuest/core/hazardScanner/detection")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")

--// Bơm data hiểm họa cho module Geometry (đứt vòng phụ thuộc — geometry không require detection).
geometry.BindDetection({
	GetActiveHazardsMap = detection.GetActiveHazardsMap,
	GetLockedProjectiles = detection.GetLockedProjectiles,
	GetTrajectoryConfigForPart = detection.GetTrajectoryConfigForPart,
	LockTrajectoryForPart = detection.LockTrajectoryForPart,
	IsIgnoredPart = detection.IsIgnoredPart,
	GetFadeThreshold = detection.GetFadeThreshold,
})

--// Table
local hazardScanner = {}

--// Detection (Scan + Visual chỉ riêng detection; Start/Stop độc lập)
hazardScanner.StartDetection = detection.StartScan
hazardScanner.StopDetection = detection.StopScan
hazardScanner.IsDetectionEnabled = detection.IsEnabled
hazardScanner.SetDetectionEnabled = detection.SetEnabled
hazardScanner.AddCustomHazard = detection.AddCustomHazard
hazardScanner.AddTrajectoryProjectile = detection.AddTrajectoryProjectile
hazardScanner.SetTrajectoryLookahead = detection.SetTrajectoryLookahead
hazardScanner.GetTrajectoryLookahead = detection.GetTrajectoryLookahead
hazardScanner.SetTrajectoryWidthPadding = detection.SetTrajectoryWidthPadding
hazardScanner.GetTrajectoryWidthPadding = detection.GetTrajectoryWidthPadding
hazardScanner.RegisterPlayerSkill = detection.RegisterPlayerSkill
hazardScanner.GetActiveBossOrb = detection.GetActiveBossOrb

hazardScanner.SetLogHazards = detection.SetLogHazards
hazardScanner.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
hazardScanner.SetLogThreats = hazardScanner.SetLogHazards
hazardScanner.IsLogThreatsEnabled = hazardScanner.IsLogHazardsEnabled

hazardScanner.SetVisualEsp = detection.SetVisualEsp
hazardScanner.IsVisualEspEnabled = detection.IsVisualEspEnabled

hazardScanner.GetHazardCount = detection.GetHazardCount
hazardScanner.GetActiveHazards = detection.GetActiveHazards
hazardScanner.GetLastHazardInfo = detection.GetLastHazardInfo
hazardScanner.OnHazardChanged = detection.OnHazardChanged

--// Projectile Whitelist (data-driven từ ReplicatedStorage.enemyProjectiles)
hazardScanner.LoadProjectileWhitelist = detection.LoadProjectileWhitelist
hazardScanner.GetProjectileWhitelistSize = detection.GetProjectileWhitelistSize
hazardScanner.GetProjectileWhitelist = detection.GetProjectileWhitelist
hazardScanner.SetProjectileWhitelistException = detection.SetProjectileWhitelistException
hazardScanner.IsProjectileWhitelistException = detection.IsProjectileWhitelistException

--// Geometry (Hitbox Padding để mở rộng vùng nguy hiểm hiển thị)
hazardScanner.geometry = geometry
hazardScanner.SetHitboxPadding = geometry.SetHitboxPadding
hazardScanner.GetHitboxPadding = geometry.GetHitboxPadding

--// Vòng lặp cập nhật visual vùng nguy hiểm theo thời gian thực (thay cho Engine cũ)
local scanRunning = false
local scanLoopThread = nil

local function runScanLoop()
	while scanRunning do
		-- Tầng 1: Nếu không ở Boss Room và toàn bộ quái trong phòng đã chết -> Dọn sạch hazard tồn đọng
		if not shared.IsBossActive() and shared.GetEnemyCount() == 0 and detection.GetHazardCount() > 0 then
			detection.ClearAllHazards("Room Cleared")
		end

		detection.UpdateTrajectories()
		detection.UpdateTrajectoryVisuals()

		task.wait(0.05)
	end
	scanLoopThread = nil
end

--// Bật scanner: bật flag, bắt đầu quét Workspace + vòng lặp cập nhật visual
function hazardScanner.StartScan()
	if scanRunning then return end
	scanRunning = true
	detection.SetEnabled(true)
	detection.StartScan()
	scanLoopThread = task.spawn(runScanLoop)
end

--// Tắt scanner: dừng vòng lặp + quét + visual.
function hazardScanner.StopScan()
	scanRunning = false
	if scanLoopThread then
		task.cancel(scanLoopThread)
		scanLoopThread = nil
	end
	detection.StopScan()
	detection.SetEnabled(false)
end

--// Toggle độc lập (UI)
function hazardScanner.Toggle(state)
	if state then
		hazardScanner.StartScan()
	else
		hazardScanner.StopScan()
	end
end

function hazardScanner.IsEnabled()
	return scanRunning
end

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	hazardScanner.StopScan()
	detection.ClearTrajectoryVisuals()
end)

return hazardScanner