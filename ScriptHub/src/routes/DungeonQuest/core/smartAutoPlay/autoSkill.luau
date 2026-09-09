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
local targetFacing = require("@routes/DungeonQuest/core/smartDodge/targetFacing")
local smartDodge = require("@routes/DungeonQuest/core/smartDodge")

local UserInputService = services.UserInputService
local VirtualInputManager = services.VirtualInputManager
local VirtualUser = game:GetService("VirtualUser")
local player = services.player

local autoSkill = {}

--// Settings
local enabled = false
local useSkillQ = true
local useSkillE = true
local castInterval = 0.25 -- Chu kỳ kiểm tra & xả chiêu cho Full Dame (giây)
local keyHoldDuration = 0.08
local buffDelay = 0.25 -- Thời gian chờ sau khi ấn Buff để nhận hiệu lực rồi mới xả Dame (giây)
local comboCooldownOverride = 0 -- 0 = tự động nhận từ game, >0 = ghi đè thủ công

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
local lastScanTime = 0

-- Reference tới hàm lấy bán kính R từ smartAutoPlay facade
local getCombatRadius = nil
function autoSkill.BindRadiusGetter(getterFn)
	getCombatRadius = getterFn
end

local function getEffectivePlaystyle()
	if playstyleModeSetting == "FullDamage" then
		return "FullDamage"
	elseif playstyleModeSetting == "BuffAndDamage" then
		return "BuffAndDamage"
	end
	return detectedPlaystyle
end

-- Tìm Tool kỹ năng trong Backpack hoặc Character theo slotKey ("q" hoặc "e")
local function findAbilityTool(slotKey)
	local bp = player and player:FindFirstChild("Backpack")
	if bp then
		for _, child in ipairs(bp:GetChildren()) do
			local slotVal = child:FindFirstChild("abilitySlot")
			if slotVal and slotVal.Value == slotKey then
				return child
			end
		end
	end

	local char = player and player.Character
	if char then
		for _, child in ipairs(char:GetChildren()) do
			if child:IsA("Tool") then
				local slotVal = child:FindFirstChild("abilitySlot")
				if slotVal and slotVal.Value == slotKey then
					return child
				end
			end
		end
	end

	return nil
end

-- Kiểm tra nhân vật có đang bận cast chiêu không (busyCasting)
local function isCharacterBusyCasting()
	local char = player and player.Character
	if char then
		local busy = char:FindFirstChild("busyCasting")
		if busy and busy:IsA("BoolValue") and busy.Value == true then
			return true
		end
	end
	return false
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

-- Tìm tất cả kẻ địch còn sống trong bán kính R phẳng (X/Z) xung quanh người chơi
local function getEnemiesInRadius(r)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return {} end

	local pPos = root.Position
	local inRange = {}

	local tracked = shared.GetTrackedEnemyData()
	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				local dx = data.Root.Position.X - pPos.X
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)
				if flatDist <= r then
					table.insert(inRange, {
						data = data,
						dist = flatDist,
						model = data.Model,
						name = (data.Model and data.Model.Name) or "Enemy",
						pos = data.Root.Position,
					})
				end
			end
		end
	end

	table.sort(inRange, function(a, b) return a.dist < b.dist end)
	return inRange
end

