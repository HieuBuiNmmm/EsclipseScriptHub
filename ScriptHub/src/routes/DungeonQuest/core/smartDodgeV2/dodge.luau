--================================================================--
-- Smart Dodge V2: Dodge Execution Engine
-- Module: humanoidMove + Snap đích (Final Step Snap)
-- DungeonQuest
--================================================================--

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local danger = require("@routes/DungeonQuest/core/smartDodgeV2/danger")
local safeSpot = require("@routes/DungeonQuest/core/smartDodgeV2/safeSpot")
local targetFacing = require("@routes/DungeonQuest/core/smartDodgeV2/targetFacing")
local tracker = require("@routes/DungeonQuest/core/autoFarm/tracker")

local player = services.player

local dodge = {}

--// Cấu hình (Settings)
local enabled = false
local maxSnapDistance = 1.5           -- Cự ly Snap dứt điểm vào đích (studs)
local maintainSnapHeight = true       -- Giữ nguyên cao độ Y khi Snap (chống giật cao độ)
local strafeFacingMode = "All"        -- "All" | "Boss" | "Mob" | "Disabled"

--// Trạng thái (Runtime State)
local isDodging = false
local dodgeThread: thread? = nil
local activeMoveConn: RBXScriptConnection? = nil
local currentTargetPos: Vector3? = nil
local dodgeStatusCallbacks: { (string) -> () } = {}

--// Raycast Parameters kiểm tra sàn khi Snap
local dodgeRayParams = RaycastParams.new()
dodgeRayParams.FilterType = Enum.RaycastFilterType.Exclude
dodgeRayParams.IgnoreWater = true
local lastFilterRebuildTime = 0
local cachedIgnoreList: { Instance } = {}

local function updateDodgeRayFilter()
	local now = os.clock()
	if now - lastFilterRebuildTime < 0.5 then return end
	lastFilterRebuildTime = now

	table.clear(cachedIgnoreList)
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(cachedIgnoreList, p.Character) end
	end
	if Workspace:FindFirstChild("RaycastIgnore") then
		table.insert(cachedIgnoreList, Workspace.RaycastIgnore)
	end
	dodgeRayParams.FilterDescendantsInstances = cachedIgnoreList
end

--// Helpers lấy linh kiện nhân vật
local function getCharacterParts(): (Model?, BasePart?, Humanoid?)
	local char = player and player.Character
	if not char then return nil, nil, nil end
	local rootPart = char:FindFirstChild("HumanoidRootPart")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not rootPart or not humanoid then return char, nil, nil end
	return char, rootPart, humanoid
end

--// Tính khoảng cách phẳng 2D trên mặt sàn (bỏ qua trục Y)
local function flatDistance(a: any, b: any): number
	if not a or not b or typeof(a) ~= "Vector3" or typeof(b) ~= "Vector3" then return math.huge end
	local dx = a.X - b.X
	local dz = a.Z - b.Z
	return math.sqrt(dx * dx + dz * dz)
end

--// Kiểm tra xem một Model kẻ địch có phải là Boss hay không
local function isEnemyBoss(model: Model?): boolean
	local eName = model and model.Name
	return shared.IsBossEnemy and shared.IsBossEnemy(model, eName) or false
end

--// Lấy vị trí mục tiêu cần quay mặt nhìn theo chế độ Dropdown: ALL / BOSS / MOB / DISABLED
local function getFaceTarget(): Vector3?
	local modeUpper = strafeFacingMode:upper()
	if modeUpper == "DISABLED" or modeUpper == "NONE" or modeUpper == "OFF" then
		return nil
	end

	-- 1. Ưu tiên target của AutoFarm nếu đang có
	local afTarget = tracker.GetTarget and tracker.GetTarget()
	if afTarget and afTarget.Root and afTarget.Root.Parent then
		local hum = afTarget.Humanoid or (afTarget.Model and afTarget.Model:FindFirstChildOfClass("Humanoid"))
		if hum and hum.Health > 0 then
			local isBoss = isEnemyBoss(afTarget.Model)
			if modeUpper == "ALL" or (modeUpper == "BOSS" and isBoss) or (modeUpper == "MOB" and not isBoss) then
				return afTarget.Root.Position
			end
		end
	end

	-- 2. Fallback: Lấy quái phù hợp nhất trong danh sách đang track của shared
	local _, rootPart = getCharacterParts()
	local pPos = rootPart and rootPart.Position
	local tracked = shared.GetTrackedEnemyData and shared.GetTrackedEnemyData()
	if tracked and #tracked > 0 and pPos then
		local nearestPos = nil
		local nearestDistSq = math.huge
		for _, data in ipairs(tracked) do
			if data and data.Root and data.Root.Parent then
				local hum = data.Humanoid or (data.Model and data.Model:FindFirstChildOfClass("Humanoid"))
				if hum and hum.Health > 0 then
					local isBoss = isEnemyBoss(data.Model)
					local matchesMode = (modeUpper == "ALL") or (modeUpper == "BOSS" and isBoss) or (modeUpper == "MOB" and not isBoss)
					if matchesMode then
						local distSq = (data.Root.Position - pPos).Magnitude
						if distSq < nearestDistSq then
							nearestDistSq = distSq
							nearestPos = data.Root.Position
						end
					end
				end
			end
		end
		if nearestPos then
			return nearestPos
		end
	end

	-- 3. Fallback: Vị trí của targetFacing chung nếu mode là ALL
	if modeUpper == "ALL" and targetFacing and targetFacing.GetTargetPosition then
		return targetFacing.GetTargetPosition()
	end

	return nil
