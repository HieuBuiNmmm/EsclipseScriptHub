--==============================================================--
-- Smart Dodge – Module 5: Dodge Execution
-- MoveTo Hybrid + Snap + Time Budget
-- DungeonQuest
--
-- HYBRID:
--   (1) Safe Spot <= Max Snap Distance
--       -> SNAP immediately.
--
--   (2) Safe Spot farther away
--       -> Humanoid:MoveTo() toward target.
--       -> Walk for at most Max Dodge Time.
--       -> When distance <= Max Snap Distance -> SNAP.
--       -> When Time Budget expires -> SNAP remainder.
--
--   (3) Real-time Target Tracking
--       -> currentTargetPos can be updated by Perform().
--       -> MoveTo() is refreshed only when target moves enough.
--
--   (4) Flat Floor Movement
--       -> MoveTo target uses X/Z from Safe Spot.
--       -> Y is kept at the player's current/starting movement height.
--
--   (5) Maintain Snap Height
--       -> Snap keeps the player's original Y when enabled.
--
-- IMPORTANT:
--   WALK no longer directly manipulates CFrame or velocity.
--   Humanoid:MoveTo() is responsible for normal character movement.
--
--==============================================================--

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local targetFacing = require("@routes/DungeonQuest/core/smartDodge/targetFacing")
local RunService = services.RunService

--// References
local player = services.player

--// State
local autoDodgeEnabled = false
local dodgeMode = "HumanoidMove" -- "HumanoidMove" | "Blink" | "MoveTo"

local maxSnapDistance = 1.0
local blinkStep = 1.0 -- Cự ly mỗi nhịp chớp Blink (studs)

local FINAL_ADJUST_DIST = 0.5

local maintainSnapHeight = true

local isDodging = false
local dodgeThread = nil
local activeMoveConn = nil

local currentTargetPos = nil

local dodgeStatusCallbacks = {}

--// MoveTo tuning
--
-- Don't re-issue MoveTo every frame.
-- This prevents constantly resetting the Humanoid's movement target.
local MOVE_TARGET_UPDATE_DISTANCE = 1.5

-- Minimum distance before considering movement finished.
local MOVE_FINISH_DISTANCE = 1.0

-- How often we check the target / danger state.
local MOVE_CHECK_INTERVAL = 0.03

--// Provider trả về vị trí cần quay mặt khi né
--// Ví dụ enemy — do AutoFarm Mode 2 đăng ký.
--// nil = giữ hành vi cũ.
local faceTargetProvider = nil

--// Raycast Parameters cho Blink kiểm tra tường và sàn (Anti-Cheat Protection)
local blinkRayParams = RaycastParams.new()
blinkRayParams.FilterType = Enum.RaycastFilterType.Exclude
blinkRayParams.IgnoreWater = true

local function updateBlinkRayFilter()
	local ignoreList = {}
	for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
		if p.Character then table.insert(ignoreList, p.Character) end
	end
	if workspace:FindFirstChild("RaycastIgnore") then
		table.insert(ignoreList, workspace.RaycastIgnore)
	end
	blinkRayParams.FilterDescendantsInstances = ignoreList
end

--// Runtime do engine bơm:
--// { getInDanger = fn, getLogInDanger = fn }
local runtime = nil

local dodge = {}

--==============================================================--
-- Runtime
--==============================================================--

function dodge.SetRuntime(ctx)
	runtime = ctx or nil
end

local function getInDanger()
	return runtime
		and runtime.getInDanger
		and runtime.getInDanger()
		or false
end

local function getLogInDanger()
	return runtime
		and runtime.getLogInDanger
		and runtime.getLogInDanger()
		or false
end

--==============================================================--
-- Status callbacks
--==============================================================--

local function fireDodgeStatus(status)
	for _, cb in ipairs(dodgeStatusCallbacks) do
		pcall(cb, status)
	end
end

--==============================================================--
-- Face target
--==============================================================--

