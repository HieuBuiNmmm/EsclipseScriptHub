-- ESP hitbox cho DungeonQuest.
-- Bao gồm Player/Enemy Hitbox (Real/Custom) + Show Skill Hitbox (tạm thời chỉ northernMageShot - precast).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local dodgeNode = require("@routes/DungeonQuest/core/dodgeNode")

--// Table
local esp = {}

--// Configuration
local LINE_THICKNESS = 0.05
local SURFACE_TRANSPARENCY = 0.8

local PLAYER_BOX_COLOR = Color3.fromRGB(0, 255, 0)
local PLAYER_BOX_NAME = "PlayerHitbox_ESP"

local ENEMY_BOX_COLOR = Color3.fromRGB(255, 0, 0)
local ENEMY_BOX_NAME = "EnemyHitbox_ESP"

--// [SmartDodge] telegraph = child "precast"; khi player trong vùng precast -> teleport ra ngoài.
local SKILL_DODGE_NAMES = {
	["northernMageShot"] = true,
	["northernWarriorCircleStrike"] = true,
	["northernWarriorLineStrike"] = true,
	["spearmanStrike"] = true,
	["spearmanStrikeHitbox"] = true,
}
--// Khoảng dịch (studs) đẩy player vượt biên vùng thêm đúng giá trị này (1-4), giữ NHỎ
--// để tránh anticheat phát hiện tele. Điều chỉnh qua slider ở UI.
local SKILL_DODGE_DISTANCE = 2
--// Bán kính vùng báo (bubble) quanh player. Nếu telegraph của skill chạm/trùng vùng này
--// (bất kể player ở đâu trong telegraph) -> dodge. Rộng hơn = né sớm hơn.
local SKILL_DODGE_ZONE_RADIUS = 4
--// Chỉ dodge khi player dưới ngưỡng máu này (0 = luôn dodge).
local SKILL_DODGE_MAX_HEALTH = 0
--// Cooldown toàn cục mặc định (giây) giữa 2 lần dodge bất kể skill nào, tránh tele liên tục.
local SKILL_DODGE_GLOBAL_COOLDOWN = 1
--// Vòng an toàn (safety) thêm vào phía trên vòng trigger, để điểm tele luôn nằm ngoài vùng nguy hiểm.
local SKILL_DODGE_SAFETY_MARGIN = 3
local SKILL_SCAN_INTERVAL = 0.01

--// Hitbox mode constants
local HITBOX_MODE_REAL = "Real"
local HITBOX_MODE_CUSTOM = "Custom"

--// State
local playerBoxEnabled = false
local playerBoxThread = nil
local playerBoxMode = HITBOX_MODE_REAL
local playerBoxScale = 1.5
local player = services.player

local enemyBoxEnabled = false
local enemyBoxThread = nil
local enemyBoxMode = HITBOX_MODE_REAL
local enemyBoxScale = 1.5

--// State [Show Dodge Zone - bubble cầu quanh player]
local dodgeZoneEnabled = false
local dodgeZoneThread = nil
local dodgeZoneRadius = SKILL_DODGE_ZONE_RADIUS
--// Vòng an toàn (safety) — phải lớn hơn trigger. Điểm an toàn luôn nằm ngoài vòng này.
local dodgeZoneSafetyRadius = SKILL_DODGE_ZONE_RADIUS + SKILL_DODGE_SAFETY_MARGIN
--// State [Show Dodge Safety - bubble đỏ quanh precast]
local dodgeSafetyEnabled = false
local dodgeSafetyThread = nil

--// State [SmartDodge]
local smartDodgeEnabled = false
local smartDodgeThread = nil
local skillDodgeGlobalCooldown = SKILL_DODGE_GLOBAL_COOLDOWN
local lastGlobalDodgeAt = 0

--// Tạo SelectionBox bám vào một adornee (Root hoặc proxy part).
local function createSelectionBox(boxName, adornee, color)
	local box = Instance.new("SelectionBox")
	box.Name = boxName
	box.Adornee = adornee
	box.Color3 = color
	box.LineThickness = LINE_THICKNESS * 4
	box.SurfaceColor3 = color
	box.SurfaceTransparency = SURFACE_TRANSPARENCY
	box.Parent = adornee
