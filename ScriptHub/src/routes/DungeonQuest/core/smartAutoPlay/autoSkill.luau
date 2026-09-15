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
local bossArea = require("@routes/DungeonQuest/core/smartDodgeV2/bossArea")

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
local lastQCastTime = 0
local lastECastTime = 0
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

local busySince = 0
-- Kiểm tra nhân vật có đang bận cast chiêu không (busyCasting)
-- Kèm cơ chế tự động bypass nếu busy liên tục quá 2.5s (tránh lỗi kẹt animation vĩnh viễn)
local function isCharacterBusyCasting(): boolean
	local char = player and player.Character
	if char then
		local busy = char:FindFirstChild("busyCasting")
		if busy and busy:IsA("BoolValue") and busy.Value == true then
			if busySince == 0 then
				busySince = os.clock()
			end
			if (os.clock() - busySince) < 2.5 then
				return true
			end
		else
			busySince = 0
		end
	else
		busySince = 0
	end
	return false
end

local function isBuffActive(): boolean
	-- Nhận biết buff thuần túy dựa vào sự hiện diện của "groundAura" trong Workspace (con cấp 1)
	-- Miễn là trong workspace còn tồn tại groundAura thì nghĩa là đang trong thời gian được buff.
	if workspace:FindFirstChild("groundAura") or workspace:FindFirstChild("GroundAura") then
		return true
	end
	for _, child in ipairs(workspace:GetChildren()) do
		if child.Name:lower() == "groundaura" then
			return true
		end
	end
	return false
end

local function getBuffRemaining(): number
	return isBuffActive() and 1 or 0
end

-- Đọc trực tiếp trạng thái Cooldown từ GUI của game (PlayerGui.abilities.Frame)
-- Đây là nguồn dữ liệu chuẩn xác 100% tương ứng với giao diện người chơi nhìn thấy
local function getSlotCooldownFromGui(slotKey: string): (boolean?, number?)
	local p = player or services.player
	local playerGui = p and p:FindFirstChild("PlayerGui")
	local abilities = playerGui and playerGui:FindFirstChild("abilities")
	local frame = abilities and abilities:FindFirstChild("Frame")
	if not frame then return nil, nil end

	local parentName = (tostring(slotKey):lower() == "q") and "LeftAbility" or "RightAbility"
	local abilityFrame = frame:FindFirstChild(parentName)
	local slot = abilityFrame and abilityFrame:FindFirstChild("slot")
	local cdNum = slot and slot:FindFirstChild("cooldownNumber")
	if cdNum and cdNum:IsA("GuiObject") then
		local isVisible = cdNum.Visible
		local numText = (cdNum:IsA("TextLabel") and cdNum.Text) or ""
		local remNum = tonumber(numText) or 0
		return isVisible, remNum
	end
	return nil, nil
end

local function isSkillReady(slotKey: string, lastCastTime: number, defaultCd: number): boolean
	local now = os.clock()
	-- Debounce chống spam phím trong khoảng thời gian siêu ngắn (< 0.15s)
	if lastCastTime > 0 and (now - lastCastTime) < 0.15 then
		return false
	end

	-- Tool phải tồn tại trong Backpack hoặc Character
	local tool = findAbilityTool(slotKey)
	if not tool then
		return false
	end

	-- Nếu có comboCooldownOverride cho buff
	if buffSkill and slotKey == buffSkill.slotKey and comboCooldownOverride > 0 then
		return (lastCastTime == 0 or (now - lastCastTime) >= comboCooldownOverride)
	end

	-- 1. ƯU TIÊN SỐ 1: Kiểm tra trực tiếp hiển thị UI của game (PlayerGui.abilities)
	local isGuiOnCooldown, guiRemTime = getSlotCooldownFromGui(slotKey)
	if isGuiOnCooldown ~= nil then
		if not isGuiOnCooldown then
			return true -- UI game hiển thị đã hết cooldown -> Sẵn sàng xả chiêu ngay!
		else
			if guiRemTime and guiRemTime <= 0.05 then
				return true
			end
			return false -- UI game đang đếm ngược cooldown
		end
	end

	-- 2. ƯU TIÊN SỐ 2: Kiểm tra giá trị NumberValue "cooldown" thời gian thực của Tool từ Game
	local tool = findAbilityTool(slotKey)
	if tool and tool.Parent then
		local cdVal = tool:FindFirstChild("cooldown")
		if cdVal and cdVal:IsA("ValueBase") then
			local num = tonumber(cdVal.Value) or 0
			return num <= 0.05
		end

		local cdLen = tool:FindFirstChild("cooldownLength")
		if cdLen and cdLen:IsA("ValueBase") and tonumber(cdLen.Value) and tonumber(cdLen.Value) > 0 then
			return lastCastTime == 0 or (now - lastCastTime) >= tonumber(cdLen.Value)
		end
	end

	-- 3. Fallback: Tính theo đồng hồ
	local cd = defaultCd or 3.0
	return lastCastTime == 0 or (now - lastCastTime) >= cd