local function getFaceTarget()
	if faceTargetProvider then
		local ok, pos = pcall(faceTargetProvider)
		if ok and type(pos) == "table" and pos.X and pos.Z then
			return pos
		end
	end

	-- Luôn luôn lấy vị trí mục tiêu nếu có (Bất kể toggle UI bật hay tắt)
	-- Đảm bảo yêu cầu cốt lõi: "Dù đang né thì vẫn phải nhìn vào mục tiêu."
	if targetFacing then
		local tPos = targetFacing.GetTargetPosition()
		if tPos then
			return tPos
		end
	end

	return nil
end

--==============================================================--
-- Helpers
--==============================================================--

local function getCharacterParts()
	local char = player and player.Character

	if not char then
		return nil, nil, nil
	end

	local rootPart = char:FindFirstChild("HumanoidRootPart")
	local humanoid = char:FindFirstChild("Humanoid")

	if not rootPart or not humanoid then
		return char, nil, nil
	end

	return char, rootPart, humanoid
end

-- Flat X/Z distance.
local function flatDistance(a, b)
	if not a or not b then
		return math.huge
	end

	local dx = a.X - b.X
	local dz = a.Z - b.Z

	return math.sqrt(dx * dx + dz * dz)
end

-- Convert arbitrary target into a flat MoveTo position.
--
-- We intentionally do not ask Humanoid to walk toward
-- the Safe Spot's raw Y value.
--
-- This keeps movement primarily horizontal.
local function makeMoveTarget(rootPart, pos)
	if not rootPart or not pos then
		return nil
	end

	return Vector3.new(
		pos.X,
		rootPart.Position.Y,
		pos.Z
	)
end

--==============================================================--
-- Snap
--==============================================================--
--
-- Teleport dứt điểm:
--   - X/Z = Safe Spot
--   - Y = starting player height if maintainSnapHeight
--   - otherwise calculate floor-relative height
--   - face enemy if provider exists
--
local function snapFace(rootPart, humanoid, pos, startHeight)
	if not rootPart or not pos then
		return
	end

	local targetY = startHeight or pos.Y

	if not maintainSnapHeight and humanoid and humanoid.HipHeight and rootPart then
		local rootOffset = humanoid.HipHeight + (rootPart.Size.Y / 2)
		local rayOrigin = Vector3.new(pos.X, (startHeight or rootPart.Position.Y) + 6, pos.Z)
		local rayDir = Vector3.new(0, -20, 0)
		local floorResult = workspace:Raycast(rayOrigin, rayDir, blinkRayParams)
		if floorResult and floorResult.Position then
			targetY = floorResult.Position.Y + rootOffset
		else
			local floorY = pos.Y - 3
			targetY = floorY + rootOffset
		end
	end

	local actualPos = Vector3.new(
		pos.X,
		targetY,
		pos.Z
	)

	local targetPos = getFaceTarget()

	if targetPos then
		rootPart.CFrame = CFrame.lookAt(
			actualPos,
			Vector3.new(
				targetPos.X,
				targetY,
				targetPos.Z
			)
		)
	else
		-- Preserve current facing direction.
		local look = rootPart.CFrame.LookVector

		local flatLook = Vector3.new(
			look.X,
			0,
			look.Z
		)

		if flatLook.Magnitude > 0.001 then
			flatLook = flatLook.Unit

			rootPart.CFrame = CFrame.lookAt(
				actualPos,
				actualPos + flatLook
			)
		else
			rootPart.CFrame = CFrame.new(actualPos)
		end
	end

	-- Only zero residual velocity AFTER snap.
	--
	-- During WALK we deliberately do NOT do this because
	-- Humanoid movement needs the normal character controller.
	rootPart.AssemblyLinearVelocity = Vector3.zero
	rootPart.AssemblyAngularVelocity = Vector3.zero
end

