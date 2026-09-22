-- HazardScannerV2 - In-Game Ground Visualizer V2
-- Trực quan hóa các vùng nguy hiểm (Ground Shadows) của HazardScannerV2 trực tiếp trong Roblox 3D Viewport.
-- Khóa 100% phẳng sát mặt sàn (2D Ground Shadows), triệt tiêu hoàn toàn rung lắc và xoay tròn 3D.

--// Imports
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local services = require("@routes/DungeonQuest/core/services")

--// Table
local visualizerV2 = {}

--// State
local enabled = false
local groundShadowsEnabled = false
local corridorEnabled = false
local activeVisuals = {} -- [BasePart] = { adornments = {}, part = part, lastFloorY = number }
local heartbeatConn = nil
local visualFolder = nil

--// Constants
local GROUND_THICKNESS = 0.22 -- studs
local FADE_THRESHOLD = 0.85
local DEFAULT_TRANSPARENCY = 0.48
local COLOR_YELLOW = Color3.fromRGB(255, 220, 20)
local COLOR_SAFE_GREEN = Color3.fromRGB(34, 255, 136)
local COLOR_CORRIDOR = Color3.fromRGB(255, 140, 0) -- Màu cam nổi bật cho Threat Corridor
local CORRIDOR_TRANSPARENCY = 0.60
local CORRIDOR_THICKNESS = 0.20

-- Xác định màu sắc hiển thị (Mặc định màu vàng sáng nổi bật cho toàn bộ hazard)
local function getVisualColor(shape)
	if shape and shape.color == "#22ff88" then
		return COLOR_SAFE_GREEN
	end
	return COLOR_YELLOW
end

-- Lấy điểm Y mặt sàn theo chân của Player (đơn giản, ổn định)
local function getFloorY(pos)
	local lp = services.player or Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	local hum = char and char:FindFirstChildOfClass("Humanoid")

	if root then
		local halfY = (root.Size and root.Size.Y > 0) and (root.Size.Y / 2) or 1.0
		local hip = (hum and hum.HipHeight and hum.HipHeight > 0) and hum.HipHeight or 1.8
		return root.Position.Y - (hip + halfY) + 0.10
	end

	return (pos and (pos.Y - 1.5) or 0) + 0.10
end

-- Lấy Folder chứa Adornment
local function getVisualFolder()
	if visualFolder and visualFolder.Parent then
		return visualFolder
	end
	local existing = Workspace.Terrain:FindFirstChild("HazardVisualizerV2")
	if existing then
		visualFolder = existing
		return visualFolder
	end
	local folder = Instance.new("Folder")
	folder.Name = "HazardVisualizerV2"
	folder.Parent = Workspace.Terrain
	visualFolder = folder
	return folder
end

-- Xóa visual của một Hazard Part
function visualizerV2.Detach(part)
	if not part then return end
	local record = activeVisuals[part]
	if not record then return end

	if record.adornments then
		for _, ad in ipairs(record.adornments) do
			pcall(function() ad:Destroy() end)
		end
		table.clear(record.adornments)
	end

	if record.corridorAdornment then
		pcall(function() record.corridorAdornment:Destroy() end)
		record.corridorAdornment = nil
	end

	activeVisuals[part] = nil
end

-- Xóa toàn bộ visual đang có
function visualizerV2.ClearAll()
	for part, _ in pairs(activeVisuals) do
		visualizerV2.Detach(part)
	end
	table.clear(activeVisuals)
	if visualFolder then
		pcall(function() visualFolder:ClearAllChildren() end)
	end
end

