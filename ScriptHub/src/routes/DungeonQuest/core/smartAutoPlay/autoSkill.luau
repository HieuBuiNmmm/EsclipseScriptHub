--==============================================================--
-- Smart Auto Play – Submodule: Auto Skill (DungeonQuest)
-- Tự động xả kỹ năng thông minh theo 2 lối chơi:
--   1. FULL DAMAGE: Cả 2 skill gây dame -> xả skill liên tục như bình thường.
--   2. BUFF + DAMAGE: 1 skill Inner Focus (Buff) + 1 skill Dame ->
--      Luôn luôn kích hoạt Buff trước -> chờ nhận hiệu lực -> xả chiêu Dame.
--      Không xả lẻ tẻ chiêu dame khi buff đang hồi chiêu (chống thọt dame).
--==============================================================--

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")

local UserInputService = services.UserInputService
local VirtualInputManager = services.VirtualInputManager
local VirtualUser = game:GetService("VirtualUser")
local player = services.player

local autoSkill = {}

--// Settings
local enabled = false
local useSkillQ = true
local useSkillE = true
local useAttack = false -- Tự động đánh thường (M1 / Weapon) khi skill hồi chiêu
local pauseCastWhileDodging = false -- Tạm hoãn xả skill gây sát thương khi đang né đòn nguy hiểm (mặc định false)
local wallCheckEnabled = false -- Kiểm tra vật cản (Line of Sight) trước khi tung chiêu (mặc định false)
local castInterval = 0.25 -- Chu kỳ kiểm tra & xả chiêu cho Full Dame (giây)
local keyHoldDuration = 0.08
local buffDelay = 0.25 -- Thời gian chờ sau khi ấn Buff để nhận hiệu lực rồi mới xả Dame (giây)
local comboCooldownOverride = 0 -- 0 = tự động nhận từ game, >0 = ghi đè thủ công
local castDamageWhileWaitingBuff = false -- Giữ tương thích ngược
local buffDuration = 6.0 -- Thời gian hiệu lực của buff (giây, cấu hình bằng slider)
local autoBuffForSpeed = true -- Tự động Buff ngoài giao tranh để tối ưu speed chạy map
local skillRadius = 25.0 -- Bán kính quét mục tiêu để cast skill dame (studs)
local targetScope = "All" -- Phạm vi hoạt động: "All" | "Boss" | "Mobs"
local lastAttackTime = 0

-- Playstyle Mode: "Auto" | "FullDamage" | "BuffAndDamage"
local playstyleModeSetting = "Auto"

--// State
local loopThread = nil
local isCasting = false
local currentEnemyCount = 0
local nearestTargetInfo = nil
local statusListeners = {}

-- Skill Info
local skillQ = {
	name = "Scanning...",
	key = Enum.KeyCode.Q,
	slotKey = "q",
	isBuff = false,
	cooldown = 15.0,
	tool = nil,
}

local skillE = {
	name = "Scanning...",
	key = Enum.KeyCode.E,
	slotKey = "e",
	isBuff = false,
	cooldown = 15.0,
	tool = nil,
}

local detectedPlaystyle = "FullDamage" -- "FullDamage" | "BuffAndDamage"
local buffSkill = nil
local damageSkill = nil
local lastBuffCastTime = 0
local lastDamageCastTime = 0
local lastAnyCastTime = 0
local lastScanTime = 0

-- Reference tới hàm lấy tầm xả chiêu (Skill Cast Range) từ smartAutoPlay facade
local getSkillRange = nil
function autoSkill.BindRadiusGetter(getterFn)
	getSkillRange = getterFn
end
autoSkill.BindSkillRangeGetter = autoSkill.BindRadiusGetter

local function getCurrentSkillRadius(): number
	if getSkillRange then
		local r = getSkillRange()
		if type(r) == "number" and r > 0 then
			return r
		end
	end
	return skillRadius
end

local function getEffectivePlaystyle()
	if playstyleModeSetting == "FullDamage" then
		return "FullDamage"
	elseif playstyleModeSetting == "BuffAndDamage" then
		return "BuffAndDamage"
	end
	return detectedPlaystyle
