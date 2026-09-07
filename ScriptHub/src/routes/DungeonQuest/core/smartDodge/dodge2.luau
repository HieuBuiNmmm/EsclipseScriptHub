-- Smart Dodge – Module 5: Dodge Execution (Walk + Snap hybrid with Time Budget) (DungeonQuest).
-- Nguyên tắc HYBRID:
--  (1) Còn cách Safe Spot ≤ Max Snap Distance => SNAP LUÔN (không walk).
--  (2) Xa hơn => WALK tối đa theo ngân sách Max Dodge Time để thu hẹp cự ly snap.
--      Vừa walk vừa kiểm tra: khi rơi vào ≤ Max Snap Distance thì snap;
--      Hết budget thời gian mà chưa tới thì snap nốt phần còn lại để kịp thoát nổ chiêu.
--  (3) Real-time Target Tracking: cập nhật đích đến thời gian thực theo quả cầu xanh.
--  (4) Flat Floor MoveTo: di chuyển phẳng bám sàn 100%.
--  (5) Maintain Height: căn chỉnh độ cao sát sàn chuẩn xác khi snap.

--// Imports
local services = require("@routes/DungeonQuest/core/services")

--// References
local player = services.player

--// State
local autoDodgeEnabled = false
local maxDodgeTime = 1.0              -- Ngân sách thời gian tối đa để né (giây)
local maxSnapDistance = 3.0           -- Còn cách Safe Spot ≤ cự ly này => SNAP LUÔN (studs)
local FINAL_ADJUST_DIST = 0.5         -- Ngưỡng "đã đứng đúng" — hết budget mà còn xa hơn mức này thì mới snap nốt
local maintainSnapHeight = true       -- Giữ độ cao Y của player lúc bắt đầu né khi snap
local isDodging = false
local dodgeThread = nil
local currentTargetPos = nil
local dodgeStatusCallbacks = {}

--// Provider trả về vị trí cần quay mặt khi né (ví dụ enemy — do AutoFarm Mode 2 đăng ký).
--// nil = giữ hành vi cũ (face theo hướng di chuyển/safe spot).
local faceTargetProvider = nil

--// Runtime do engine bơm: { getInDanger = fn, getLogInDanger = fn }
local runtime = nil

local dodge = {}

--// Engine bơm trạng thái chạy (tránh vòng require dodge -> engine)
function dodge.SetRuntime(ctx)
	runtime = ctx or nil
end

local function getInDanger()
	return runtime and runtime.getInDanger and runtime.getInDanger() or false
end

local function getLogInDanger()
	return runtime and runtime.getLogInDanger and runtime.getLogInDanger() or false
end

local function fireDodgeStatus(status)
	for _, cb in ipairs(dodgeStatusCallbacks) do
		pcall(cb, status)
	end
end

--// Lấy vị trí cần quay mặt khi né (nếu có provider). pcall cho an toàn vì provider do module khác bơm.
local function getFaceTarget()
	if not faceTargetProvider then return nil end
	local ok, pos = pcall(faceTargetProvider)
	if ok and type(pos) == "table" and pos.X and pos.Z then return pos end
	return nil
end

--// Snap rotation khi teleport dứt điểm: căn chỉnh độ cao sát sàn chuẩn xác + face provider target nếu có.
local function snapFace(rootPart, humanoid, pos, startHeight)
	local targetY = startHeight or pos.Y
	if not maintainSnapHeight and humanoid and humanoid.HipHeight then
		local rootOffset = humanoid.HipHeight + (rootPart.Size.Y / 2)
		local floorY = pos.Y - 3 -- vì pos.Y từ geometry.GetFloorPosition là floorY + 3
		targetY = floorY + rootOffset
	end

	local actualPos = Vector3.new(pos.X, targetY, pos.Z)
	local targetPos = getFaceTarget()
	if targetPos then
		rootPart.CFrame = CFrame.new(actualPos, Vector3.new(targetPos.X, targetY, targetPos.Z))
	else
		rootPart.CFrame = CFrame.new(actualPos, actualPos + rootPart.CFrame.LookVector)
	end
end