end

--// Cập nhật box cho một Root theo mode hiện tại.
--// REAL: SelectionBox bám trực tiếp Root (kích thước thật).
--// CUSTOM: proxy part vô hình kích thước = Root.Size * scale, bám theo Root.
local function updateEntityBox(boxName, root, color, mode, scale)
	if not root or not root.Parent then return end
	local proxyName = boxName .. "_Proxy"
	local existingBox = root:FindFirstChild(boxName)
	local existingProxy = root:FindFirstChild(proxyName)

	if mode == HITBOX_MODE_CUSTOM then
		if existingBox and existingBox:IsA("SelectionBox") and existingBox.Adornee == root then
			existingBox:Destroy()
		end

		if not existingProxy then
			existingProxy = Instance.new("Part")
			existingProxy.Name = proxyName
			existingProxy.Anchored = true
			existingProxy.CanCollide = false
			existingProxy.CanQuery = false
			existingProxy.CanTouch = false
			existingProxy.Transparency = 1
			existingProxy.Parent = root
			createSelectionBox(boxName, existingProxy, color)
		end

		local rootSize = root.Size
		local maxDim = math.max(math.abs(rootSize.X), math.abs(rootSize.Y), math.abs(rootSize.Z))
		local customSize = math.max(maxDim * scale, 1)
		existingProxy.Size = Vector3.new(customSize, customSize, customSize)
		existingProxy.CFrame = root.CFrame
	else
		if existingProxy then existingProxy:Destroy() end
		if existingBox and existingBox:IsA("SelectionBox") and existingBox.Adornee ~= root then
			existingBox:Destroy()
			existingBox = nil
		end
		if not existingBox or not existingBox:IsA("SelectionBox") or existingBox.Adornee ~= root then
			createSelectionBox(boxName, root, color)
		end
	end
end

--// Highlight hitbox THẬT của player (quanh HumanoidRootPart) để phân biệt với
--// "ghost" (bản nhân vật ảo hiển thị khi teleport orbit). Màu xanh lá, khác hẳn
--// hitbox enemy đỏ. Tự bám theo nhân vật khi respawn.
local function attachPlayerBox()
	local character = player and player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	if not root or not root.Parent then return end
	updateEntityBox(PLAYER_BOX_NAME, root, PLAYER_BOX_COLOR, playerBoxMode, playerBoxScale)
end

local function clearPlayerBox()
	if playerBoxThread then task.cancel(playerBoxThread); playerBoxThread = nil end
	local function clearCharacter(character)
		if not character then return end
		for _, desc in ipairs(character:GetDescendants()) do
			if desc.Name == PLAYER_BOX_NAME or desc.Name == PLAYER_BOX_NAME .. "_Proxy" then
				desc:Destroy()
			end
		end
	end
	clearCharacter(player and player.Character)
	for _, p in ipairs(services.Players:GetPlayers()) do
		clearCharacter(p.Character)
	end
end

function esp.TogglePlayerHitbox(state)
	if state == playerBoxEnabled then return end
	playerBoxEnabled = state

	if playerBoxEnabled then
		if playerBoxThread then task.cancel(playerBoxThread); playerBoxThread = nil end
		playerBoxThread = task.spawn(function()
			while playerBoxEnabled do
				local ok, err = pcall(attachPlayerBox)
				if not ok then
					if os.clock() - (esp.lastPlayerWarn or 0) > 5 then
						esp.lastPlayerWarn = os.clock()
						warn("[PlayerHitbox] error:", tostring(err))
					end
				end
				services.RunService.Heartbeat:Wait()
			end
		end)
	else
		clearPlayerBox()
	end
end

function esp.IsPlayerHitboxEnabled()
	return playerBoxEnabled
end

function esp.GetPlayerHitboxMode()
	return playerBoxMode
end