end

-- Tìm Tool kỹ năng trong Backpack hoặc Character theo slotKey ("q" hoặc "e", không phân biệt hoa thường)
local function findAbilityTool(slotKey)
	local targetKey = tostring(slotKey):lower()

	local bp = player and player:FindFirstChild("Backpack")
	if bp then
		for _, child in ipairs(bp:GetChildren()) do
			local slotVal = child:FindFirstChild("abilitySlot")
			if slotVal and tostring(slotVal.Value):lower() == targetKey then
				return child
			end
		end
	end

	local char = player and player.Character
	if char then
		for _, child in ipairs(char:GetChildren()) do
			if child:IsA("Tool") then
				local slotVal = child:FindFirstChild("abilitySlot")
				if slotVal and tostring(slotVal.Value):lower() == targetKey then
					return child
				end
			end
		end
	end

	return nil
end

-- Kiểm tra nhân vật có đang bận cast chiêu không (busyCasting)
-- Kèm cơ chế tự động bypass nếu busy kéo dài quá 0.6s (tránh lỗi kẹt animation hoặc đòn đánh thường)
local function isCharacterBusyCasting()
	local char = player and player.Character
	if char then
		local busy = char:FindFirstChild("busyCasting")
		if busy and busy:IsA("BoolValue") and busy.Value == true then
			if os.clock() - lastAnyCastTime < 0.6 then
				return true
			end
		end
	end
	return false
end

local function isBuffActive(): boolean
	if lastBuffCastTime == 0 then return false end
	return (os.clock() - lastBuffCastTime) < buffDuration
end

local function getBuffRemaining(): number
	if lastBuffCastTime == 0 then return 0 end
	return math.max(0, buffDuration - (os.clock() - lastBuffCastTime))
end

local function isBuffSkillReady(): boolean
	if not buffSkill then return false end
	local buffTool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
	if comboCooldownOverride > 0 then
		local elapsed = os.clock() - lastBuffCastTime
		return (lastBuffCastTime == 0 or elapsed >= comboCooldownOverride)
	elseif buffTool and buffTool.Parent then
		local cdVal = buffTool:FindFirstChild("cooldown")
		if cdVal and cdVal:IsA("ValueBase") then
			return (tonumber(cdVal.Value) or 0) <= 0.05
		else
			local elapsed = os.clock() - lastBuffCastTime
			return (lastBuffCastTime == 0 or elapsed >= (buffSkill.cooldown or 15.0))
		end
	else
		local elapsed = os.clock() - lastBuffCastTime
		return (lastBuffCastTime == 0 or elapsed >= (buffSkill.cooldown or 15.0))
	end
end

local function getComboCooldownRemaining()
	local activeStyle = getEffectivePlaystyle()
	if activeStyle ~= "BuffAndDamage" or not buffSkill then return 0 end

	-- Nếu người chơi cấu hình ghi đè bằng slider
	if comboCooldownOverride > 0 and lastBuffCastTime > 0 then
		local elapsed = os.clock() - lastBuffCastTime
		return math.max(0, comboCooldownOverride - elapsed)
	end

	-- Lấy Cooldown thời gian thực trực tiếp từ Tool trong Backpack / Character
	local tool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
	if tool and tool.Parent then
		local cdVal = tool:FindFirstChild("cooldown")
		if cdVal and cdVal:IsA("ValueBase") then
			return math.max(0, tonumber(cdVal.Value) or 0)
		end
	end

	-- Fallback tính theo đồng hồ
	if lastBuffCastTime > 0 then
		local cd = buffSkill.cooldown or 15.0
		local elapsed = os.clock() - lastBuffCastTime
		return math.max(0, cd - elapsed)
	end

	return 0
end

