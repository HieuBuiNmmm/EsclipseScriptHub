-- Path Record System – Visual: 3D Visualizer cho Path Macro & Real-time Record.
--   - Hiển thị từng Node của đường đi dưới dạng hình cầu 3D (SphereHandleAdornment).
--   - Lúc Record: Sphere màu ĐỎ (real-time thêm node khi nhân vật di chuyển).
--   - Lúc thường (xem room / playback / idle): Sphere màu XANH LÁ (đọc từ macro segment đã lưu của room).
--   - Event Spheres & 3D Text:
--       * ⚡ Skill (M2 / QE / Q / E): Sphere Tím + 3D Text + Ray tia hướng mặt (Facing).
--       * ⏳ Dwell (Nhịp dừng): Sphere Vàng + 3D Text thời gian dừng (vd: 1.5s) + Ray tia hướng mặt.
--       * 🚩 Start & 🏁 Finish: Sphere Cyan / Pink + 3D Text nổi bật.
--   - Hỗ trợ đường nối (LineHandleAdornment) và bộ Object Pool hiệu năng cao, không giật lag.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local storage = require("@routes/DungeonQuest/core/pathRecord/storage")
local recorder = require("@routes/DungeonQuest/core/pathRecord/recorder")
local mover = require("@routes/DungeonQuest/core/pathRecord/player")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

local Workspace = game:GetService("Workspace")
local RunService = services.RunService

--// Table
local visual = {}

--// Constants & Colors
local CONTAINER_NAME = "PR_PathVisual_Container"
local ANCHOR_NAME = "PR_PathVisual_Anchor"

local COLOR_RECORDING_SPHERE = Color3.fromRGB(255, 60, 60) -- Đỏ khi Record
local COLOR_RECORDING_LINE = Color3.fromRGB(255, 90, 90)

local COLOR_NORMAL_SPHERE = Color3.fromRGB(0, 255, 120) -- Xanh lá lúc thường
local COLOR_NORMAL_LINE = Color3.fromRGB(0, 220, 110)

-- Event Colors
local COLOR_START_NODE = Color3.fromRGB(0, 230, 255) -- Node bắt đầu (Cyan)
local COLOR_FINISH_NODE = Color3.fromRGB(255, 80, 180) -- Node kết thúc (Pink)
local COLOR_DWELL_NODE = Color3.fromRGB(255, 190, 30) -- Node Dwell / Dừng (Vàng Amber)
local COLOR_SKILL_NODE = Color3.fromRGB(200, 70, 255) -- Node Xả chiêu (Tím Neon)

local COLOR_SKILL_RAY = Color3.fromRGB(220, 100, 255)
local COLOR_DWELL_RAY = Color3.fromRGB(255, 210, 60)

local DEFAULT_SPHERE_RADIUS = 0.35
local EVENT_SPHERE_RADIUS = 0.55
local DEFAULT_LINE_THICKNESS = 2.5
local RAY_THICKNESS = 3.0
local VERTICAL_OFFSET = 0.35 -- Studs nâng cao nhẹ để không bị chìm dưới sàn gồ ghề

--// Settings
local enabled = true
local showLines = true
local showEvents = true
local showFacingRays = true
local nodeRadius = DEFAULT_SPHERE_RADIUS
local alwaysOnTop = true

--// Runtime State
local container = nil
local anchorPart = nil
local updateConnection = nil
local lastUpdateClock = 0

--// Object Pools
local spherePool = {}
local linePool = {}
local eventSpherePool = {}
local facingRayPool = {}
local badgePool = {}