--// Thực thi né sang Safe Spot (Walk + Snap hybrid with Time Budget):
--// (1) Còn cách Safe Spot ≤ maxSnapDistance => snap luôn.
--// (2) Xa hơn => walk tối đa theo ngân sách maxDodgeTime, bám đuổi marker thời gian thực.
--// (3) Hết budget mà chưa tới => snap nốt phần còn lại để kịp thoát sát thương.
function dodge.Perform(safePos, escapeDist)
	local char = player and player.Character
	local rootPart = char and char:FindFirstChild("HumanoidRootPart")
	local humanoid = char and char:FindFirstChild("Humanoid")
	if not rootPart or not humanoid or humanoid.Health <= 0 then return end

	currentTargetPos = safePos

	-- Nếu đang trong tiến trình né, cập nhật đích đến mới nhất
	if isDodging then
		return
	end

	dodgeThread = task.spawn(function()
		isDodging = true
		fireDodgeStatus("Dodging")

		-- Độ cao Y ban đầu của player làm neo
		local startHeight = rootPart.Position.Y

		local function finish()
			isDodging = false
			currentTargetPos = nil
			fireDodgeStatus("Safe")
		end

		local currentPos = rootPart.Position
		local totalDist = (safePos - currentPos).Magnitude

		-- (1) Khoảng cách ngắn (≤ maxSnapDistance) -> Snap tức thời 1 nhịp
		if totalDist <= maxSnapDistance then
			snapFace(rootPart, humanoid, safePos, startHeight)
			if getLogInDanger() then
				print(("[SmartDodge][Dodge] ⚡ Instant Snap (%.1f studs) to Safe Spot!"):format(totalDist))
			end
			finish()
			return
		end

		if getLogInDanger() then
			print(("[SmartDodge][Dodge] 🚀 CFrame Smooth Glide (%.1f studs, budget %.2fs)..."):format(totalDist, maxDodgeTime))
		end

		local startTime = os.clock()
		local lastTick = os.clock()

		-- (2) Lướt mượt CFrame (Glide) theo thời gian thực tới Safe Spot
		while getInDanger() and autoDodgeEnabled and (os.clock() - startTime < maxDodgeTime) do
			if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then break end
			local now = os.clock()
			local dt = math.clamp(now - lastTick, 0.008, 0.05)
			lastTick = now

			local targetPos = currentTargetPos or safePos
			currentPos = rootPart.Position
			local diffX = targetPos.X - currentPos.X
			local diffZ = targetPos.Z - currentPos.Z
			local distRemaining = math.sqrt(diffX * diffX + diffZ * diffZ)

			-- Đã thu hẹp tới cự ly snap (còn ≤ maxSnapDistance) -> snap dứt điểm
			if distRemaining <= maxSnapDistance then
				snapFace(rootPart, humanoid, targetPos, startHeight)
				break
			end

			-- Tính tốc độ lướt: Lấy tốc độ WalkSpeed thực tế của nhân vật (tối thiểu 24 studs/s)
			local speed = math.max(24, (humanoid and humanoid.WalkSpeed) or 24)
			local thisStep = math.min(distRemaining, speed * dt)

			if distRemaining > 0.01 then
				local dirX = diffX / distRemaining
				local dirZ = diffZ / distRemaining
				local nextX = currentPos.X + dirX * thisStep
				local nextZ = currentPos.Z + dirZ * thisStep

				-- Giữ nguyên độ cao sàn Y chuẩn xác
				local nextPos = Vector3.new(nextX, startHeight, nextZ)

				-- Quay mặt về quái (nếu có provider) hoặc theo hướng lướt
				local targetEnemy = getFaceTarget()
				if targetEnemy then
					rootPart.CFrame = CFrame.lookAt(nextPos, Vector3.new(targetEnemy.X, startHeight, targetEnemy.Z))
				else
					rootPart.CFrame = CFrame.lookAt(nextPos, Vector3.new(nextX + dirX, startHeight, nextZ + dirZ))
				end

				rootPart.AssemblyLinearVelocity = Vector3.zero
				rootPart.AssemblyAngularVelocity = Vector3.zero
			end

			task.wait(0.016) -- ~60 FPS mượt mà
		end

		-- (3) Hết ngân sách thời gian mà vẫn chưa đứng đúng chỗ: snap nốt phần còn lại
		local targetPos = currentTargetPos or safePos
		if (os.clock() - startTime) >= maxDodgeTime and (targetPos - rootPart.Position).Magnitude > FINAL_ADJUST_DIST then
			snapFace(rootPart, humanoid, targetPos, startHeight)
			if getLogInDanger() then
				print("[SmartDodge][Dodge] ⚡ Time Budget reached — snapped the remainder to Safe Spot!")
			end
		end

		finish()
	end)
end

--// Hủy thread né hiện tại (engine gọi khi dừng loop / shutdown)
function dodge.Cancel()
	if dodgeThread then
		task.cancel(dodgeThread)
		dodgeThread = nil
	end
	isDodging = false
	currentTargetPos = nil
end

--// Bắn trạng thái dodge ra callbacks (engine gọi "Idle" khi dừng loop)
function dodge.FireStatus(status)
	fireDodgeStatus(status)
end

--// Accessors

function dodge.SetAutoDodge(state)
	autoDodgeEnabled = state and true or false
end

function dodge.IsAutoDodgeEnabled()
	return autoDodgeEnabled
end

function dodge.SetMaxDodgeTime(seconds)
	if type(seconds) == "number" and seconds > 0 then
		maxDodgeTime = seconds
	end
end

function dodge.GetMaxDodgeTime()
	return maxDodgeTime
end

function dodge.SetMaxSnapDistance(value)
	if type(value) == "number" and value > 0 then
		maxSnapDistance = value
	end
end

function dodge.GetMaxSnapDistance()
	return maxSnapDistance
end

-- Backward compatibility aliases
dodge.SetMaxTeleportStep = dodge.SetMaxSnapDistance
dodge.GetMaxTeleportStep = dodge.GetMaxSnapDistance

function dodge.SetMaintainSnapHeight(state)
	maintainSnapHeight = state and true or false
end

function dodge.IsMaintainSnapHeightEnabled()
	return maintainSnapHeight
end

function dodge.IsDodging()
	return isDodging
end

function dodge.SetFaceTargetProvider(func)
	faceTargetProvider = type(func) == "function" and func or nil
end

function dodge.GetStatus()
	if isDodging then
		return "Dodging"
	elseif getInDanger() then
		return "Safe (Standing in Spot)"
	else
		return "Idle"
	end
end

function dodge.OnDodgeStatusChanged(callback)
	if type(callback) ~= "function" then return end
	table.insert(dodgeStatusCallbacks, callback)
end

return dodge