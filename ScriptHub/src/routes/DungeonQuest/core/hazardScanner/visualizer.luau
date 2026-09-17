-- HazardScanner – Visualizer: Vẽ trực quan vùng toán học (Ground Visualizer)
-- dựa trên mô hình hình học của geometry.luau.
-- Phân loại màu sắc:
--   - Màu Đỏ (Red): Danger Zone của chiêu thức tĩnh / bình thường.
--   - Màu Xanh (Blue): Danger Zone của chiêu thức có quỹ đạo bay (Trajectory / Projectile), áp dụng Trajectory Margin riêng.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local visualizer = {}

--// State
local enabled = false
local data = nil
local activeVisuals = {} -- [hazardInfo] = { items = {}, adornments = {}, connections = {} }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local ZONE_COLOR_RED = Color3.fromRGB(255, 45, 45)
local ZONE_COLOR_BLUE = Color3.fromRGB(0, 160, 255)
local ZONE_TRANSPARENCY = 0.55
local GROUND_THICKNESS = 0.25

--// Lấy độ cao mặt sàn theo chân người chơi tại thời điểm vẽ
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Gán data source từ detection (tránh circular dependency)
function visualizer.BindDetection(dataSource)
	data = dataSource or nil
end

local trajectorySource = nil
function visualizer.BindTrajectory(source)
	trajectorySource = source or nil
end

function visualizer.IsEnabled()
	return enabled
end

--// Cập nhật vị trí và góc xoay của một Adornment ghim thẳng đứng xuống mặt đất mỗi frame
local function updateVisualCFrame(item, targetY)
	local ad = item.ad
	local zone = item.zone
	local part = item.part
	local anchorPart = item.anchorPart or part
	if not ad or not ad.Parent or not anchorPart or not anchorPart.Parent then return end

	local worldPos = (zone and zone.cx and zone.cz) and Vector3.new(zone.cx, 0, zone.cz) or (part and part.Position)
	if not worldPos then return end
	local worldTargetPos = Vector3.new(worldPos.X, targetY or worldPos.Y, worldPos.Z)

	if item.isCircle then
		-- Đĩa tròn: Cố định nằm ngang hoàn toàn trên mặt phẳng World X-Z
		local desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		ad.CFrame = (anchorPart == workspace.Terrain) and desiredWorldCFrame or anchorPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	else
		-- Hộp OBB: Giữ hướng quay Yaw trên sàn, triệt tiêu Pitch/Roll
		local desiredWorldCFrame
		if zone and (zone.isMovingBeam or zone.isBigSpike) then
			local trajDir = trajectorySource and trajectorySource.GetHazardDirection and trajectorySource.GetHazardDirection(item.hazardInfo)
			if trajDir and trajDir.Magnitude > 0.01 then
				desiredWorldCFrame = CFrame.lookAt(worldTargetPos, worldTargetPos + trajDir)
			else
				local baseCF = (part and part.Parent) and part.CFrame or CFrame.identity
				local _, yaw, _ = baseCF:ToOrientation()
				desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(0, yaw, 0)
			end
		else
			local baseCF = (part and part.Parent) and part.CFrame or CFrame.identity
			local _, yaw, _ = baseCF:ToOrientation()
			desiredWorldCFrame = CFrame.new(worldTargetPos) * CFrame.Angles(0, yaw, 0)
		end
		ad.CFrame = (anchorPart == workspace.Terrain) and desiredWorldCFrame or anchorPart.CFrame:ToObjectSpace(desiredWorldCFrame)
	end
end

--// Vòng lặp Heartbeat: Ghim toàn bộ visual thẳng đứng xuống mặt đất liên tục mỗi frame
--// Hỗ trợ Wave Expiration (Cắt đuôi dạng sóng): Tự động gỡ các vòng tròn đã quá hạn expireTime
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false
	local targetY = getPlayerGroundY()
	local now = os.clock()

	for info, record in pairs(activeVisuals) do
		local isChain = info.IsSyntheticChain or (info.MaxExpireTime and now < info.MaxExpireTime)
		local isInstanceAlive = info.Instance and info.Instance.Parent

		if not isInstanceAlive and not isChain then
			visualizer.DetachZoneVisuals(info)
		else
			if record.items then
				local aliveItems = {}
				for _, item in ipairs(record.items) do
					local zone = item.zone
					if zone and zone.expireTime and now > zone.expireTime then
						-- Vòng tròn này đã hết hạn -> hủy adornment để cắt đuôi
						if item.ad and item.ad.Parent then
							pcall(function() item.ad:Destroy() end)
						end
					elseif item.ad and item.ad.Parent then
						table.insert(aliveItems, item)
						updateVisualCFrame(item, targetY)
					end
				end
				record.items = aliveItems
				if #aliveItems > 0 then
					hasAny = true
				else
					visualizer.DetachZoneVisuals(info)
				end
			end
		end
	end

	if not hasAny and heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
end

local function ensureHeartbeat()
	if not heartbeatConnection and enabled then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