function esp.SetPlayerHitboxMode(mode)
	if mode ~= HITBOX_MODE_REAL and mode ~= HITBOX_MODE_CUSTOM then return end
	playerBoxMode = mode
end

function esp.GetPlayerHitboxScale()
	return playerBoxScale
end

function esp.SetPlayerHitboxScale(scale)
	playerBoxScale = scale
end

--// Highlight hitbox THẬT của từng enemy đang track (quanh Root) khi ENGAGE.
--// Màu đỏ, dày như player hitbox, dùng chung cơ chế SelectionBox nhưng tự
--// bám theo enemy model khi di chuyển/spawn.
local function attachEnemyBoxes()
	for _, data in ipairs(shared.GetTrackedEnemyData()) do
		local root = data.Root
		if root and root.Parent then
			updateEntityBox(ENEMY_BOX_NAME, root, ENEMY_BOX_COLOR, enemyBoxMode, enemyBoxScale)
		end
	end
end

local function clearEnemyBoxes()
	if enemyBoxThread then task.cancel(enemyBoxThread); enemyBoxThread = nil end
	for _, obj in ipairs(game:GetService("Workspace"):GetDescendants()) do
		local box = obj:FindFirstChild(ENEMY_BOX_NAME)
		local proxy = obj:FindFirstChild(ENEMY_BOX_NAME .. "_Proxy")
		if box then box:Destroy() end
		if proxy then proxy:Destroy() end
	end
end

function esp.ToggleEnemyHitbox(state)
	if state == enemyBoxEnabled then return end
	enemyBoxEnabled = state

	if enemyBoxEnabled then
		if enemyBoxThread then task.cancel(enemyBoxThread); enemyBoxThread = nil end
		enemyBoxThread = task.spawn(function()
			while enemyBoxEnabled do
				local ok, err = pcall(attachEnemyBoxes)
				if not ok then
					if os.clock() - (esp.lastEnemyWarn or 0) > 5 then
						esp.lastEnemyWarn = os.clock()
						warn("[EnemyHitbox] error:", tostring(err))
					end
				end
				services.RunService.Heartbeat:Wait()
			end
		end)
	else
		clearEnemyBoxes()
	end
end

function esp.IsEnemyHitboxEnabled()
	return enemyBoxEnabled
end

function esp.GetEnemyHitboxMode()
	return enemyBoxMode
end

function esp.SetEnemyHitboxMode(mode)
	if mode ~= HITBOX_MODE_REAL and mode ~= HITBOX_MODE_CUSTOM then return end
	enemyBoxMode = mode
end

function esp.GetEnemyHitboxScale()
	return enemyBoxScale
end

function esp.SetEnemyHitboxScale(scale)
	enemyBoxScale = scale
end

--// ========== [Show Skill Hitbox] Phủ skill bằng proxy mesh part (trong suốt) ==========
--// Clone toàn bộ model skill -> giữ nguyên hình dạng MeshPart thật, làm trong suốt
--// neon để hiển thị hitbox. Không đổi màu/tự ẩn theo thời gian.

--// Danh sách skill cần vẽ proxy.
local SKILL_PROJECTILE_NAMES = {
	["northernMageShot"] = true,
	["northernWarriorCircleStrike"] = true,
	["northernWarriorLineStrike"] = true,
	["spearmanStrike"] = true,
	["spearmanStrikeHitbox"] = true,
}
local SKILL_ESP_COLOR = Color3.fromRGB(255, 230, 0)
local SKILL_ESP_NAME = "SkillESP"

--// State proxy cho từng model (điểm neo để giữ vị trí trùng mỗi frame).
local skillBoxEnabled = false
local skillBoxThread = nil