end

--// Báo trạng thái né đòn ra ngoài
local function fireStatus(status: string)
	for _, cb in ipairs(dodgeStatusCallbacks) do
		pcall(cb, status)
	end
end

--================================================================--
-- Snap Đích (Teleport dứt điểm vào Safe Spot)
--================================================================--
local function snapFace(rootPart: BasePart, humanoid: Humanoid, pos: Vector3, startHeight: number?)
	if not rootPart or not pos then return end

	local targetY = startHeight or pos.Y

	-- Nếu không giữ nguyên cao độ cũ: Bắn tia xuống sàn để hạ chân êm ái
	if not maintainSnapHeight and humanoid and humanoid.HipHeight and rootPart then
		updateDodgeRayFilter()
		local rootOffset = humanoid.HipHeight + (rootPart.Size.Y / 2)
		local rayOrigin = Vector3.new(pos.X, (startHeight or rootPart.Position.Y) + 6, pos.Z)
		local rayDir = Vector3.new(0, -20, 0)
		local floorResult = Workspace:Raycast(rayOrigin, rayDir, dodgeRayParams)
		if floorResult and floorResult.Position then
			targetY = floorResult.Position.Y + rootOffset
		else
			targetY = pos.Y + rootOffset
		end
	end

	local actualPos = Vector3.new(pos.X, targetY, pos.Z)
	local targetEnemy = getFaceTarget()

	if targetEnemy then
		-- Snap và quay mặt thẳng vào mục tiêu
		rootPart.CFrame = CFrame.lookAt(actualPos, Vector3.new(targetEnemy.X, targetY, targetEnemy.Z))
	else
		-- Giữ nguyên góc nhìn ngang hiện tại
		local look = rootPart.CFrame.LookVector
		local flatLook = Vector3.new(look.X, 0, look.Z)
		if flatLook.Magnitude > 0.001 then
			rootPart.CFrame = CFrame.lookAt(actualPos, actualPos + flatLook.Unit)
		else
			rootPart.CFrame = CFrame.new(actualPos)
		end
	end

	-- Triệt tiêu hoàn toàn vận tốc quán tính sau khi Snap (chống trượt)
	rootPart.AssemblyLinearVelocity = Vector3.zero
	rootPart.AssemblyAngularVelocity = Vector3.zero
end

