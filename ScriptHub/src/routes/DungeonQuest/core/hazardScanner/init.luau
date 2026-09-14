-- HazardScanner (DungeonQuest) – Facade: quét hiểm họa + vẽ SelectionBox đơn giản.
-- Đơn giản hóa hoàn toàn: chỉ phát hiện đối tượng xuất hiện trong Workspace qua
-- ChildAdded/ChildRemoved sau sự kiện start dungeon, vẽ SelectionBox quanh từng đối tượng.
-- Không còn trajectory / whitelist / boss orb / ngoại lệ / hitbox padding / tên 3D.
-- Đường dẫn require "@routes/DungeonQuest/core/hazardScanner" vẫn giữ nguyên (init.luau).

--// Imports
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local detection = require("@routes/DungeonQuest/core/hazardScanner/detection")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")
local visualizer = require("@routes/DungeonQuest/core/hazardScanner/visualizer")

--// Table
local hazardScanner = {}

--// Bind data sources (tranh vong phu thuoc)
geometry.BindDetection(detection)
visualizer.BindDetection(detection)

--// Geometry (Danger Zones)
hazardScanner.IsPointInAnyHazard = geometry.IsPointInAnyHazard
hazardScanner.GetHitboxPadding = geometry.GetHitboxPadding
hazardScanner.SetHitboxPadding = geometry.SetHitboxPadding
hazardScanner.GetHazardZones = geometry.GetHazardZones

--// Ground Visualizer (Debug Danger Zones)
hazardScanner.SetVisualizerEnabled = visualizer.SetEnabled
hazardScanner.IsVisualizerEnabled = visualizer.IsEnabled
hazardScanner.RefreshVisuals = visualizer.RefreshAll

--// Detection (Scan + SelectionBox)
hazardScanner.StartDetection = detection.StartScan
hazardScanner.StopDetection = detection.StopScan
hazardScanner.IsDetectionEnabled = detection.IsEnabled
hazardScanner.SetDetectionEnabled = detection.SetEnabled

hazardScanner.SetLogHazards = detection.SetLogHazards
hazardScanner.IsLogHazardsEnabled = detection.IsLogHazardsEnabled
-- Backward compatibility aliases
hazardScanner.SetLogThreats = hazardScanner.SetLogHazards
hazardScanner.IsLogThreatsEnabled = hazardScanner.IsLogHazardsEnabled

hazardScanner.SetLogFailed = detection.SetLogFailed
hazardScanner.IsLogFailedEnabled = detection.IsLogFailedEnabled

hazardScanner.GetHazardCount = detection.GetHazardCount
hazardScanner.GetActiveHazards = detection.GetActiveHazards
hazardScanner.GetLastHazardInfo = detection.GetLastHazardInfo
hazardScanner.OnHazardChanged = detection.OnHazardChanged

--// Bật scanner: bắt đầu quét Workspace
function hazardScanner.StartScan()
	detection.StartScan()
end

--// Tắt scanner: dừng quét + dọn visual
function hazardScanner.StopScan()
	detection.StopScan()
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
	return detection.IsEnabled()
end

--// Dọn dẹp toàn diện khi shutdown
lifecycle.Register(function()
	detection.StopScan()
end)

return hazardScanner