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
local targetFacing = require("@routes/DungeonQuest/core/smartDodge/targetFacing")


--// References
local player = services.player

--// State
local autoDodgeEnabled = false
local dodgeMode = "Blink" -- "Blink" | "MoveTo" (Mặc định Blink để ép di chuyển mượt mà không bị phím đè)

local maxDodgeTime = 1.0
local maxSnapDistance = 3.0

local FINAL_ADJUST_DIST = 0.5

local maintainSnapHeight = true

local isDodging = false
local dodgeThread = nil

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

	-- Lấy vị trí mục tiêu hiện tại từ targetFacing
	if targetFacing and targetFacing.IsEnabled() then
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

	if not maintainSnapHeight
		and humanoid
		and humanoid.HipHeight
	then
		local rootOffset =
			humanoid.HipHeight
			+ (rootPart.Size.Y / 2)

		-- geometry.GetFloorPosition() contract:
		-- pos.Y = floorY + 3
		local floorY = pos.Y - 3

		targetY = floorY + rootOffset
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

		-- Log tốc độ người chơi khi bắt đầu né (WalkSpeed và vận tốc vật lý thực tế)
		local curWalkSpeed = humanoid and humanoid.WalkSpeed or 0
		local curVel = rootPart and rootPart.AssemblyLinearVelocity or Vector3.zero
		local horizSpeed = math.sqrt(curVel.X * curVel.X + curVel.Z * curVel.Z)
		print(("[SmartDodge][SpeedLog] 🏃 Bắt đầu né (%s) | WalkSpeed: %.1f studs/s | Vận tốc vật lý: %.1f studs/s (3D: %.1f) | Cự ly thoát: %.1f studs")
			:format(dodgeMode, curWalkSpeed, horizSpeed, curVel.Magnitude, escapeDist or 0))

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
				humanoid.AutoRotate = not targetFacing.IsEnabled()
			end
		end

		local function finish()
			cleanGyro()

			if rootPart and rootPart.Parent then
				rootPart.AssemblyLinearVelocity = Vector3.zero
				rootPart.AssemblyAngularVelocity = Vector3.zero
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

			local totalDist = flatDistance(
				currentPos,
				targetPos
			)

			--======================================================--
			-- (1) Already close enough -> SNAP
			--======================================================--

			if totalDist <= maxSnapDistance then
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

			--======================================================--
			-- (2) MOVEMENT: Blink (Instant Snap) OR MoveTo (Walk + Gyro)
			--======================================================--

			if dodgeMode == "Blink" then
				-- Blink: Lướt / Snap tức thì tới Safe Spot (Không bị kẹt vật lý)
				snapFace(
					rootPart,
					humanoid,
					targetPos,
					startHeight
				)

				if getLogInDanger() then
					print(
						("[SmartDodge][Dodge] ⚡ Blink Dash (%.1f studs) to Safe Spot!")
							:format(totalDist)
					)
				end

				return
			else
				-- MoveTo Walk Mode
				if getLogInDanger() then
					print(
						("[SmartDodge][Dodge] 🚶 MoveTo Walk (%.1f studs, budget %.2fs)...")
							:format(totalDist, maxDodgeTime)
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

				--======================================================--
				-- WALK LOOP: Humanoid:MoveTo di chuyển tự nhiên
				--======================================================--

				while autoDodgeEnabled
					and (os.clock() - startTime < maxDodgeTime)
				do
					if not rootPart.Parent
						or not humanoid.Parent
						or humanoid.Health <= 0
					then
						break
					end

					targetPos = currentTargetPos or safePos
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
			end

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

			local remainingDist = flatDistance(
				rootPart.Position,
				targetPos
			)

			if remainingDist <= maxSnapDistance or remainingDist > FINAL_ADJUST_DIST then
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
		humanoid.AutoRotate = true
	end

	if rootPart and rootPart.Parent then
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
	if mode == "MoveTo" or mode == "Blink" then
		dodgeMode = mode
	end
end

function dodge.GetDodgeMode()
	return dodgeMode
end

--==============================================================--
-- Max Dodge Time
--==============================================================--

function dodge.SetMaxDodgeTime(seconds)
	if type(seconds) == "number"
		and seconds > 0
	then
		maxDodgeTime = seconds
	end
end

function dodge.GetMaxDodgeTime()
	return maxDodgeTime
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