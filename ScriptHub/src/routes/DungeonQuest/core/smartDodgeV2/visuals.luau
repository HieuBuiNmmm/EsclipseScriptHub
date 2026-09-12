-- Smart Dodge V2: Visuals Engine
-- Quản lý toàn bộ hiển thị 3D ESP (SelectionBox, Name Tag Billboards, Trajectory Box, Timers).
-- Tách rời hoàn toàn khỏi logic toán học phát hiện, dễ dàng bật/tắt độc lập và tùy biến màu sắc.

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local types = require("@routes/DungeonQuest/core/smartDodgeV2/types")

local visuals = {}

local espEnabled = true
local nameTagsEnabled = true
local unifiedModelBoxes = true
local lineThickness = 0.08
local surfaceTransparency = 0.65

-- Bảng màu chuẩn:
-- 1. Màu vàng Neon cho đòn đánh / hiểm họa / Projectile
local HAZARD_BOX_COLOR = Color3.fromRGB(255, 225, 30)
local HAZARD_TEXT_COLOR = Color3.fromRGB(255, 230, 80)

-- 2. Quy ước chung cho TẤT CẢ các tia định hướng (Telegraph Beams):
local TELEGRAPH_BOX_COLOR = Color3.fromRGB(255, 120, 20) -- Màu Cam Neon định hướng
local TELEGRAPH_TEXT_COLOR = Color3.fromRGB(255, 160, 50)

-- Lưu trữ các đối tượng visual: [ActiveHazard] = { boxes = {}, nameTags = {}, trajectoryPart = Part?, corridorPart = Part?, telegraphStartPos = Vector3? }
local hazardVisualMap: { [types.ActiveHazard]: any } = {}

function visuals.SetTelegraphColor(color: Color3)
	TELEGRAPH_BOX_COLOR = color
	visuals.RebuildAll()
end

function visuals.GetTelegraphColor(): Color3
	return TELEGRAPH_BOX_COLOR
end

function visuals.SetUnifiedModelBoxes(state: boolean)
	unifiedModelBoxes = state
	visuals.RebuildAll()
end

function visuals.IsUnifiedModelBoxes(): boolean
	return unifiedModelBoxes
end

function visuals.SetLineThickness(val: number)
	lineThickness = math.clamp(val, 0.01, 0.3)
	for _, data in pairs(hazardVisualMap) do
		if data.boxes then
			for _, b in ipairs(data.boxes) do b.LineThickness = lineThickness end
		end
	end
end

function visuals.GetLineThickness(): number
	return lineThickness
end

function visuals.GetHazardVisualData(hazard: types.ActiveHazard): any
	return hazardVisualMap[hazard]
end

function visuals.SetSurfaceTransparency(val: number)
	surfaceTransparency = math.clamp(val, 0.0, 1.0)
	for _, data in pairs(hazardVisualMap) do
		if data.boxes then
			for _, b in ipairs(data.boxes) do b.SurfaceTransparency = surfaceTransparency end
		end
	end
end

function visuals.GetSurfaceTransparency(): number
	return surfaceTransparency
end

function visuals.SetEspEnabled(state: boolean)
	espEnabled = state
	for _, data in pairs(hazardVisualMap) do
		if data.boxes then
			for _, b in ipairs(data.boxes) do b.Visible = espEnabled end
		end
	end
end

function visuals.IsEspEnabled(): boolean
	return espEnabled
end

function visuals.SetNameTagsEnabled(state: boolean)
	nameTagsEnabled = state
	for _, data in pairs(hazardVisualMap) do
		if data.nameTags then
			for _, tag in ipairs(data.nameTags) do
				tag.Enabled = nameTagsEnabled
			end
		end
	end
end

function visuals.IsNameTagsEnabled(): boolean
	return nameTagsEnabled
end

local function getActivePartCount(hazard: types.ActiveHazard): number
	local count = 0
	if hazard and hazard.activeParts then
		for _ in pairs(hazard.activeParts) do
			count = count + 1
		end
	end
	return count
end

--// Đọc bề rộng tiết diện ngang (Cross-section Width) từ chính Adornee của một SelectionBox
local function getBoxWidth(box: SelectionBox): number?
	local adornee = box.Adornee
	if not adornee then return nil end

	local size: Vector3?
	if adornee:IsA("BasePart") then
		local mesh = adornee:FindFirstChildOfClass("SpecialMesh")
		if mesh then
			size = Vector3.new(
				adornee.Size.X * math.abs(mesh.Scale.X),
				adornee.Size.Y * math.abs(mesh.Scale.Y),
				adornee.Size.Z * math.abs(mesh.Scale.Z)
			)
		else
			size = adornee.Size
		end
	elseif adornee:IsA("Model") then
		local _, s = adornee:GetBoundingBox()
		size = s
	end

	if not size then return nil end

	-- Sắp xếp 3 chiều: dims[1] <= dims[2] <= dims[3]
	-- dims[3] là chiều dài dọc theo hướng phóng (Length của Spike, ví dụ 40 studs)
	-- dims[2] là bề rộng tiết diện ngang thực tế (Cross-section Width của Spike, ví dụ 8-10 studs)
	local dims = { size.X, size.Y, size.Z }
	table.sort(dims)

	local width = dims[2]
	if width < 1.0 then
		width = dims[3]
	end

	return width