local function fireStatusChange()
	local activeStyle = getEffectivePlaystyle()
	local info = {
		enabled = enabled,
		isCasting = isCasting,
		playstyle = activeStyle,
		skillQ = skillQ,
		skillE = skillE,
		buffSkill = buffSkill,
		damageSkill = damageSkill,
		cooldownRemaining = getComboCooldownRemaining(),
		buffActive = isBuffActive(),
		buffRemaining = getBuffRemaining(),
		buffDuration = buffDuration,
		autoBuffForSpeed = autoBuffForSpeed,
		targetScope = targetScope,
		enemyCount = currentEnemyCount,
		targetName = nearestTargetInfo and nearestTargetInfo.name or nil,
		targetDist = nearestTargetInfo and nearestTargetInfo.dist or nil,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

-- Kích hoạt kỹ năng (ưu tiên gọi localEvent của Tool, đồng thời nhấn phím)
local function castAbility(tool, key)
	-- Quay mặt ngay tức thì về hướng mục tiêu (ưu tiên Centroid Override khi gom quái AoE)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local aimOverride = nil
	pcall(function()
		local sdv2 = require("@routes/DungeonQuest/core/smartDodgeV2")
		if sdv2 and sdv2.facing and sdv2.facing.GetTargetOverride then
			aimOverride = sdv2.facing.GetTargetOverride()
		end
	end)
	if not aimOverride then
		pcall(function()
			local tf = require("@routes/DungeonQuest/core/smartDodge/targetFacing")
			if tf and tf.GetTargetOverride then
				aimOverride = tf.GetTargetOverride()
			end
		end)
	end
	local tPos = aimOverride or (nearestTargetInfo and nearestTargetInfo.pos)
	if root and tPos then
		local pPos = root.Position
		local flatLook = Vector3.new(tPos.X - pPos.X, 0, tPos.Z - pPos.Z)
		if flatLook.Magnitude > 0.5 then
			pcall(function()
				root.CFrame = CFrame.lookAt(pPos, pPos + flatLook.Unit)
			end)
		end
	end

	lastAnyCastTime = os.clock()

	if tool and tool.Parent then
		local localEvent = tool:FindFirstChild("localEvent")
		if localEvent and localEvent:IsA("BindableEvent") then
			pcall(function()
				localEvent:Fire()
			end)
		end
	end

	if key then
		local holdTime = shared.GetKeyHoldTime() or keyHoldDuration
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, key, false, game)
			task.wait(holdTime)
			VirtualInputManager:SendKeyEvent(false, key, false, game)
		end)
	end
end

--// Quét thông tin trang bị kỹ năng trực tiếp từ Backpack / Character
function autoSkill.ScanEquippedSkills()
	local toolQ = findAbilityTool("q")
	local toolE = findAbilityTool("e")

	local function parseTool(tool, defaultName, key, slotKey)
		if not tool then
			return {
				name = defaultName,
				key = key,
				slotKey = slotKey,
				isBuff = false,
				cooldown = 15.0,
				tool = nil,
			}
		end

		local rawName = tool.Name
		local nameLower = rawName:lower()
		-- Kỹ năng chỉ cần chứa từ "inner" trong tên thì được xem là BUFF
		local isBuff = nameLower:find("inner") ~= nil

		local maxCd = 15.0
		local cdLen = tool:FindFirstChild("cooldownLength")
		if cdLen and cdLen:IsA("ValueBase") and tonumber(cdLen.Value) and tonumber(cdLen.Value) > 0 then
			maxCd = tonumber(cdLen.Value)
		end

		return {
			name = rawName,
			key = key,
			slotKey = slotKey,
			isBuff = isBuff,
			cooldown = maxCd,
			tool = tool,
		}
	end

	skillQ = parseTool(toolQ, "Skill Q", Enum.KeyCode.Q, "q")
	skillE = parseTool(toolE, "Skill E", Enum.KeyCode.E, "e")

	-- Phân loại lối chơi tự động
	if skillQ.isBuff and not skillE.isBuff then
		detectedPlaystyle = "BuffAndDamage"
		buffSkill = skillQ
		damageSkill = skillE
	elseif skillE.isBuff and not skillQ.isBuff then
		detectedPlaystyle = "BuffAndDamage"
		buffSkill = skillE
		damageSkill = skillQ
	else
		detectedPlaystyle = "FullDamage"
		buffSkill = nil
		damageSkill = nil
	end

	lastScanTime = os.clock()
	fireStatusChange()
