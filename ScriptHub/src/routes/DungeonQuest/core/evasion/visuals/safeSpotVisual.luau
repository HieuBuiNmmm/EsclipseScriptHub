-- HazardScanner – Safe Spot Visualizer (DungeonQuest).
-- Module chuyên trách vẽ và quản lý Adornments hiển thị Safe Spot Marker và Candidate Debug Grid.

--// Constants & Colors
local COLOR_SAFE_SPOT = Color3.fromRGB(0, 255, 120) -- Xanh lá Neon dạ quang
local COLOR_LINE = Color3.fromRGB(0, 255, 150)
local COLOR_CENTER = Color3.fromRGB(255, 255, 255) -- Tâm trắng nổi bật
local COLOR_CANDIDATE_SAFE = Color3.fromRGB(0, 235, 140)
local COLOR_CANDIDATE_UNSAFE = Color3.fromRGB(255, 60, 60)

local GROUND_THICKNESS = 0.20
local MARKER_RADIUS = 1.4 -- studs
local CENTER_RADIUS = 0.45 -- studs

--// Table
local safeSpotVisual = {}

--// State
local markerAdornment = nil
local centerAdornment = nil
local lineAdornment = nil
local candidatePool = {}

--// Đảm bảo adornments chính của Safe Spot tồn tại
local function ensureMainVisuals(root)
	if not root then return end

	-- Marker đĩa tròn ngoài
	if not markerAdornment or not markerAdornment.Parent then
		if markerAdornment then pcall(function() markerAdornment:Destroy() end) end
		local ad = Instance.new("CylinderHandleAdornment")
		ad.Name = "SafeSpot_OuterMarker"
		ad.Adornee = root
		ad.Radius = MARKER_RADIUS
		ad.Height = GROUND_THICKNESS
		ad.Color3 = COLOR_SAFE_SPOT
		ad.Transparency = 0.35
		ad.ZIndex = 6
		ad.AlwaysOnTop = false
		ad.Visible = false
		ad.Parent = root
		markerAdornment = ad
	end

	-- Điểm tâm tròn màu trắng
	if not centerAdornment or not centerAdornment.Parent then
		if centerAdornment then pcall(function() centerAdornment:Destroy() end) end
		local cad = Instance.new("CylinderHandleAdornment")
		cad.Name = "SafeSpot_CenterDot"
		cad.Adornee = root
		cad.Radius = CENTER_RADIUS
		cad.Height = GROUND_THICKNESS + 0.05
		cad.Color3 = COLOR_CENTER
		cad.Transparency = 0.15
		cad.ZIndex = 7
		cad.AlwaysOnTop = false
		cad.Visible = false
		cad.Parent = root
		centerAdornment = cad
	end

	-- Đường dẫn nối từ Player -> Safe Spot
	if not lineAdornment or not lineAdornment.Parent then
		if lineAdornment then pcall(function() lineAdornment:Destroy() end) end
		local lad = Instance.new("LineHandleAdornment")
		lad.Name = "SafeSpot_EscapeLine"
		lad.Adornee = root
		lad.Color3 = COLOR_LINE
		lad.Thickness = 3.5
		lad.Transparency = 0.20
		lad.ZIndex = 6
		lad.AlwaysOnTop = false
		lad.Visible = false
		lad.Parent = root
		lineAdornment = lad
	end
end

--// Đảm bảo adornment cho từng candidate trong pool
local function ensureCandidateAdornment(index, root)
	local entry = candidatePool[index]
	if not entry then
		local dot = Instance.new("CylinderHandleAdornment")
		dot.Name = "SafeSpot_CandidateDot_" .. index
		dot.Adornee = root
		dot.Radius = 0.25
		dot.Height = GROUND_THICKNESS
		dot.ZIndex = 4
		dot.AlwaysOnTop = false
		dot.Visible = false
		dot.Parent = root

		local line = Instance.new("LineHandleAdornment")
		line.Name = "SafeSpot_CandidateLine_" .. index
		line.Adornee = root
		line.Thickness = 1.2
		line.ZIndex = 4
		line.AlwaysOnTop = false
		line.Visible = false
		line.Parent = root

		entry = { dot = dot, line = line }
		candidatePool[index] = entry
	else
		if entry.dot and entry.dot.Adornee ~= root then
			entry.dot.Adornee = root
			entry.dot.Parent = root
		end
		if entry.line and entry.line.Adornee ~= root then
			entry.line.Adornee = root
			entry.line.Parent = root
		end
	end
	return entry
end

--// Ẩn toàn bộ candidate visuals
function safeSpotVisual.HideCandidates()
	for _, entry in ipairs(candidatePool) do
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Ẩn toàn bộ visuals
function safeSpotVisual.Hide()
	if markerAdornment and markerAdornment.Parent then markerAdornment.Visible = false end
	if centerAdornment and centerAdornment.Parent then centerAdornment.Visible = false end
	if lineAdornment and lineAdornment.Parent then lineAdornment.Visible = false end
	safeSpotVisual.HideCandidates()