end

--// Tìm Companion Projectile (Missile / Spike) xuất phát gần startPos
local function findCompanionProjectile(startPos: Vector3): (types.ActiveHazard?, BasePart?)
	local bestDist = 25 -- Trong bán kính 25 studs quanh điểm xuất phát
	local bestHazard = nil
	local bestPart = nil

	-- 1. Tìm trong hazardVisualMap trước
	for h, data in pairs(hazardVisualMap) do
		local isProj = (h.isCustomHazard and not h.isTelegraph)
			or (h.instance and (h.instance.Name:lower():find("spike") or h.instance.Name:lower():find("missile")))
		if isProj then
			local hPos = h.position
			if not hPos and h.instance then
				if h.instance:IsA("BasePart") then
					hPos = h.instance.Position
				elseif h.instance:IsA("Model") then
					hPos = h.instance:GetPivot().Position
				end
			end

			if hPos then
				local dist = (hPos - startPos).Magnitude
				if dist < bestDist then
					bestDist = dist
					bestHazard = h
					local p = next(h.activeParts)
					if not p and h.instance and h.instance:IsA("BasePart") then
						p = h.instance
					end
					bestPart = p
				end
			end
		end
	end

	if bestPart then return bestHazard, bestPart end

	-- 2. Quét nhanh Workspace quanh startPos nếu chưa nạp kịp vào hazardVisualMap
	for _, child in ipairs(Workspace:GetChildren()) do
		local nameLower = child.Name:lower():gsub("%s+", "")
		if (nameLower:find("spike") or nameLower:find("missile")) and not nameLower:find("beam") then
			local cPos = child:IsA("BasePart") and child.Position or (child:IsA("Model") and child:GetPivot().Position)
			if cPos and (cPos - startPos).Magnitude < bestDist then
				local p = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")
				if p then
					return nil, p
				end
			end
		end
	end

	return nil, nil
end

--// Tìm độ rộng từ SelectionBox của chính Spike/Missile đi cùng (nằm tại vị trí xuất phát của tia)
local function getCompanionSpikeBoxWidth(startPos: Vector3): number?
	local compHazard, compPart = findCompanionProjectile(startPos)
	if compHazard and hazardVisualMap[compHazard] then
		local data = hazardVisualMap[compHazard]
		if data.boxes then
			for _, box in ipairs(data.boxes) do
				local w = getBoxWidth(box)
				if w and w > 0 then return w end
			end
		end
	end

	if compPart then
		local mesh = compPart:FindFirstChildOfClass("SpecialMesh")
		local size = mesh and Vector3.new(
			compPart.Size.X * math.abs(mesh.Scale.X),
			compPart.Size.Y * math.abs(mesh.Scale.Y),
			compPart.Size.Z * math.abs(mesh.Scale.Z)
		) or compPart.Size
		return math.max(size.X, size.Z)
	end

	return nil
end

--// Chỉ đồng bộ sang duy nhất tia định hướng đi kèm Spike này (dựa trên vị trí xuất phát)
local function syncCompanionTelegraphWidth(spikeHazard: types.ActiveHazard, spikeWidth: number)
	local spikePos = spikeHazard.position
	if not spikePos and spikeHazard.instance then
		if spikeHazard.instance:IsA("BasePart") then
			spikePos = spikeHazard.instance.Position
		elseif spikeHazard.instance:IsA("Model") then
			spikePos = spikeHazard.instance:GetPivot().Position
		end
	end
	if not spikePos then return end

	local isBigSpike = (spikeHazard.name and spikeHazard.name:lower():find("bigspike") ~= nil)
		or (spikeHazard.instance and spikeHazard.instance.Name:lower():find("bigspike") ~= nil)

	for h, data in pairs(hazardVisualMap) do
		if h.isTelegraph and data.corridorPart and data.telegraphStartPos then
			local dist = (data.telegraphStartPos - spikePos).Magnitude
			if dist < 25 then
				local corridor = data.corridorPart
				local targetWidth = isBigSpike and math.max(spikeWidth, 40.0) or spikeWidth
				if corridor.Parent and math.abs(corridor.Size.X - targetWidth) > 0.5 then
					corridor.Size = Vector3.new(targetWidth, corridor.Size.Y, corridor.Size.Z)
					if data.nameTags then
						for _, tag in ipairs(data.nameTags) do
							local label = tag:FindFirstChildOfClass("TextLabel")
							if label then
								label.Text = ("%s [Beam W:%.1f]"):format(h.instance.Name, targetWidth)
							end
						end
					end
					-- Đồng bộ luôn Beam trong game nếu cần
					local firstPart = next(h.activeParts)
					local beam = firstPart and (firstPart:FindFirstChildOfClass("Beam") or (firstPart.Parent and firstPart.Parent:FindFirstChildOfClass("Beam")))
					if beam and (isBigSpike or (beam.Width0 and beam.Width0 < 20)) then
						pcall(function()
							beam.Width0 = targetWidth
							beam.Width1 = targetWidth
						end)
					end
				end
			end
		end
	end