end

-- Tự động theo dõi Backpack và Character để cập nhật ngay khi đổi đồ hoặc hồi sinh
local function hookBackpackEvents()
	local bp = player and player:FindFirstChild("Backpack")
	if bp then
		bp.ChildAdded:Connect(function()
			task.delay(0.15, autoSkill.ScanEquippedSkills)
		end)
		bp.ChildRemoved:Connect(function()
			task.delay(0.15, autoSkill.ScanEquippedSkills)
		end)
	end
end

hookBackpackEvents()

if player then
	player.CharacterAdded:Connect(function()
		task.delay(0.5, function()
			hookBackpackEvents()
			autoSkill.ScanEquippedSkills()
		end)
	end)
end

shared.OnRespawn(function()
	task.delay(0.5, function()
		hookBackpackEvents()
		autoSkill.ScanEquippedSkills()
	end)
end)

task.spawn(function()
	task.wait(0.5)
	autoSkill.ScanEquippedSkills()
end)

-- Kiểm tra xem kẻ địch có khớp với phạm vi targetScope ("All" | "Boss" | "Mobs") không
local function isEnemyMatchingScope(model: Instance?, name: string?): boolean
	return shared.IsEnemyMatchingScope(model, name, targetScope)
end

-- Tia Raycast kiểm tra đường đạn thông thoáng (Line of Sight / Wall Check)
local losRayParams = RaycastParams.new()
losRayParams.FilterType = Enum.RaycastFilterType.Exclude
losRayParams.IgnoreWater = true

local function isLineOfSightClear(fromPos: Vector3, toPos: Vector3, enemyModel: Instance?): boolean
	if not wallCheckEnabled then return true end
	local char = player and player.Character
	local ignore = {}
	if char then table.insert(ignore, char) end
	if enemyModel then table.insert(ignore, enemyModel) end
	local rayIgnore = workspace:FindFirstChild("RaycastIgnore")
	if rayIgnore then table.insert(ignore, rayIgnore) end
	losRayParams.FilterDescendantsInstances = ignore

	local origin = Vector3.new(fromPos.X, fromPos.Y + 2.0, fromPos.Z)
	local target = Vector3.new(toPos.X, toPos.Y + 2.0, toPos.Z)
	local dir = target - origin
	local hit = workspace:Raycast(origin, dir, losRayParams)
	if hit and hit.Instance and hit.Instance.CanCollide then
		return false
	end
	return true
end

-- Kiểm tra xem hệ thống SmartDodge V2 có đang né đòn khẩn cấp không
local function isDodgingNow(): boolean
	local dodging = false
	pcall(function()
		local sdv2 = require("@routes/DungeonQuest/core/smartDodgeV2")
		if sdv2 and sdv2.dodge and sdv2.dodge.IsDodging and sdv2.dodge.IsDodging() then
			dodging = true
		elseif sdv2 and sdv2.danger and sdv2.danger.IsPlayerInDanger and sdv2.danger.IsPlayerInDanger() then
			dodging = true
		end
	end)
	return dodging
end

-- Thực hiện đòn đánh thường (Weapon Attack / M1)
local function performWeaponAttack(targetPos: Vector3?)
	if not useAttack then return end
	if isCharacterBusyCasting() then return end
	if pauseCastWhileDodging and isDodgingNow() then return end
	if (os.clock() - lastAttackTime) < 0.25 then return end

	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not char or not root then return end

	-- Quay mặt nhanh về mục tiêu nếu có
	if targetPos then
		local flatLook = Vector3.new(targetPos.X - root.Position.X, 0, targetPos.Z - root.Position.Z)
		if flatLook.Magnitude > 0.5 then
			pcall(function()
				root.CFrame = CFrame.lookAt(root.Position, root.Position + flatLook.Unit)
			end)
		end
	end

	lastAttackTime = os.clock()

	-- Kích hoạt Tool vũ khí đang cầm trên tay (không phải Tool ability slot)
	for _, child in ipairs(char:GetChildren()) do
		if child:IsA("Tool") and not child:FindFirstChild("abilitySlot") then
			pcall(function()
				child:Activate()
			end)
		end
	end

	pcall(function()
		VirtualUser:CaptureController()
		VirtualUser:Button1Down(Vector2.new(0, 0))
		task.wait(0.03)
		VirtualUser:Button1Up(Vector2.new(0, 0))
	end)
