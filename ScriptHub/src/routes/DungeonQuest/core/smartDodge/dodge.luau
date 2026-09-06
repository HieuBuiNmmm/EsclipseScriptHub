-- Smart Dodge – Module 5: Dodge Execution (Walk + Snap) (DungeonQuest).
-- Chuyên trách: di chuyển nhân vật tới Safe Spot theo Ngân sách Thời gian (Max Dodge Time).
-- Nguyên tắc: WALK TỐI ĐA để thu hẹp cự ly snap — snap xa sẽ bị anti-cheat kéo về. Snap chỉ là
-- cứu cánh cuối: (1) micro-snap ≤0.5 stud để căn chỉnh dừng chính xác, (2) hết ngân sách thời gian
-- mà chưa tới thì snap nốt phần còn lại (đã được walk thu nhỏ). Luôn-facing target qua provider.

--// Imports
local services = require("@routes/DungeonQuest/core/services")

--// References
local player = services.player

--// State
local autoDodgeEnabled = false
local maxDodgeTime = 1.0              -- Ngân sách thời gian tối đa để né 1 đối tượng (s)
local FINAL_ADJUST_DIST = 0.5         -- Cự ly micro-snap cuối để căn chỉnh dừng đúng Safe Spot
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

--// Thực thi né sang Safe Spot theo Ngân sách Thời gian (Max Dodge Time).
--// Ưu tiên WALK tối đa để thu hẹp cự ly snap (snap xa bị anti-cheat kéo về). Snap chỉ là
--// phao cứu sinh cuối: (1) micro-snap ≤ FINAL_ADJUST_DIST để đặt dừng chính xác, (2) hết ngân
--// sách thời gian mà chưa tới thì snap nốt phần còn lại (đã được walk thu nhỏ).
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

		--// Đã đứng sát Safe Spot: micro-snap căn chỉnh là đủ, không cần di chuyển.
		if (safePos - rootPart.Position).Magnitude <= FINAL_ADJUST_DIST then
			snapFace(rootPart, safePos)
			if getLogInDanger() then
				print("[SmartDodge][Dodge] ⚡ Current spot already safe, micro-snap adjusted.")
			end
			finish()
			return
		end

		if getLogInDanger() then
			print(("[SmartDodge][Dodge] 🚶 Walking to Safe Spot (budget %.2fs)..."):format(maxDodgeTime))
		end

		local startTime = os.clock()

		--// Walk tối đa trong ngân sách thời gian để thu hẹp cự ly snap.
		while getInDanger() and autoDodgeEnabled and (os.clock() - startTime < maxDodgeTime) do
			if not rootPart.Parent or not humanoid.Parent or humanoid.Health <= 0 then break end

			--// Đã tới gần đích: snap căn chỉnh dừng chính xác rồi kết thúc.
			if (safePos - rootPart.Position).Magnitude <= FINAL_ADJUST_DIST then
				snapFace(rootPart, safePos)
				humanoid:MoveTo(safePos)
				break
			end

			--// Walk: face target giữa các bước (MoveTo dịch chuyển, ta chỉ xoay hướng).
			local targetPos = getFaceTarget()
			if targetPos then
				rootPart.CFrame = CFrame.lookAt(rootPart.Position, Vector3.new(targetPos.X, rootPart.Position.Y, targetPos.Z))
			end
			humanoid:MoveTo(safePos)
			task.wait(0.05)
		end

		--// Hết ngân sách thời gian mà chưa tới: snap nốt phần còn lại (đã được walk thu nhỏ tối đa).
		if (os.clock() - startTime) >= maxDodgeTime
			and (safePos - rootPart.Position).Magnitude > FINAL_ADJUST_DIST then
			snapFace(rootPart, safePos)
			if getLogInDanger() then
				print("[SmartDodge][Dodge] ⚡ Budget end — snapped the remainder to Safe Spot.")
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