end

--// Gắn SelectionBox và Name Tag lên một Part cụ thể (khi ở chế độ vẽ từng Part)
function visuals.AttachPartVisual(hazard: types.ActiveHazard, part: BasePart)
	local data = hazardVisualMap[hazard]
	if not data or not part or not part:IsA("BasePart") or not part.Parent then return end

	-- Nếu hazard này đang được gộp tổng thể cấp Model thì không vẽ part lẻ
	if data.isUnified then
		return
	end

	-- Lựa chọn màu: tia định hướng dùng TELEGRAPH_BOX_COLOR (Cam Neon), đòn đánh dùng HAZARD_BOX_COLOR (Vàng Neon)
	local boxColor = hazard.isTelegraph and TELEGRAPH_BOX_COLOR or HAZARD_BOX_COLOR
	local textColor = hazard.isTelegraph and TELEGRAPH_TEXT_COLOR or HAZARD_TEXT_COLOR

	-- Tránh tạo trùng lặp SelectionBox trên cùng một Part
	if data.boxes then
		for _, b in ipairs(data.boxes) do
			if b.Adornee == part then
				return
			end
		end
	end

	-- 1. SelectionBox 3D bọc quanh part với độ đậm rõ nét
	local box = Instance.new("SelectionBox")
	box.Name = "SmartDodge_SelectionBox"
	box.Color3 = boxColor
	box.SurfaceColor3 = boxColor
	box.SurfaceTransparency = surfaceTransparency
	box.LineThickness = lineThickness
	box.Adornee = part
	box.Visible = espEnabled
	box.Parent = part
	table.insert(data.boxes, box)

	-- Nếu là Custom Spike thì đồng bộ W từ chính SelectionBox vừa gắn sang Telegraph đi kèm (nếu có)
	if hazard.isCustomHazard and not hazard.isTelegraph then
		local w = getBoxWidth(box)
		if w and w > 0 then
			syncCompanionTelegraphWidth(hazard, w)
		end
	end

	-- 2. Name Tag Billboard hiển thị tên: Chỉ tạo 1 nhãn đại diện cho hazard để tránh rối mắt
	if #data.nameTags == 0 then
		local displayName = ""
		if hazard.instance and hazard.instance ~= part then
			displayName = ("%s(%s)"):format(hazard.instance.Name, part.ClassName)
		else
			displayName = ("%s(%s)"):format(part.Name, part.ClassName)
		end

		local bb = Instance.new("BillboardGui")
		bb.Name = "SmartDodge_NameTag"
		bb.Size = UDim2.fromOffset(180, 24)
		bb.StudsOffset = Vector3.new(0, 2.0, 0)
		bb.AlwaysOnTop = true
		bb.Enabled = nameTagsEnabled
		bb.Adornee = part

		local label = Instance.new("TextLabel")
		label.Size = UDim2.fromScale(1, 1)
		label.BackgroundTransparency = 1
		label.Font = Enum.Font.GothamBold
		label.TextSize = 12
		label.TextColor3 = textColor
		label.TextStrokeTransparency = 0
		label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		label.Text = displayName
		label.Parent = bb
		bb.Parent = part

		table.insert(data.nameTags, bb)
	end
end

