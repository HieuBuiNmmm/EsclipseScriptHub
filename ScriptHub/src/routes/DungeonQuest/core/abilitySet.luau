-- Ability Set Manager (DungeonQuest)
-- Tự động chuyển đổi qua lại giữa 2 bộ Loadout (Set 1 / Set 2) theo vai trò chiến đấu:
--   - Khi di chuyển / diệt quái thường (Mob Rooms / Path Record): Đổi sang Set Quái (mặc định Set 2: Full Damage)
--   - Khi chiến đấu với Boss (Boss Room / Smart Auto Play): Đổi sang Set Boss (mặc định Set 1: Buff + Damage)
-- Sử dụng remote game:
--   - RemoteFunction: ReplicatedStorage.remotes.reloadInvy (lấy thông tin q, e, q2, e2 của cả 2 set)
--   - RemoteEvent: ReplicatedStorage.remotes.swapAbilitySet (gửi lệnh đổi set)
--   - RemoteEvent: ReplicatedStorage.remotes.abilitySetSwapped (lắng nghe server xác nhận)

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local notifier = require("@routes/DungeonQuest/core/notifier")
local autoSkill = require("@routes/DungeonQuest/core/smartAutoPlay/autoSkill")

local ReplicatedStorage = services.ReplicatedStorage or game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local player = services.player

local CACHE_FILE = "Maclib/DQ_AbilitySets.json"

local abilitySet = {}

-- State
local autoSwapEnabled = false
local mobSet = 2 -- Mặc định Set 2 cho quái thường
local bossSet = 1 -- Mặc định Set 1 cho đánh boss
local currentSet = 1
local isSwapping = false
local setChangedListeners = {}
local labelChangedListeners = {}
local cleanupConnections = {}

-- Loadouts parsed from reloadInvy:
-- [1] = { q = "SkillName", e = "SkillName" }
-- [2] = { q = "SkillName", e = "SkillName" }
local loadouts = {
	[1] = { q = nil, e = nil },
	[2] = { q = nil, e = nil },
}

local function trackCleanupConnection(conn)
	if conn then table.insert(cleanupConnections, conn) end
	return conn
end

--// Đọc cache kỹ năng từ file local (nếu có)
local function loadSkillsCache()
	if not (isfile and readfile) then return end
	pcall(function()
		if isfile(CACHE_FILE) then
			local raw = readfile(CACHE_FILE)
			local data = HttpService:JSONDecode(raw)
			if type(data) == "table" then
				if data["1"] and type(data["1"]) == "table" then
					loadouts[1].q = data["1"].q
					loadouts[1].e = data["1"].e
				end
				if data["2"] and type(data["2"]) == "table" then
					loadouts[2].q = data["2"].q
					loadouts[2].e = data["2"].e
				end
			end
		end
	end)
end

--// Lưu cache kỹ năng vào file local
local function saveSkillsCache()
	if not (writefile and isfile and makefolder) then return end
	pcall(function()
		local data = {
			["1"] = loadouts[1],
			["2"] = loadouts[2],
		}
		writefile(CACHE_FILE, HttpService:JSONEncode(data))
	end)
end

local function fireLabelsChanged()
	for _, cb in ipairs(labelChangedListeners) do
		pcall(cb)
	end
end

local function fireSetChanged(newSet)
	for _, cb in ipairs(setChangedListeners) do
		pcall(cb, newSet)
	end
end

--// Đọc tên Tool kỹ năng hiện đang gắn trong Backpack hoặc Character (slot q và e)
local function getActiveBackpackSkills(): (string?, string?)
	local qName = nil
	local eName = nil

	local function checkContainer(container)
		if not container then return end
		for _, child in ipairs(container:GetChildren()) do
			local slot = child:FindFirstChild("abilitySlot")
			if slot and type(slot.Value) == "string" then
				local s = slot.Value:lower()
				if s == "q" then
					qName = child.Name
				elseif s == "e" then
					eName = child.Name
				end
			end
		end
	end

	checkContainer(player and player:FindFirstChild("Backpack"))
	checkContainer(player and player.Character)

	return qName, eName