--================================================================--
-- Perform Dodge (humanoidMove + Snap Đích)
--================================================================--
function dodge.Perform(safePos: Vector3?, escapeDist: number?, hazardName: string?)
	if not enabled then return end
	if not safePos or typeof(safePos) ~= "Vector3" then return end

	-- Bỏ qua né đòn nếu đang tử trận hoặc đang trong thời gian bảo vệ sau hồi sinh
	if shared.IsDead and shared.IsDead() then return end
	if danger.IsRespawnProtected and danger.IsRespawnProtected() then return end

	local char, rootPart, humanoid = getCharacterParts()
	if not rootPart or not humanoid or humanoid.Health <= 0 then
		return
	end

	currentTargetPos = safePos

	-- Nếu đang có luồng né chạy: Luồng đó sẽ tự động bắt lấy currentTargetPos mới
	if isDodging then
		return
	end

	dodgeThread = task.spawn(function()
		isDodging = true
		if targetFacing and targetFacing.SetDodging then
			targetFacing.SetDodging(true)
		end
		fireStatus("Dodging")

		local startHeight = rootPart.Position.Y
		local startTime = os.clock()
		local MAX_DODGE_TIMEOUT = 3.5

		local function finish()
			if activeMoveConn then
				pcall(function() activeMoveConn:Disconnect() end)
				activeMoveConn = nil
			end

			if rootPart and rootPart.Parent then
				rootPart.AssemblyLinearVelocity = Vector3.zero
				rootPart.AssemblyAngularVelocity = Vector3.zero
			end

			if humanoid and humanoid.Parent then
				pcall(function()
					humanoid:Move(Vector3.zero, false)
					humanoid.AutoRotate = true
				end)
			end

			isDodging = false
			if targetFacing and targetFacing.SetDodging then
				targetFacing.SetDodging(false)
			end
			currentTargetPos = nil
			fireStatus("Safe")
		end

		local ok, err = pcall(function()
			local targetPos = currentTargetPos or safePos
			local currentPos = rootPart.Position
			local initialDist = flatDistance(currentPos, targetPos)

			-- BƯỚC 1: INSTANT SNAP (Nếu cự ly tới Safe Spot <= maxSnapDistance ngay từ đầu)
			if initialDist <= maxSnapDistance then
				snapFace(rootPart, humanoid, targetPos, startHeight)
				finish()
				return
			end

			-- BƯỚC 2: HUMANOID:MOVE (Vận động vật lý mượt mà, không giật hình/CFrame)
			updateDodgeRayFilter()

			-- Runner liên tục inject chuyển động theo nhịp RenderStepped
			activeMoveConn = RunService.RenderStepped:Connect(function()
				if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
					if activeMoveConn then activeMoveConn:Disconnect(); activeMoveConn = nil end
					return
				end

				local curTarget = currentTargetPos or safePos
				if not curTarget then return end

				local curDiff = Vector3.new(curTarget.X - rootPart.Position.X, 0, curTarget.Z - rootPart.Position.Z)
				if curDiff.Magnitude > 0.4 then
					humanoid:Move(curDiff.Unit, false)
				else
					humanoid:Move(Vector3.zero, false)
				end

				-- STRAFE FACING: Xoay mặt nhìn mục tiêu theo chế độ (ALL / BOSS / MOB)
				local targetEnemy = getFaceTarget()
				if targetEnemy then
					humanoid.AutoRotate = false
					local pPos = rootPart.Position
					local diff = Vector3.new(targetEnemy.X - pPos.X, 0, targetEnemy.Z - pPos.Z)
					if diff.Magnitude > 0.5 then
						rootPart.CFrame = CFrame.lookAt(pPos, Vector3.new(targetEnemy.X, pPos.Y, targetEnemy.Z))
					end
				else
					humanoid.AutoRotate = true
				end
			end)

			-- Vòng lặp giám sát cự ly & SNAP ĐÍCH
			while enabled and (os.clock() - startTime < MAX_DODGE_TIMEOUT) do
				if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
					break
				end

				targetPos = currentTargetPos or safePos
				if not targetPos then break end

				currentPos = rootPart.Position
				local diff = Vector3.new(targetPos.X - currentPos.X, 0, targetPos.Z - currentPos.Z)
				local dist = diff.Magnitude

				-- SNAP ĐÍCH: Khi đã chạy tới gần đích (<= maxSnapDistance) -> Snap dứt điểm vào Safe Spot!
				if dist <= maxSnapDistance then
					snapFace(rootPart, humanoid, targetPos, startHeight)
					break
				end

				-- Nếu đã thoát hiểm hoàn toàn (không còn dính bất kỳ hiểm họa nào)
				if not danger.IsPlayerInDanger() then
					-- Nếu cự ly còn lại rất gần thì snap nốt vào tâm, ngược lại có thể dừng ngay
					if dist <= (maxSnapDistance * 1.5) then
						snapFace(rootPart, humanoid, targetPos, startHeight)
					end
					break
				end

				task.wait(0.03)
			end

			-- Đảm bảo kiểm tra Snap bước cuối trước khi thoát
			if rootPart.Parent and humanoid.Parent and humanoid.Health > 0 then
				targetPos = currentTargetPos or safePos
				if targetPos then
					local remainingDist = flatDistance(rootPart.Position, targetPos)
					if remainingDist <= maxSnapDistance then
						snapFace(rootPart, humanoid, targetPos, startHeight)
					end
				end
			end
		end)

		if not ok then
			warn("[SmartDodgeV2 - Dodge] Error during dodge execution: " .. tostring(err))
		end

		finish()
	end)
end