end

local function isBuffSkillReady(): boolean
	if not buffSkill then return false end
	return isSkillReady(buffSkill.slotKey, lastBuffCastTime, buffSkill.cooldown or 15.0)
end

local function isDamageSkillReady(): boolean
	if not damageSkill then return false end
	return isSkillReady(damageSkill.slotKey, lastDamageCastTime, damageSkill.cooldown or 3.0)
end

local function getComboCooldownRemaining()
	local activeStyle = getEffectivePlaystyle()
	if activeStyle ~= "BuffAndDamage" or not buffSkill then return 0 end

	-- Nếu người chơi cấu hình ghi đè bằng slider
	if comboCooldownOverride > 0 and lastBuffCastTime > 0 then
		local elapsed = os.clock() - lastBuffCastTime
		return math.max(0, comboCooldownOverride - elapsed)
	end

	-- 1. Ưu tiên lấy từ UI game
	local isGuiCd, guiRem = getSlotCooldownFromGui(buffSkill.slotKey)
	if isGuiCd ~= nil then
		if isGuiCd and guiRem and guiRem > 0 then
			return guiRem
		elseif not isGuiCd then
			return 0
		end
	end

	-- 2. Lấy từ Tool
	local tool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
	if tool and tool.Parent then
		local cdVal = tool:FindFirstChild("cooldown")
		if cdVal and cdVal:IsA("ValueBase") then
			return math.max(0, tonumber(cdVal.Value) or 0)
		end
	end

	-- 3. Fallback tính theo đồng hồ
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
local function castAbility(tool, key, slotKey)
	-- Quay mặt ngay tức thì về hướng mục tiêu (ưu tiên Centroid Override khi gom quái AoE)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	local aimOverride = nil
	pcall(function()
		local sdv2 = require("@routes/DungeonQuest/core/smartDodgeV2")
		if sdv2 and sdv2.targetFacing and sdv2.targetFacing.GetTargetOverride then
			aimOverride = sdv2.targetFacing.GetTargetOverride()
		end
	end)
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

	local actTool = (tool and tool.Parent and tool) or (slotKey and findAbilityTool(slotKey))
	if actTool and actTool.Parent then
		local localEvent = actTool:FindFirstChild("localEvent")
		if localEvent and localEvent:IsA("BindableEvent") then
			pcall(function()
				localEvent:Fire()
			end)
		end
	end

	if key then
		local holdTime = shared.GetKeyHoldTime() or keyHoldDuration or 0.05
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, key, false, game)
			task.delay(math.min(holdTime, 0.05), function()
				pcall(function()
					VirtualInputManager:SendKeyEvent(false, key, false, game)
				end)
			end)
		end)
	end
end