end

--// Đọc số Set hiện tại từ UI game (PlayerGui.abilities.Frame["Set#"]) làm fallback phụ
local function readGuiSetNumber(): number?
	local pg = player and player:FindFirstChild("PlayerGui")
	local ab = pg and pg:FindFirstChild("abilities")
	local fr = ab and ab:FindFirstChild("Frame")
	local label = fr and fr:FindFirstChild("Set#")
	if label and type(label.Text) == "string" then
		local num = tonumber(label.Text:match("%d+"))
		if num == 1 or num == 2 then
			return num
		end
	end
	return nil
end

--// Tải toàn bộ cấu hình 2 Loadout từ remote `reloadInvy` (dựa trên q, e, q2, e2)
function abilitySet.ReloadInventory(): boolean
	local remotes = ReplicatedStorage:FindFirstChild("remotes")
	local reloadRemote = remotes and remotes:FindFirstChild("reloadInvy")
	if not reloadRemote or not reloadRemote:IsA("RemoteFunction") then
		return false
	end

	local ok, invData = pcall(function()
		return reloadRemote:InvokeServer()
	end)
	if not ok or type(invData) ~= "table" then
		return false
	end

	-- Tìm bảng abilities (có thể nằm ở invData.abilities hoặc invData["1"].abilities)
	local abilitiesTable = nil
	if invData.abilities and type(invData.abilities) == "table" then
		abilitiesTable = invData.abilities
	else
		for _, val in pairs(invData) do
			if type(val) == "table" and val.abilities and type(val.abilities) == "table" then
				abilitiesTable = val.abilities
				break
			end
		end
	end

	if not abilitiesTable then return false end

	local s1_q, s1_e = nil, nil
	local s2_q, s2_e = nil, nil

	for _, item in pairs(abilitiesTable) do
		if type(item) == "table" and type(item.equipped) == "table" then
			local eq = item.equipped
			local name = item.name or "None"
			if eq.q == true then s1_q = name end
			if eq.e == true then s1_e = name end
			if eq.q2 == true then s2_q = name end
			if eq.e2 == true then s2_e = name end
		end
	end

	local changed = false
	if s1_q and s1_q ~= loadouts[1].q then loadouts[1].q = s1_q; changed = true end
	if s1_e and s1_e ~= loadouts[1].e then loadouts[1].e = s1_e; changed = true end
	if s2_q and s2_q ~= loadouts[2].q then loadouts[2].q = s2_q; changed = true end
	if s2_e and s2_e ~= loadouts[2].e then loadouts[2].e = s2_e; changed = true end

	if changed then
		saveSkillsCache()
		fireLabelsChanged()
	end

	abilitySet.DetectCurrentSetFromBackpack()

	return true
end

--// Đối chiếu kỹ năng trong Backpack với loadouts (Set 1 vs Set 2) để xác định chuẩn xác 100% Set hiện tại
function abilitySet.DetectCurrentSetFromBackpack(): number
	local curQ, curE = getActiveBackpackSkills()
	if not curQ and not curE then
		local fromGui = readGuiSetNumber()
		if fromGui then currentSet = fromGui end
		return currentSet or 1
	end

	local s1 = loadouts[1]
	local s2 = loadouts[2]

	local score1 = 0
	local score2 = 0

	if curQ then
		if s1.q and s1.q == curQ then score1 += 1 end
		if s2.q and s2.q == curQ then score2 += 1 end
	end
	if curE then
		if s1.e and s1.e == curE then score1 += 1 end
		if s2.e and s2.e == curE then score2 += 1 end
	end

	if score1 > score2 then
		currentSet = 1
	elseif score2 > score1 then
		currentSet = 2
	else
		local fromGui = readGuiSetNumber()
		if fromGui then
			currentSet = fromGui
		end
	end

	return currentSet or 1
end

--// Lấy số Set hiện tại
function abilitySet.GetCurrentSet(): number
	return abilitySet.DetectCurrentSetFromBackpack()
end