--// Dừng / Hủy bỏ né đòn
function dodge.Cancel()
	if dodgeThread then
		task.cancel(dodgeThread)
		dodgeThread = nil
	end

	if activeMoveConn then
		pcall(function() activeMoveConn:Disconnect() end)
		activeMoveConn = nil
	end

	local _, rootPart, humanoid = getCharacterParts()
	if humanoid and humanoid.Parent then
		pcall(function()
			humanoid:Move(Vector3.zero, false)
			humanoid.AutoRotate = true
		end)
	end
	if rootPart and rootPart.Parent then
		rootPart.AssemblyLinearVelocity = Vector3.zero
		rootPart.AssemblyAngularVelocity = Vector3.zero
	end

	isDodging = false
	if targetFacing and targetFacing.SetDodging then
		targetFacing.SetDodging(false)
	end
	currentTargetPos = nil
	fireStatus("Cancelled")
end

--================================================================--
-- Getters / Setters
--================================================================--
function dodge.SetEnabled(state: boolean)
	enabled = (state == true)
	if not enabled and isDodging then
		dodge.Cancel()
	end
end

function dodge.IsEnabled(): boolean
	return enabled
end

function dodge.SetMaxSnapDistance(val: number)
	if type(val) == "number" and val >= 0.2 then
		maxSnapDistance = math.clamp(val, 0.2, 10.0)
	end
end

function dodge.GetMaxSnapDistance(): number
	return maxSnapDistance
end

function dodge.SetMaintainSnapHeight(state: boolean)
	maintainSnapHeight = (state == true)
end

function dodge.IsMaintainSnapHeight(): boolean
	return maintainSnapHeight
end

function dodge.SetStrafeFacingMode(mode: string)
	local m = tostring(mode or "All"):gsub("%s+", "")
	local mUp = m:upper()
	if mUp == "BOSS" then
		strafeFacingMode = "Boss"
	elseif mUp == "MOB" or mUp == "MOBS" then
		strafeFacingMode = "Mob"
	elseif mUp == "DISABLED" or mUp == "NONE" or mUp == "OFF" then
		strafeFacingMode = "Disabled"
	else
		strafeFacingMode = "All"
	end

	-- Đồng bộ trạng thái và kích hoạt liên tục vào targetFacing
	if strafeFacingMode == "Disabled" then
		if targetFacing and targetFacing.SetEnabled then
			targetFacing.SetEnabled(false)
		end
	else
		if targetFacing then
			if targetFacing.SetTargetScope then
				targetFacing.SetTargetScope(strafeFacingMode)
			end
			if targetFacing.SetEnabled then
				targetFacing.SetEnabled(true)
			end
		end
	end
end

function dodge.GetStrafeFacingMode(): string
	return strafeFacingMode
end

function dodge.IsDodging(): boolean
	return isDodging
end

function dodge.OnDodgeStatusChanged(cb: (string) -> ())
	if type(cb) == "function" then
		table.insert(dodgeStatusCallbacks, cb)
	end
end

function dodge.SetRespawnBypassEnabled(state: boolean)
	danger.SetRespawnBypassEnabled(state)
end

function dodge.IsRespawnBypassEnabled(): boolean
	return danger.IsRespawnBypassEnabled()
end

function dodge.SetRespawnBypassDuration(val: number)
	danger.SetRespawnBypassDuration(val)
end

function dodge.GetRespawnBypassDuration(): number
	return danger.GetRespawnBypassDuration()
end

function dodge.IsRespawnProtected(): boolean
	return danger.IsRespawnProtected()
end

function dodge.GetRespawnProtectionRemaining(): number
	return danger.GetRespawnProtectionRemaining()
end

--================================================================--
-- Tự động kết nối với Safe Spot Radar V2
--================================================================--
safeSpot.OnSafeSpotChanged(function(hasSpot: boolean, pos: Vector3?, hazardName: string?, dist: number)
	if not enabled then return end
	if danger.IsRespawnProtected and danger.IsRespawnProtected() then return end
	if hasSpot and pos then
		dodge.Perform(pos, dist, hazardName)
	end
end)

danger.OnDangerStateChanged(function(inDanger: boolean)
	if not inDanger and isDodging then
		-- Khi nguy hiểm kết thúc, hủy bỏ né đòn nếu còn đang dở
		dodge.Cancel()
	end
end)

shared.OnRespawn(function()
	dodge.Cancel()
	if safeSpot and safeSpot.ClearRadar then
		safeSpot.ClearRadar()
	end
end)

lifecycle.Register(function()
	dodge.SetEnabled(false)
	dodge.Cancel()
	table.clear(dodgeStatusCallbacks)
end)

return dodge