--==============================================================--
-- Face while walking
--==============================================================--
--
-- We do NOT set CFrame here.
--
-- AutoRotate is used so Humanoid movement remains responsible
-- for the character's orientation.
--
-- If an external faceTargetProvider exists, we temporarily
-- disable AutoRotate and rotate using Humanoid:MoveTo() only
-- is not enough to guarantee facing an arbitrary enemy.
--
-- Therefore:
--   - normal mode -> AutoRotate = true
--   - face-target mode -> AutoRotate = false
--     and use a lightweight orientation adjustment.
--
-- IMPORTANT:
-- This is intentionally not done every frame.
--
local function updateWalkFacing(rootPart, humanoid)
	local faceTarget = getFaceTarget()

	if not faceTarget then
		humanoid.AutoRotate = true
		return
	end

	humanoid.AutoRotate = false

	local current = rootPart.Position

	local target = Vector3.new(
		faceTarget.X,
		current.Y,
		faceTarget.Z
	)

	local diff = target - current

	if diff.Magnitude > 0.05 then
		local look = diff.Unit

		-- Rotate only.
		--
		-- This does not change position.
		rootPart.CFrame = CFrame.lookAt(
			current,
			current + look
		)
	end
end

--==============================================================--
-- Perform Dodge
--==============================================================--