--// Quét thông tin trang bị kỹ năng trực tiếp từ Backpack / Character
function autoSkill.ScanEquippedSkills()
	local toolQ = findAbilityTool("q")
	local toolE = findAbilityTool("e")

	local function parseTool(tool, defaultName, key, slotKey, prevSkill)
		if not tool then
			-- Nếu tool tạm thời chưa load trong Backpack/Character (ví dụ vừa hồi sinh),
			-- giữ lại thông tin kỹ năng đã nhận diện trước đó (tên, isBuff, cooldown) thay vì xóa trắng về FullDamage!
			if prevSkill and prevSkill.name ~= "Scanning..." and prevSkill.name ~= defaultName then
				return {
					name = prevSkill.name,
					key = key,
					slotKey = slotKey,
					isBuff = prevSkill.isBuff,
					cooldown = prevSkill.cooldown,
					tool = nil,
				}
			end
			return {
				name = defaultName,
				key = key,
				slotKey = slotKey,
				isBuff = false,
				cooldown = 3.0,
				tool = nil,
			}
		end

		local rawName = tool.Name
		local nameLower = rawName:lower()
		-- Kỹ năng chỉ cần chứa từ "inner" trong tên thì được xem là BUFF
		local isBuff = nameLower:find("inner") ~= nil

		local defaultCd = isBuff and 15.0 or 3.0
		local maxCd = defaultCd
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

	skillQ = parseTool(toolQ, "Skill Q", Enum.KeyCode.Q, "q", skillQ)
	skillE = parseTool(toolE, "Skill E", Enum.KeyCode.E, "e", skillE)

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
			task.delay(0.1, autoSkill.ScanEquippedSkills)
		end)
		bp.ChildRemoved:Connect(function()
			task.delay(0.1, autoSkill.ScanEquippedSkills)
		end)
	end
end

hookBackpackEvents()

-- Hàm xử lý reset sạch khi nhân vật hồi sinh
local function handleRespawnOrCharacterAdded()
	-- 1. Reset sạch toàn bộ mốc thời gian cast chiêu về 0 cho kiếp sống mới (đảm bảo buff sẵn sàng ngay lập tức)
	lastBuffCastTime = 0
	lastDamageCastTime = 0
	lastQCastTime = 0
	lastECastTime = 0
	lastAnyCastTime = 0
	busySince = 0
	isCasting = false

	-- 2. Đăng ký lại Backpack và quét skill ngay lập tức
	hookBackpackEvents()
	autoSkill.ScanEquippedSkills()

	-- 3. Quét bổ sung trong 1 giây đầu (100ms, 250ms, 500ms) để đón các Tool tải chậm
	task.delay(0.1, autoSkill.ScanEquippedSkills)
	task.delay(0.25, autoSkill.ScanEquippedSkills)
	task.delay(0.5, autoSkill.ScanEquippedSkills)
end

if player then
	player.CharacterAdded:Connect(function(char)
		handleRespawnOrCharacterAdded()

		local hum = char and char:WaitForChild("Humanoid", 5)
		if hum then
			hum.Died:Connect(function()
				isCasting = false
				lastBuffCastTime = 0
				lastDamageCastTime = 0
				lastQCastTime = 0
				lastECastTime = 0
				lastAnyCastTime = 0
				busySince = 0
			end)
		end
	end)
end

shared.OnRespawn(function()
	handleRespawnOrCharacterAdded()
end)

task.spawn(function()
	task.wait(0.5)
	autoSkill.ScanEquippedSkills()
end)

-- Kiểm tra xem kẻ địch có khớp với phạm vi targetScope ("All" | "Boss" | "Mobs") không
local function isEnemyMatchingScope(model: Instance?, name: string?): boolean
	return shared.IsEnemyMatchingScope(model, name, targetScope)
end

-- Kiểm tra xem có Boss đang hiện diện trong trận chiến hay không
local function isBossPresent(): boolean
	if shared.IsBossActive and shared.IsBossActive() then
		return true
	end
	if bossArea and bossArea.IsLocked and bossArea.IsLocked() then
		return true
	end
	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	if tracked then
		for _, data in ipairs(tracked) do
			if data and data.Model and data.Model.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					if shared.IsBossEnemy(data.Model, data.Model.Name) then
						return true
					end
					local mName = data.Model.Name:lower()
					if mName:find("boss") ~= nil then
						return true
					end
				end
			end
		end
	end
	return false
