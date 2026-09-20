-- HazardScannerV2 - Boss Telegraph & Animation Tracker
-- Theo dõi Boss: Bắt Animation Track đang chạy (Cast animation),
-- Tiến độ niệm chiêu (TimePosition / Length), Góc nhìn và Trạng thái chiến đấu.

--// Imports
local shared = require("@routes/DungeonQuest/core/shared")
local contextual = require("@routes/DungeonQuest/core/contextual")

--// Table
local bossWatcher = {}

--// State
local currentBossModel = nil
local lastPlayingTracks = {}

-- Tìm Model của Boss hiện tại trong tập enemy đang track
local function findBossModel()
	if not shared.GetTrackedEnemyData then return nil end
	local enemies = shared.GetTrackedEnemyData()
	for _, enemy in ipairs(enemies) do
		if enemy and enemy.Model and enemy.Humanoid and enemy.Humanoid.Health > 0 then
			local mName = enemy.Model.Name:lower()
			local isBoss = string.find(mName, "boss") ~= nil
				or (enemy.Room and string.find(enemy.Room.Name:lower(), "boss") ~= nil)
				or (enemy.Model.Parent and string.find(enemy.Model.Parent.Name:lower(), "boss") ~= nil)
			if isBoss or (shared.IsBossActive and shared.IsBossActive()) then
				return enemy.Model, enemy.Humanoid, enemy.Root
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

-- Lấy dữ liệu Boss Telegraph toàn diện cho Telemetry
function bossWatcher.GetBossTelegraphData()
	local model, humanoid, root = findBossModel()
	local isBossActive = (shared.IsBossActive and shared.IsBossActive()) or (model ~= nil)
	local bossIdx = (shared.GetCurrentBossIndex and shared.GetCurrentBossIndex()) or 0
	local isBossAreaActive, bossAreaRadius, bossAreaCenter = contextual.GetActiveBossArea()

	if not model or not root or not humanoid then
		return {
			active = false,
			bossIndex = bossIdx,
			name = "None",
			x = 0, y = 0, z = 0,
			health = 0, maxHealth = 100, healthPercent = 100,
			yaw = 0,
			isCasting = false,
			activeAnimations = {},
			arenaActive = isBossAreaActive or false,
			arenaCenterX = (bossAreaCenter and bossAreaCenter.X) or 0,
			arenaCenterZ = (bossAreaCenter and bossAreaCenter.Z) or 0,
			arenaRadius = bossAreaRadius or 80.0,
		}
	end

	local animTracks = getBossAnimationTracks(humanoid)
	local isCasting = #animTracks > 0
	local primaryAnim = animTracks[1] or nil

	return {
		active = true,
		bossIndex = bossIdx,
		name = model.Name,
		x = root.Position.X,
		y = root.Position.Y,
		z = root.Position.Z,
		health = math.max(0, humanoid.Health),
		maxHealth = math.max(1, humanoid.MaxHealth),
		healthPercent = math.clamp((humanoid.Health / humanoid.MaxHealth) * 100, 0, 100),
		yaw = getYawDegrees(root.CFrame.LookVector),
		isCasting = isCasting,
		activeAnimations = animTracks,
		primaryAnimation = primaryAnim,
		arenaActive = isBossAreaActive or false,
		arenaCenterX = (bossAreaCenter and bossAreaCenter.X) or 0,
		arenaCenterZ = (bossAreaCenter and bossAreaCenter.Z) or 0,
		arenaRadius = bossAreaRadius or 80.0,
	}
end

return bossWatcher
