-- HazardScanner – Timer & 3D Tag Visualizer (DungeonQuest):
-- Hiển thị 3D visual gắn trên đầu mọi Danger Zone trong không gian trận đấu.
-- Phân loại nhãn 3D:
--   - (T) Trajectory: Chiêu thức đang di chuyển / có quỹ đạo bay (Blue/Orange Zone) -> KHÔNG đếm thời gian.
--   - (P) Projectile: Đối tượng có tên trong ReplicatedStorage/enemyProjectiles nhưng đang tĩnh trên sàn -> CÓ đếm thời gian.
--   - (N) Non-projectile: Chiêu thức tĩnh trên mặt sàn (Red Danger Zone) -> CÓ đếm thời gian.
-- Mỗi Danger Zone có 1 BillboardGui gắn trực tiếp vào Part của vùng đó
-- và tự hủy lập tức ngay khi Zone mờ đi (Transparency > 0.85) hoặc biến mất khỏi Workspace.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local geometry = require("@routes/DungeonQuest/core/evasion/spatial/geometry")

local RunService = services.RunService or game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
local COLOR_BLUE = Color3.fromRGB(0, 180, 255)
local COLOR_ORANGE = Color3.fromRGB(255, 140, 0)
local COLOR_PURPLE = Color3.fromRGB(220, 90, 255)

--// Folder chứa danh sách enemy projectiles mẫu trong ReplicatedStorage
local PROJECTILE_FOLDER = "enemyProjectiles"
local enemyProjectilesLoaded = false
local enemyProjectileNames = {} -- [cleanName] = true

--// Blacklist: Các đối tượng nằm trong enemyProjectiles nhưng thực tế không phải là Projectile
local PROJECTILE_BLACKLIST = {
	-- Thêm tên đối tượng vào đây nếu cần loại khỏi (P)
}

--// Danh sách Chasing Projectiles (Đạn truy đuổi / tự đổi hướng theo player)
--// Thêm hoặc xóa tên trực tiếp tại đây:
local CHASING_PROJECTILE_NAMES = {
	["secondbossgreenorb"] = true,
	["secondbossredorb"] = true,
	["secondbossyelloworb"] = true,
}

local function loadEnemyProjectiles()
	if enemyProjectilesLoaded then return end
	enemyProjectilesLoaded = true
	local folder = ReplicatedStorage:FindFirstChild(PROJECTILE_FOLDER)
	if folder then
		for _, obj in ipairs(folder:GetChildren()) do
			local clean = (obj.Name or ""):lower():gsub("%s+", "")
			if #clean > 0 then
				enemyProjectileNames[clean] = true
			end
		end
		folder.ChildAdded:Connect(function(child)
			local clean = (child.Name or ""):lower():gsub("%s+", "")
			if #clean > 0 then
				enemyProjectileNames[clean] = true
			end
		end)
	end
end

--// Kiểm tra xem tên hazard có phải là Chasing Projectile (đạn truy đuổi) không
function timerVisual.IsChasingProjectile(name)
	if not name or type(name) ~= "string" then return false end
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	if CHASING_PROJECTILE_NAMES[clean] == true then return true end
	for n in pairs(CHASING_PROJECTILE_NAMES) do
		if string.find(clean, n, 1, true) then
			return true
		end
	end
	return false
end

--// Kiểm tra xem tên hazard có phải là Projectile mẫu từ ReplicatedStorage/enemyProjectiles không
function timerVisual.IsEnemyProjectile(name)
	loadEnemyProjectiles()
	if not name or type(name) ~= "string" then return false end
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	if PROJECTILE_BLACKLIST[clean] == true then return false end
	return enemyProjectileNames[clean] == true
end

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

--// Phân loại nhãn và màu sắc cho 1 hazard
--// Trả về: tag ("C" | "P" | "N"), strokeColor (Color3), tagRgb (string), hasTimer (boolean)
local function getHazardClassification(hazardInfo)
	local isTraj = hazardInfo and hazardInfo.IsTrajectory == true
	local name = hazardInfo and hazardInfo.Name or "Hazard"
	local isChasing = timerVisual.IsChasingProjectile(name)
	local isProj = timerVisual.IsEnemyProjectile(name)
	local hasTimer = not isTraj or isChasing

	if isChasing then
		-- (C) Chasing Projectile (đạn truy đuổi dí theo player, không có trajectory, có đếm thời gian)
		local strokeColor = COLOR_PURPLE
		local tagRgb = "220,100,255"
		return "C", strokeColor, tagRgb, true
	elseif isProj then
		-- (P) Projectile (có tên trong ReplicatedStorage/enemyProjectiles)
		local strokeColor = isTraj and COLOR_ORANGE or COLOR_BLUE
		local tagRgb = isTraj and "255,160,50" or "0,210,255"
		return "P", strokeColor, tagRgb, hasTimer
	else
		-- (N) Non-projectile (không thuộc enemyProjectiles)
		local strokeColor = isTraj and COLOR_ORANGE or COLOR_RED
		local tagRgb = isTraj and "255,160,50" or "255,80,80"
		return "N", strokeColor, tagRgb, hasTimer
	end
end