end

-- Kiểm tra xem trên thế giới (dungeon/map) có tồn tại kẻ địch / Boss nào còn sống hay không
local function hasAliveEnemyOnWorld(): boolean
	if targetScope == "Boss" then
		return isBossPresent()
	end

	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	if tracked then
		for _, data in ipairs(tracked) do
			if data and data.Model and data.Model.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					local eName = (data.Model and data.Model.Name) or "Enemy"
					if isEnemyMatchingScope(data.Model, eName) then
						return true
					end
				end
			end
		end
	end

	if isBossPresent() then
		return true
	end

	local afTarget = tracker.GetTarget and tracker.GetTarget()
	if afTarget and afTarget.Model and afTarget.Model.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local tName = (afTarget.Model and afTarget.Model.Name) or "Target"
			if isEnemyMatchingScope(afTarget.Model, tName) then
				return true
			end
		end
	end

	return false
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

-- Hệ thống Auto Skill hoạt động độc lập, không chịu ảnh hưởng bởi trạng thái né
local function isDodgingNow(): boolean
	return false
end

-- Thực hiện đòn đánh thường (Weapon Attack / M1) - Non-blocking
local function performWeaponAttack(targetPos: Vector3?)
	if not useAttack then return end
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
		task.delay(0.03, function()
			pcall(function()
				VirtualUser:Button1Up(Vector2.new(0, 0))
			end)
		end)
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

	local tracked = shared.GetTrackedEnemyData()
	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				local dx = data.Root.Position.X - pPos.X
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)
				if flatDist <= r then
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
			local dz = afTarget.Root.Position.Z - pPos.Z
			local flatDist = math.sqrt(dx * dx + dz * dz)
			if flatDist <= r then
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

-- Mốc thời gian spam theo interval (độc lập, không phụ thuộc cooldown)
local lastBuffAttemptTime = 0
local lastDamageAttemptTime = 0
local lastSkillQAttemptTime = 0
local lastSkillEAttemptTime = 0