--// Tạo 1 MeshPart proxy bọc theo mesh thật của model skill (lấy MeshId/Scale/
--// TextureID từ MeshPart đầu tiên trong model). Trả về proxy MeshPart.
local function createSkillProxy(model)
	local template = nil
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("MeshPart") then
			template = desc
			break
		end
	end
	local proxy
	if template then
		proxy = template:Clone()
	else
		proxy = Instance.new("MeshPart")
		proxy.Size = model:GetExtentsSize()
	end
	proxy.Name = SKILL_ESP_NAME
	proxy.Anchored = true
	proxy.CanCollide = false
	proxy.CanQuery = false
	proxy.CanTouch = false
	proxy.Material = Enum.Material.Neon
	proxy.Transparency = 0.8
	proxy.Color = SKILL_ESP_COLOR
	return proxy
end

--// Giữ proxy khớp vị trí/hướng với model gốc mỗi khi quét thấy.
local function syncSkillProxy(proxy, model)
	proxy.CFrame = model:GetPivot()
end

--// Tạo proxy nếu chưa có, rồi đồng bộ vị trí với model gốc.
local function createSkillBox(model)
	local proxy = model:FindFirstChild(SKILL_ESP_NAME)
	if not proxy then
		proxy = createSkillProxy(model)
		proxy.Parent = model
	end
	syncSkillProxy(proxy, model)
end

--// Quét Workspace tìm skill theo tên và vẽ proxy.
local function scanSkillHitboxes()
	local Workspace = game:GetService("Workspace")
	local function handleRoot(root)
		if not SKILL_PROJECTILE_NAMES[root.Name] then return end
		createSkillBox(root)
	end
	for _, child in ipairs(Workspace:GetChildren()) do
		handleRoot(child)
		if not SKILL_PROJECTILE_NAMES[child.Name] then
			for _, desc in ipairs(child:GetDescendants()) do
				if SKILL_PROJECTILE_NAMES[desc.Name] then
					handleRoot(desc)
					break
				end
			end
		end
	end
end

local function clearSkillBoxes()
	if skillBoxThread then task.cancel(skillBoxThread); skillBoxThread = nil end
	local Workspace = game:GetService("Workspace")
	for _, obj in ipairs(Workspace:GetDescendants()) do
		for _, child in ipairs(obj:GetChildren()) do
			if child.Name == SKILL_ESP_NAME then child:Destroy() end
		end
	end
end

function esp.ToggleSkillHitbox(state)
	if state == skillBoxEnabled then return end
	skillBoxEnabled = state
	if skillBoxEnabled then
		if skillBoxThread then task.cancel(skillBoxThread); skillBoxThread = nil end
		skillBoxThread = task.spawn(function()
			while skillBoxEnabled do
				local ok, err = pcall(scanSkillHitboxes)
				if not ok and os.clock() - (esp.lastSkillWarnH or 0) > 5 then
					esp.lastSkillWarnH = os.clock()
					warn("[SkillHitbox] error:", tostring(err))
				end
				task.wait(SKILL_SCAN_INTERVAL)
			end
		end)
	else
		clearSkillBoxes()
	end
end

function esp.IsSkillHitboxEnabled()
	return skillBoxEnabled
end

--// ========== [SmartDodge] Auto-dodge ==========

--// Cache >> skillDodgeState[model] = { lastDodgeAt }; weak-key.
local skillDodgeState = setmetatable({}, { __mode = "k" })
--// Teleport cooldown giữa 2 lần dodge của cùng model (giây).
local SKILL_DODGE_INTERVAL = 0.3
--// Khoảng dịch runtime (studs), chỉnh qua slider (1-4).
local skillDodgeDistance = SKILL_DODGE_DISTANCE

--// Tìm telegraph: child "precast" (BasePart).
local function findSkillTelegraph(root)
	local precast = root:FindFirstChild("precast")
	return (precast and precast:IsA("BasePart")) and precast or nil
end

--// Kiểm tra toàn bộ descendant BasePart của model skill có đang ẩn (transparency=1)
--// hay không. Nếu tất cả đều ẩn -> chiêu coi như không còn hiệu lực -> bỏ qua (không né).
local function isSkillInvisible(model)
	local any = false
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("BasePart") and not desc:IsA("Terrain") then
			any = true
			if desc.Transparency < 1 then return false end
		end
	end
	return any
