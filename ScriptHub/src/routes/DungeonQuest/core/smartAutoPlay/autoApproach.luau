--==============================================================--
-- Smart Auto Play – Submodule: Auto Approach (DungeonQuest)
-- Quản lý tiếp cận mục tiêu bằng Pathfinding (AutoFarm) dựa trên Combat Radius R:
--   - Khi KHÔNG CÓ quái nào trong vòng tròn R: Bật AutoFarm dẫn đường tiếp cận mục tiêu.
--   - Khi BẮT ĐẦU CÓ quái bước vào vòng tròn R: Lập tức dừng AutoFarm để giữ cự ly chiến đấu.
--   - Khi tiêu diệt hết quái trong R: Tự động tiếp tục bật AutoFarm tìm cụm quái tiếp theo.
--==============================================================--

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local autoFarm = require("@routes/DungeonQuest/core/autoFarm")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")

local player = services.player

local autoApproach = {}

--// Settings
local enabled = false
local hysteresisBuffer = 2.0 -- Đệm chống rung giật mép vòng tròn (studs)
local checkInterval = 0.15 -- Chu kỳ kiểm tra (giây)

--// State
local loopThread = nil
local currentState = "Disabled" -- "Disabled" | "Approaching" | "InCombat" | "NoEnemies"
local currentTargetName = nil
local currentTargetDist = nil
local statusListeners = {}

-- Reference tới hàm lấy bán kính R từ smartAutoPlay facade
local getCombatRadius = nil
function autoApproach.BindRadiusGetter(getterFn)
	getCombatRadius = getterFn
end

local function fireStatusChange()
	local info = {
		enabled = enabled,
		state = currentState,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
	}
	for _, cb in ipairs(statusListeners) do
		pcall(cb, info)
	end
end

-- Tìm quái gần nhất và kiểm tra xem có quái nào nằm trong bán kính R không
local function evaluateEnemies(r)
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return false, 0, nil, nil end

	local pPos = root.Position
	local tracked = shared.GetTrackedEnemyData()

	local hasEnemyInRadius = false
	local nearestDist = math.huge
	local nearestName = nil
	local totalAlive = 0

	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent then
			local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
			if hum and hum.Health > 0 then
				totalAlive = totalAlive + 1
				local dx = data.Root.Position.X - pPos.X
				local dz = data.Root.Position.Z - pPos.Z
				local flatDist = math.sqrt(dx * dx + dz * dz)

				if flatDist < nearestDist then
					nearestDist = flatDist
					nearestName = (data.Model and data.Model.Name) or "Enemy"
				end

				if flatDist <= r then
					hasEnemyInRadius = true
				end
			end
		end
	end

	-- Kiểm tra thêm target hiện tại của AutoFarm nếu có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local dx = afTarget.Root.Position.X - pPos.X
			local dz = afTarget.Root.Position.Z - pPos.Z
			local flatDist = math.sqrt(dx * dx + dz * dz)
			if flatDist <= r then
				hasEnemyInRadius = true
			end
			if flatDist < nearestDist then
				nearestDist = flatDist
				nearestName = (afTarget.Model and afTarget.Model.Name) or "Target"
			end
		end
	end

	return hasEnemyInRadius, totalAlive, nearestName, (nearestDist < math.huge and nearestDist or nil)
end

-- Vòng lặp điều phối trạng thái tiếp cận
local function startLoop()
	if loopThread then return end

	loopThread = task.spawn(function()
		while enabled do
			if not shared.IsDead() then
				local r = (getCombatRadius and getCombatRadius()) or 15.0

				-- Đồng bộ reachDistance của AutoFarm theo bán kính R để thuật toán Pathfinding dừng chuẩn
				if autoFarm.GetReachDistance and autoFarm.SetReachDistance then
					if math.abs(autoFarm.GetReachDistance() - r) > 0.5 then
						autoFarm.SetReachDistance(r)
					end
				end

				-- Đánh giá tình hình quái xung quanh
				-- Khi đang ở trạng thái InCombat, mở rộng ngưỡng so sánh thêm hysteresisBuffer để không bị bật/tắt liên tục
				local checkR = (currentState == "InCombat") and (r + hysteresisBuffer) or r
				local hasEnemyInRange, totalAlive, nName, nDist = evaluateEnemies(checkR)

				currentTargetName = nName
				currentTargetDist = nDist

				if totalAlive == 0 then
					-- Không có quái nào còn sống trong phòng/dungeon
					currentState = "NoEnemies"
					if autoFarm.IsEnabled() then
						autoFarm.Toggle(false)
					end
				elseif hasEnemyInRange then
					-- ĐÃ CÓ QUÁI TRONG VÒNG TRÒN R -> Dừng Pathfinding của AutoFarm ngay lập tức!
					currentState = "InCombat"
					if autoFarm.IsEnabled() then
						autoFarm.Toggle(false)
					end
				else
					-- CHƯA CÓ QUÁI TRONG R -> Bật AutoFarm để tìm đường tiếp cận mục tiêu!
					currentState = "Approaching"
					if not autoFarm.IsEnabled() then
						autoFarm.Toggle(true)
					end
				end

				fireStatusChange()
			else
				-- Nhân vật tử trận -> Tạm dừng AutoFarm
				if autoFarm.IsEnabled() then
					autoFarm.Toggle(false)
				end
			end

			task.wait(checkInterval)
		end

		if autoFarm.IsEnabled() then
			autoFarm.Toggle(false)
		end
		currentState = "Disabled"
		currentTargetName = nil
		currentTargetDist = nil
		fireStatusChange()
		loopThread = nil
	end)
end

local function stopLoop()
	enabled = false
	if autoFarm.IsEnabled() then
		autoFarm.Toggle(false)
	end
	currentState = "Disabled"
	currentTargetName = nil
	currentTargetDist = nil
	fireStatusChange()
end

--// Public API
function autoApproach.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		startLoop()
	else
		stopLoop()
	end
end

function autoApproach.IsEnabled()
	return enabled
end

function autoApproach.GetStatus()
	return {
		enabled = enabled,
		state = currentState,
		targetName = currentTargetName,
		targetDist = currentTargetDist,
	}
end

function autoApproach.OnStatusChanged(callback)
	if type(callback) == "function" then
		table.insert(statusListeners, callback)
	end
end

-- Lifecycle Cleanup
lifecycle.Register(function()
	autoApproach.SetEnabled(false)
end)

return autoApproach