function dodge.Perform(safePos, escapeDist)
	-- Bỏ qua né chiêu khi nhân vật đang trong trạng thái bất tử (ForceField hoặc mới hồi sinh)
	if shared.IsInvulnerable and shared.IsInvulnerable() then
		return
	end

	local char, rootPart, humanoid = getCharacterParts()

	if not rootPart
		or not humanoid
		or humanoid.Health <= 0
	then
		return
	end

	if not safePos then
		return
	end

	-- Always update latest target.
	currentTargetPos = safePos

	-- If already dodging, do NOT spawn another thread.
	--
	-- The active thread will pick up currentTargetPos.
	if isDodging then
		return
	end

	dodgeThread = task.spawn(function()
		isDodging = true
		targetFacing.SetDodging(true)

		fireDodgeStatus("Dodging")


		--======================================================--
		-- Initial state
		--======================================================--

		local startHeight = rootPart.Position.Y
		local activeGyro = nil

		local function cleanGyro()
			if activeGyro and activeGyro.Parent then
				pcall(function() activeGyro:Destroy() end)
				activeGyro = nil
			end
			if humanoid and humanoid.Parent then
				local hasEnemy = targetFacing and targetFacing.IsEnabled and targetFacing.IsEnabled() and targetFacing.IsTargetActive and targetFacing.IsTargetActive()
				if hasEnemy then
					humanoid.AutoRotate = false
				else
					humanoid.AutoRotate = true
				end
			end
		end

		local function finish()
			cleanGyro()

			if activeMoveConn then
				pcall(function() activeMoveConn:Disconnect() end)
				activeMoveConn = nil
			end

			if rootPart and rootPart.Parent and dodgeMode ~= "HumanoidMove" then
				rootPart.AssemblyLinearVelocity = Vector3.zero
				rootPart.AssemblyAngularVelocity = Vector3.zero
			end

			if humanoid and humanoid.Parent and dodgeMode == "HumanoidMove" then
				pcall(function()
					humanoid:Move(Vector3.zero, false)
					local root = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
					if root then humanoid:MoveTo(root.Position) end
				end)
			end

			isDodging = false
			targetFacing.SetDodging(false)
			currentTargetPos = nil

			fireDodgeStatus("Safe")
		end

		local ok, err = pcall(function()
			--======================================================--
			-- Initial target
			--======================================================--

			local targetPos = currentTargetPos or safePos
			local currentPos = rootPart.Position

			local totalDist = (Vector3.new(targetPos.X, 0, targetPos.Z) - Vector3.new(currentPos.X, 0, currentPos.Z)).Magnitude

			-- 1. Nếu cự ly tới Safe Spot <= snapDistance -> Snap dứt điểm ngay lập tức (1 bước duy nhất)
			-- Trong chế độ Blink: Không bao giờ snap 1 bước lớn hơn blinkStep để chống giật anticheat sync
			local effectiveSnapDist = (dodgeMode == "Blink") and math.min(maxSnapDistance, blinkStep) or maxSnapDistance
			if totalDist <= effectiveSnapDist and dodgeMode ~= "HumanoidMove" then
				snapFace(
					rootPart,
					humanoid,
					targetPos,
					startHeight
				)

				if getLogInDanger() then
					print(
						("[SmartDodge][Dodge] ⚡ Instant Snap (%.1f studs) to Safe Spot!")
							:format(totalDist)
					)
				end

				return
			end

			if dodgeMode == "HumanoidMove" then
				-- PURE PHYSICAL INPUT WALK (ZERO CFRAME OVERWRITE / ZERO HEIGHT JITTER)
				if getLogInDanger() then
					print(("[SmartDodge][Dodge] 🏃 Humanoid:Move (Pure Physics Walk) (%.1f studs)..."):format(totalDist))
				end

				local startTime = os.clock()
				local MAX_WALK_TIMEOUT = 4.0

				local targetEnemy = getFaceTarget()
				if targetEnemy then
					humanoid.AutoRotate = false
				else
					humanoid.AutoRotate = true
				end

				local moveTarget = Vector3.new(targetPos.X, rootPart.Position.Y, targetPos.Z)
				humanoid:MoveTo(moveTarget)

				if activeMoveConn then
					pcall(function() activeMoveConn:Disconnect() end)
					activeMoveConn = nil
				end

				activeMoveConn = RunService.RenderStepped:Connect(function()
					if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
						if activeMoveConn then activeMoveConn:Disconnect(); activeMoveConn = nil end
						return
					end

					local curTarget = currentTargetPos or safePos
					if not curTarget then return end

					local curDiff = Vector3.new(curTarget.X - rootPart.Position.X, 0, curTarget.Z - rootPart.Position.Z)
					if curDiff.Magnitude > 0.6 then
						humanoid:Move(curDiff.Unit, false)
					else
						humanoid:Move(Vector3.zero, false)
					end

					-- STRAFE FACING: Vừa rảo bước né đòn vừa giữ nguyên góc nhìn dán chặt vào mục tiêu
					if targetFacing and targetFacing.IsEnabled and targetFacing.IsEnabled() then
						local curEnemy = getFaceTarget()
						if curEnemy then
							if humanoid.AutoRotate ~= false then
								humanoid.AutoRotate = false
							end
							local pPos = rootPart.Position
							local diff = Vector3.new(curEnemy.X - pPos.X, 0, curEnemy.Z - pPos.Z)
							if diff.Magnitude > 0.5 then
								local curLook = rootPart.CFrame.LookVector
								local wantLook = diff.Unit
								if curLook:Dot(wantLook) < 0.999 then
									rootPart.CFrame = CFrame.lookAt(pPos, Vector3.new(curEnemy.X, pPos.Y, curEnemy.Z))
								end
							end
						else
							if humanoid.AutoRotate ~= true then
								humanoid.AutoRotate = true
							end
						end
					end
				end)

				while autoDodgeEnabled and (os.clock() - startTime < MAX_WALK_TIMEOUT) do
					if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
						break
					end

					-- Nếu đã an toàn (không còn hiểm họa đè) -> dừng bước
					if not getInDanger() then
						break
					end

					targetPos = currentTargetPos or safePos
					if not targetPos then break end

					currentPos = rootPart.Position
					local diff = Vector3.new(targetPos.X - currentPos.X, 0, targetPos.Z - currentPos.Z)
					local dist = diff.Magnitude

					if dist <= 0.8 then
						break
					end

					humanoid:MoveTo(Vector3.new(targetPos.X, currentPos.Y, targetPos.Z))

					-- Tự động nhảy nếu gặp gờ bậc thang / chướng ngại vật thấp
					local waistOrigin = currentPos + Vector3.new(0, 0.5, 0)
					local waistDir = diff.Unit * 2.0
					local obstacleHit = workspace:Raycast(waistOrigin, waistDir, blinkRayParams)
					if obstacleHit and obstacleHit.Instance and obstacleHit.Instance.CanCollide and obstacleHit.Normal.Y < 0.7 then
						humanoid.Jump = true
					end

					task.wait(0.03)
				end

				finish()
				return
			end

			if dodgeMode == "Blink" then
				-- RAPID CONTINUOUS BLINK (ANTI-CHEAT HARDENED):
				-- 1. blinkStep studs mỗi 0.025s (vận tốc ~112 studs/s chuẩn Dash skill)
				-- 2. Quét raycast vật cản ngang thắt lưng (Anti No-Clip): không blink xuyên tường/cột
				-- 3. Bám sàn động (Dynamic Floor Snapping): tự nâng/hạ chân theo dốc/bậc thang
				-- 4. Triệt tiêu gia tốc vật lý (AssemblyLinearVelocity = 0): chống desync
				local currentStep = blinkStep or 1.0
				local blinkStart = os.clock()
				local MAX_BLINK_TIMEOUT = 2.5 -- Giới hạn an toàn chống kẹt

				updateBlinkRayFilter()

				while autoDodgeEnabled and (os.clock() - blinkStart < MAX_BLINK_TIMEOUT) do
					if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then
						return
					end

					targetPos = currentTargetPos or safePos
					if not targetPos then break end

					currentPos = rootPart.Position
					local diff = Vector3.new(targetPos.X - currentPos.X, 0, targetPos.Z - currentPos.Z)
					local dist = diff.Magnitude

					-- Nếu đã tới cự ly snap hoặc khoảng cách quá ngắn -> Snap dứt điểm (không vượt quá currentStep)
					local snapThreshold = math.min(maxSnapDistance, currentStep)
					if dist <= snapThreshold then
						snapFace(rootPart, humanoid, targetPos, startHeight)
						if getLogInDanger() then
							print(("[SmartDodge][Dodge] ⚡ Rapid Blink reached Safe Spot (%.1f studs) -> SNAP!"):format(dist))
						end
						return
					end

					-- Nếu đã thoát hiểm hoàn toàn (không còn dính hazard) và cự ly còn lại nhỏ (<= currentStep) -> Snap và dừng
					if not getInDanger() and dist <= currentStep then
						snapFace(rootPart, humanoid, targetPos, startHeight)
						return
					end

					local stepDist = math.min(currentStep, dist)
					local stepDir = diff.Unit

					-- KIỂM TRA RAYCAST VẬT CẢN (ANTI NO-CLIP RUBBERBAND):
					-- Quét tia ngang ở tầm thắt lưng (Y + 1.5) để phát hiện tường / cột cản
					local waistOrigin = currentPos + Vector3.new(0, 1.5, 0)
					local waistDir = stepDir * (stepDist + 0.4)
					local wallHit = workspace:Raycast(waistOrigin, waistDir, blinkRayParams)

					if wallHit and wallHit.Instance and wallHit.Instance.CanCollide and wallHit.Normal.Y <= 0.65 then
						local hitDist = (wallHit.Position - waistOrigin).Magnitude
						if hitDist <= 0.7 then
							-- Đã sát tường cản, không thể tiến thêm về hướng này
							break
						else
							stepDist = math.max(0, hitDist - 0.4)
						end
					end

					local stepPos = currentPos + stepDir * stepDist
					snapFace(rootPart, humanoid, stepPos, startHeight)

					task.wait(0.025)
				end

				-- Final check sau khi thoát loop Blink: Chỉ snap nếu cự ly còn lại <= currentStep
				if rootPart.Parent and humanoid.Parent and humanoid.Health > 0 then
					targetPos = currentTargetPos or safePos
					if targetPos then
						local remainingDiff = Vector3.new(targetPos.X - rootPart.Position.X, 0, targetPos.Z - rootPart.Position.Z)
						if remainingDiff.Magnitude <= math.min(maxSnapDistance, currentStep) then
							snapFace(rootPart, humanoid, targetPos, startHeight)
						end
					end
				end
				return
			end

			-- MoveTo Walk Mode (chỉ dùng khi mode == "MoveTo")
			if getLogInDanger() then
				print(
					("[SmartDodge][Dodge] 🚶 MoveTo Walk (%.1f studs)...")
						:format(totalDist)
				)
			end

			-- DÙNG BODYGYRO ĐỂ XOAY MẶT VỀ BOSS MÀ KHÔNG LÀM ĐỨNG YÊN NHÂN VẬT
			local targetEnemy = getFaceTarget()
			if targetEnemy then
				humanoid.AutoRotate = false
				pcall(function()
					local g = Instance.new("BodyGyro")
					g.Name = "SmartDodge_FacingGyro"
					g.MaxTorque = Vector3.new(0, 400000, 0)
					g.P = 25000
					g.D = 500
					local pPos = rootPart.Position
					g.CFrame = CFrame.lookAt(pPos, Vector3.new(targetEnemy.X, pPos.Y, targetEnemy.Z))
					g.Parent = rootPart
					activeGyro = g
				end)
			else
				humanoid.AutoRotate = true
			end

			local startTime = os.clock()
			local MAX_SAFETY_TIMEOUT = 10.0 -- Giới hạn an toàn chống kẹt vĩnh viễn nếu bị tường cản

			--======================================================--
			-- WALK LOOP: Humanoid:MoveTo di chuyển tự nhiên đến khi an toàn hoặc tới Safe Spot
			--======================================================--

			while autoDodgeEnabled and (os.clock() - startTime < MAX_SAFETY_TIMEOUT) do
				if not rootPart.Parent
					or not humanoid.Parent
					or humanoid.Health <= 0
				then
					break
				end

				-- Nếu đã an toàn (không còn hiểm họa đè) -> dừng bước
				if not getInDanger() then
					break
				end

				targetPos = currentTargetPos or safePos
				if not targetPos then
					break
				end

				currentPos = rootPart.Position

				local distRemaining = flatDistance(
					currentPos,
					targetPos
				)

				if distRemaining <= maxSnapDistance then
					snapFace(
						rootPart,
						humanoid,
						targetPos,
						startHeight
					)

					if getLogInDanger() then
						print(
							("[SmartDodge][Dodge] 🎯 Reached snap range (%.2f studs) -> SNAP")
								:format(distRemaining)
						)
					end

					break
				end

				-- Cập nhật góc quay của Gyro nếu Boss dịch chuyển
				if activeGyro and activeGyro.Parent then
					local enemyPos = getFaceTarget()
					if enemyPos then
						activeGyro.CFrame = CFrame.lookAt(currentPos, Vector3.new(enemyPos.X, currentPos.Y, enemyPos.Z))
					end
				end

				local moveTarget = makeMoveTarget(
					rootPart,
					targetPos
				)

				-- Phát MoveTo để Humanoid tự động bước đi
				humanoid:MoveTo(moveTarget)

				task.wait(0.05)
			end

			cleanGyro()

			--======================================================--
			-- (3) Final decision after WALK
			--======================================================--

			if not rootPart.Parent
				or not humanoid.Parent
				or humanoid.Health <= 0
			then
				return
			end

			targetPos = currentTargetPos or safePos
			if not targetPos then return end

			local remainingDist = flatDistance(
				rootPart.Position,
				targetPos
			)

			if remainingDist <= maxSnapDistance then
				snapFace(
					rootPart,
					humanoid,
					targetPos,
					startHeight
				)

				if getLogInDanger() then
					print(
						("[SmartDodge][Dodge] ⚡ Final snap from %.2f studs.")
							:format(remainingDist)
					)
				end
			end
		end)

		if not ok then
			warn("[SmartDodge][Dodge] Error during dodge execution: " .. tostring(err))
		end

		finish()
	end)