end

--// Kiểm tra vùng báo (bubble hình cầu quanh player, bán kính SKILL_DODGE_ZONE_RADIUS) có giao
--// với khối (AABB) của precast không. Khoảng cách ngắn nhất từ tâm bubble tới bề mặt khối
--// (trong local space, nên precast xoay cũng đúng) <= radius -> có giao. Thuần hình học,
--// không phụ thuộc physics/CanQuery.
local function zoneIntersectsPrecast(precast, playerCenter)
	local half = precast.Size / 2
	local localPos = precast.CFrame:PointToObjectSpace(playerCenter)
	local dx = math.max(math.abs(localPos.X) - half.X, 0)
	local dy = math.max(math.abs(localPos.Y) - half.Y, 0)
	local dz = math.max(math.abs(localPos.Z) - half.Z, 0)
	local closestSq = dx * dx + dy * dy + dz * dz
	return closestSq <= (dodgeZoneRadius * dodgeZoneRadius)
end

--// Vị trí an toàn: đẩy player vượt biên vùng precast thêm skillDodgeDistance studs (giữ Y).
local function findSafePosition(precast, rootPart)
	local center = precast.Position
	local toPlayer = rootPart.Position - center
	local dir = Vector3.new(toPlayer.X, 0, toPlayer.Z)
	if dir.Magnitude < 0.001 then
		dir = Vector3.new(rootPart.CFrame.LookVector.X, 0, rootPart.CFrame.LookVector.Z)
		if dir.Magnitude < 0.001 then dir = Vector3.new(1, 0, 0) end
	end
	dir = dir.Unit
	local half = (precast.Size.X + precast.Size.Z) / 4
	local distToEdge = math.max(half, 1)
	--// Vòng an toàn: đẩy điểm đích ra ngoài vòng safety (lớn hơn vòng trigger)
	--// + thêm biên né, đảm bảo không tele vào vùng nguy hiểm của precast.
	local safePos = center + dir * (distToEdge + dodgeZoneSafetyRadius + skillDodgeDistance)
	return Vector3.new(safePos.X, rootPart.Position.Y, safePos.Z)
end

--// Teleport toàn bộ character ra chỗ an toàn (giữ hướng, dịch tương đối -> nhỏ cho anticheat).
--// LƯU Ý: cộng offset vào position (CFrame + Vector3) giữ hướng trong world space.
--// Không dùng (CFrame * CFrame.new(delta)) vì phép nhân dịch theo local space của rootPart,
--// gây lệch hướng -> player bị kéo về gần chỗ cũ.
local function teleportAway(rootPart, safePos)
	local character = rootPart.Parent
	if not character then return end
	character:SetPrimaryPartCFrame(rootPart.CFrame + (safePos - rootPart.Position))
end

--// Xử lý 1 model skill: nếu player trong vùng precast -> teleport ra ngoài (cooldown).
local function handleSkillRoot(root)
	if not SKILL_DODGE_NAMES[root.Name] then return end
	--// Bỏ qua nếu toàn bộ Part trong skill đã ẩn (transparency=1) -> chiêu không còn hiệu lực.
	if isSkillInvisible(root) then return end

	local castState = skillDodgeState[root]
	if castState and castState[1] and (os.clock() - castState[1]) < SKILL_DODGE_INTERVAL then return end
	--// Cooldown toàn cục: tránh tele liên tục giữa các lần dodge bất kể skill nào.
	if (os.clock() - lastGlobalDodgeAt) < skillDodgeGlobalCooldown then return end

	local precast = findSkillTelegraph(root)
	if not precast then return end
	local character = services.player.Character
	if not character then return end
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart or not rootPart.Parent then return end

	if SKILL_DODGE_MAX_HEALTH > 0 then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health > SKILL_DODGE_MAX_HEALTH then return end
	end

	if zoneIntersectsPrecast(precast, rootPart.Position) then
		--// Ưu tiên tele tới node an toàn (xanh) gần nhất nếu có; fallback về hướng cũ.
		local target = dodgeNode.FindSafeSpot(character)
		if not target then
			target = findSafePosition(precast, rootPart)
		end
		teleportAway(rootPart, target)
		skillDodgeState[root] = { os.clock() }
		lastGlobalDodgeAt = os.clock()
	end