-- Vẽ hoặc cập nhật Visual Ground Shadow cho 1 Hazard Part
function visualizerV2.Update(part, data)
	if not enabled or not part or not part.Parent or not data then return end
	if part.Transparency > FADE_THRESHOLD then
		visualizerV2.Detach(part)
		return
	end

	local shape = data.shape
	if not shape then return end

	local pos = Vector3.new(shape.x, shape.y, shape.z)
	local floorY = getFloorY(pos)
	local color = getVisualColor(shape)
	local folder = getVisualFolder()

	local record = activeVisuals[part]
	if not record then
		record = {
			part = part,
			adornments = {},
			shapeType = shape.shape,
			lastFloorY = floorY,
		}
		activeVisuals[part] = record
	else
		record.lastFloorY = floorY
		if record.shapeType ~= shape.shape then
			for _, ad in ipairs(record.adornments) do
				pcall(function() ad:Destroy() end)
			end
			table.clear(record.adornments)
			record.shapeType = shape.shape
		end
	end

	-- 1. VẼ GROUND SHADOW (Bóng sàn 2D vàng / xanh ngọc)
	if groundShadowsEnabled then
		-- 1. HÌNH TRÒN (CIRCLE AOE)
		if shape.shape == "circle" then
		local cyl = record.adornments[1]
		if not cyl or not cyl.Parent or not cyl:IsA("CylinderHandleAdornment") then
			if cyl then
				pcall(function() cyl:Destroy() end)
			end
			cyl = Instance.new("CylinderHandleAdornment")
			cyl.Name = "GroundCircle_" .. part.Name
			cyl.Adornee = Workspace.Terrain
			cyl.AlwaysOnTop = true
			cyl.ZIndex = 2
			cyl.Transparency = DEFAULT_TRANSPARENCY
			cyl.Parent = folder
			record.adornments[1] = cyl
		end

		cyl.Radius = shape.radius or 5
		cyl.Height = GROUND_THICKNESS
		cyl.Color3 = color
		cyl.CFrame = CFrame.new(shape.x, floorY, shape.z) * CFrame.Angles(math.rad(90), 0, 0)

	-- 2. HỘP CHỮ NHẬT KHÓA MẶT SÀN (PLANAR OBB BOX - Moving Beam, Missiles, Static Boxes)
	elseif shape.shape == "box" then
		local box = record.adornments[1]
		if not box or not box.Parent or not box:IsA("BoxHandleAdornment") then
			if box then
				pcall(function() box:Destroy() end)
			end
			box = Instance.new("BoxHandleAdornment")
			box.Name = "GroundBox_" .. part.Name
			box.Adornee = Workspace.Terrain
			box.AlwaysOnTop = true
			box.ZIndex = 2
			box.Transparency = DEFAULT_TRANSPARENCY
			box.Parent = folder
			record.adornments[1] = box
		end

		local hw = shape.halfWidth or shape.halfX or 2
		local hl = shape.halfLength or shape.halfZ or 2
		local fwd = shape.fwd2D or Vector3.new(0, 0, -1)
		if fwd.Magnitude < 0.001 then
			fwd = Vector3.new(0, 0, -1)
		else
			fwd = fwd.Unit
		end
		local right = shape.right2D
		if not right or right.Magnitude < 0.001 then
			right = Vector3.new(-fwd.Z, 0, fwd.X)
		else
			right = right.Unit
		end

		box.Size = Vector3.new(hw * 2, GROUND_THICKNESS, hl * 2)
		box.Color3 = color
		local ok, cf = pcall(function()
			return CFrame.fromMatrix(Vector3.new(shape.x, floorY, shape.z), right, Vector3.yAxis, -fwd)
		end)
		if ok and cf then
			box.CFrame = cf
		else
			box.CFrame = CFrame.new(shape.x, floorY, shape.z)
		end

	-- 3. 7 VÒNG BÁN NGUYỆT CỦA BOSS 3 (COMPOUND MULTI-RINGS)
	elseif shape.shape == "compound_multiring" then
		-- Lõi tâm (Core Circle)
		local coreCyl = record.adornments[1]
		if not coreCyl or not coreCyl.Parent or not coreCyl:IsA("CylinderHandleAdornment") then
			if coreCyl then
				pcall(function() coreCyl:Destroy() end)
			end
			coreCyl = Instance.new("CylinderHandleAdornment")
			coreCyl.Name = "MultiRingCore"
			coreCyl.Adornee = Workspace.Terrain
			coreCyl.AlwaysOnTop = true
			coreCyl.ZIndex = 3
			coreCyl.Transparency = 0.45
			coreCyl.Color3 = Color3.fromRGB(255, 235, 60)
			coreCyl.Parent = folder
			record.adornments[1] = coreCyl
		end
		coreCyl.Radius = shape.coreRadius or 12.5
		coreCyl.Height = GROUND_THICKNESS
		coreCyl.CFrame = CFrame.new(shape.x, floorY, shape.z) * CFrame.Angles(math.rad(90), 0, 0)

		-- 7 Vành bán nguyệt (Mỗi vành tạo 14 cung cong tiếp tuyến BoxHandleAdornment để đường tròn mịn mượt)
		local rings = shape.rings or {}
		local adIndex = 2
		local segmentsPerRing = 14

		for _, ring in ipairs(rings) do
			local rIn = ring.rIn or 12.5
			local rOut = ring.rOut or 25.0
			local rMid = (rIn + rOut) / 2
			local bandThick = rOut - rIn
			local ringYaw = ring.yaw or 0

			local angleSpan = math.pi -- 180 độ
			local angleStep = angleSpan / segmentsPerRing
			local startAngle = math.rad(ringYaw - 90)
			local segLen = rMid * angleStep * 1.04 -- Chồng nhẹ 4% để mép khép kín hoàn hảo mà không lộ khớp nối

			for s = 1, segmentsPerRing do
				local a = startAngle + (s - 0.5) * angleStep
				local segX = shape.x + math.sin(a) * rMid
				local segZ = shape.z - math.cos(a) * rMid
				local tangent = Vector3.new(math.cos(a), 0, math.sin(a))
				local normal = Vector3.new(math.sin(a), 0, -math.cos(a))

				local segBox = record.adornments[adIndex]
				if not segBox or not segBox.Parent or not segBox:IsA("BoxHandleAdornment") then
					if segBox then
						pcall(function() segBox:Destroy() end)
					end
					segBox = Instance.new("BoxHandleAdornment")
					segBox.Name = "RingArcSeg"
					segBox.Adornee = Workspace.Terrain
					segBox.AlwaysOnTop = true
					segBox.ZIndex = 2
					segBox.Transparency = 0.55
					segBox.Color3 = COLOR_YELLOW
					segBox.Parent = folder
					record.adornments[adIndex] = segBox
				end

				segBox.Size = Vector3.new(bandThick, GROUND_THICKNESS, segLen)
				local ok, cf = pcall(function()
					return CFrame.fromMatrix(Vector3.new(segX, floorY, segZ), normal, Vector3.yAxis, -tangent)
				end)
				if ok and cf then
					segBox.CFrame = cf
				else
					segBox.CFrame = CFrame.new(segX, floorY, segZ)
				end
				adIndex += 1
			end
		end

		-- Xóa các adornment thừa nếu số lượng giảm
		for i = adIndex, #record.adornments do
			if record.adornments[i] then
				pcall(function() record.adornments[i]:Destroy() end)
				record.adornments[i] = nil
			end
		end
	end
	else
		if record and record.adornments and #record.adornments > 0 then
			for _, ad in ipairs(record.adornments) do
				pcall(function() ad:Destroy() end)
			end
			table.clear(record.adornments)
		end
	end

	-- 4. XỬ LÝ THREAT CORRIDOR (Hành lang màu cam đón đầu theo Whitelist)
	if corridorEnabled and shape.corridor then
		local corr = shape.corridor
		local cBox = record.corridorAdornment
		if not cBox or not cBox.Parent or not cBox:IsA("BoxHandleAdornment") then
			if cBox then
				pcall(function() cBox:Destroy() end)
			end
			cBox = Instance.new("BoxHandleAdornment")
			cBox.Name = "ThreatCorridor_" .. (corr.model and corr.model.Name or part.Name)
			cBox.Adornee = Workspace.Terrain
			cBox.AlwaysOnTop = true
			cBox.ZIndex = 1 -- Nằm dưới Ground Shadow (ZIndex = 2)
			cBox.Transparency = CORRIDOR_TRANSPARENCY
			cBox.Color3 = COLOR_CORRIDOR
			cBox.Parent = folder
			record.corridorAdornment = cBox
		end

		cBox.Size = Vector3.new(corr.width, CORRIDOR_THICKNESS, corr.length)
		local corridorFloorY = floorY
		if corr.isModelCorridor then
			corridorFloorY = getFloorY(Vector3.new(corr.centerX, pos.Y, corr.centerZ))
		end
		local centerPos = Vector3.new(corr.centerX, corridorFloorY, corr.centerZ)
		local targetLook = centerPos + Vector3.new(corr.fwd2D.X, 0, corr.fwd2D.Z)
		local ok, cf = pcall(function()
			return CFrame.lookAt(centerPos, targetLook)
		end)
		if ok and cf then
			cBox.CFrame = cf
		else
			cBox.CFrame = CFrame.new(centerPos)
		end
		if not cBox.Visible then
			cBox.Visible = true
		end
	else
		if record.corridorAdornment and record.corridorAdornment.Visible then
			record.corridorAdornment.Visible = false
		end
	end
