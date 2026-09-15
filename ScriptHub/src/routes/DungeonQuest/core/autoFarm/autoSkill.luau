-- Auto Farm System – Smart Auto Skill Manager (DungeonQuest)
-- Quản lý logic kích hoạt skill thông minh chạy HOÀN TOÀN ĐỘC LẬP VÀ SONG SONG:
-- - Có vòng lặp Heartbeat riêng, không bị phụ thuộc/chặn bởi Auto Farm di chuyển hay Auto Dodge né đòn.
-- - Cast Q và Cast E trong task.spawn riêng biệt, không block lẫn nhau và không block luồng game.
--
-- Logic:
-- 1. Skill Q (Buff Damage & Speed): Tự động kích hoạt/spam khi có Enemy tồn tại còn sống trên map.
-- 2. Skill E (Damage Skill): Chỉ kích hoạt khi:
--    - Khoảng cách 2D tới mục tiêu <= Skill E Cast Range (Slider độc lập).
--    - Chiêu Q đang có hiệu lực buff (nhận biết qua effect 'groundAura' tồn tại trong workspace).

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")

local RunService = services.RunService or game:GetService("RunService")
local VirtualInputManager = services.VirtualInputManager or game:GetService("VirtualInputManager")
local player = services.player

local autoSkill = {}

--// State
local enabled = false
local skillERange = 35.0 -- studs (Khoảng cách cast chiêu E độc lập)
local spamInterval = 0.15 -- giây giữa các lần bấm phím

local lastCastQ = 0
local lastCastE = 0
local isCastingQ = false
local isCastingE = false
local heartbeatConnection = nil

function autoSkill.IsEnabled()
	return enabled
end

-- Forward declaration
local startHeartbeat, stopHeartbeat

function autoSkill.SetEnabled(state)
	local want = state == true
	if want == enabled then return end
	enabled = want
	if enabled then
		startHeartbeat()
	else
		stopHeartbeat()
	end
end

-- Aliases for backward compatibility
autoSkill.IsSkillQEnabled = autoSkill.IsEnabled
autoSkill.SetSkillQEnabled = autoSkill.SetEnabled
autoSkill.IsSkillEEnabled = autoSkill.IsEnabled
autoSkill.SetSkillEEnabled = autoSkill.SetEnabled

function autoSkill.GetSkillERange()
	return skillERange
end

function autoSkill.SetSkillERange(val)
	if type(val) == "number" and val >= 2 then
		skillERange = val
	end
end

function autoSkill.GetSpamInterval()
	return spamInterval
end

function autoSkill.SetSpamInterval(val)
	if type(val) == "number" and val >= 0.05 then
		spamInterval = val
	end
end

--// Kiểm tra xem chiêu Q (Buff) có đang có hiệu lực hay không dựa vào effect 'groundAura' trong workspace
function autoSkill.IsBuffActive()
	local ok, aura = pcall(function()
		return workspace:FindFirstChild("groundAura")
	end)
	return ok and aura ~= nil
end

--// Lấy HumanoidRootPart của người chơi
local function getPlayerRoot()
	local lp = player or game:GetService("Players").LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	if root and root.Parent then return root end
	return nil
end

--// Lấy Enemy mục tiêu tốt nhất và tính khoảng cách 2D phẳng (X-Z)
local function getBestEnemyAndDistance()
	local root = getPlayerRoot()
	if not root then return nil, math.huge, false end
	local playerPos = root.Position

	-- 1. Ưu tiên target hiện tại của AutoFarm Tracker
	local curTarget = tracker.GetTarget and tracker.GetTarget()
	if curTarget and curTarget.Root and curTarget.Root.Parent then
		local hum = curTarget.Humanoid or (curTarget.Model and curTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local ePos = curTarget.Root.Position
			local flatDist = Vector3.new(ePos.X - playerPos.X, 0, ePos.Z - playerPos.Z).Magnitude
			return curTarget, flatDist, true
		end
	end

	-- 2. Tìm quái sống gần nhất từ shared.GetTrackedEnemyData()
	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	local closestTarget = nil
	local closestDistSq = math.huge
	local hasAnyLivingEnemy = false

	if tracked and #tracked > 0 then
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					hasAnyLivingEnemy = true
					local ePos = data.Root.Position
					local dx = ePos.X - playerPos.X
					local dz = ePos.Z - playerPos.Z
					local distSq = dx * dx + dz * dz
					if distSq < closestDistSq then
						closestDistSq = distSq
						closestTarget = data
					end
				end
			end
		end
	end

	local closestFlatDist = closestDistSq < math.huge and math.sqrt(closestDistSq) or math.huge
	return closestTarget, closestFlatDist, hasAnyLivingEnemy
end

--// Bấm và nhả phím Q đơn lập (Buff) trong luồng độc lập
function autoSkill.CastSkillQ()
	if isCastingQ then return end
	isCastingQ = true
	task.spawn(function()
		local holdTime = (shared.GetKeyHoldTime and shared.GetKeyHoldTime()) or 0.05
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
		end)
		task.wait(holdTime)
		pcall(function()
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
		end)
		isCastingQ = false
	end)
end

--// Bấm và nhả phím E đơn lập (Damage) trong luồng độc lập
function autoSkill.CastSkillE()
	if isCastingE then return end
	isCastingE = true
	task.spawn(function()
		local holdTime = (shared.GetKeyHoldTime and shared.GetKeyHoldTime()) or 0.05
		pcall(function()
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
		end)
		task.wait(holdTime)
		pcall(function()
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
		end)
		isCastingE = false
	end)
end

--// Vòng lặp chính xử lý Smart Skills độc lập trên Heartbeat
local function onHeartbeat()
	if not enabled or shared.IsInLobby() then return end

	local root = getPlayerRoot()
	if not root then return end

	local char = root.Parent
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health <= 0 then return end

	local target, flatDist, hasEnemy = getBestEnemyAndDistance()
	local now = os.clock()

	-- 1. Xử lý Skill Q (Buff): Kích hoạt song song khi có Enemy tồn tại trên map
	if (now - lastCastQ >= spamInterval) and not isCastingQ then
		if hasEnemy then
			lastCastQ = now
			autoSkill.CastSkillQ()
		end
	end

	-- 2. Xử lý Skill E (Damage): Kích hoạt song song khi có Target, nằm trong tầm range độc lập VÀ chiêu Q đang buff (groundAura)
	if (now - lastCastE >= spamInterval) and not isCastingE then
		if target and flatDist <= skillERange then
			local buffActive = autoSkill.IsBuffActive()
			if buffActive then
				lastCastE = now
				autoSkill.CastSkillE()
			end
		end
	end
end

startHeartbeat = function()
	if not heartbeatConnection then
		heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

stopHeartbeat = function()
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
		heartbeatConnection = nil
	end
	isCastingQ = false
	isCastingE = false
end

-- Hook trực tiếp Step từ bên ngoài nếu cần
function autoSkill.Step(deltaTime, currentTarget, flatDistToTarget)
	-- Heartbeat riêng đã tự động xử lý 100% song song và độc lập
end

lifecycle.Register(function()
	autoSkill.SetEnabled(false)
end)

return autoSkill