end

-- Tìm tất cả kẻ địch còn sống trong bán kính R phẳng (X/Z) xung quanh người chơi
local function getEnemiesInRadius(r)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return {} end

	local pPos = root.Position
	local inRange = {}
	local seenModels = {}

	-- Cho phép chênh lệch cao độ tương xứng với bán kính r (tránh lọc oan quái trên cầu thang/dốc)
	local maxAllowedDy = math.max(25.0, r * 0.75)

	local tracked = shared.GetTrackedEnemyData()
	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				local dx = data.Root.Position.X - pPos.X
				local dy = data.Root.Position.Y - pPos.Y
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)
				if flatDist <= r and math.abs(dy) <= maxAllowedDy then
					local eName = (data.Model and data.Model.Name) or "Enemy"
					if isEnemyMatchingScope(data.Model, eName) then
						if isLineOfSightClear(pPos, data.Root.Position, data.Model) then
							seenModels[data.Model] = true
							table.insert(inRange, {
								data = data,
								dist = flatDist,
								model = data.Model,
								name = eName,
								pos = data.Root.Position,
							})
						end
					end
				end
			end
		end
	end

	-- Bổ sung target hiện tại của AutoFarm nếu chưa có trong inRange
	local afTarget = tracker.GetTarget and tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent and not seenModels[afTarget.Model] then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local dx = afTarget.Root.Position.X - pPos.X
			local dy = afTarget.Root.Position.Y - pPos.Y
			local dz = afTarget.Root.Position.Z - pPos.Z
			local flatDist = math.sqrt(dx * dx + dz * dz)
			if flatDist <= r and math.abs(dy) <= maxAllowedDy then
				local tName = (afTarget.Model and afTarget.Model.Name) or "Target"
				if isEnemyMatchingScope(afTarget.Model, tName) then
					if isLineOfSightClear(pPos, afTarget.Root.Position, afTarget.Model) then
						table.insert(inRange, {
							data = afTarget,
							dist = flatDist,
							model = afTarget.Model,
							name = tName,
							pos = afTarget.Root.Position,
						})
					end
				end
			end
		end
	end

	table.sort(inRange, function(a, b) return a.dist < b.dist end)
	return inRange
end