--// Gắn SelectionBox 3D và các visual lên hazard
function visuals.AttachHazardVisuals(hazard: types.ActiveHazard)
	if hazardVisualMap[hazard] then return end

	local data = {
		boxes = {},
		nameTags = {},
		trajectoryPart = nil,
		corridorPart = nil,
		telegraphStartPos = nil,
		isUnified = false,
	}
	hazardVisualMap[hazard] = data

	local boxColor = hazard.isTelegraph and TELEGRAPH_BOX_COLOR or HAZARD_BOX_COLOR
	local textColor = hazard.isTelegraph and TELEGRAPH_TEXT_COLOR or HAZARD_TEXT_COLOR
	local partCount = getActivePartCount(hazard)

	-- Quy tắc: Nếu chỉ có duy nhất 1 part thì KHÔNG gộp; nếu >= 2 part thì MỚI gộp Model (trừ khi có cờ neverUnify)
	local shouldUnify = unifiedModelBoxes and hazard.instance and hazard.instance:IsA("Model") and (partCount >= 2) and not hazard.neverUnify
	data.isUnified = shouldUnify

	-- 1. Nếu là tia định hướng (Telegraph Beam): Tạo hành lang kéo dài với độ rộng lấy trực tiếp từ SelectionBox của Spike
	local firstPart = next(hazard.activeParts)
	if hazard.isTelegraph and firstPart and firstPart:IsA("BasePart") then
		local att2 = firstPart:FindFirstChild("Attachment2") or (firstPart.Parent and firstPart.Parent:FindFirstChild("Attachment2"))
		local startPos = firstPart.Position
		local endPos = (att2 and att2:IsA("Attachment")) and att2.WorldPosition or (startPos + firstPart.CFrame.LookVector * 100)
		local delta = endPos - startPos
		local length = math.max(delta.Magnitude, 5)

		-- Dựa trực tiếp vào độ rộng của Beam thật trong game hoặc SelectionBox của Spike xuất phát cùng vị trí
		local beam = firstPart:FindFirstChildOfClass("Beam") or (firstPart.Parent and firstPart.Parent:FindFirstChildOfClass("Beam"))
		local width = nil

		-- 1. Nếu là tia Big Spike (Beam.Width0 = 40 trong game script hoặc tên chứa bigspike)
		local isBigSpike = (beam and beam.Width0 and beam.Width0 >= 20)
			or (firstPart.Name:lower():find("bigspike") ~= nil)
			or (firstPart.Parent and firstPart.Parent.Name:lower():find("bigspike") ~= nil)

		if isBigSpike then
			width = beam and math.max(beam.Width0, beam.Width1 or 0) or 40.0
			if width < 20 then width = 40.0 end
		else
			-- 2. Với Seeking Spikes hoặc các đòn khác:
			-- Beam.Width0 trong ReplicatedStorage template chỉ là tia mỏng mặc định (~1-2 studs),
			-- KHÔNG phải độ rộng thực của chiêu! Spike thật trong game có độ rộng ~10-14 studs!
			-- Ưu tiên đo trực tiếp từ SelectionBox / SpecialMesh của Companion Spike Part!
			width = getCompanionSpikeBoxWidth(startPos)
			if not width or width < 4.0 then
				-- Fallback chuẩn xác cho Seeking Spikes (độ rộng gai ~12 studs thay vì 6 studs)
				width = 12.0
			end
		end
		width = math.clamp(width, 4.0, 50.0)

		-- Tạo khối hành lang 3D vô hình mô phỏng đường đi của đạn với bề ngang = SelectionBox của Spike
		local centerCF = CFrame.lookAt(startPos, endPos) * CFrame.new(0, 0, -length / 2)
		local corridor = Instance.new("Part")
		corridor.Name = "SmartDodge_TelegraphCorridor"
		corridor.Transparency = 1
		corridor.Anchored = true
		corridor.CanCollide = false
		corridor.CanQuery = false
		corridor.CanTouch = false
		corridor.Size = Vector3.new(width, 0.4, length)
		corridor.CFrame = centerCF
		corridor.Parent = Workspace
		data.corridorPart = corridor
		data.telegraphStartPos = startPos

		-- Bọc SelectionBox Cam Neon lên toàn bộ hành lang tia định hướng
		local box = Instance.new("SelectionBox")
		box.Name = "SmartDodge_SelectionBox_Telegraph"
		box.Color3 = TELEGRAPH_BOX_COLOR
		box.SurfaceColor3 = TELEGRAPH_BOX_COLOR
		box.SurfaceTransparency = surfaceTransparency
		box.LineThickness = lineThickness
		box.Adornee = corridor
		box.Visible = espEnabled
		box.Parent = corridor
		table.insert(data.boxes, box)

		-- Nhãn tên tia định hướng
		local bb = Instance.new("BillboardGui")
		bb.Name = "SmartDodge_NameTag_Telegraph"
		bb.Size = UDim2.fromOffset(220, 24)
		bb.StudsOffset = Vector3.new(0, 2.5, 0)
		bb.AlwaysOnTop = true
		bb.Enabled = nameTagsEnabled
		bb.Adornee = corridor

		local label = Instance.new("TextLabel")
		label.Size = UDim2.fromScale(1, 1)
		label.BackgroundTransparency = 1
		label.Font = Enum.Font.GothamBold
		label.TextSize = 12
		label.TextColor3 = TELEGRAPH_TEXT_COLOR
		label.TextStrokeTransparency = 0
		label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		label.Text = ("%s [Beam W:%.1f]"):format(hazard.instance.Name, width)
		label.Parent = bb
		bb.Parent = corridor
		table.insert(data.nameTags, bb)

		-- 2. Dynamic Shrinking Corridor Runner:
		-- Tự động co ngắn hành lang từ phía sau theo vị trí đầu đạn (sau lưng tên lửa là SAFE)
		local pathVec = (endPos - startPos)
		local totalLength = pathVec.Magnitude
		local pathDir = (totalLength > 0.001) and (pathVec / totalLength) or Vector3.new(0, 0, -1)

		local compHazard, compPart = findCompanionProjectile(startPos)
		data.companionPart = compPart
		data.companionHazard = compHazard

		local heartbeatConn: RBXScriptConnection?
		local searchStartTime = os.clock()
		local compHasBeenVisible = false

		heartbeatConn = RunService.Heartbeat:Connect(function()
			if not corridor or not corridor.Parent then
				if heartbeatConn then heartbeatConn:Disconnect(); heartbeatConn = nil end
				return
			end

			-- Nếu chưa bắt được companion part lúc đầu, quét tìm trong 0.8s đầu
			if (not compPart or not compPart.Parent) and (os.clock() - searchStartTime < 0.8) then
				local h, p = findCompanionProjectile(startPos)
				if p then
					compPart = p
					compHazard = h
					data.companionPart = compPart
					data.companionHazard = compHazard

					-- Tự động đồng bộ lại độ rộng hành lang theo Companion Spike vừa tìm thấy
					if not isBigSpike then
						local spikeW = getCompanionSpikeBoxWidth(startPos)
						if spikeW and spikeW >= 4.0 and math.abs(corridor.Size.X - spikeW) > 0.5 then
							width = spikeW
							corridor.Size = Vector3.new(width, corridor.Size.Y, corridor.Size.Z)
							if data.nameTags then
								for _, tag in ipairs(data.nameTags) do
									local label = tag:FindFirstChildOfClass("TextLabel")
									if label then
										label.Text = ("%s [Beam W:%.1f]"):format(hazard.instance.Name, width)
									end
								end
							end
						end
					end
				end
			end

			-- Khi đã có companion projectile:
			if compPart and compPart.Parent then
				if compPart.Transparency < 0.85 then
					compHasBeenVisible = true
				end

				-- Chỉ hủy hành lang khi spike đã từng xuất hiện (Transparency < 0.85) và nay tan biến
				if compHasBeenVisible and compPart.Transparency >= 0.85 then
					if heartbeatConn then heartbeatConn:Disconnect(); heartbeatConn = nil end
					pcall(function() corridor:Destroy() end)
					return
				end

				local curPos = compPart.Position
				-- Chiếu vị trí hiện tại của tên lửa lên trục bắn (từ startPos -> endPos)
				local distAlong = (curPos - startPos):Dot(pathDir)

				-- Trừ 3 studs padding phía sau đuôi tên lửa để bao trọn hitbox đạn
				local safeDist = math.clamp(distAlong - 3, 0, totalLength)
				local remainingLength = totalLength - safeDist

				if remainingLength <= 2.0 then
					-- Đạn đã chạm đích hoặc bay qua khỏi phòng -> Xóa ngay hành lang màu cam!
					if heartbeatConn then heartbeatConn:Disconnect(); heartbeatConn = nil end
					pcall(function() corridor:Destroy() end)
					return
				end

				-- Cập nhật lại kích thước và tâm điểm của hành lang:
				-- Bắt đầu từ đuôi tên lửa (newStart) kéo dài đến thẳng endPos (tường)
				local newStart = startPos + pathDir * safeDist
				local newCenter = newStart + pathDir * (remainingLength / 2)
				corridor.Size = Vector3.new(width, 0.4, remainingLength)
				corridor.CFrame = CFrame.lookAt(newCenter, newCenter + pathDir)
			end
		end)

		data.heartbeatConn = heartbeatConn
	elseif shouldUnify then
		-- Gộp toàn bộ các part con (>= 2): Vẽ DUY NHẤT 1 SelectionBox bao quát toàn bộ Model
		local box = Instance.new("SelectionBox")
		box.Name = "SmartDodge_SelectionBox_Model"
		box.Color3 = boxColor
		box.SurfaceColor3 = boxColor
		box.SurfaceTransparency = surfaceTransparency
		box.LineThickness = lineThickness
		box.Adornee = hazard.instance
		box.Visible = espEnabled
		box.Parent = hazard.instance
		table.insert(data.boxes, box)

		-- Đồng bộ độ rộng từ SelectionBox của Spike Model sang Telegraph Corridor đi kèm (nếu có)
		if hazard.isCustomHazard and not hazard.isTelegraph then
			local w = getBoxWidth(box)
			if w and w > 0 then
				syncCompanionTelegraphWidth(hazard, w)
			end
		end

		-- Tìm một part làm neo để treo nhãn tên duy nhất
		local anchorPart = hazard.instance.PrimaryPart or next(hazard.activeParts)
		if not anchorPart then
			for _, desc in ipairs(hazard.instance:GetDescendants()) do
				if desc:IsA("BasePart") then
					anchorPart = desc
					break
				end
			end
		end

		if anchorPart then
			local bb = Instance.new("BillboardGui")
			bb.Name = "SmartDodge_NameTag_Model"
			bb.Size = UDim2.fromOffset(200, 24)
			bb.StudsOffset = Vector3.new(0, 2.5, 0)
			bb.AlwaysOnTop = true
			bb.Enabled = nameTagsEnabled
			bb.Adornee = anchorPart

			local label = Instance.new("TextLabel")
			label.Size = UDim2.fromScale(1, 1)
			label.BackgroundTransparency = 1
			label.Font = Enum.Font.GothamBold
			label.TextSize = 12
			label.TextColor3 = textColor
			label.TextStrokeTransparency = 0
			label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			label.Text = ("%s(Model)"):format(hazard.instance.Name)
			label.Parent = bb
			bb.Parent = anchorPart

			table.insert(data.nameTags, bb)
		end
	else
		-- Nếu chỉ có 1 Part hoặc Part đơn lẻ: Vẽ theo từng Part
		for part in pairs(hazard.activeParts) do
			visuals.AttachPartVisual(hazard, part)
		end
	end

	-- 3. Synthetic Telegraph Corridor:
	-- 3. Moving Trajectory Box (Chuẩn V1):
	-- Khối màu Cam di chuyển theo viên đạn với độ dài giới hạn phía trước (mặc định 40 studs).
	-- Vùng xa phía trước và vùng phía sau lưng đạn đều là SAFE để người chơi có diện tích né đòn tối đa!
	if hazard.hasSyntheticTelegraph and not hazard.isTelegraph then
		local projPart = (hazard.instance and hazard.instance:IsA("BasePart")) and hazard.instance or next(hazard.activeParts)
		if projPart and projPart:IsA("BasePart") then
			local lookaheadDepth = hazard.telegraphLength or 40.0

			-- Đo độ rộng từ SelectionBox của đạn, Model BoundingBox hoặc part.Size
			local width = 6.0
			if hazard.instance and hazard.instance:IsA("Model") then
				local _, mSize = hazard.instance:GetBoundingBox()
				width = math.max(mSize.X, mSize.Y, mSize.Z)
			elseif data.boxes and #data.boxes > 0 then
				local w = getBoxWidth(data.boxes[1])
				if w and w > 0 then width = w end
			else
				width = math.max(projPart.Size.X, projPart.Size.Z)
			end
			if width < 3.0 then width = 5.0 end

			local curPos = (hazard.instance and hazard.instance:IsA("Model") and hazard.instance.PrimaryPart) and hazard.instance.PrimaryPart.Position or projPart.Position
			-- Khóa hướng bay ban đầu (Initial Forward 2D) ngay lúc đạn vừa spawn
			local initLook = (hazard.instance and hazard.instance:IsA("Model") and hazard.instance.PrimaryPart) and hazard.instance.PrimaryPart.CFrame.LookVector or projPart.CFrame.LookVector
			local lockedForward2D = Vector3.new(initLook.X, 0, initLook.Z)
			if hazard.isHomingToPlayer then
				local localPlayer = Players.LocalPlayer
				local char = localPlayer and localPlayer.Character
				local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
				if root and root:IsA("BasePart") then
					local toP = Vector3.new(root.Position.X - curPos.X, 0, root.Position.Z - curPos.Z)
					if toP.Magnitude > 0.3 then
						lockedForward2D = toP.Unit
					end
				end
			elseif lockedForward2D.Magnitude > 0.001 then
				lockedForward2D = lockedForward2D.Unit
			else
				lockedForward2D = Vector3.new(0, 0, -1)
			end

			local lastPos = curPos
			local visualCenter = curPos + lockedForward2D * ((lookaheadDepth / 2) - 1.0)

			local corridor = Instance.new("Part")
			corridor.Name = "SmartDodge_MovingTrajectory"
			corridor.Transparency = 1
			corridor.Anchored = true
			corridor.CanCollide = false
			corridor.CanQuery = false
			corridor.CanTouch = false
			corridor.Size = Vector3.new(width, 0.4, lookaheadDepth)
			corridor.CFrame = CFrame.lookAt(visualCenter, visualCenter + lockedForward2D)
			corridor.Parent = Workspace
			data.corridorPart = corridor

			local box = Instance.new("SelectionBox")
			box.Name = "SmartDodge_SelectionBox_Trajectory"
			box.Color3 = TELEGRAPH_BOX_COLOR
			box.SurfaceColor3 = TELEGRAPH_BOX_COLOR
			box.SurfaceTransparency = surfaceTransparency
			box.LineThickness = lineThickness
			box.Adornee = corridor
			box.Visible = espEnabled
			box.Parent = corridor
			table.insert(data.boxes, box)

			local bb = Instance.new("BillboardGui")
			bb.Name = "SmartDodge_NameTag_Trajectory"
			bb.Size = UDim2.fromOffset(200, 24)
			bb.StudsOffset = Vector3.new(0, 2.5, 0)
			bb.AlwaysOnTop = true
			bb.Enabled = nameTagsEnabled
			bb.Adornee = corridor

			local label = Instance.new("TextLabel")
			label.Size = UDim2.fromScale(1, 1)
			label.BackgroundTransparency = 1
			label.Font = Enum.Font.GothamBold
			label.TextSize = 12
			label.TextColor3 = TELEGRAPH_TEXT_COLOR
			label.TextStrokeTransparency = 0
			label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
			local trajTitle = hazard.isHomingToPlayer and "Homing Trajectory" or "Moving Trajectory"
			label.Text = ("%s [%s]"):format(hazard.instance.Name, trajTitle)
			label.Parent = bb
			bb.Parent = corridor
			table.insert(data.nameTags, bb)

			-- Heartbeat Runner (Chuẩn V1):
			-- Khóa hướng bay theo vector chuyển động thực tế (Delta Position) hoặc bám theo Player (Homing).
			-- Hoàn toàn miễn nhiễm với việc viên đạn tự quay tròn quanh trục CFrame!
			local heartbeatConn: RBXScriptConnection?
			heartbeatConn = RunService.Heartbeat:Connect(function()
				if not corridor or not corridor.Parent then
					if heartbeatConn then heartbeatConn:Disconnect(); heartbeatConn = nil end
					return
				end

				if not projPart or not projPart.Parent or projPart.Transparency >= 0.85 then
					if heartbeatConn then heartbeatConn:Disconnect(); heartbeatConn = nil end
					pcall(function() corridor:Destroy() end)
					return
				end

				local pPos = (hazard.instance and hazard.instance:IsA("Model") and hazard.instance.PrimaryPart) and hazard.instance.PrimaryPart.Position or projPart.Position

				local currentDepth = lookaheadDepth
				if hazard.isHomingToPlayer then
					local localPlayer = Players.LocalPlayer
					local char = localPlayer and localPlayer.Character
					local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
					if root and root:IsA("BasePart") then
						local toPlayer = Vector3.new(root.Position.X - pPos.X, 0, root.Position.Z - pPos.Z)
						local distToPlayer = toPlayer.Magnitude
						if distToPlayer > 0.3 then
							lockedForward2D = toPlayer.Unit
						end
						-- Giới hạn độ dài: Không nối 100% tới player nếu player ở xa, nhưng che phủ đủ khoảng cách gần
						currentDepth = math.clamp(distToPlayer + 2.0, 6.0, lookaheadDepth)
					else
						local moveDelta = pPos - lastPos
						local moveDelta2D = Vector3.new(moveDelta.X, 0, moveDelta.Z)
						if moveDelta2D.Magnitude > 0.05 then
							lockedForward2D = moveDelta2D.Unit
						end
					end
				else
					-- Tính hướng bay từ độ dời vị trí giữa 2 frame (Position Delta)
					local moveDelta = pPos - lastPos
					local moveDelta2D = Vector3.new(moveDelta.X, 0, moveDelta.Z)
					if moveDelta2D.Magnitude > 0.05 then
						lockedForward2D = moveDelta2D.Unit
					end
				end
				lastPos = pPos

				local newCenter = pPos + lockedForward2D * ((currentDepth / 2) - 1.0)
				corridor.Size = Vector3.new(width, 0.4, currentDepth)
				corridor.CFrame = CFrame.lookAt(newCenter, newCenter + lockedForward2D)
			end)

			data.heartbeatConn = heartbeatConn
		end
	end