end

--// Quét Workspace tìm skill theo tên và dodge.
local function scanSkillDodges()
	local Workspace = game:GetService("Workspace")
	local function handleRoot(root)
		if not SKILL_DODGE_NAMES[root.Name] then
			for _, desc in ipairs(root:GetDescendants()) do
				if SKILL_DODGE_NAMES[desc.Name] and desc:FindFirstChild("precast") then
					handleSkillRoot(desc)
					break
				end
			end
		else
			handleSkillRoot(root)
		end
	end
	for _, child in ipairs(Workspace:GetChildren()) do
		handleRoot(child)
	end
end

local function clearSkillDodges()
	if smartDodgeThread then task.cancel(smartDodgeThread); smartDodgeThread = nil end
	table.clear(skillDodgeState)
end

function esp.ToggleSmartDodge(state)
	if state == smartDodgeEnabled then return end
	smartDodgeEnabled = state
	if smartDodgeEnabled then
		if smartDodgeThread then task.cancel(smartDodgeThread); smartDodgeThread = nil end
		smartDodgeThread = task.spawn(function()
			while smartDodgeEnabled do
				local ok, err = pcall(scanSkillDodges)
				if not ok and os.clock() - (esp.lastSkillWarnD or 0) > 5 then
					esp.lastSkillWarnD = os.clock()
					warn("[SmartDodge] error:", tostring(err))
				end
				task.wait(SKILL_SCAN_INTERVAL)
			end
		end)
	else
		clearSkillDodges()
	end
end

function esp.IsSmartDodgeEnabled()
	return smartDodgeEnabled
end

--// Đặt/bớt khoảng dịch tele khi dodge (studs). Clamp 1-4 để tránh anticheat.
function esp.SetSkillDodgeDistance(value)
	skillDodgeDistance = math.clamp(value or SKILL_DODGE_DISTANCE, 1, 4)
end

function esp.GetSkillDodgeDistance()
	return skillDodgeDistance
end

--// Đặt cooldown toàn cục (giây) giữa 2 lần dodge. Clamp 0-5 để tránh anticheat.
function esp.SetSmartDodgeCooldown(value)
	skillDodgeGlobalCooldown = math.clamp(value or SKILL_DODGE_GLOBAL_COOLDOWN, 0, 5)
end

function esp.GetSmartDodgeCooldown()
	return skillDodgeGlobalCooldown
end

--// ========== [Show Dodge Zone] Trực quan 2 vòng né ==========
--// Vòng trigger (cyan, quanh player, bán kính dodgeZoneRadius): ngưỡng kích hoạt né.
--// Vòng safety (đỏ, quanh mỗi precast, bán kính dodgeZoneSafetyRadius): vùng mà điểm
--// an toàn sau khi né phải nằm ngoài.

local DODGE_ZONE_NAME = "DodgeZone_ESP"
local DODGE_ZONE_COLOR = Color3.fromRGB(0, 255, 255)
local DODGE_SAFETY_NAME = "DodgeSafety_ESP"
local DODGE_SAFETY_COLOR = Color3.fromRGB(255, 60, 60)

--// Tạo/cập nhật một bubble cầu tại vị trí thế giới tuyệt đối (parent = Workspace).
local function showBubble(name, color, center, radius)
	local bubble = workspace:FindFirstChild(name)
	if not bubble then
		bubble = Instance.new("Part")
		bubble.Name = name
		bubble.Shape = Enum.PartType.Ball
		bubble.Transparency = 0.75
		bubble.Anchored = true
		bubble.CanCollide = false
		bubble.CanQuery = false
		bubble.CanTouch = false
		bubble.Material = Enum.Material.Neon
		bubble.Color = color
		bubble.Parent = workspace
	end
	bubble.Size = Vector3.one * (radius * 2)
	bubble.CFrame = CFrame.new(center)