end

--// Cập nhật hiển thị Candidate Debug Grid
local function updateCandidateGrid(root, targetY, evaluatedCandidates, isShowCandidates)
	if not isShowCandidates or not evaluatedCandidates or #evaluatedCandidates == 0 then
		safeSpotVisual.HideCandidates()
		return
	end

	local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.05, root.Position.Z)
	local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)

	for i, cand in ipairs(evaluatedCandidates) do
		local entry = ensureCandidateAdornment(i, root)
		local candWorld = Vector3.new(cand.pos.X, targetY + 0.05, cand.pos.Z)
		local localEnd = root.CFrame:PointToObjectSpace(candWorld)

		local color = cand.isSafe and COLOR_CANDIDATE_SAFE or COLOR_CANDIDATE_UNSAFE
		local alpha = cand.isSafe and 0.35 or 0.55

		-- 1. Dot tại điểm candidate
		if entry.dot and entry.dot.Parent then
			local desiredDotCF = CFrame.new(candWorld) * CFrame.Angles(math.rad(90), 0, 0)
			entry.dot.CFrame = root.CFrame:ToObjectSpace(desiredDotCF)
			entry.dot.Color3 = color
			entry.dot.Transparency = alpha
			entry.dot.Radius = cand.isSafe and 0.30 or 0.20
			entry.dot.Visible = true
		end

		-- 2. Line nối từ chân Player -> candidate
		if entry.line and entry.line.Parent then
			local delta = localEnd - localStart
			local length = delta.Magnitude
			if length > 0.2 then
				entry.line.CFrame = CFrame.lookAt(localStart, localEnd)
				entry.line.Length = length
				entry.line.Color3 = color
				entry.line.Transparency = alpha + 0.15
				entry.line.Thickness = cand.isSafe and 1.4 or 0.9
				entry.line.Visible = true
			else
				entry.line.Visible = false
			end
		end
	end

	-- Ẩn các adornment không dùng đến
	for i = #evaluatedCandidates + 1, #candidatePool do
		local entry = candidatePool[i]
		if entry.dot and entry.dot.Parent then entry.dot.Visible = false end
		if entry.line and entry.line.Parent then entry.line.Visible = false end
	end
end

--// Cập nhật hiển thị Safe Spot chính và Candidates
function safeSpotVisual.Update(root, safePos, targetY, evaluatedCandidates, isVisualEnabled, isShowCandidates)
	if not root or not root.Parent or not isVisualEnabled or not safePos then
		safeSpotVisual.Hide()
		return
	end

	ensureMainVisuals(root)

	local worldTargetPos = Vector3.new(safePos.X, targetY, safePos.Z)

	-- 1. Marker đĩa tròn ngoài
	if markerAdornment and markerAdornment.Parent then
		local desiredWorldCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		markerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredWorldCF)
		markerAdornment.Visible = true
	end

	-- 2. Điểm tâm tròn màu trắng
	if centerAdornment and centerAdornment.Parent then
		local desiredCenterCF = CFrame.new(worldTargetPos) * CFrame.Angles(math.rad(90), 0, 0)
		centerAdornment.CFrame = root.CFrame:ToObjectSpace(desiredCenterCF)
		centerAdornment.Visible = true
	end

	-- 3. Line dẫn đường từ chân Player -> Safe Spot
	if lineAdornment and lineAdornment.Parent then
		local playerFeetWorld = Vector3.new(root.Position.X, targetY + 0.1, root.Position.Z)
		local safeFeetWorld = Vector3.new(safePos.X, targetY + 0.1, safePos.Z)

		local localStart = root.CFrame:PointToObjectSpace(playerFeetWorld)
		local localEnd = root.CFrame:PointToObjectSpace(safeFeetWorld)
		local delta = localEnd - localStart
		local length = delta.Magnitude

		if length > 0.3 then
			lineAdornment.CFrame = CFrame.new(localStart)
			lineAdornment.Length = length
			lineAdornment.CFrame = CFrame.lookAt(localStart, localEnd)
			lineAdornment.Visible = true
		else
			lineAdornment.Visible = false
		end
	end

	-- 4. Candidate debug grid
	updateCandidateGrid(root, targetY, evaluatedCandidates, isShowCandidates)
end

--// Dọn dẹp toàn bộ visual
function safeSpotVisual.Cleanup()
	if markerAdornment then pcall(function() markerAdornment:Destroy() end); markerAdornment = nil end
	if centerAdornment then pcall(function() centerAdornment:Destroy() end); centerAdornment = nil end
	if lineAdornment then pcall(function() lineAdornment:Destroy() end); lineAdornment = nil end

	for _, entry in ipairs(candidatePool) do
		if entry.dot then pcall(function() entry.dot:Destroy() end) end
		if entry.line then pcall(function() entry.line:Destroy() end) end
	end
	table.clear(candidatePool)
end

return safeSpotVisual
