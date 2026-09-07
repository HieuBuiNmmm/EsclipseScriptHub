-- Smart Dodge – Module phu: Boss Facing Manager (DungeonQuest)
-- Chuyen trach: Tu dong dinh vi Boss trong Dungeon va dieu khien nhan vat luon quay mat ve phia Boss.
-- Giup nguoi choi de dang ngam ban skill va ep huong ne luon LUI ra xa Boss.

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

--// References
local player = services.player

--// State
local enabled = false
local facingThread = nil
local isDodging = false

--// Cache trạng thái Boss để tránh quét toàn bộ enemy & UI hàng chục lần/giây
local cachedBossData = nil
local lastBossScanTime = 0
local BOSS_SCAN_INTERVAL = 0.5

local cachedBossGui = false
local lastBossGuiCheckTime = 0
local BOSS_GUI_CHECK_INTERVAL = 2.0

local bossFacing = {}

function bossFacing.SetDodging(state)
	isDodging = state and true or false
end

local BOSS_KEYWORDS = {
	"boss", "king", "queen", "lord", "overlord", "captain", "general",
	"pharaoh", "guardian", "titan", "dragon", "demon", "knight", "emperor",
	"master", "giant", "behemoth", "baron", "commander", "void", "monarch", "anubis"
}

--// Kiểm tra PlayerGui xem có GUI báo Boss xuất hiện hay không (Throttled 2s + Không quét đệ quy sâu)
local function isBossGuiPresent()
	local now = os.clock()
	if (now - lastBossGuiCheckTime) < BOSS_GUI_CHECK_INTERVAL then
		return cachedBossGui
	end
	lastBossGuiCheckTime = now
	cachedBossGui = false

	if not player then return false end
	local pGui = player:FindFirstChild("PlayerGui")
	if not pGui then return false end

	for _, gui in ipairs(pGui:GetChildren()) do
		local nameLower = gui.Name:lower()
		if nameLower:find("boss") then
			if (gui:IsA("ScreenGui") and gui.Enabled) or (gui:IsA("GuiObject") and gui.Visible) then
				cachedBossGui = true
				return true
			end
		end

		-- Chỉ kiểm tra cấp con trực tiếp, tuyệt đối không đệ quy true sâu toàn bộ cây UI
		local h = gui:FindFirstChild("bossHealth") or gui:FindFirstChild("BossHealth")
			or gui:FindFirstChild("bossBar") or gui:FindFirstChild("BossBar")
		if h and ((h:IsA("ScreenGui") and h.Enabled) or (h:IsA("GuiObject") and h.Visible)) then
			cachedBossGui = true
			return true
		end
	end

	return false
end

--// Tìm kiếm Boss đang hoạt động trong dungeon (Có bộ đệm Cache 0.5s)
local function getActiveBossData()
	local now = os.clock()

	-- Nếu Boss đã cache vẫn còn tồn tại và còn sống -> Trả về ngay lập tức trong 0.001ms
	if cachedBossData
		and cachedBossData.Root
		and cachedBossData.Root.Parent
		and cachedBossData.Humanoid
		and cachedBossData.Humanoid.Health > 0
	then
		if (now - lastBossScanTime) < BOSS_SCAN_INTERVAL then
			return cachedBossData
		end
	end

	lastBossScanTime = now
	local tracked = shared.GetTrackedEnemyData()
	if not tracked or #tracked == 0 then
		cachedBossData = nil
		return nil
	end

	local bestBoss = nil
	local highestHealth = 0
	local secondHighestHealth = 0

	for _, data in ipairs(tracked) do
		if data and data.Root and data.Root.Parent and data.Humanoid and data.Humanoid.Health > 0 then
			local modelName = (data.Model and data.Model.Name or ""):lower()
			local roomName = (data.Room and data.Room.Name or ""):lower()

			-- 1. Nhận diện trực tiếp qua từ khóa Boss
			for _, kw in ipairs(BOSS_KEYWORDS) do
				if modelName:find(kw) or roomName:find(kw) then
					cachedBossData = data
					return data
				end
			end

			local maxHp = data.Humanoid.MaxHealth or 0
			if maxHp > highestHealth then
				secondHighestHealth = highestHealth
				highestHealth = maxHp
				bestBoss = data
			elseif maxHp > secondHighestHealth then
				secondHighestHealth = maxHp
			end
		end
	end

	-- 2. Khi hệ thống xác nhận đang ở Boss Room
	local isBossRoom = shared.IsBossActive()
		or (shared.GetCurrentBossIndex and shared.GetCurrentBossIndex() > 0)
		or isBossGuiPresent()
		or #tracked == 1

	if isBossRoom and bestBoss then
		cachedBossData = bestBoss
		return bestBoss
	end

	-- 3. Dựa trên sự chênh lệch máu vượt trội
	if bestBoss and (highestHealth >= 2.0 * secondHighestHealth or highestHealth >= 15000 or #tracked <= 3) then
		cachedBossData = bestBoss
		return bestBoss
	end

	-- 4. Fallback
	cachedBossData = bestBoss
	return bestBoss
end

--// Lấy vị trí Vector3 của Boss hiện tại (nếu có)
function bossFacing.GetBossPosition()
	local bossData = getActiveBossData()
	if bossData and bossData.Root and bossData.Root.Parent then
		return bossData.Root.Position
	end
	return nil
end

--// Kiểm tra xem hiện có Boss đang hoạt động hay không
function bossFacing.IsBossActive()
	return getActiveBossData() ~= nil
end

--// Vòng lặp xoay mặt về Boss (Chỉ xoay khi góc lệch đáng kể, tránh spam CFrame liên tục)
local function startFacingLoop()
	if facingThread then return end
	facingThread = task.spawn(function()
		while enabled and lifecycle.IsActive() do
			if not isDodging then
				local bossPos = bossFacing.GetBossPosition()
				if bossPos then
					local char = player and player.Character
					local rootPart = char and char:FindFirstChild("HumanoidRootPart")
					local humanoid = char and char:FindFirstChild("Humanoid")

					if rootPart and rootPart.Parent and humanoid and humanoid.Health > 0 then
						local pPos = rootPart.Position
						local target = Vector3.new(bossPos.X, pPos.Y, bossPos.Z)
						local diff = target - pPos

						if diff.Magnitude > 1.0 then
							local curLook = rootPart.CFrame.LookVector
							local wantLook = Vector3.new(diff.X, 0, diff.Z).Unit
							-- Chỉ chỉnh CFrame nếu góc lệch > ~6 độ (dot < 0.995) để tránh spam physics
							if curLook:Dot(wantLook) < 0.995 then
								rootPart.CFrame = CFrame.lookAt(pPos, target)
							end
						end
					end
				end
			end
			task.wait(0.05)
		end
		facingThread = nil
	end)
end

local function stopFacingLoop()
	if facingThread then
		task.cancel(facingThread)
		facingThread = nil
	end
end

--// Bat / tat tinh nang Auto Face Boss
function bossFacing.SetEnabled(state)
	enabled = state and true or false
	if enabled then
		startFacingLoop()
	else
		stopFacingLoop()
	end
end

function bossFacing.IsEnabled()
	return enabled
end

--// Tu dong don dep khi script shutdown
lifecycle.Register(function()
	stopFacingLoop()
end)

return bossFacing