end

--// Khi một part mới được thêm vào hazard đang chạy (ví dụ Model.DescendantAdded)
function visuals.OnHazardPartAdded(hazard: types.ActiveHazard, part: BasePart)
	local data = hazardVisualMap[hazard]
	if not data then return end

	local partCount = getActivePartCount(hazard)

	-- Nếu là Model và có bật toggle gộp (và hazard không bị cấm gộp):
	if unifiedModelBoxes and hazard.instance and hazard.instance:IsA("Model") and not hazard.neverUnify then
		if data.isUnified then
			-- Đang ở chế độ gộp Model -> Bounding box Model tự động bao quát part mới, không cần vẽ part lẻ
			return
		elseif partCount >= 2 then
			-- Trước đó chỉ có 1 part, nay tăng lên >= 2 part -> Chuyển sang gộp Model!
			visuals.RebuildHazardVisuals(hazard)
			return
		end
	end

	-- Nếu vẫn là 1 part hoặc không gộp -> vẽ part lẻ
	visuals.AttachPartVisual(hazard, part)
end

--// Xóa visual của một Part cụ thể
function visuals.RemoveHazardPart(hazard: types.ActiveHazard, part: BasePart)
	local data = hazardVisualMap[hazard]
	if not data then return end

	if data.isUnified then
		-- Đang ở chế độ gộp Model: kiểm tra số part còn lại
		local partCount = getActivePartCount(hazard)

		-- Nếu số part giảm xuống còn đúng 1: Tự động chuyển về vẽ part lẻ đó!
		if partCount == 1 then
			visuals.RebuildHazardVisuals(hazard)
		end
		return
	end

	if data.boxes then
		for i = #data.boxes, 1, -1 do
			local b = data.boxes[i]
			if b.Adornee == part or b.Parent == part then
				pcall(function() b:Destroy() end)
				table.remove(data.boxes, i)
			end
		end
	end

	if data.nameTags then
		for i = #data.nameTags, 1, -1 do
			local tag = data.nameTags[i]
			if tag.Adornee == part or tag.Parent == part then
				pcall(function() tag:Destroy() end)
				table.remove(data.nameTags, i)
			end
		end
	end