--// Cập nhật text hiển thị và màu sắc cho BillboardGui của 1 hazard
local function updateTimerText(record, hazardInfo)
	if not record or not record.items or not hazardInfo then return end
	local tag, strokeColor, tagRgb, hasTimer = getHazardClassification(hazardInfo)
	local name = hazardInfo.Name or "Hazard"
	local text = ""

	if hasTimer then
		local spawnClock = hazardInfo.SpawnClock or os.clock()
		local elapsed = math.max(0, os.clock() - spawnClock)
		text = ("<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(255,220,220)'>%s</font> <font color='rgb(255,255,255)'><b>%.1fs</b></font>"):format(
			tagRgb,
			tag,
			name,
			elapsed
		)
	else
		text = ("<font color='rgb(%s)'><b>(%s)</b></font> <font color='rgb(220,235,255)'>%s</font>"):format(
			tagRgb,
			tag,
			name
		)
	end

	for _, item in ipairs(record.items) do
		if item.label and item.label.Parent then
			item.label.Text = text
		end
		if item.stroke and item.stroke.Parent and item.stroke.Color ~= strokeColor then
			item.stroke.Color = strokeColor
		end
	end
end

--// Vòng lặp Heartbeat: Cập nhật bộ đếm/nhãn và dọn dẹp NGAY LẬP TỨC khi Danger Zone biến mất
local function onHeartbeat()
	if not enabled then return end
	local hasAny = false

	for hazardInfo, record in pairs(activeTimers) do
		local inst = hazardInfo.Instance
		if not inst or not inst.Parent then
			timerVisual.DetachTimerVisual(hazardInfo)
		else
			if record.items then
				-- Duyệt ngược mảng items để xóa các Zone đã biến mất/mờ
				for i = #record.items, 1, -1 do
					local item = record.items[i]
					local part = item.part
					if not isZonePartAlive(part) then
						if item.billboard and item.billboard.Parent then
							pcall(function() item.billboard:Destroy() end)
						end
						table.remove(record.items, i)
					else
						-- Zone còn sống -> cập nhật vị trí offset
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

--// Tạo 1 BillboardGui cho 1 Danger Zone (part)
local function createHazardBillboard(part, initialStrokeColor)
	local yOffset = computeYOffset(part)

	local bb = Instance.new("BillboardGui")
	bb.Name = "HazardLifespanTimer"
	bb.Adornee = part
	bb.AlwaysOnTop = true
	bb.MaxDistance = 500
	bb.LightInfluence = 0
	bb.ResetOnSpawn = false
	bb.Active = false
	bb.Size = UDim2.new(0, 150, 0, 24)
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
	stroke.Color = initialStrokeColor or COLOR_RED
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

--// Gắn 3D Tag/Timer Visual cho toàn bộ các vùng của 1 Hazard
function timerVisual.AttachTimerVisual(hazardInfo)
	if not enabled or not hazardInfo then return end

	local name = hazardInfo.Name or (hazardInfo.Instance and hazardInfo.Instance.Name) or ""
	if (geometry.IsIceSpikesChain and geometry.IsIceSpikesChain(name))
		or (geometry.IsSecondBossCircleChain and geometry.IsSecondBossCircleChain(name)) then
		return
	end

	if activeTimers[hazardInfo] then
		timerVisual.DetachTimerVisual(hazardInfo)
	end

	local inst = hazardInfo.Instance
	if not inst or not inst.Parent then return end

	local _, initialStrokeColor = getHazardClassification(hazardInfo)
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

		-- Tự động hủy tag LẬP TỨC khi part mờ dần (hết chiêu thức)
		local connTrans = part:GetPropertyChangedSignal("Transparency"):Connect(function()
			if not isZonePartAlive(part) then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connTrans)

		-- Tự động hủy tag LẬP TỨC khi part bị xóa khỏi Workspace
		local connParent = part.AncestryChanged:Connect(function(_, newParent)
			if not newParent then
				pcall(function() bb:Destroy() end)
			end
		end)
		table.insert(connections, connParent)
	end

	local targetPart = nil
	if zones and #zones > 0 then
		if inst:IsA("Model") then
			if inst.PrimaryPart and isZonePartAlive(inst.PrimaryPart) then
				targetPart = inst.PrimaryPart
			elseif inst:FindFirstChild("HumanoidRootPart") and isZonePartAlive(inst:FindFirstChild("HumanoidRootPart")) then
				targetPart = inst:FindFirstChild("HumanoidRootPart")
			end
		end

		if not targetPart then
			local center = hazardZones.center
			local bestDistSq = math.huge
			for _, zone in ipairs(zones) do
				local p = zone.part
				if isZonePartAlive(p) then
					if center then
						local dx = p.Position.X - center.X
						local dz = p.Position.Z - center.Z
						local d2 = dx * dx + dz * dz
						if d2 < bestDistSq then
							bestDistSq = d2
							targetPart = p
						end
					else
						targetPart = p
						break
					end
				end
			end
		end
	end

	if not targetPart then
		targetPart = getMainPart(inst)
	end

	if targetPart and isZonePartAlive(targetPart) then
		local bb, label, stroke = createHazardBillboard(targetPart, initialStrokeColor)
		hookPart(targetPart, bb, label, stroke, nil)
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

--// Cập nhật khi hazard chuyển đổi trạng thái Trajectory
function timerVisual.UpdateHazardVisualColor(hazardInfo, isTrajectory)
	if not hazardInfo then return end
	local record = activeTimers[hazardInfo]
	if record then
		updateTimerText(record, hazardInfo)
	else
		timerVisual.AttachTimerVisual(hazardInfo)
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

--// Làm mới toàn bộ Visuals cho tất cả các hazard hiện có
function timerVisual.RefreshAll()
	timerVisual.ClearAll()
	if not enabled or not data then return end

	for _, info in pairs(data.GetActiveHazardsMap()) do
		if info then
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