--// Khởi tạo container và anchor part
local function ensureContainer()
	if container and container.Parent and anchorPart and anchorPart.Parent then
		return anchorPart
	end

	visual.Clear()

	local newContainer = Instance.new("Folder")
	newContainer.Name = CONTAINER_NAME
	newContainer.Parent = Workspace

	local newAnchor = Instance.new("Part")
	newAnchor.Name = ANCHOR_NAME
	newAnchor.Anchored = true
	newAnchor.CanCollide = false
	newAnchor.CanQuery = false
	newAnchor.CanTouch = false
	newAnchor.Transparency = 1
	newAnchor.Size = Vector3.new(1, 1, 1)
	newAnchor.CFrame = CFrame.new(0, 0, 0)
	newAnchor.Parent = newContainer

	container = newContainer
	anchorPart = newAnchor
	table.clear(spherePool)
	table.clear(linePool)
	table.clear(eventSpherePool)
	table.clear(facingRayPool)
	table.clear(badgePool)

	return anchorPart
end

--// Lấy hoặc tạo SphereHandleAdornment cho Node thông thường từ Pool
local function getSphereAdornment(index, anchor)
	local ad = spherePool[index]
	if not ad or not ad.Parent then
		ad = Instance.new("SphereHandleAdornment")
		ad.Name = "PR_NodeSphere_" .. tostring(index)
		ad.Adornee = anchor
		ad.AlwaysOnTop = alwaysOnTop
		ad.ZIndex = 5
		ad.Transparency = 0.2
		ad.Parent = anchor
		spherePool[index] = ad
	end
	return ad
end

--// Lấy hoặc tạo LineHandleAdornment từ Pool
local function getLineAdornment(index, anchor)
	local ad = linePool[index]
	if not ad or not ad.Parent then
		ad = Instance.new("LineHandleAdornment")
		ad.Name = "PR_PathLine_" .. tostring(index)
		ad.Adornee = anchor
		ad.AlwaysOnTop = alwaysOnTop
		ad.ZIndex = 4
		ad.Transparency = 0.3
		ad.Thickness = DEFAULT_LINE_THICKNESS
		ad.Parent = anchor
		linePool[index] = ad
	end
	return ad
end

--// Lấy hoặc tạo Event Sphere (kích thước lớn hơn cho Dwell / Skill / Start / Finish)
local function getEventSphereAdornment(index, anchor)
	local ad = eventSpherePool[index]
	if not ad or not ad.Parent then
		ad = Instance.new("SphereHandleAdornment")
		ad.Name = "PR_EventSphere_" .. tostring(index)
		ad.Adornee = anchor
		ad.AlwaysOnTop = alwaysOnTop
		ad.ZIndex = 8
		ad.Transparency = 0.15
		ad.Radius = EVENT_SPHERE_RADIUS
		ad.Parent = anchor
		eventSpherePool[index] = ad
	end
	return ad
end

--// Lấy hoặc tạo Facing Direction Ray
local function getFacingRayAdornment(index, anchor)
	local ad = facingRayPool[index]
	if not ad or not ad.Parent then
		ad = Instance.new("LineHandleAdornment")
		ad.Name = "PR_FacingRay_" .. tostring(index)
		ad.Adornee = anchor
		ad.AlwaysOnTop = alwaysOnTop
		ad.ZIndex = 9
		ad.Transparency = 0.1
		ad.Thickness = RAY_THICKNESS
		ad.Parent = anchor
		facingRayPool[index] = ad
	end
	return ad
end

--// Lấy hoặc tạo 3D Text Badge (BillboardGui + Frame + TextLabel)
local function getBadge(index, anchor)
	local entry = badgePool[index]
	if not entry or not entry.billboard or not entry.billboard.Parent then
		local att = Instance.new("Attachment")
		att.Name = "PR_BadgeAtt_" .. tostring(index)
		att.Parent = anchor

		local bb = Instance.new("BillboardGui")
		bb.Name = "PR_BadgeGui_" .. tostring(index)
		bb.Adornee = att
		bb.Size = UDim2.new(0, 115, 0, 24)
		bb.StudsOffset = Vector3.new(0, 1.6, 0)
		bb.AlwaysOnTop = true
		bb.MaxDistance = 180
		bb.LightInfluence = 0
		bb.Parent = container

		local frame = Instance.new("Frame")
		frame.Name = "BadgeFrame"
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
		stroke.Color = COLOR_SKILL_NODE
		stroke.Thickness = 1.4
		stroke.Transparency = 0.15
		stroke.Parent = frame

		local label = Instance.new("TextLabel")
		label.Name = "Text"
		label.Size = UDim2.new(1, -6, 1, 0)
		label.Position = UDim2.new(0, 3, 0, 0)
		label.BackgroundTransparency = 1
		label.Font = Enum.Font.GothamBold
		label.TextSize = 11
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.RichText = true
		label.Text = ""
		label.TextXAlignment = Enum.TextXAlignment.Center
		label.TextYAlignment = Enum.TextYAlignment.Center
		label.Parent = frame

		entry = {
			attachment = att,
			billboard = bb,
			frame = frame,
			stroke = stroke,
			label = label,
		}
		badgePool[index] = entry
	end
	return entry
