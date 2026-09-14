-- HazardScanner – Visualizer: Vẽ trực quan vùng toán học (Ground Visualizer)
-- dựa trên mô hình hình học của geometry.luau (đã bao gồm Hitbox Padding).
-- Hỗ trợ vẽ đĩa tròn phẳng (CylinderHandleAdornment) cho Ball/Cylinder
-- và hộp chữ nhật phẳng (BoxHandleAdornment) cho Box/OBB.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")

--// Table
local visualizer = {}

--// State
local enabled = false
local data = nil
local activeVisuals = {} -- [hazardInfo] = { adornments = {}, connections = {} }
local player = services.player

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local ZONE_COLOR = Color3.fromRGB(255, 45, 45)
local ZONE_TRANSPARENCY = 0.55
local GROUND_THICKNESS = 0.25

--// Lay do cao mat san theo chan nguoi choi tai thoi diem ve
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

function visualizer.IsEnabled()
	return enabled
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

	activeVisuals[hazardInfo] = nil
end

--// Vẽ visual cho một hazard (căn chỉnh Y theo độ cao người chơi)
function visualizer.AttachZoneVisuals(hazardInfo)
	if not enabled or not hazardInfo then return end
	if activeVisuals[hazardInfo] then
		visualizer.DetachZoneVisuals(hazardInfo)
	end

	local hazardZones = geometry.GetHazardZones(hazardInfo)
	if not hazardZones or not hazardZones.zones then return end

	local padding = geometry.GetHitboxPadding()
	local targetY = getPlayerGroundY()
	local adornments = {}
	local connections = {}

	for _, zone in ipairs(hazardZones.zones) do
		local part = zone.part
		if part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD then
			local worldPos = part.Position
			local worldTargetPos = Vector3.new(worldPos.X, targetY or worldPos.Y, worldPos.Z)
			local localOffset = part.CFrame:PointToObjectSpace(worldTargetPos)
			local ad = nil

			if zone.radius then
				-- Vùng tròn (Ball / Cylinder) -> Đĩa tròn phẳng ngang tầm người chơi
				local cyl = Instance.new("CylinderHandleAdornment")
				cyl.Name = "HazardGroundCircle"
				cyl.Adornee = part
				cyl.Radius = zone.radius + padding
				cyl.Height = GROUND_THICKNESS
				cyl.Color3 = ZONE_COLOR
				cyl.Transparency = ZONE_TRANSPARENCY
				cyl.ZIndex = 2
				cyl.AlwaysOnTop = true
				-- Căn CFrame tại localOffset và xoay 90 độ quanh trục X để mặt phẳng nằm ngang
				cyl.CFrame = CFrame.new(localOffset) * CFrame.Angles(math.rad(90), 0, 0)
				cyl.Parent = part
				ad = cyl
			elseif zone.half and zone.cframe then
				-- Vùng hộp (Box / Mesh / OBB) -> Khối hộp phẳng ngang tầm người chơi
				local box = Instance.new("BoxHandleAdornment")
				box.Name = "HazardGroundBox"
				box.Adornee = part
				box.Size = Vector3.new(zone.half.X * 2, GROUND_THICKNESS, zone.half.Z * 2)
				box.Color3 = ZONE_COLOR
				box.Transparency = ZONE_TRANSPARENCY
				box.ZIndex = 2
				box.AlwaysOnTop = true
				box.CFrame = CFrame.new(localOffset)
				box.Parent = part
				ad = box
			end

			if ad then
				table.insert(adornments, ad)
				-- Tự động destroy visual khi part mờ dần
				local conn = part:GetPropertyChangedSignal("Transparency"):Connect(function()
					if part.Parent and part.Transparency > FADE_TRANSPARENCY_THRESHOLD then
						pcall(function() ad:Destroy() end)
					end
				end)
				table.insert(connections, conn)
			end
		end
	end

	if #adornments > 0 then
		activeVisuals[hazardInfo] = {
			adornments = adornments,
			connections = connections,
		}
	end
end

--// Xóa toàn bộ visual
function visualizer.ClearAll()
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

--// Lang nghe thay doi padding de refresh visual
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