end

--// Xóa sạch visual của một hazard
function visuals.RemoveHazardVisuals(hazard: types.ActiveHazard)
	local data = hazardVisualMap[hazard]
	if not data then return end

	-- Nếu hazard này là tia định hướng (Telegraph Beam) mà viên tên lửa companion vẫn đang bay:
	-- KHÔNG xóa hành lang màu cam! Chuyển quyền quản lý corridor sang hazard của tên lửa
	if hazard.isTelegraph and data.corridorPart and data.corridorPart.Parent then
		local compPart = data.companionPart
		if not compPart or not compPart.Parent then
			local h, p = findCompanionProjectile(data.telegraphStartPos or data.corridorPart.Position)
			compPart = p
			data.companionPart = p
			data.companionHazard = h
		end

		if compPart and compPart.Parent and compPart.Transparency < 0.85 then
			local compHazard = data.companionHazard
			if not compHazard then
				for h in pairs(hazardVisualMap) do
					if h.instance == compPart or (h.activeParts and h.activeParts[compPart]) or (compPart.Parent and h.instance == compPart.Parent) then
						compHazard = h
						break
					end
				end
			end

			if compHazard and hazardVisualMap[compHazard] then
				local compData = hazardVisualMap[compHazard]
				compData.corridorPart = data.corridorPart
				compData.heartbeatConn = data.heartbeatConn
				compData.companionPart = data.companionPart
			end

			-- Tách corridorPart ra khỏi data của beam để không bị Destroy() ngay dưới đây
			data.corridorPart = nil
			data.heartbeatConn = nil
		end
	end

	if data.heartbeatConn then
		pcall(function() data.heartbeatConn:Disconnect() end)
		data.heartbeatConn = nil
	end

	if data.boxes then
		for _, b in ipairs(data.boxes) do
			pcall(function() b:Destroy() end)
		end
	end
	if data.nameTags then
		for _, tag in ipairs(data.nameTags) do
			pcall(function() tag:Destroy() end)
		end
	end
	if data.corridorPart then
		pcall(function() data.corridorPart:Destroy() end)
		data.corridorPart = nil
	end

	hazardVisualMap[hazard] = nil