-- Kích hoạt đòn đánh / phím kỹ năng (Đảm bảo phát hiện địch trong RADIUS r trước khi cast dame)
local function executeCombat(r)
	local activeStyle = getEffectivePlaystyle()

	-- Đảm bảo Tool reference luôn hợp lệ
	if not skillQ.tool or not skillQ.tool.Parent then
		skillQ.tool = findAbilityTool("q")
	end
	if not skillE.tool or not skillE.tool.Parent then
		skillE.tool = findAbilityTool("e")
	end

	-- Kiểm tra Dodge-Priority: Nếu đang né đòn khẩn cấp -> Hoãn xả skill gây sát thương
	local dodging = pauseCastWhileDodging and isDodgingNow()

	if activeStyle == "BuffAndDamage" and buffSkill and damageSkill then
		-- LỐI CHƠI 2: BUFF + DAMAGE
		local buffTool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
		local damageTool = damageSkill.tool or findAbilityTool(damageSkill.slotKey)

		local isBuffReady = isBuffSkillReady()

		if isBuffReady and not isCharacterBusyCasting() then
			isCasting = true

			-- Bước 1: Kích hoạt BUFF (Buff có thể kích hoạt cả khi né để tăng tốc)
			castAbility(buffTool, buffSkill.key)
			lastBuffCastTime = os.clock()

			-- Bước 2: Chờ nhận hiệu lực buff (buffDelay)
			task.wait(buffDelay)

			-- Bước 3: KIỂM TRA LẠI: PHÁT HIỆN ĐỊCH TRONG RADIUS RỒI MỚI CAST DAME!
			if not (pauseCastWhileDodging and isDodgingNow()) then
				local freshEnemies = getEnemiesInRadius(r)
				if #freshEnemies > 0 and not isCharacterBusyCasting() then
					nearestTargetInfo = freshEnemies[1]
					castAbility(damageTool, damageSkill.key)
					lastDamageCastTime = os.clock()
				end
			end

			isCasting = false
		elseif isBuffActive() and not isCharacterBusyCasting() then
			-- Buff vẫn ĐANG TRONG THỜI GIAN HIỆU LỰC:
			if not dodging then
				local freshEnemies = getEnemiesInRadius(r)
				if #freshEnemies > 0 then
					nearestTargetInfo = freshEnemies[1]
					local dCdVal = damageTool and damageTool:FindFirstChild("cooldown")
					local dReady = not dCdVal or ((tonumber(dCdVal.Value) or 0) <= 0.05)
					if dReady then
						local elapsedSinceLastDamage = os.clock() - lastDamageCastTime
						local dCd = damageSkill.cooldown or 2.5
						if lastDamageCastTime == 0 or elapsedSinceLastDamage >= dCd then
							isCasting = true
							castAbility(damageTool, damageSkill.key)
							lastDamageCastTime = os.clock()
							isCasting = false
						else
							performWeaponAttack(freshEnemies[1].pos)
						end
					else
						performWeaponAttack(freshEnemies[1].pos)
					end
				end
			end
		else
			-- Buff HẾT THỜI GIAN HIỆU LỰC và đang hồi chiêu:
			-- Chờ Buff hồi chiêu để cast cùng Buff. Trong lúc chờ có thể chém thường.
			if not dodging then
				local freshEnemies = getEnemiesInRadius(r)
				if #freshEnemies > 0 then
					performWeaponAttack(freshEnemies[1].pos)
				end
			end
		end
	else
		-- LỐI CHƠI 1: FULL DAMAGE (Spam Q & E, chỉ cast khi phát hiện địch trong RADIUS)
		if not dodging then
			local freshEnemies = getEnemiesInRadius(r)
			if #freshEnemies > 0 then
				isCasting = true
				local castedQ = false
				if useSkillQ then
					local qTool = skillQ.tool or findAbilityTool("q")
					local qCdVal = qTool and qTool:FindFirstChild("cooldown")
					local qReady = not qCdVal or ((tonumber(qCdVal.Value) or 0) <= 0.05)
					if qReady and not isCharacterBusyCasting() then
						nearestTargetInfo = freshEnemies[1]
						castAbility(qTool, Enum.KeyCode.Q)
						castedQ = true
					end
				end

				if castedQ then
					task.wait(0.08)
				end

				local freshEnemiesE = getEnemiesInRadius(r)
				local castedE = false
				if #freshEnemiesE > 0 and useSkillE then
					local eTool = skillE.tool or findAbilityTool("e")
					local eCdVal = eTool and eTool:FindFirstChild("cooldown")
					local eReady = not eCdVal or ((tonumber(eCdVal.Value) or 0) <= 0.05)
					if eReady and not isCharacterBusyCasting() then
						nearestTargetInfo = freshEnemiesE[1]
						castAbility(eTool, Enum.KeyCode.E)
						castedE = true
					end
				end

				-- Nếu cả Q lẫn E đều đang cooldown, tự động đánh thường (Weapon Attack)
				if not castedQ and not castedE then
					performWeaponAttack(freshEnemies[1].pos)
				end

				isCasting = false
			end
		end
	end
end