end

--// Xoá bubble vòng trigger (cyan) quanh player.
local function clearZoneBubble()
	local Workspace = game:GetService("Workspace")
	local bubble = Workspace:FindFirstChild(DODGE_ZONE_NAME)
	if bubble then bubble:Destroy() end
end

--// Xoá các bubble vòng safety (đỏ) quanh precast.
local function clearSafetyBubbles()
	local Workspace = game:GetService("Workspace")
	for _, obj in ipairs(Workspace:GetDescendants()) do
		for _, child in ipairs(obj:GetChildren()) do
			if string.find(child.Name, DODGE_SAFETY_NAME, 1, true) then
				child:Destroy()
			end
		end
	end
end

function esp.ToggleDodgeZone(state)
	if state == dodgeZoneEnabled then return end
	dodgeZoneEnabled = state
	if dodgeZoneEnabled then
		if dodgeZoneThread then task.cancel(dodgeZoneThread); dodgeZoneThread = nil end
		dodgeZoneThread = task.spawn(function()
			while dodgeZoneEnabled do
				local character = player.Character
				local rootPart = character and character:FindFirstChild("HumanoidRootPart")
				if rootPart then
					showBubble(DODGE_ZONE_NAME, DODGE_ZONE_COLOR, rootPart.Position, dodgeZoneRadius)
				end
				task.wait(SKILL_SCAN_INTERVAL * 2)
			end
		end)
	else
		clearZoneBubble()
	end
end

function esp.IsDodgeZoneEnabled()
	return dodgeZoneEnabled
end

--// Vòng safety (đỏ): quét skill có precast, vẽ bubble đỏ quanh mỗi precast.
function esp.ToggleDodgeSafety(state)
	if state == dodgeSafetyEnabled then return end
	dodgeSafetyEnabled = state
	if dodgeSafetyEnabled then
		if dodgeSafetyThread then task.cancel(dodgeSafetyThread); dodgeSafetyThread = nil end
		dodgeSafetyThread = task.spawn(function()
			while dodgeSafetyEnabled do
				local Workspace = game:GetService("Workspace")
				local function handle(root)
					if SKILL_DODGE_NAMES[root.Name] then
						local precast = root:FindFirstChild("precast")
						if precast and precast:IsA("BasePart") then
							local bubbleName = DODGE_SAFETY_NAME .. "_" .. tostring(precast:GetDebugId())
							showBubble(bubbleName, DODGE_SAFETY_COLOR, precast.Position, dodgeZoneSafetyRadius)
						end
					end
				end
				for _, child in ipairs(Workspace:GetChildren()) do
					handle(child)
					for _, desc in ipairs(child:GetDescendants()) do
						if SKILL_DODGE_NAMES[desc.Name] then handle(desc) end
					end
				end
				task.wait(SKILL_SCAN_INTERVAL * 2)
			end
		end)
	else
		clearSafetyBubbles()
	end
end

function esp.IsDodgeSafetyEnabled()
	return dodgeSafetyEnabled
end

--// Đặt bán kính (tầm) bubble quanh player. Clamp 1-10 studs.
function esp.SetDodgeZoneRadius(value)
	dodgeZoneRadius = math.clamp(value or SKILL_DODGE_ZONE_RADIUS, 1, 10)
end

function esp.GetDodgeZoneRadius()
	return dodgeZoneRadius
end

--// Đặt bán kính vòng an toàn (safety) — phải >= vòng trigger. Clamp 2-15 studs.
function esp.SetDodgeZoneSafetyRadius(value)
	dodgeZoneSafetyRadius = math.max(value or (dodgeZoneRadius + SKILL_DODGE_SAFETY_MARGIN), dodgeZoneRadius)
	dodgeZoneSafetyRadius = math.clamp(dodgeZoneSafetyRadius, 2, 15)
end

function esp.GetDodgeZoneSafetyRadius()
	return dodgeZoneSafetyRadius
end

return esp
