-- HazardScannerV2 - Boss Telegraph & Animation Tracker
-- Theo dõi Boss độc lập: Bắt Animation Track đang chạy (Cast animation),
-- Tiến độ niệm chiêu (TimePosition / Length), Góc nhìn và Trạng thái chiến đấu.

--// Imports
local Workspace = game:GetService("Workspace")

--// Table
local bossWatcher = {}

--// State
local currentBossModel = nil
local lastPlayingTracks = {}
local isRunning = false

-- Tìm Model của Boss trong dungeon hoặc Workspace
local function findBossModel()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon then
		for _, child in ipairs(dungeon:GetChildren()) do
			if child:IsA("Model") then
				local hum = child:FindFirstChildOfClass("Humanoid")
				local root = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
				if hum and hum.Health > 0 and root then
					local mName = child.Name:lower()
					if string.find(mName, "boss") ~= nil or (child.Parent and string.find(child.Parent.Name:lower(), "boss") ~= nil) then
						return child, hum, root
					end
				end
			end
		end
	end
	for _, child in ipairs(Workspace:GetChildren()) do
		if child:IsA("Model") and child.Name ~= "dungeon" then
			local hum = child:FindFirstChildOfClass("Humanoid")
			local root = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
			if hum and hum.Health > 0 and root then
				local mName = child.Name:lower()
				if string.find(mName, "boss") ~= nil then
					return child, hum, root
				end
			end
		end
	end
	return nil, nil, nil
end

-- Trích xuất danh sách Animation Tracks đang phát trên Boss
local function getBossAnimationTracks(humanoid)
	local activeTracks = {}
	if not humanoid then return activeTracks end

	local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
	local tracks = {}
	pcall(function()
		tracks = animator:GetPlayingAnimationTracks()
	end)

	for _, track in ipairs(tracks) do
		if track and track.IsPlaying and track.WeightCurrent > 0.1 then
			local animId = ""
			if track.Animation then
				animId = track.Animation.AnimationId or ""
			end
			local length = math.max(0.1, track.Length)
			local progress = math.clamp(track.TimePosition / length, 0, 1)

			table.insert(activeTracks, {
				name = track.Name or "Anim",
				animId = animId,
				speed = track.Speed,
				length = length,
				timePos = track.TimePosition,
				progress = progress,
				weight = track.WeightCurrent,
			})
		end
	end

	return activeTracks
end

-- Trích xuất góc quay Yaw (degrees)
local function getYawDegrees(lookVector)
	if not lookVector or lookVector.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lookVector.X, -lookVector.Z))
end

function bossWatcher.Start()
	isRunning = true
end

function bossWatcher.Stop()
	isRunning = false
	currentBossModel = nil
end

function bossWatcher.Update(now)
	-- Periodic check if needed
end

-- Lấy dữ liệu Boss Telegraph toàn diện cho Telemetry
function bossWatcher.GetTelegraphData()
	local model, humanoid, root = findBossModel()

	if not model or not root or not humanoid then
		return {
			active = false,
			bossIndex = 0,
			name = "None",
			x = 0, y = 0, z = 0,
			health = 0, maxHealth = 100, healthPercent = 100,
			yaw = 0,
			isCasting = false,
			activeAnimations = {},
			arenaActive = false,
			arenaCenterX = 0,
			arenaCenterZ = 0,
			arenaRadius = 80.0,
			innerDeadzoneActive = false,
			innerDeadzoneRadius = 0,
		}
	end

	local animTracks = getBossAnimationTracks(humanoid)
	local isCasting = #animTracks > 0
	local primaryAnim = animTracks[1] or nil

	return {
		active = true,
		bossIndex = 1,
		name = model.Name,
		x = math.round(root.Position.X * 10) / 10,
		y = math.round(root.Position.Y * 10) / 10,
		z = math.round(root.Position.Z * 10) / 10,
		health = math.max(0, math.round(humanoid.Health)),
		maxHealth = math.max(1, math.round(humanoid.MaxHealth)),
		healthPercent = math.clamp((humanoid.Health / humanoid.MaxHealth) * 100, 0, 100),
		yaw = math.round(getYawDegrees(root.CFrame.LookVector) * 10) / 10,
		isCasting = isCasting,
		activeAnimations = animTracks,
		primaryAnimation = primaryAnim,
		arenaActive = false,
		arenaCenterX = 0,
		arenaCenterZ = 0,
		arenaRadius = 80.0,
		innerDeadzoneActive = false,
		innerDeadzoneRadius = 0,
	}
end

bossWatcher.GetBossTelegraphData = bossWatcher.GetTelegraphData
bossWatcher.FindBossModel = findBossModel

return bossWatcher