end

--// Xóa toàn bộ visual khi tắt hệ thống
function visuals.ClearAll()
	for hazard, data in pairs(hazardVisualMap) do
		if data.heartbeatConn then
			pcall(function() data.heartbeatConn:Disconnect() end)
			data.heartbeatConn = nil
		end
		if data.boxes then
			for _, b in ipairs(data.boxes) do pcall(function() b:Destroy() end) end
		end
		if data.nameTags then
			for _, tag in ipairs(data.nameTags) do pcall(function() tag:Destroy() end) end
		end
		if data.corridorPart then
			pcall(function() data.corridorPart:Destroy() end)
		end
	end
	table.clear(hazardVisualMap)
end

--// Tái tạo lại visual cho 1 hazard (khi chuyển đổi chế độ gộp/tách)
function visuals.RebuildHazardVisuals(hazard: types.ActiveHazard)
	visuals.RemoveHazardVisuals(hazard)
	visuals.AttachHazardVisuals(hazard)
end

--// Tái tạo lại visual cho tất cả các hazard hiện hữu
function visuals.RebuildAll()
	local list = {}
	for hazard in pairs(hazardVisualMap) do
		table.insert(list, hazard)
	end
	for _, hazard in ipairs(list) do
		visuals.RemoveHazardVisuals(hazard)
		visuals.AttachHazardVisuals(hazard)
	end
