-- HazardScannerV2 - Bonus Boss Memory Game (Simon Says) Watcher
-- Tự động theo dõi, ghi nhớ chuỗi gợi ý (Left/Right) và hiển thị vùng an toàn thời gian thực.

--// Imports
local Workspace = game:GetService("Workspace")
local filter = require("@routes/DungeonQuest/core/hazardScannerV2/filter")

--// Table
local memoryWatcher = {}

--// State
local isModelActive = false
local recordedSequence = {} -- Array of strings: "LEFT" or "RIGHT"
local currentStep = 0
local phase = "IDLE" -- "IDLE" | "HINT" | "EXECUTION"
local lastActiveSide = nil
local lastPulseTime = 0
local modelSpawnTime = 0
local currentAttackSide = nil
local currentSafeSide = nil

-- Debounce timer giữa các nhịp flash
local FLASH_DEBOUNCE_SEC = 0.25

-- Helper kiểm tra part có đang active không
local function isPartActive(part)
	if not part or not part:IsA("BasePart") or not part:IsDescendantOf(Workspace) then
		return false
	end
	if part.Transparency <= 0.85 then
		return true
	end
	local emitter = part:FindFirstChildWhichIsA("ParticleEmitter")
	if emitter and emitter.Enabled then
		return true
	end
	return false
end

-- Tìm Model bonusBossMemoryModel trong Workspace
local function findMemoryModel()
	for _, child in ipairs(Workspace:GetChildren()) do
		if filter.IsMemoryModel(child) and child:IsA("Model") then
			return child
		end
	end
	return nil
end

-- Reset toàn bộ trạng thái
function memoryWatcher.Reset()
	isModelActive = false
	table.clear(recordedSequence)
	currentStep = 0
	phase = "IDLE"
	lastActiveSide = nil
	lastPulseTime = 0
	modelSpawnTime = 0
	currentAttackSide = nil
	currentSafeSide = nil
end

-- Cập nhật trạng thái theo từng nhịp Heartbeat
function memoryWatcher.Update(now)
	local model = findMemoryModel()
	if not model then
		if isModelActive then
			memoryWatcher.Reset()
		end
		return
	end

	if not isModelActive then
		isModelActive = true
		modelSpawnTime = now
		table.clear(recordedSequence)
		currentStep = 0
		phase = "HINT"
	end

	-- Lấy các part đại diện cho 2 bên
	local leftPrecast = model:FindFirstChild("leftPrecast")
	local rightPrecast = model:FindFirstChild("rightPrecast")
	local leftHitbox = model:FindFirstChild("leftHitbox")
	local rightHitbox = model:FindFirstChild("rightHitbox")
	local leftGood = model:FindFirstChild("leftPrecastGood")
	local rightGood = model:FindFirstChild("rightPrecastGood")

	local isLeftPrecastActive = isPartActive(leftPrecast) or isPartActive(leftGood)
	local isRightPrecastActive = isPartActive(rightPrecast) or isPartActive(rightGood)
	local isLeftHitboxActive = isPartActive(leftHitbox)
	local isRightHitboxActive = isPartActive(rightHitbox)

	-- 1. Kiểm tra xem có đang trong Giai đoạn Xả đòn thật (Execution Phase) không
	local isHitboxActive = isLeftHitboxActive or isRightHitboxActive

	if isHitboxActive and phase ~= "EXECUTION" then
		phase = "EXECUTION"
		currentStep = 1
		lastActiveSide = nil
		lastPulseTime = 0
	end

	if phase == "HINT" then
		-- Giai đoạn 1: Ghi nhận chuỗi Flash gợi ý (Safe Side sequence)
		local activeSide = nil
		if isLeftPrecastActive and not isRightPrecastActive then
			activeSide = "LEFT"
		elseif isRightPrecastActive and not isLeftPrecastActive then
			activeSide = "RIGHT"
		end

		if activeSide and activeSide ~= lastActiveSide and (now - lastPulseTime > FLASH_DEBOUNCE_SEC) then
			table.insert(recordedSequence, activeSide)
			lastActiveSide = activeSide
			lastPulseTime = now
		elseif not activeSide and lastActiveSide and (now - lastPulseTime > FLASH_DEBOUNCE_SEC) then
			-- Kết thúc nhịp flash hiện tại
			lastActiveSide = nil
		end
	elseif phase == "EXECUTION" then
		-- Giai đoạn 2: Đang xả đòn thật theo chuỗi
		local activeAttack = nil
		if isLeftHitboxActive then
			activeAttack = "LEFT"
		elseif isRightHitboxActive then
			activeAttack = "RIGHT"
		end

		currentAttackSide = activeAttack

		-- Tính toán Safe Side:
		-- Ưu tiên 1: Dựa trên Hitbox thực tế đang xuất hiện (Ngược lại với Hitbox)
		-- Ưu tiên 2 (Pre-emptive): Dựa trên chuỗi đã ghi nhớ ở Phase 1 theo currentStep
		if activeAttack == "LEFT" then
			currentSafeSide = "RIGHT"
		elseif activeAttack == "RIGHT" then
			currentSafeSide = "LEFT"
		else
			-- Khi đòn đánh chưa chạm hoặc giữa 2 nhịp đòn: dự đoán trước vị trí an toàn từ bộ nhớ
			local stepIdx = math.clamp(currentStep, 1, math.max(1, #recordedSequence))
			currentSafeSide = recordedSequence[stepIdx] or nil
		end

		-- Đếm bước hiện tại dựa trên số nhịp đòn hitbox xuất hiện
		if activeAttack and activeAttack ~= lastActiveSide and (now - lastPulseTime > FLASH_DEBOUNCE_SEC) then
			lastActiveSide = activeAttack
			lastPulseTime = now
		elseif not activeAttack and lastActiveSide and (now - lastPulseTime > FLASH_DEBOUNCE_SEC) then
			-- Vừa kết thúc 1 nhịp đánh -> Chuyển sang bước kế tiếp
			currentStep = math.min(#recordedSequence, currentStep + 1)
			lastActiveSide = nil
		end
	end
end

-- Trích xuất dữ liệu Telemetry gửi lên Web Live Radar
function memoryWatcher.GetMemoryTelemetry()
	if not isModelActive and #recordedSequence == 0 then
		return nil
	end

	local hintText = "Waiting..."
	if phase == "HINT" then
		hintText = string.format("🧠 Phase 1: Recorded %d steps", #recordedSequence)
	elseif phase == "EXECUTION" then
		local step = math.clamp(currentStep, 1, math.max(1, #recordedSequence))
		local total = math.max(1, #recordedSequence)
		if currentSafeSide then
			local expectedDanger = (currentSafeSide == "LEFT") and "RIGHT" or "LEFT"
			hintText = string.format("🟢 SAFE: %s | 🔴 DANGER: %s (Step %d/%d)", currentSafeSide, expectedDanger, step, total)
		else
			hintText = string.format("⚡ Preparing Strike (Step %d/%d)", step, total)
		end
	end

	return {
		active = isModelActive,
		phase = phase,
		sequence = recordedSequence,
		currentStep = math.clamp(currentStep, 1, math.max(1, #recordedSequence)),
		totalSteps = #recordedSequence,
		currentAttackSide = currentAttackSide,
		safeSide = currentSafeSide,
		hintText = hintText,
	}
end

return memoryWatcher
