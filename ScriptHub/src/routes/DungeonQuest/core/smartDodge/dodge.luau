-- Smart Dodge – Module 5: Dodge Execution (Walk + Snap) (DungeonQuest).
-- Chuyên trách: di chuyển nhân vật tới Safe Spot với cơ chế Walk + Snap duy nhất,
-- luôn-facing target qua provider (faceTargetProvider), settings AutoDodge/MaxSnap.
-- Trạng thái "đang nguy hiểm" + cờ log do module Engine cung cấp qua SetRuntime (tránh vòng require).

--// Imports
local services = require("@routes/DungeonQuest/core/services")

--// References
local player = services.player

--// State
local autoDodgeEnabled = false
local maxTeleportStep = 3.0          -- Cự ly Snap dứt điểm cuối cùng tối đa (studs)
local isDodging = false
local dodgeThread = nil
local dodgeStatusCallbacks = {}
--// Provider trả về vị trí cần quay mặt khi né (ví dụ enemy — do AutoFarm Mode 2 đăng ký).
--// nil = giữ hành vi cũ (face theo hướng di chuyển/safe spot). Giúp "luôn facing target"
--// cả trong lúc đi bộ né (xoay mặt enemy giữa các bước MoveTo).
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

--// Snap rotation khi teleport dứt điểm: face provider target nếu có, không thì giữ LookVector cũ.
local function snapFace(rootPart, pos)
	local targetPos = getFaceTarget()
	if targetPos then
		rootPart.CFrame = CFrame.new(pos, Vector3.new(targetPos.X, pos.Y, targetPos.Z))
	else
		rootPart.CFrame = CFrame.new(pos, pos + rootPart.CFrame.LookVector)
	end
end

--// Thực thi né sang Safe Spot bằng cơ chế Walk + Snap (duy nhất): MoveTo đi bộ theo navmesh,
--// khi tới cự ly maxTeleportStep cuối cùng thì Snap dứt điểm. Không còn blink/micro-teleport —
--// nhân vật không quay mặt theo hướng nhảy, giảm ồn anti-cheat.
function dodge.Perform(safePos, escapeDist)
	local char = player and player.Character
	local rootPart = char and char:FindFirstChild("HumanoidRootPart")
	local humanoid = char and char:FindFirstChild("Humanoid")
	if not rootPart or not humanoid or humanoid.Health <= 0 then return end

	if isDodging then return end

	dodgeThread = task.spawn(function()
		isDodging = true
		fireDodgeStatus("Dodging")

		--// Luôn-facing target khi có provider: tắt AutoRotate để MoveTo không quay nhân vật theo
		--// hướng đi; tự xoay mặt target giữa các bước. Khôi phục AutoRotate khi kết thúc.
		local prevAutoRotate = humanoid.AutoRotate
		local faceEnemy = faceTargetProvider ~= nil
		if faceEnemy then humanoid.AutoRotate = false end
		local function finish()
			if faceEnemy then humanoid.AutoRotate = prevAutoRotate end
			isDodging = false
			fireDodgeStatus("Safe")
		end

		local currentPos = rootPart.Position
		local totalDist = (safePos - currentPos).Magnitude

		-- Trường hợp 1: Khoảng cách ngắn (<= maxTeleportStep, ví dụ <= 3.0 studs) -> Snap dứt điểm 1 nhịp
		if totalDist <= maxTeleportStep then
			snapFace(rootPart, safePos)
			if getLogInDanger() then
				print(("[SmartDodge][Dodge] ⚡ Instant Snap (%.1f studs) to Safe Spot!"):format(totalDist))
			end
			finish()
			return
		end

		-- Walk + Snap (duy nhất): đi bộ theo navmesh tới Safe Spot, snap khi tới cự ly cuối.
		if getLogInDanger() then
			print(("[SmartDodge][Dodge] 🚶 Walk + Final Snap (%.1f studs) to Safe Spot..."):format(totalDist))
		end

		local startTime = os.clock()
		local timeout = 2.5

		while getInDanger() and autoDodgeEnabled and (os.clock() - startTime < timeout) do
			if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then break end
			currentPos = rootPart.Position
			local distRemaining = (safePos - currentPos).Magnitude

			-- Đã tới cự ly snap cuối cùng (còn ≤ maxTeleportStep) -> snap + MoveTo tới đích
			if distRemaining <= maxTeleportStep then
				snapFace(rootPart, safePos)
				humanoid:MoveTo(safePos)
				break
			end

			--// Face target giữa các bước đi (MoveTo dịch chuyển, ta chỉ xoay hướng, giữ vị trí).
			local targetPos = getFaceTarget()
			if targetPos then
				rootPart.CFrame = CFrame.lookAt(rootPart.Position, Vector3.new(targetPos.X, rootPart.Position.Y, targetPos.Z))
			end
			humanoid:MoveTo(safePos)
			task.wait(0.05)
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

function dodge.SetMaxTeleportStep(step)
	if type(step) == "number" and step > 0 then
		maxTeleportStep = step
	end
end

function dodge.GetMaxTeleportStep()
	return maxTeleportStep
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