end

--// Visual Hitbox Circle quanh chân Player (Phản ánh trực quan bán kính Padding)
local hitboxVisualEnabled = true
local hitboxPart: Part? = nil

local COLOR_HITBOX_SAFE = Color3.fromRGB(0, 240, 255)   -- Xanh Cyan Neon khi an toàn
local COLOR_HITBOX_DANGER = Color3.fromRGB(255, 50, 50) -- Đỏ rực Neon khi dính chiêu

function visuals.SetHitboxVisualEnabled(state: boolean)
	hitboxVisualEnabled = (state == true)
	if not hitboxVisualEnabled and hitboxPart then
		hitboxPart.Parent = nil
	end
end

function visuals.IsHitboxVisualEnabled(): boolean
	return hitboxVisualEnabled
end

local function getOrCreateHitboxPart(): Part
	if hitboxPart and hitboxPart.Parent then
		return hitboxPart
	end

	local part = Instance.new("Part")
	part.Name = "SmartDodge_PlayerHitboxCircle"
	part.Shape = Enum.PartType.Cylinder
	part.Material = Enum.Material.Neon
	part.Transparency = 0.55
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false
	part.CastShadow = false
	part.Color = COLOR_HITBOX_SAFE

	hitboxPart = part
	return part
end

function visuals.UpdatePlayerHitboxVisual(playerPos: Vector3?, inDanger: boolean?, padding: number?, floorY: number?)
	if not hitboxVisualEnabled or not playerPos then
		if hitboxPart then
			hitboxPart.Parent = nil
		end
		return
	end

	local part = getOrCreateHitboxPart()
	local pad = padding or 1.8
	local diameter = math.max(0.4, pad * 2)

	part.Size = Vector3.new(0.12, diameter, diameter)
	part.Color = (inDanger == true) and COLOR_HITBOX_DANGER or COLOR_HITBOX_SAFE

	local y = (floorY ~= nil) and floorY or (playerPos.Y - 2.85)
	part.CFrame = CFrame.new(playerPos.X, y, playerPos.Z) * CFrame.Angles(0, 0, math.rad(90))
	part.Parent = Workspace
end

return visuals