end

--==============================================================--
-- Cancel
--==============================================================--

function dodge.Cancel()
	if dodgeThread then
		task.cancel(dodgeThread)
		dodgeThread = nil
	end

	local char, rootPart, humanoid = getCharacterParts()

	if humanoid then
		pcall(function()
			humanoid:Move(Vector3.zero, false)
		end)
		local hasEnemy = targetFacing and targetFacing.IsEnabled and targetFacing.IsEnabled() and targetFacing.IsTargetActive and targetFacing.IsTargetActive()
		if hasEnemy then
			humanoid.AutoRotate = false
		else
			humanoid.AutoRotate = true
		end
	end

	if rootPart and rootPart.Parent and dodgeMode ~= "HumanoidMove" then
		rootPart.AssemblyLinearVelocity = Vector3.zero
		rootPart.AssemblyAngularVelocity = Vector3.zero
	end

	isDodging = false
	targetFacing.SetDodging(false)
	currentTargetPos = nil
end

--==============================================================--
-- Status
--==============================================================--

function dodge.FireStatus(status)
	fireDodgeStatus(status)
end

--==============================================================--
-- Auto Dodge
--==============================================================--

function dodge.SetAutoDodge(state)
	autoDodgeEnabled = state and true or false
end

function dodge.IsAutoDodgeEnabled()
	return autoDodgeEnabled
