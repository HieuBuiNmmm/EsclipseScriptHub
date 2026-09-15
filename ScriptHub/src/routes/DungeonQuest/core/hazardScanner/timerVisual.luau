-- HazardScanner – Timer Visualizer (DungeonQuest):
-- Hiển thị 3D visual đếm thời gian tồn tại (Lifespan Duration Timer) tăng dần (0.0s, 0.1s, 0.2s...)
-- CHỈ DÀNH CHO RED ZONE (vùng nguy hiểm tĩnh trên sàn đấu).
-- Tuyệt đối không đếm cho Blue Zone (Đạn bay / Trajectory) hay Yellow (Hành lang quỹ đạo / Candidate).
-- Mỗi Red Danger Zone (đĩa tròn đỏ, hộp OBB đỏ) có 1 BillboardGui gắn trực tiếp vào Part của vùng đó
-- và tự hủy lập tức ngay khi Red Zone mờ đi (Transparency > 0.85) hoặc biến mất.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/hazardScanner/geometry")

local RunService = services.RunService or game:GetService("RunService")
local player = services.player

--// Table
local timerVisual = {}

--// State
local enabled = true
local data = nil
local activeTimers = {} -- [hazardInfo] = { items = {}, connections = {} }
local heartbeatConnection = nil

--// Constants
local FADE_TRANSPARENCY_THRESHOLD = 0.85
local COLOR_RED = Color3.fromRGB(255, 60, 60)
local RGB_TEXT_RED = "255,130,130"

--// Gán data source từ detection (tránh circular dependency)
function timerVisual.BindDetection(dataSource)
	data = dataSource or nil
end

function timerVisual.IsEnabled()
	return enabled
end

--// Lấy độ cao mặt sàn của người chơi
local function getPlayerGroundY()
	local char = player and player.Character
	if not char then return nil end
	local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
	if not root then return nil end
	return root.Position.Y - 2.5
end

--// Tính toán Y Offset phù hợp để BillboardGui luôn lơ lửng ở tầm mắt phía trên sàn đấu
local function computeYOffset(part)
	if not part or not part.Parent then return 2.5 end
	local groundY = getPlayerGroundY()
	if groundY then
		local desiredY = groundY + 2.5
		local diff = desiredY - part.Position.Y
		local minAbovePart = part.Size.Y / 2 + 1.2
		return math.clamp(math.max(diff, minAbovePart), 1.5, 30.0)
	end
	return math.clamp(part.Size.Y / 2 + 1.8, 2.0, 10.0)
end

--// Kiểm tra Part của Danger Zone còn sống không
local function isZonePartAlive(part)
	return part and part.Parent and part.Transparency <= FADE_TRANSPARENCY_THRESHOLD
end

--// Tìm BasePart đại diện fallback
local function getMainPart(instance)
	if not instance or not instance.Parent then return nil end
	if instance:IsA("BasePart") then
		if isZonePartAlive(instance) then return instance end
	elseif instance:IsA("Model") then
		if instance.PrimaryPart and isZonePartAlive(instance.PrimaryPart) then
			return instance.PrimaryPart
		end
		local hrp = instance:FindFirstChild("HumanoidRootPart")
		if hrp and isZonePartAlive(hrp) then
			return hrp
		end
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and isZonePartAlive(desc) then
				return desc
			end
		end
	else
		for _, desc in ipairs(instance:GetDescendants()) do
			if desc:IsA("BasePart") and isZonePartAlive(desc) then
				return desc
			end
		end
	end
	return nil
end

--// Cập nhật text thời gian cho toàn bộ Red Danger Zone của 1 hazard
local function updateTimerText(record, hazardInfo)
	if not record or not record.items or not hazardInfo then return end
	local spawnClock = hazardInfo.SpawnClock or os.clock()
	local elapsed = math.max(0, os.clock() - spawnClock)
	local name = hazardInfo.Name or "Red Zone"
	local text = ("<font color='rgb(%s)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>"):format(
		RGB_TEXT_RED,
		name,
		elapsed
	)

	for _, item in ipairs(record.items) do
		if item.label and item.label.Parent then
			item.label.Text = text
		end
	end
end

--// Vòng lặp Heartbeat: Cập nhật bộ đếm thời gian và dọn dẹp NGAY LẬP TỨC khi Red Zone biến mất
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false

	for hazardInfo, record in pairs(activeTimers) do
		local inst = hazardInfo.Instance
		-- Nếu hazard bị chuyển sang Trajectory (Blue Zone) hoặc instance không còn -> gỡ ngay
		if hazardInfo.IsTrajectory == true or not inst or not inst.Parent then
			timerVisual.DetachTimerVisual(hazardInfo)
		else
			if record.items then
				-- Duyệt ngược mảng items để xóa các Red Zone đã biến mất/mờ
				for i = #record.items, 1, -1 do
					local item = record.items[i]
					local part = item.part
					if not isZonePartAlive(part) then
						if item.billboard and item.billboard.Parent then
							pcall(function() item.billboard:Destroy() end)
						end
						table.remove(record.items, i)
					else
						-- Red Zone còn sống -> cập nhật vị trí offset
						if item.billboard and item.billboard.Parent then
							item.billboard.StudsOffset = Vector3.new(0, computeYOffset(part), 0)
						end
					end
				end

				if #record.items == 0 then
					timerVisual.DetachTimerVisual(hazardInfo)
				else
					hasAny = true
					updateTimerText(record, hazardInfo)
				end
			else
				timerVisual.DetachTimerVisual(hazardInfo)
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

