-- Death Logger cho DungeonQuest.
-- Công cụ ĐIỀU TRA: khi player chết, log ra console thông tin nguyên nhân
-- tử vong (lastCombatant, vị trí, và các object nghi ngờ là hazard quanh
-- điểm chết). Dùng để xác định "thứ gì thực sự gây chết" trước khi gắn
-- vào danh sách hazard dodge. Chưa tự động né.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local player = services.player

--// Configuration
--// Bán kính quét các object nghi ngờ quanh điểm chết (chỉ tính trong bán kính này)
local LOG_RADIUS = 25

--// Số candidate top hiển thị trong danh sách tham khảo
local TOP_N = 3

--// Các pattern tên nghi ngờ là hazard/skill (khớp chuỗi con, không phân biệt hoa thường)
local CANDIDATE_PATTERNS = {
	"firstBoss", "CrissCross", "Spike", "Hitbox", "hitBox",
	"Skill", "Orb", "Spear", "Poison", "Arrow", "Projectile",
}

--// Table
local deathLog = {}

--// State
local enabled = false

local function matchesCandidate(name)
	local lower = name:lower()
	for _, p in ipairs(CANDIDATE_PATTERNS) do
		if lower:find(p:lower(), 1, true) then return true end
	end
	return false
end

local function describeObject(obj)
	local kind = obj:IsA("BasePart") and "Part" or obj.ClassName
	local name = obj.Name
	local rootPos = nil
	if obj:IsA("BasePart") then
		rootPos = obj.Position
	elseif obj:IsA("Model") then
		local p = obj.PrimaryPart
		if p and p:IsA("BasePart") then
			rootPos = p.Position
		else
			for _, c in ipairs(obj:GetChildren()) do
				if c:IsA("BasePart") then rootPos = c.Position; break end
			end
		end
	end
	return name, kind, rootPos
end

local function scanCandidates(deathPos)
	local Workspace = game:GetService("Workspace")
	local hits = {}
	for _, child in ipairs(Workspace:GetChildren()) do
		--// Chỉ xét child level 1; folder bỏ qua luôn
		if not child:IsA("Folder") and matchesCandidate(child.Name) then
			local name, kind, pos = describeObject(child)
			if pos then
				table.insert(hits, { name = name, kind = kind, dist = (pos - deathPos).Magnitude, lvl = 0 })
			end
		end
	end
	table.sort(hits, function(a, b) return a.dist < b.dist end)
	return hits
end

--// Chọn 1 nguyên nhân có khả năng cao nhất: ưu tiên trùng lastCombatant,
--// nếu không thì lấy candidate gần điểm chết nhất.
local function pickMostLikely(hits, combatantName)
	if combatantName and combatantName ~= "none" then
		for _, h in ipairs(hits) do
			local nm = h.name:lower()
			local tx = combatantName:lower()
			if nm:find(tx, 1, true) then return h, "lastCombatant" end
		end
	end
	if #hits > 0 then return hits[1], "closest" end
	return nil, "none"
end

local function logDeath(deathPos, character)
	if not enabled then return end
	local healthInfo = ""
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		healthInfo = string.format(" (health=%.1f)", humanoid.Health)
	end

	local lastCombatantInfo = "none"
	--// lastCombatant có thể không tồn tại trong môi trường game -> bọc pcall
	local ok, lc = pcall(function()
		local v = humanoid and humanoid.lastCombatant
		if v and v:IsA("BasePart") and v.Parent then return v.Parent.Name end
		if v then return tostring(v) end
		return nil
	end)
	if ok and lc then
		lastCombatantInfo = lc
	end

	print("[DEATH-LOG] ========================================")
	print("[DEATH-LOG] Player died at " .. tostring(deathPos) .. healthInfo)
	print("[DEATH-LOG] lastCombatant: " .. tostring(lastCombatantInfo))

	local hits = scanCandidates(deathPos)
	--// Thu hẹp: chỉ giữ candidate trong bán kính
	local inRange = {}
	for _, h in ipairs(hits) do
		if h.dist <= LOG_RADIUS then table.insert(inRange, h) end
	end
	hits = inRange

	local cause, basis = pickMostLikely(hits, lastCombatantInfo)

	print("[DEATH-LOG] ========================================")
	print("[DEATH-LOG] Player died at " .. tostring(deathPos) .. healthInfo)
	print("[DEATH-LOG] lastCombatant: " .. tostring(lastCombatantInfo))

	if cause then
		local reason = basis == "lastCombatant" and "matched lastCombatant" or "closest to death point"
		print(string.format("[DEATH-LOG] >> MOST LIKELY CAUSE: %s (%s, dist=%.1f) [%s]", cause.name, cause.kind, cause.dist, reason))
	else
		print("[DEATH-LOG] >> MOST LIKELY CAUSE: none (no candidate hazard within " .. LOG_RADIUS .. " stud)")
	end

	local n = math.min(#hits, TOP_N)
	if n > 0 then
		print("[DEATH-LOG] Top " .. n .. " candidates nearby:")
		for i = 1, n do
			local h = hits[i]
			print(string.format("[DEATH-LOG]   %d) %-40s %-10s dist=%.1f", i, h.name, h.kind, h.dist))
		end
	end
	print("[DEATH-LOG] ========================================")
end

function deathLog.Init()
	if player and player.Character and player.Character.Parent then
		local hum = player.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.Died:Connect(function()
				local root = player.Character:FindFirstChild("HumanoidRootPart")
				logDeath(root and root.Position or Vector3.zero, player.Character)
			end)
		end
	end

	player.CharacterAdded:Connect(function(character)
		local hum = character:WaitForChild("Humanoid", 10)
		if not hum then return end
		hum.Died:Connect(function()
			local root = character:FindFirstChild("HumanoidRootPart")
			logDeath(root and root.Position or Vector3.zero, character)
		end)
	end)
end

function deathLog.Toggle(state)
	enabled = state == true
end

function deathLog.IsEnabled()
	return enabled
end

return deathLog