--// Xóa visual của một hazard
function visualizer.DetachZoneVisuals(hazardInfo)
	if not hazardInfo then return end
	local record = activeVisuals[hazardInfo]
	if not record then return end

	if record.adornments then
		for _, ad in ipairs(record.adornments) do
			pcall(function() ad:Destroy() end)
		end
		table.clear(record.adornments)
	end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	if record.items then
		table.clear(record.items)
	end

	activeVisuals[hazardInfo] = nil
end

--// Cập nhật màu sắc và bán kính/kích thước visual khi hazard chuyển trạng thái Trajectory (Red <-> Blue)
function visualizer.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo then return end
	local record = activeVisuals[hazardInfo]
	if not record or not record.items then return end

	local isTraj = isTrajectory == true or hazardInfo.IsTrajectory == true
	local color = isTraj and ZONE_COLOR_BLUE or ZONE_COLOR_RED
	local pad = isTraj and geometry.GetTrajectoryMargin() or 0.0

	for _, item in ipairs(record.items) do
		local ad = item.ad
		local zone = item.zone
		local part = item.part
		if ad and ad.Parent and zone and part and part.Parent then
			ad.Color3 = color
			if item.isCircle and zone.radius then
				ad.Radius = zone.radius + pad
			elseif zone.half then
				local halfX = zone.half.X
				local halfZ = zone.half.Z
				ad.Size = Vector3.new(halfX * 2, GROUND_THICKNESS, halfZ * 2)
			end
		end
	end
end

--// Vẽ visual cho một hazard (Ghim thẳng đứng xuống mặt đất)
function visualizer.AttachZoneVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeVisuals[hazardInfo] then
		visualizer.DetachZoneVisuals(hazardInfo)
	end

	local hazardZones = geometry.GetHazardZones(hazardInfo)
	if not hazardZones or not hazardZones.zones then return end

	local isTraj = hazardInfo.IsTrajectory == true
	local color = isTraj and ZONE_COLOR_BLUE or ZONE_COLOR_RED
	local pad = isTraj and geometry.GetTrajectoryMargin() or 0.0
	local targetY = getPlayerGroundY()
	local items = {}
	local adornments = {}
	local connections = {}

	local terrain = workspace.Terrain

	for _, zone in ipairs(hazardZones.zones) do
		local part = zone.part
		local isChain = zone.isSecondBossChain == true
		local isMovingBeam = zone.isMovingBeam == true
		local isBigSpike = zone.isBigSpike == true
		local anchorPart = (isChain or isMovingBeam or isBigSpike) and terrain or part

		if isChain or isMovingBeam or isBigSpike or (part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD) then
			local ad = nil
			local isCircle = false

			if zone.radius then
				isCircle = true
				local cyl = Instance.new("CylinderHandleAdornment")
				cyl.Name = "HazardGroundCircle"
				cyl.Adornee = anchorPart
				cyl.Radius = zone.radius + pad
				cyl.Height = GROUND_THICKNESS
				cyl.Color3 = color
				cyl.Transparency = ZONE_TRANSPARENCY
				cyl.ZIndex = 2
				cyl.AlwaysOnTop = true
				cyl.Parent = anchorPart
				ad = cyl
			elseif zone.half and zone.cframe then
				local box = Instance.new("BoxHandleAdornment")
				box.Name = "HazardGroundBox"
				box.Adornee = anchorPart
				box.Size = Vector3.new(zone.half.X * 2, GROUND_THICKNESS, zone.half.Z * 2)
				box.Color3 = color
				box.Transparency = ZONE_TRANSPARENCY
				box.ZIndex = 2
				box.AlwaysOnTop = true
				box.Parent = anchorPart
				ad = box
			end

			if ad then
				local item = {
					ad = ad,
					part = part,
					anchorPart = anchorPart,
					isCircle = isCircle,
					zone = zone,
					hazardInfo = hazardInfo,
				}
				updateVisualCFrame(item, targetY)
				table.insert(items, item)
				table.insert(adornments, ad)

				if (not isChain and not isMovingBeam) and part then
					-- Tự động destroy visual khi part mờ dần (chỉ part thông thường)
					local conn = part:GetPropertyChangedSignal("Transparency"):Connect(function()
						if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
							pcall(function() ad:Destroy() end)
						end
					end)
					table.insert(connections, conn)
				end
			end
		end
	end

	if #adornments > 0 then
		activeVisuals[hazardInfo] = {
			items = items,
			adornments = adornments,
			connections = connections,
		}
		ensureHeartbeat()
	end
end

--// Xóa toàn bộ visual
function visualizer.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeVisuals) do
		visualizer.DetachZoneVisuals(info)
	end
	table.clear(activeVisuals)
end

--// Refresh lại toàn bộ visual đang hoạt động
function visualizer.RefreshAll()
	visualizer.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		visualizer.AttachZoneVisuals(info)
	end
end

--// Bật / tắt Ground Visualizer
function visualizer.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		visualizer.RefreshAll()
	else
		visualizer.ClearAll()
	end
end

--// Lắng nghe thay đổi margin/padding để refresh visual
geometry.OnPaddingChanged(function()
	if enabled then
		visualizer.RefreshAll()
	end
end)

--// Dọn dẹp khi script shutdown
lifecycle.Register(function()
	visualizer.ClearAll()
end)

return visualizer