--// Tạo 1 BillboardGui cho 1 Red Danger Zone (part)
local function createRedZoneBillboard(part)
	local yOffset = computeYOffset(part)

	local bb = Instance.new("BillboardGui")
	bb.Name = "HazardLifespanTimer"
	bb.Adornee = part
	bb.AlwaysOnTop = true
	bb.MaxDistance = 500
	bb.LightInfluence = 0
	bb.ResetOnSpawn = false
	bb.Active = false
	bb.Size = UDim2.new(0, 130, 0, 24)
	bb.StudsOffset = Vector3.new(0, yOffset, 0)
	bb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local frame = Instance.new("Frame")
	frame.Name = "TimerFrame"
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
	frame.BackgroundTransparency = 0.25
	frame.BorderSizePixel = 0
	frame.Parent = bb

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = frame

	local stroke = Instance.new("UIStroke")
	stroke.Name = "Stroke"
	stroke.Thickness = 1.3
	stroke.Color = COLOR_RED
	stroke.Transparency = 0.15
	stroke.Parent = frame

	local label = Instance.new("TextLabel")
	label.Name = "TimerLabel"
	label.Size = UDim2.new(1, -6, 1, 0)
	label.Position = UDim2.new(0, 3, 0, 0)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamBold
	label.TextSize = 11
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextStrokeTransparency = 0
	label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	label.RichText = true
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.Text = ""
	label.Parent = frame

	bb.Parent = part
	return bb, label, stroke
end

--// Gắn 3D Timer Visual cho TỪNG RED DANGER ZONE của Hazard (CHỈ Red Zone, bỏ qua Blue Zone)
function timerVisual.AttachTimerVisual(hazardInfo)
	if not enabled or not hazardInfo then return end

	-- CHỈ đếm cho Red Zone, không đếm cho Blue Zone (Trajectory)
	if hazardInfo.IsTrajectory == true then
		if activeTimers[hazardInfo] then
			timerVisual.DetachTimerVisual(hazardInfo)
		end
		return
	end

	if activeTimers[hazardInfo] then
		timerVisual.DetachTimerVisual(hazardInfo)
	end

	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return end

	local hazardZones = geometry.GetHazardZones(hazardInfo)
	local zones = hazardZones and hazardZones.zones

	local items = {}
	local connections = {}

	local function hookPart(part, bb, label, stroke, zone)
		local item = {
			billboard = bb,
			label = label,
			stroke = stroke,
			part = part,
			zone = zone,
		}
		table.insert(items, item)

		-- Tự động hủy timer LẬP TỨC khi part mờ dần (hết chiêu thức)
		local connTrans = part:GetPropertyChangedSignal("Transparency"):Connect(function()
			if not isZonePartAlive(part) then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connTrans)

		-- Tự động hủy timer LẬP TỨC khi part bị xóa khỏi Workspace
		local connParent = part.AncestryChanged:Connect(function(_, newParent)
			if not newParent then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connParent)
	end

	if zones and #zones > 0 then
		for _, zone in ipairs(zones) do
			local part = zone.part
			if isZonePartAlive(part) then
				local bb, label, stroke = createRedZoneBillboard(part)
				hookPart(part, bb, label, stroke, zone)
			end
		end
	else
		local part = getMainPart(inst)
		if isZonePartAlive(part) then
			local bb, label, stroke = createRedZoneBillboard(part)
			hookPart(part, bb, label, stroke, nil)
		end
	end

	if #items > 0 then
		local record = {
			items = items,
			connections = connections,
		}
		activeTimers[hazardInfo] = record
		updateTimerText(record, hazardInfo)
		ensureHeartbeat()
	end
end

--// Gỡ bỏ Timer Visual của 1 hazard
function timerVisual.DetachTimerVisual(hazardInfo)
	if not hazardInfo then return end
	local record = activeTimers[hazardInfo]
	if not record then return end

	if record.connections then
		for _, c in ipairs(record.connections) do
			pcall(function() c:Disconnect() end)
		end
		table.clear(record.connections)
	end

	if record.items then
		for _, item in ipairs(record.items) do
			if item.billboard and item.billboard.Parent then
				pcall(function() item.billboard:Destroy() end)
			end
		end
		table.clear(record.items)
	end

	activeTimers[hazardInfo] = nil
end

--// Cập nhật khi hazard chuyển đổi trạng thái Trajectory (Nếu thành Blue Zone -> gỡ timer ngay)
function timerVisual.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo then return end
	local isTraj = isTrajectory == true or hazardInfo.IsTrajectory == true
	if isTraj then
		-- Chuyển thành Blue Zone -> Gỡ bỏ timer hoàn toàn
		timerVisual.DetachTimerVisual(hazardInfo)
	else
		-- Là Red Zone -> Đảm bảo có timer
		if not activeTimers[hazardInfo] then
			timerVisual.AttachTimerVisual(hazardInfo)
		end
	end
end

--// Xóa sạch toàn bộ Timer Visuals
function timerVisual.ClearAll()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	for info in pairs(activeTimers) do
		timerVisual.DetachTimerVisual(info)
	end
	table.clear(activeTimers)
end

--// Làm mới toàn bộ Timer Visuals (CHỈ gắn cho Red Zones)
function timerVisual.RefreshAll()
	timerVisual.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		if info and info.IsTrajectory ~= true then
			timerVisual.AttachTimerVisual(info)
		end
	end
end

--// Bật / tắt 3D Timer Visualizer
function timerVisual.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		timerVisual.RefreshAll()
	else
		timerVisual.ClearAll()
	end
end

--// Dọn dẹp khi script shutdown
lifecycle.Register(function()
	timerVisual.ClearAll()
end)

return timerVisual