-- Vòng lặp quét quái trong tầm và xả chiêu
local function startLoop()
	if loopThread then return end

	-- Quét cập nhật trang bị ngay khi bắt đầu bật
	autoSkill.ScanEquippedSkills()

	loopThread = task.spawn(function()
		while enabled do
			pcall(function()
				-- Không thao tác khi nhân vật đã chết hoặc đang mở khung gõ chữ (chat box)
				if not shared.IsDead() and not UserInputService:GetFocusedTextBox() then
					local r = getCurrentSkillRadius()
					local enemies = getEnemiesInRadius(r)
					currentEnemyCount = #enemies

					local activeStyle = getEffectivePlaystyle()

					if #enemies > 0 then
						nearestTargetInfo = enemies[1]

						-- Thực thi tấn công theo lối chơi tương ứng (chỉ cast skill dame khi có địch trong r)
						executeCombat(r)
					else
						nearestTargetInfo = nil
						isCasting = false

						-- Tự động Buff ngoài giao tranh (chạy map / di chuyển) để tối ưu tốc độ người chơi
						if autoBuffForSpeed and activeStyle == "BuffAndDamage" and buffSkill then
							if isBuffSkillReady() and not isCharacterBusyCasting() then
								local buffTool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
								isCasting = true
								castAbility(buffTool, buffSkill.key)
								lastBuffCastTime = os.clock()
								isCasting = false
							end
						end
					end

					fireStatusChange()
				else
					isCasting = false
					currentEnemyCount = 0
					nearestTargetInfo = nil
					fireStatusChange()
				end
			end)

			local activeStyle = getEffectivePlaystyle()
			if activeStyle == "BuffAndDamage" then
				-- Trong chế độ Buff+Dame, loop tick nhanh (0.08s) để chớp thời cơ xả ngay khi hồi chiêu
				task.wait(0.08)
			else
				task.wait(castInterval)
			end
		end

		isCasting = false
		currentEnemyCount = 0
		nearestTargetInfo = nil
		fireStatusChange()
		loopThread = nil
	end)
end

local function stopLoop()
	enabled = false
	isCasting = false
	currentEnemyCount = 0
	nearestTargetInfo = nil
	fireStatusChange()
end

--// Public API
function autoSkill.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		startLoop()
	else
		stopLoop()
	end
end

function autoSkill.IsEnabled()
	return enabled
end

function autoSkill.SetSkillQ(state)
	useSkillQ = state and true or false
end

function autoSkill.IsSkillQEnabled()
	return useSkillQ
end

function autoSkill.SetSkillE(state)
	useSkillE = state and true or false
end

function autoSkill.IsSkillEEnabled()
	return useSkillE
end

function autoSkill.SetAutoAttack(state)
	useAttack = state and true or false
end

function autoSkill.IsAutoAttackEnabled()
	return useAttack
end

function autoSkill.SetAutoFace(state)
	autoFace = state and true or false
	if not autoFace and not enabled then
		pcall(function()
			local sdv2 = require("@routes/DungeonQuest/core/smartDodgeV2")
			if sdv2 and sdv2.facing and sdv2.facing.SetEnabled then
				sdv2.facing.SetEnabled(false)
			end
		end)
		pcall(function()
			local tf = require("@routes/DungeonQuest/core/smartDodge/targetFacing")
			if tf and tf.SetEnabled then
				tf.SetEnabled(false)
			end
		end)
	end
end

function autoSkill.IsAutoFaceEnabled()
	return autoFace
end

function autoSkill.SetInterval(val)
	if type(val) == "number" and val >= 0.05 then
		castInterval = math.clamp(val, 0.05, 2.0)
	end
end

function autoSkill.GetInterval()
	return castInterval
end

function autoSkill.SetBuffDelay(val)
	if type(val) == "number" and val >= 0.05 then
		buffDelay = math.clamp(val, 0.05, 1.5)
	end
end

function autoSkill.GetBuffDelay()
	return buffDelay
end

function autoSkill.SetComboCooldownOverride(val)
	if type(val) == "number" and val >= 0 then
		comboCooldownOverride = val
	end
end

function autoSkill.GetComboCooldownOverride()
	return comboCooldownOverride
