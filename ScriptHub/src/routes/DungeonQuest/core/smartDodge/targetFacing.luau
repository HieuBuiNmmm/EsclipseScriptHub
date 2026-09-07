-- Smart Dodge – Module phụ: Target Facing Manager (DungeonQuest)
-- Chuyên trách: Tự động định vị mục tiêu hiện tại (Target của Auto Farm hoặc quái gần nhất)
-- và điều khiển nhân vật luôn quay mặt về phía mục tiêu (sử dụng Humanoid.AutoRotate = false).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")

--// References
local player = services.player

--// State
local enabled = false
local facingThread = nil
local isDodging = false

local targetFacing = {}

function targetFacing.SetDodging(state)
	isDodging = state and true or false
end

local function getPlayerRoot()
	local char = player and player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if root and root.Parent then return root end
	return nil
end

local function getHumanoid()
	local char = player and player.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum and hum.Parent then return hum end
	return nil
end

local function applyAutoRotateState()
	local hum = getHumanoid()
	if hum then
		hum.AutoRotate = not enabled
	end
end

--// Lấy vị trí Vector3 của Target hiện tại (Auto Farm target hoặc quái gần nhất)
function targetFacing.GetTargetPosition()
	-- 1. Ưu tiên target của Auto Farm nếu đang có
	local afTarget = tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			return afTarget.Root.Position
		end
	end

	-- 2. Fallback: Lấy quái gần nhất trong danh sách đang track của shared
	local rootPart = getPlayerRoot()
	local pPos = rootPart and rootPart.Position
	local tracked = shared.GetTrackedEnemyData()
	if tracked and #tracked > 0 and pPos then
		local nearestPos = nil
		local nearestDistSq = math.huge
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					local distSq = (data.Root.Position - pPos).Magnitude
					if distSq < nearestDistSq then
						nearestDistSq = distSq
						nearestPos = data.Root.Position
					end
				end
			end
		end
		return nearestPos
	end

	return nil
end

--// Kiểm tra xem có mục tiêu đang hoạt động hay không
function targetFacing.IsTargetActive()
	return targetFacing.GetTargetPosition() ~= nil
end

--// Vòng lặp ép quay mặt về mục tiêu
local function startFacingLoop()
	if facingThread then return end
	applyAutoRotateState()

	facingThread = task.spawn(function()
		while enabled and lifecycle.IsActive() do
			if not isDodging then
				local targetPos = targetFacing.GetTargetPosition()
				if targetPos then
					local rootPart = getPlayerRoot()
					local humanoid = getHumanoid()

					if rootPart and humanoid and humanoid.Health > 0 then
						-- Đảm bảo AutoRotate luôn false khi tính năng đang bật
						if humanoid.AutoRotate ~= false then
							humanoid.AutoRotate = false
						end

						local pPos = rootPart.Position
						local target = Vector3.new(targetPos.X, pPos.Y, targetPos.Z)
						local diff = target - pPos

						if diff.Magnitude > 0.5 then
							local curLook = rootPart.CFrame.LookVector
							local wantLook = Vector3.new(diff.X, 0, diff.Z).Unit
							-- Chỉ chỉnh CFrame nếu góc lệch đáng kể để mượt mà
							if curLook:Dot(wantLook) < 0.999 then
								rootPart.CFrame = CFrame.lookAt(pPos, target)
							end
						end
					end
				end
			end
			task.wait(0.03)
		end
		facingThread = nil
	end)
end

local function stopFacingLoop()
	if facingThread then
		task.cancel(facingThread)
		facingThread = nil
	end
	-- Khôi phục lại AutoRotate = true
	local hum = getHumanoid()
	if hum then
		hum.AutoRotate = true
	end
end

--// Bật / tắt tính năng Auto Face Target
function targetFacing.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		startFacingLoop()
	else
		stopFacingLoop()
	end
end

function targetFacing.IsEnabled()
	return enabled
end

--// Lắng nghe respawn để set lại AutoRotate
shared.OnRespawn(function()
	if enabled then
		task.defer(function()
			applyAutoRotateState()
		end)
	end
end)

--// Tự động dọn dẹp khi script shutdown
lifecycle.Register(function()
	stopFacingLoop()
end)

return targetFacing