-- Vòng lặp quét quái trong tầm và xả chiêu (HOÀN TOÀN NON-BLOCKING)
local function startLoop()
	if loopThread then return end

	-- Quét cập nhật trang bị ngay khi bắt đầu bật
	autoSkill.ScanEquippedSkills()

	loopThread = task.spawn(function()
		while enabled do
			pcall(function()
				-- Không thao tác khi nhân vật đã chết hoặc đang mở khung gõ chữ (chat box)
				if shared.IsDead() or UserInputService:GetFocusedTextBox() then
					isCasting = false
					currentEnemyCount = 0
					nearestTargetInfo = nil
					fireStatusChange()
					return
				end

				-- 1. ĐIỀU KIỆN TIÊN QUYẾT: TRÊN THẾ GIỚI PHẢI TỒN TẠI ENEMY / BOSS
				local hasEnemyWorld = hasAliveEnemyOnWorld()
				if not hasEnemyWorld then
					isCasting = false
					currentEnemyCount = 0
					nearestTargetInfo = nil
					fireStatusChange()
					return
				end

				-- Quét mục tiêu trong bán kính Magenta (Skill Cast Range)
				local r = getCurrentSkillRadius()
				local enemiesInMagenta = getEnemiesInRadius(r)
				currentEnemyCount = #enemiesInMagenta
				if #enemiesInMagenta > 0 then
					nearestTargetInfo = enemiesInMagenta[1]
				else
					nearestTargetInfo = nil
				end

				local now = os.clock()
				local curInterval = castInterval or 0.25
				local activeStyle = getEffectivePlaystyle()

				-- Đảm bảo Tool reference luôn hợp lệ
				if not skillQ.tool or not skillQ.tool.Parent then
					skillQ.tool = findAbilityTool("q")
				end
				if not skillE.tool or not skillE.tool.Parent then
					skillE.tool = findAbilityTool("e")
				end

				local hasBuff = isBuffActive()

				-- A. NẾU LÀ LỐI CHƠI BUFF + DAMAGE (Có 1 skill Buff và 1 skill Dame)
				if activeStyle == "BuffAndDamage" and buffSkill and damageSkill then
					local bTool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
					local dTool = damageSkill.tool or findAbilityTool(damageSkill.slotKey)

					-- 1. SKILL BUFF:
					-- Điều kiện: Trên thế giới phải tồn tại enemy/boss (hasEnemyWorld == true)
					-- Spam theo interval, hoàn toàn NON-BLOCKING, không phụ thuộc cooldown
					if (now - lastBuffAttemptTime) >= curInterval then
						lastBuffAttemptTime = now
						isCasting = true
						castAbility(bTool, buffSkill.key, buffSkill.slotKey)
						if buffSkill.slotKey == "q" then
							lastQCastTime = now
						else
							lastECastTime = now
						end
						lastBuffCastTime = now
						isCasting = false
					end

					-- 2. SKILL DAME:
					-- Điều kiện:
					--   - Trên thế giới phải tồn tại enemy/boss (hasEnemyWorld == true)
					--   - Phải trong tầm Magenta (#enemiesInMagenta > 0)
					--   - Phải trong thời gian được buff (hasBuff == true, tức groundAura tồn tại trong Workspace con cấp 1)
					-- Spam theo interval, hoàn toàn NON-BLOCKING, không phụ thuộc cooldown
					if hasBuff and #enemiesInMagenta > 0 then
						if (now - lastDamageAttemptTime) >= curInterval then
							lastDamageAttemptTime = now
							isCasting = true
							castAbility(dTool, damageSkill.key, damageSkill.slotKey)
							if damageSkill.slotKey == "q" then
								lastQCastTime = now
							else
								lastECastTime = now
							end
							lastDamageCastTime = now
							isCasting = false
						end
					end

					-- 3. Tự động đánh thường (M1) nếu bật useAttack và có quái trong tầm Magenta
					if useAttack and #enemiesInMagenta > 0 then
						performWeaponAttack(enemiesInMagenta[1].pos)
					end

				else
					-- B. NẾU LÀ LỐI CHƠI FULL DAMAGE (Cả 2 skill Dame, hoặc không có Buff skill)
					-- Cả 2 skill đều là Dame: xả khi có enemy trong tầm Magenta theo interval
					if #enemiesInMagenta > 0 then
						-- Skill Q
						if useSkillQ and (now - lastSkillQAttemptTime) >= curInterval then
							lastSkillQAttemptTime = now
							local toolQ = skillQ.tool or findAbilityTool("q")
							isCasting = true
							castAbility(toolQ, skillQ.key, "q")
							lastQCastTime = now
							isCasting = false
						end

						-- Skill E
						if useSkillE and (now - lastSkillEAttemptTime) >= curInterval then
							lastSkillEAttemptTime = now
							local toolE = skillE.tool or findAbilityTool("e")
							isCasting = true
							castAbility(toolE, skillE.key, "e")
							lastECastTime = now
							isCasting = false
						end

						if useAttack then
							performWeaponAttack(enemiesInMagenta[1].pos)
						end
					end
				end

				fireStatusChange()
			end)

			task.wait(0.03)
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
			if sdv2 and sdv2.targetFacing and sdv2.targetFacing.SetEnabled then
				sdv2.targetFacing.SetEnabled(false)
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

-- Lắng nghe Boss xuất hiện để prime cooldowns và ưu tiên Buff trước
shared.OnBossActiveChanged(function(active)
	if active then
		lastBuffCastTime = 0
		lastDamageCastTime = 0
		lastQCastTime = 0
		lastECastTime = 0
	end
end)

-- Lifecycle Cleanup
lifecycle.Register(function()
	autoSkill.SetEnabled(false)
end)

return autoSkill