--// Lấy chuỗi hiển thị tên Set kèm tên chiêu (VD: "Set 1 (Flame; Inner Focus)")
function abilitySet.GetSetLabel(setNum: number): string
	local data = loadouts[setNum]
	if data and (data.q or data.e) then
		local qText = data.q or "None"
		local eText = data.e or "None"
		return string.format("Set %d (%s; %s)", setNum, qText, eText)
	end
	return string.format("Set %d", setNum)
end

function abilitySet.OnLabelsChanged(callback)
	if type(callback) == "function" then
		table.insert(labelChangedListeners, callback)
	end
end

function abilitySet.OnSetChanged(callback)
	if type(callback) == "function" then
		table.insert(setChangedListeners, callback)
	end
end

--// Hoán đổi sang đúng Set mục tiêu (1 hoặc 2) với cơ chế đối chiếu Backpack
function abilitySet.SwapToSet(targetSet: number): boolean
	if targetSet ~= 1 and targetSet ~= 2 then return false end
	local cur = abilitySet.GetCurrentSet()
	if cur == targetSet then
		return true -- Đã ở đúng Set mục tiêu, không cần đổi
	end
	if isSwapping then return false end
	isSwapping = true

	task.spawn(function()
		local attempts = 0
		while attempts < 3 do
			attempts += 1
			if abilitySet.GetCurrentSet() == targetSet then break end

			-- 1. Chờ cho tới khi nhân vật hết bận xả chiêu (busyCasting == false)
			local timeout = os.clock() + 1.5
			while os.clock() < timeout do
				local char = player and player.Character
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if hum and hum.Health <= 0 then
					isSwapping = false
					return
				end
				local busy = char and char:FindFirstChild("busyCasting")
				if not (busy and busy.Value == true) then
					break
				end
				task.wait(0.06)
			end

			-- 2. Gửi lệnh swap lên server
			local remotes = ReplicatedStorage:FindFirstChild("remotes")
			local swapRemote = remotes and remotes:FindFirstChild("swapAbilitySet")
			if swapRemote and swapRemote:IsA("RemoteEvent") then
				pcall(function()
					swapRemote:FireServer()
				end)
			end

			-- 3. Chờ phản hồi xác nhận đổi thành công bằng đối chiếu Backpack
			local waitDeadline = os.clock() + 0.9
			while os.clock() < waitDeadline do
				if abilitySet.DetectCurrentSetFromBackpack() == targetSet then
					break
				end
				task.wait(0.06)
			end

			if abilitySet.GetCurrentSet() == targetSet then
				break
			end
			task.wait(0.15)
		end

		local finalSet = abilitySet.GetCurrentSet()
		if finalSet == targetSet then
			currentSet = targetSet
			fireSetChanged(targetSet)
			notifier.Notify(
				"Loadout",
				("Đã chuyển sang %s"):format(abilitySet.GetSetLabel(targetSet)),
				2
			)
			-- Quét lại bảng kỹ năng và cập nhật playstyle cho Auto Play tức thì
			if autoSkill and autoSkill.ScanEquippedSkills then
				task.delay(0.1, autoSkill.ScanEquippedSkills)
			end
		end

		isSwapping = false
	end)

	return true
end

--// Áp dụng Set phù hợp với trạng thái phòng hiện tại (Boss vs Mob)
function abilitySet.ApplyCurrentRole()
	if not autoSwapEnabled then return end
	if shared.IsInLobby and shared.IsInLobby() then return end

	local isBoss = shared.IsBossActive and shared.IsBossActive()
	local target = isBoss and bossSet or mobSet
	abilitySet.SwapToSet(target)
end

function abilitySet.ApplyForBoss()
	if not autoSwapEnabled then return end
	abilitySet.SwapToSet(bossSet)
end

function abilitySet.ApplyForMob()
	if not autoSwapEnabled then return end
	abilitySet.SwapToSet(mobSet)
end

--// Getters / Setters
function abilitySet.SetAutoSwapEnabled(state)
	autoSwapEnabled = state and true or false
	if autoSwapEnabled then
		task.spawn(abilitySet.ApplyCurrentRole)
	end