end

--==============================================================--
-- Dodge Movement Mode ("MoveTo" | "Blink")
--==============================================================--

function dodge.SetDodgeMode(mode)
	if mode == "MoveTo" or mode == "Blink" or mode == "HumanoidMove" then
		dodgeMode = mode
	end
end

function dodge.GetDodgeMode()
	return dodgeMode
end

--==============================================================--
-- Max Snap Distance
--==============================================================--

function dodge.SetMaxSnapDistance(value)
	if type(value) == "number"
		and value > 0
	then
		maxSnapDistance = value
	end
end

function dodge.GetMaxSnapDistance()
	return maxSnapDistance
end

--==============================================================--
-- Backward compatibility
--==============================================================--

dodge.SetMaxTeleportStep = dodge.SetMaxSnapDistance
dodge.GetMaxTeleportStep = dodge.GetMaxSnapDistance

--==============================================================--
-- Blink Step Distance
--==============================================================--

function dodge.SetBlinkStep(value)
	if type(value) == "number" and value > 0 then
		blinkStep = value
	end
end

function dodge.GetBlinkStep()
	return blinkStep
end

--==============================================================--
-- Maintain Snap Height
--==============================================================--

function dodge.SetMaintainSnapHeight(state)
	maintainSnapHeight = state and true or false
end

function dodge.IsMaintainSnapHeightEnabled()
	return maintainSnapHeight
end

--==============================================================--
-- State
--==============================================================--

function dodge.IsDodging()
	return isDodging
end

--==============================================================--
-- Face Target Provider
--==============================================================--

function dodge.SetFaceTargetProvider(func)
	faceTargetProvider =
		type(func) == "function"
		and func
		or nil
end

--==============================================================--
-- Status Getter
--==============================================================--

function dodge.GetStatus()
	if isDodging then
		return "Dodging"
	elseif shared.IsInvulnerable and shared.IsInvulnerable() and getInDanger() then
		return "🛡️ Paused (Invulnerable)"
	elseif getInDanger() then
		return "Safe (Standing in Spot)"
	else
		return "Idle"
	end
end

--==============================================================--
-- Status Callback
--==============================================================--

function dodge.OnDodgeStatusChanged(callback)
	if type(callback) ~= "function" then
		return
	end

	table.insert(
		dodgeStatusCallbacks,
		callback
	)
end

--==============================================================--
-- Return
--==============================================================--

return dodge