-- Kích hoạt đòn đánh / phím kỹ năng
local function executeCombat()
	local activeStyle = getEffectivePlaystyle()

	-- Đảm bảo Tool reference luôn hợp lệ
	if not skillQ.tool or not skillQ.tool.Parent then
		skillQ.tool = findAbilityTool("q")
	end
	if not skillE.tool or not skillE.tool.Parent then
		skillE.tool = findAbilityTool("e")
	end

	if activeStyle == "BuffAndDamage" and buffSkill and damageSkill then
		-- LỐI CHƠI 2: BUFF + DAMAGE
		local buffTool = buffSkill.tool or findAbilityTool(buffSkill.slotKey)
		local damageTool = damageSkill.tool or findAbilityTool(damageSkill.slotKey)

		-- Kiểm tra xem chiêu Buff đã hồi xong chưa
		local isBuffReady = false
		if comboCooldownOverride > 0 then
			local elapsed = os.clock() - lastBuffCastTime
			isBuffReady = (lastBuffCastTime == 0 or elapsed >= comboCooldownOverride)
		elseif buffTool and buffTool.Parent then
			local cdVal = buffTool:FindFirstChild("cooldown")
			if cdVal and cdVal:IsA("ValueBase") then
				isBuffReady = (tonumber(cdVal.Value) or 0) <= 0.05
			else
				local elapsed = os.clock() - lastBuffCastTime
				isBuffReady = (lastBuffCastTime == 0 or elapsed >= buffSkill.cooldown)
			end
		else
			local elapsed = os.clock() - lastBuffCastTime
			isBuffReady = (lastBuffCastTime == 0 or elapsed >= buffSkill.cooldown)
		end

		if isBuffReady and not isCharacterBusyCasting() then
			isCasting = true

			-- Bước 1: Kích hoạt BUFF
			castAbility(buffTool, buffSkill.key)
			lastBuffCastTime = os.clock()

			-- Bước 2: Chờ nhận hiệu lực buff (buffDelay)
			task.wait(buffDelay)

			-- Bước 3: Kích hoạt DAME
			castAbility(damageTool, damageSkill.key)
			lastDamageCastTime = os.clock()

			isCasting = false
		end
	else
		-- LỐI CHƠI 1: FULL DAMAGE (Spam Q & E như bình thường)
		isCasting = true
		if useSkillQ then
			local qTool = skillQ.tool or findAbilityTool("q")
			local qCdVal = qTool and qTool:FindFirstChild("cooldown")
			local qReady = not qCdVal or ((tonumber(qCdVal.Value) or 0) <= 0.05)
			if qReady and not isCharacterBusyCasting() then
				castAbility(qTool, Enum.KeyCode.Q)
			end
		end

		if useSkillE then
			local eTool = skillE.tool or findAbilityTool("e")
			local eCdVal = eTool and eTool:FindFirstChild("cooldown")
			local eReady = not eCdVal or ((tonumber(eCdVal.Value) or 0) <= 0.05)
			if eReady and not isCharacterBusyCasting() then
				castAbility(eTool, Enum.KeyCode.E)
			end
		end
		isCasting = false
	end
end

-- Vòng lặp quét quái trong tầm và xả chiêu
local function startLoop()
	if loopThread then return end

	-- Quét cập nhật trang bị ngay khi bắt đầu bật
	autoSkill.ScanEquippedSkills()

	loopThread = task.spawn(function()
		while enabled do
			-- Không thao tác khi nhân vật đã chết hoặc đang mở khung gõ chữ (chat box)
			if not shared.IsDead() and not UserInputService:GetFocusedTextBox() then
				local r = (getCombatRadius and getCombatRadius()) or 15.0
				local enemies = getEnemiesInRadius(r)
				currentEnemyCount = #enemies

				if #enemies > 0 then
					nearestTargetInfo = enemies[1]

					-- Thực thi tấn công theo lối chơi tương ứng
					executeCombat()
				else
					nearestTargetInfo = nil
					isCasting = false
				end

				fireStatusChange()
			else
				isCasting = false
				currentEnemyCount = 0
				nearestTargetInfo = nil
				fireStatusChange()
			end

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
		targetFacing.SetEnabled(false)
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

function autoSkill.GetStatus()
	local activeStyle = getEffectivePlaystyle()
	return {
		enabled = enabled,
		isCasting = isCasting,
		playstyle = activeStyle,
		skillQ = skillQ,
		skillE = skillE,
		buffSkill = buffSkill,
		damageSkill = damageSkill,
		cooldownRemaining = getComboCooldownRemaining(),
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