end

function autoSkill.SetCastDamageWhileWaitingBuff(val)
	castDamageWhileWaitingBuff = val and true or false
end

function autoSkill.IsCastDamageWhileWaitingBuffEnabled()
	return castDamageWhileWaitingBuff
end

function autoSkill.SetPlaystyleMode(mode)
	if mode == "Auto" or mode == "FullDamage" or mode == "BuffAndDamage" then
		playstyleModeSetting = mode
		fireStatusChange()
	end
end

function autoSkill.GetPlaystyleMode()
	return playstyleModeSetting
end

function autoSkill.GetEffectivePlaystyle()
	return getEffectivePlaystyle()
end

function autoSkill.GetSkillQInfo()
	return skillQ
end

function autoSkill.GetSkillEInfo()
	return skillE
end

function autoSkill.GetBuffSkill()
	return buffSkill
end

function autoSkill.GetDamageSkill()
	return damageSkill
end

function autoSkill.GetComboCooldownRemaining()
	return getComboCooldownRemaining()
end

function autoSkill.SetBuffDuration(val)
	if type(val) == "number" and val >= 0.5 then
		buffDuration = math.clamp(val, 0.5, 60.0)
		fireStatusChange()
	end
end

function autoSkill.GetBuffDuration()
	return buffDuration
end

function autoSkill.SetAutoBuffForSpeed(state)
	autoBuffForSpeed = state and true or false
	fireStatusChange()
end

function autoSkill.IsAutoBuffForSpeedEnabled()
	return autoBuffForSpeed
end

function autoSkill.IsBuffActive()
	return isBuffActive()
end

function autoSkill.GetBuffRemaining()
	return getBuffRemaining()
end

function autoSkill.SetRadius(val)
	if type(val) == "number" and val > 0 then
		skillRadius = math.clamp(val, 4.0, 150.0)
		fireStatusChange()
	end
end
autoSkill.SetSkillRadius = autoSkill.SetRadius

function autoSkill.GetRadius()
	return getCurrentSkillRadius()
end
autoSkill.GetSkillRadius = autoSkill.GetRadius

function autoSkill.SetPauseCastWhileDodging(state: boolean)
	pauseCastWhileDodging = (state == true)
	fireStatusChange()
end

function autoSkill.IsPauseCastWhileDodgingEnabled(): boolean
	return pauseCastWhileDodging
end

function autoSkill.SetWallCheckEnabled(state: boolean)
	wallCheckEnabled = (state == true)
	fireStatusChange()
end

function autoSkill.IsWallCheckEnabled(): boolean
	return wallCheckEnabled
end

function autoSkill.SetTargetScope(scope)
	targetScope = shared.NormalizeTargetScope(scope)
	fireStatusChange()
end

function autoSkill.GetTargetScope()
	return targetScope
end

function autoSkill.GetStatus()
	local activeStyle = getEffectivePlaystyle()
	return {
		enabled = enabled,
		isCasting = isCasting,
		playstyle = activeStyle,
		skillQ = skillQ,
		skillE = skillE,
		useSkillQ = useSkillQ,
		useSkillE = useSkillE,
		useAttack = useAttack,
		pauseCastWhileDodging = pauseCastWhileDodging,
		wallCheckEnabled = wallCheckEnabled,
		buffSkill = buffSkill,
		damageSkill = damageSkill,
		radius = getCurrentSkillRadius(),
		cooldownRemaining = getComboCooldownRemaining(),
		buffActive = isBuffActive(),
		buffRemaining = getBuffRemaining(),
		buffDuration = buffDuration,
		autoBuffForSpeed = autoBuffForSpeed,
		targetScope = targetScope,
		enemyCount = currentEnemyCount,
		targetName = nearestTargetInfo and nearestTargetInfo.name or nil,
		targetDist = nearestTargetInfo and nearestTargetInfo.dist or nil,
	}
end

function autoSkill.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

-- Lifecycle Cleanup
lifecycle.Register(function()
	autoSkill.SetEnabled(false)
end)

return autoSkill