end

-- Vòng lặp cập nhật liên tục mỗi frame
local function onHeartbeat()
	if not enabled then return end

	local deadParts = {}
	for part, record in pairs(activeVisuals) do
		if not part or not part:IsDescendantOf(Workspace) or part.Transparency > FADE_THRESHOLD then
			table.insert(deadParts, part)
		end
	end

	for _, dead in ipairs(deadParts) do
		visualizerV2.Detach(dead)
	end
end

local function updateActiveState()
	local shouldBeActive = groundShadowsEnabled or corridorEnabled
	if enabled == shouldBeActive then return end
	enabled = shouldBeActive

	if enabled then
		visualizerV2.ClearAll()
		if not heartbeatConn then
			heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
		end
	else
		if heartbeatConn then
			heartbeatConn:Disconnect()
			heartbeatConn = nil
		end
		visualizerV2.ClearAll()
	end
end

-- Bật / tắt Ground Visualizer V2 (Bóng sàn 2D)
function visualizerV2.SetEnabled(state)
	groundShadowsEnabled = state and true or false
	updateActiveState()
	if not groundShadowsEnabled then
		for _, rec in pairs(activeVisuals) do
			if rec.adornments then
				for _, ad in ipairs(rec.adornments) do
					pcall(function() ad:Destroy() end)
				end
				table.clear(rec.adornments)
			end
		end
	end
end

function visualizerV2.IsEnabled()
	return groundShadowsEnabled
end

-- Bật / tắt hiển thị Threat Corridor V2 (Hành lang màu cam)
function visualizerV2.SetCorridorEnabled(state)
	corridorEnabled = state and true or false
	updateActiveState()
	if not corridorEnabled then
		for _, rec in pairs(activeVisuals) do
			if rec.corridorAdornment then
				pcall(function() rec.corridorAdornment:Destroy() end)
				rec.corridorAdornment = nil
			end
		end
	end
end

function visualizerV2.IsCorridorEnabled()
	return corridorEnabled
end

return visualizerV2