end

function abilitySet.IsAutoSwapEnabled(): boolean
	return autoSwapEnabled
end

function abilitySet.SetMobSet(setNum: number)
	if setNum == 1 or setNum == 2 then
		mobSet = setNum
		if autoSwapEnabled and not (shared.IsBossActive and shared.IsBossActive()) then
			task.spawn(abilitySet.ApplyForMob)
		end
	end
end

function abilitySet.GetMobSet(): number
	return mobSet
end

function abilitySet.SetBossSet(setNum: number)
	if setNum == 1 or setNum == 2 then
		bossSet = setNum
		if autoSwapEnabled and (shared.IsBossActive and shared.IsBossActive()) then
			task.spawn(abilitySet.ApplyForBoss)
		end
	end
end

function abilitySet.GetBossSet(): number
	return bossSet
end

--// Khởi tạo listeners
local function initListeners()
	loadSkillsCache()

	-- 1. Đọc dữ liệu inventory qua reloadInvy ngay khi khởi tạo
	task.spawn(function()
		for _ = 1, 10 do
			if abilitySet.ReloadInventory() then break end
			task.wait(1.0)
		end
	end)

	-- 2. Đối chiếu lại khi nhân vật hồi sinh
	if player then
		trackCleanupConnection(player.CharacterAdded:Connect(function()
			task.delay(0.6, function()
				abilitySet.DetectCurrentSetFromBackpack()
			end)
		end))
	end

	-- 3. Theo dõi boss xuất hiện / biến mất
	if shared.OnBossActiveChanged then
		trackCleanupConnection(shared.OnBossActiveChanged(function(isBoss)
			if autoSwapEnabled then
				if isBoss then
					abilitySet.ApplyForBoss()
				else
					abilitySet.ApplyForMob()
				end
			end
		end))
	end

	-- 4. Theo dõi vào dungeon mới (Lobby -> Dungeon)
	if shared.OnLobbyChanged then
		trackCleanupConnection(shared.OnLobbyChanged(function(inLobby)
			if not inLobby then
				task.delay(1.5, function()
					abilitySet.ReloadInventory()
					if autoSwapEnabled then
						abilitySet.ApplyCurrentRole()
					end
				end)
			else
				task.delay(1.0, abilitySet.ReloadInventory)
			end
		end))
	end

	-- 5. Theo dõi Path Record bắt đầu phát (đảm bảo đang ở đúng Loadout)
	if shared.OnPathRecordPlayingChanged then
		trackCleanupConnection(shared.OnPathRecordPlayingChanged(function(isPlaying)
			if isPlaying and autoSwapEnabled then
				task.spawn(abilitySet.ApplyCurrentRole)
			end
		end))
	end

	-- 6. Lắng nghe server event abilitySetSwapped
	task.spawn(function()
		local remotes = ReplicatedStorage:WaitForChild("remotes", 15)
		local swappedEv = remotes and remotes:WaitForChild("abilitySetSwapped", 10)
		if swappedEv and swappedEv:IsA("RemoteEvent") then
			trackCleanupConnection(swappedEv.OnClientEvent:Connect(function(arg)
				local num = tonumber(arg)
				if num == 1 or num == 2 then
					currentSet = num
					fireSetChanged(num)
					task.delay(0.1, function()
						abilitySet.DetectCurrentSetFromBackpack()
					end)
					if autoSkill and autoSkill.ScanEquippedSkills then
						task.delay(0.1, autoSkill.ScanEquippedSkills)
					end
				end
			end))
		end
	end)
end

initListeners()

lifecycle.Register(function()
	for _, conn in ipairs(cleanupConnections) do
		if typeof(conn) == "RBXScriptConnection" or (typeof(conn) == "table" and typeof(conn.Disconnect) == "function") then
			pcall(function() conn:Disconnect() end)
		elseif typeof(conn) == "function" then
			pcall(conn)
		end
	end
	table.clear(cleanupConnections)
	table.clear(setChangedListeners)
	table.clear(labelChangedListeners)
	isSwapping = false
end)

return abilitySet