end

--// Chuyển đổi an toàn hướng facing sang Vector3 unit
local function toVector3Facing(facing)
	if not facing then return nil end
	if typeof(facing) == "Vector3" then
		if facing.Magnitude > 0.001 then return facing.Unit end
		return nil
	end
	if type(facing) == "table" and type(facing.X) == "number" and type(facing.Z) == "number" then
		local v = Vector3.new(facing.X, 0, facing.Z)
		if v.Magnitude > 0.001 then return v.Unit end
	end
	return nil
end

--// Ẩn tất cả adornments đang có trong pool
local function hideAllAdornments()
	for _, sphere in ipairs(spherePool) do
		if sphere and sphere.Parent then sphere.Visible = false end
	end
	for _, line in ipairs(linePool) do
		if line and line.Parent then line.Visible = false end
	end
	for _, evSphere in ipairs(eventSpherePool) do
		if evSphere and evSphere.Parent then evSphere.Visible = false end
	end
	for _, ray in ipairs(facingRayPool) do
		if ray and ray.Parent then ray.Visible = false end
	end
	for _, badge in ipairs(badgePool) do
		if badge and badge.billboard and badge.billboard.Parent then
			badge.billboard.Enabled = false
		end
	end
end

--// Cập nhật hiển thị path nodes, lines, event spheres & 3D text
function visual.Update()
	if not enabled then
		hideAllAdornments()
		return
	end

	if shared.IsInLobby() then
		hideAllAdornments()
		return
	end

	local isRecording = recorder.IsRecording()
	local pointLists = {}
	local dwellsList = {}
	local skillsList = {}

	if isRecording then
		-- Chế độ RECORDING: Lấy toàn bộ points của các phase và phase hiện tại đang ghi
		local prevPhases = recorder.GetRoomPhases and recorder.GetRoomPhases()
		if prevPhases and #prevPhases > 0 then
			for _, p in ipairs(prevPhases) do
				if p and p.points and #p.points > 0 then
					table.insert(pointLists, p.points)
				end
			end
		end

		local curPoints = recorder.GetCurrentPoints()
		if curPoints and #curPoints > 0 then
			table.insert(pointLists, curPoints)
		end

		local curDwells = recorder.GetCurrentDwells and recorder.GetCurrentDwells()
		if curDwells then dwellsList = curDwells end

		local curSkills = recorder.GetCurrentSkills and recorder.GetCurrentSkills()
		if curSkills then skillsList = curSkills end
	else
		-- Chế độ THƯỜNG (Idle / Playback / Xem Room): Lấy points từ segment đã lưu của map & room hiện tại
		local map = shared.GetCurrentDungeonName()
		local room = shared.GetCurrentRoomIndex()

		if map and #map > 0 and room > 0 then
			local seg = storage.GetRoomSegment(map, room)
			if seg then
				if seg.phases and #seg.phases > 0 then
					for _, p in ipairs(seg.phases) do
						if p and p.points and #p.points > 0 then
							table.insert(pointLists, p.points)
						end
					end
				elseif seg.points and #seg.points > 0 then
					table.insert(pointLists, seg.points)
				end

				if seg.events then
					dwellsList = seg.events.dwells or {}
					skillsList = seg.events.skills or {}
				end
			end
		end
	end

	if #pointLists == 0 then
		hideAllAdornments()
		return
	end

	local anchor = ensureContainer()
	if not anchor then return end

	local sphereColor = isRecording and COLOR_RECORDING_SPHERE or COLOR_NORMAL_SPHERE
	local lineColor = isRecording and COLOR_RECORDING_LINE or COLOR_NORMAL_LINE

	local sphereIdx = 0
	local lineIdx = 0
	local evSphereIdx = 0
	local rayIdx = 0
	local badgeIdx = 0

	local firstGlobalPos = nil
	local lastGlobalPos = nil

	-- 1. Vẽ các Node Spheres & Connecting Lines
	for _, pts in ipairs(pointLists) do
		local numPts = #pts
		if numPts > 0 then
			if not firstGlobalPos then firstGlobalPos = pts[1] end
			lastGlobalPos = pts[numPts]

			for i = 1, numPts do
				local pos = pts[i]
				if pos then
					sphereIdx += 1
					local sphere = getSphereAdornment(sphereIdx, anchor)
					sphere.Radius = nodeRadius
					sphere.Color3 = sphereColor
					sphere.AlwaysOnTop = alwaysOnTop
					sphere.CFrame = CFrame.new(pos + Vector3.new(0, VERTICAL_OFFSET, 0))
					sphere.Visible = true
				end
			end

			-- Vẽ đường nối các node
			if showLines and numPts >= 2 then
				for i = 1, numPts - 1 do
					local p1 = pts[i]
					local p2 = pts[i + 1]
					if p1 and p2 then
						local v1 = p1 + Vector3.new(0, VERTICAL_OFFSET, 0)
						local v2 = p2 + Vector3.new(0, VERTICAL_OFFSET, 0)
						local dist = (v2 - v1).Magnitude
						if dist > 0.05 then
							lineIdx += 1
							local line = getLineAdornment(lineIdx, anchor)
							line.Length = dist
							line.Thickness = DEFAULT_LINE_THICKNESS
							line.Color3 = lineColor
							line.AlwaysOnTop = alwaysOnTop
							line.CFrame = CFrame.lookAt(v1, v2)
							line.Visible = true
						end
					end
				end
			end
		end
	end

	-- 2. Vẽ Event Spheres & 3D Text (Skills / Dwells / Start / Finish)
	if showEvents then
		-- Start Marker: Đại diện duy nhất cho điểm xuất phát (gộp cả nhịp dừng Start nếu có)
		local startDwell = nil
		if firstGlobalPos then
			for _, d in ipairs(dwellsList) do
				if d.pos and (d.pos - firstGlobalPos).Magnitude < 1.5 then
					startDwell = d
					break
				end
			end

			evSphereIdx += 1
			local startSphere = getEventSphereAdornment(evSphereIdx, anchor)
			startSphere.Radius = EVENT_SPHERE_RADIUS
			startSphere.Color3 = COLOR_START_NODE
			startSphere.AlwaysOnTop = alwaysOnTop
			startSphere.CFrame = CFrame.new(firstGlobalPos + Vector3.new(0, VERTICAL_OFFSET, 0))
			startSphere.Visible = true

			badgeIdx += 1
			local badge = getBadge(badgeIdx, anchor)
			badge.attachment.WorldPosition = firstGlobalPos + Vector3.new(0, VERTICAL_OFFSET, 0)
			badge.stroke.Color = COLOR_START_NODE

			local startPauseSec = mover and mover.GetStartPauseTime and mover.GetStartPauseTime() or 0
			if startPauseSec > 0 then
				badge.label.Text = ("<font color='rgb(0,240,255)'><b>🚩 START (%.1fs)</b></font>"):format(startPauseSec)
			else
				badge.label.Text = "<font color='rgb(0,240,255)'><b>🚩 START</b></font>"
			end
			badge.billboard.Enabled = true

			-- Start Facing Ray (nếu có hướng xoay mặt lúc xuất phát)
			if showFacingRays and startDwell and startDwell.facing then
				local facingVec = toVector3Facing(startDwell.facing)
				if facingVec then
					rayIdx += 1
					local ray = getFacingRayAdornment(rayIdx, anchor)
					local rStart = firstGlobalPos + Vector3.new(0, VERTICAL_OFFSET, 0)
					local rEnd = rStart + facingVec * 3.5
					ray.Length = 3.5
					ray.Color3 = COLOR_START_NODE
					ray.AlwaysOnTop = alwaysOnTop
					ray.CFrame = CFrame.lookAt(rStart, rEnd)
					ray.Visible = true
				end
			end
		end

		-- Dwells (Nhịp dừng): Bỏ qua dwell ở Start Node và Finish Node để không bị đè 2 badge
		for _, d in ipairs(dwellsList) do
			local dPos = d.pos
			local isAtStart = firstGlobalPos and (dPos - firstGlobalPos).Magnitude < 1.5
			local isAtFinish = lastGlobalPos and (dPos - lastGlobalPos).Magnitude < 1.5
			if dPos and not isAtStart and not isAtFinish then
				evSphereIdx += 1
				local dSphere = getEventSphereAdornment(evSphereIdx, anchor)
				dSphere.Radius = EVENT_SPHERE_RADIUS
				dSphere.Color3 = COLOR_DWELL_NODE
				dSphere.AlwaysOnTop = alwaysOnTop
				dSphere.CFrame = CFrame.new(dPos + Vector3.new(0, VERTICAL_OFFSET, 0))
				dSphere.Visible = true

				local durSec = math.round((d.dur or 0) * 10) / 10
				badgeIdx += 1
				local badge = getBadge(badgeIdx, anchor)
				badge.attachment.WorldPosition = dPos + Vector3.new(0, VERTICAL_OFFSET, 0)
				badge.stroke.Color = COLOR_DWELL_NODE
				badge.label.Text = ("<font color='rgb(255,200,60)'><b>⏳ Pause (%.1fs)</b></font>"):format(durSec)
				badge.billboard.Enabled = true

				-- Dwell Facing Ray
				if showFacingRays then
					local facingVec = toVector3Facing(d.facing)
					if facingVec then
						rayIdx += 1
						local ray = getFacingRayAdornment(rayIdx, anchor)
						local rStart = dPos + Vector3.new(0, VERTICAL_OFFSET, 0)
						local rEnd = rStart + facingVec * 3.0
						ray.Length = 3.0
						ray.Color3 = COLOR_DWELL_RAY
						ray.AlwaysOnTop = alwaysOnTop
						ray.CFrame = CFrame.lookAt(rStart, rEnd)
						ray.Visible = true
					end
				end
			end
		end

		-- Skills (Xả chiêu Q / E / QE)
		for _, s in ipairs(skillsList) do
			local sPos = s.pos
			if sPos then
				evSphereIdx += 1
				local sSphere = getEventSphereAdornment(evSphereIdx, anchor)
				sSphere.Radius = EVENT_SPHERE_RADIUS
				sSphere.Color3 = COLOR_SKILL_NODE
				sSphere.AlwaysOnTop = alwaysOnTop
				sSphere.CFrame = CFrame.new(sPos + Vector3.new(0, VERTICAL_OFFSET, 0))
				sSphere.Visible = true

				local skillName = (s.key and #s.key > 0) and s.key or "QE"
				badgeIdx += 1
				local badge = getBadge(badgeIdx, anchor)
				badge.attachment.WorldPosition = sPos + Vector3.new(0, VERTICAL_OFFSET, 0)
				badge.stroke.Color = COLOR_SKILL_NODE
				badge.label.Text = ("<font color='rgb(220,100,255)'><b>⚡ Skill [%s]</b></font>"):format(skillName)
				badge.billboard.Enabled = true

				-- Skill Facing Ray
				if showFacingRays then
					local facingVec = toVector3Facing(s.facing)
					if facingVec then
						rayIdx += 1
						local ray = getFacingRayAdornment(rayIdx, anchor)
						local rStart = sPos + Vector3.new(0, VERTICAL_OFFSET, 0)
						local rEnd = rStart + facingVec * 3.8
						ray.Length = 3.8
						ray.Color3 = COLOR_SKILL_RAY
						ray.AlwaysOnTop = alwaysOnTop
						ray.CFrame = CFrame.lookAt(rStart, rEnd)
						ray.Visible = true
					end
				end
			end
		end

		-- Finish Marker (chỉ hiện lúc thường hoặc khi có nhiều hơn 1 điểm)
		local finishDwell = nil
		if lastGlobalPos and lastGlobalPos ~= firstGlobalPos and not isRecording then
			for _, d in ipairs(dwellsList) do
				if d.pos and (d.pos - lastGlobalPos).Magnitude < 1.5 then
					finishDwell = d
					break
				end
			end

			evSphereIdx += 1
			local finishSphere = getEventSphereAdornment(evSphereIdx, anchor)
			finishSphere.Radius = EVENT_SPHERE_RADIUS
			finishSphere.Color3 = COLOR_FINISH_NODE
			finishSphere.AlwaysOnTop = alwaysOnTop
			finishSphere.CFrame = CFrame.new(lastGlobalPos + Vector3.new(0, VERTICAL_OFFSET, 0))
			finishSphere.Visible = true

			badgeIdx += 1
			local badge = getBadge(badgeIdx, anchor)
			badge.attachment.WorldPosition = lastGlobalPos + Vector3.new(0, VERTICAL_OFFSET, 0)
			badge.stroke.Color = COLOR_FINISH_NODE

			local pauseSec = mover and mover.GetStartPauseTime and mover.GetStartPauseTime() or 0
			if finishDwell and pauseSec > 0 then
				badge.label.Text = ("<font color='rgb(255,100,200)'><b>🏁 FINISH (%.1fs)</b></font>"):format(pauseSec)
			else
				badge.label.Text = "<font color='rgb(255,100,200)'><b>🏁 FINISH</b></font>"
			end
			badge.billboard.Enabled = true

			-- Finish Facing Ray (nếu có hướng xoay mặt lúc kết thúc)
			if showFacingRays and finishDwell and finishDwell.facing then
				local facingVec = toVector3Facing(finishDwell.facing)
				if facingVec then
					rayIdx += 1
					local ray = getFacingRayAdornment(rayIdx, anchor)
					local rStart = lastGlobalPos + Vector3.new(0, VERTICAL_OFFSET, 0)
					local rEnd = rStart + facingVec * 3.5
					ray.Length = 3.5
					ray.Color3 = COLOR_FINISH_NODE
					ray.AlwaysOnTop = alwaysOnTop
					ray.CFrame = CFrame.lookAt(rStart, rEnd)
					ray.Visible = true
				end
			end
		end
	end

	-- Ẩn các sphere thừa trong pool
	for i = sphereIdx + 1, #spherePool do
		local sphere = spherePool[i]
		if sphere and sphere.Parent then sphere.Visible = false end
	end

	-- Ẩn các line thừa trong pool
	for i = lineIdx + 1, #linePool do
		local line = linePool[i]
		if line and line.Parent then line.Visible = false end
	end

	-- Ẩn các event sphere thừa trong pool
	for i = evSphereIdx + 1, #eventSpherePool do
		local evSphere = eventSpherePool[i]
		if evSphere and evSphere.Parent then evSphere.Visible = false end
	end

	-- Ẩn các facing ray thừa trong pool
	for i = rayIdx + 1, #facingRayPool do
		local ray = facingRayPool[i]
		if ray and ray.Parent then ray.Visible = false end
	end

	-- Ẩn các badge thừa trong pool
	for i = badgeIdx + 1, #badgePool do
		local badge = badgePool[i]
		if badge and badge.billboard and badge.billboard.Parent then
			badge.billboard.Enabled = false
		end
	end
end

--// Vòng lặp cập nhật liên tục
local function startUpdateLoop()
	if updateConnection then return end
	updateConnection = RunService.Heartbeat:Connect(function()
		local now = os.clock()
		local isRec = recorder.IsRecording()
		-- Khi record thì cập nhật nhanh hơn (0.03s) để bám sát chuyển động; lúc thường 0.1s
		local interval = isRec and 0.03 or 0.1
		if now - lastUpdateClock < interval then return end
		lastUpdateClock = now

		pcall(visual.Update)
	end)
end

--// Configuration API
function visual.SetEnabled(state)
	enabled = state and true or false
	if not enabled then
		hideAllAdornments()
	else
		pcall(visual.Update)
	end
end

function visual.IsEnabled()
	return enabled
end

function visual.SetShowLines(state)
	showLines = state and true or false
	if not showLines then
		for _, line in ipairs(linePool) do
			if line and line.Parent then line.Visible = false end
		end
	else
		pcall(visual.Update)
	end
end

function visual.IsShowLinesEnabled()
	return showLines
end

function visual.SetShowEvents(state)
	showEvents = state and true or false
	if not showEvents then
		for _, evSphere in ipairs(eventSpherePool) do
			if evSphere and evSphere.Parent then evSphere.Visible = false end
		end
		for _, badge in ipairs(badgePool) do
			if badge and badge.billboard and badge.billboard.Parent then badge.billboard.Enabled = false end
		end
	else
		pcall(visual.Update)
	end
end

function visual.IsShowEventsEnabled()
	return showEvents
end

function visual.SetShowFacingRays(state)
	showFacingRays = state and true or false
	if not showFacingRays then
		for _, ray in ipairs(facingRayPool) do
			if ray and ray.Parent then ray.Visible = false end
		end
	else
		pcall(visual.Update)
	end
end

function visual.IsShowFacingRaysEnabled()
	return showFacingRays
end

function visual.SetNodeRadius(radius)
	if type(radius) == "number" then
		nodeRadius = math.clamp(radius, 0.1, 1.5)
		pcall(visual.Update)
	end
end

function visual.GetNodeRadius()
	return nodeRadius
end

function visual.SetAlwaysOnTop(state)
	alwaysOnTop = state and true or false
	for _, sphere in ipairs(spherePool) do
		if sphere and sphere.Parent then sphere.AlwaysOnTop = alwaysOnTop end
	end
	for _, line in ipairs(linePool) do
		if line and line.Parent then line.AlwaysOnTop = alwaysOnTop end
	end
	for _, evSphere in ipairs(eventSpherePool) do
		if evSphere and evSphere.Parent then evSphere.AlwaysOnTop = alwaysOnTop end
	end
	for _, ray in ipairs(facingRayPool) do
		if ray and ray.Parent then ray.AlwaysOnTop = alwaysOnTop end
	end
	for _, badge in ipairs(badgePool) do
		if badge and badge.billboard and badge.billboard.Parent then badge.billboard.AlwaysOnTop = alwaysOnTop end
	end
end

function visual.IsAlwaysOnTopEnabled()
	return alwaysOnTop
end

--// Dọn dẹp visual container
function visual.Clear()
	hideAllAdornments()
	table.clear(spherePool)
	table.clear(linePool)
	table.clear(eventSpherePool)
	table.clear(facingRayPool)
	table.clear(badgePool)
	local existing = Workspace:FindFirstChild(CONTAINER_NAME)
	if existing then
		pcall(function() existing:Destroy() end)
	end
	container = nil
	anchorPart = nil
end

function visual.Destroy()
	if updateConnection then
		updateConnection:Disconnect()
		updateConnection = nil
	end
	visual.Clear()
end

-- Clear on load once in case an old visual container exists
visual.Clear()

-- Tự động chạy vòng lặp cập nhật
startUpdateLoop()

-- Đăng ký dọn dẹp khi script unload
lifecycle.Register(function()
	visual.Destroy()
end)

return visual