-- Death Logger v2 cho DungeonQuest (executor-level hook).
-- Mục tiêu: biết CHÍNH XÁC nguyên nhân chết thay vì đoán theo vị trí.
--
-- Chiến lược phát hiện (theo độ chính xác giảm dần):
--   1. Hook `Humanoid.TakeDamage` (global, cài 1 lần ở Init). Mỗi đòn damage
--      trúng nhân vật local đều ghi lại {thời điểm, amount, source, vị trí}.
--      Đòn cuối cùng trong KILL_WINDOW (giây) trước lúc chết = killing blow.
--   2. Đọc engine props `LastHurtPart` / `LastHurtByHumanoid` + `lastCombatant`
--      (legacy) NGAY tại thời điểm chết — bắt được damage do server đè trực
--      tiếp Health mà không đi qua TakeDamage (vd: killplane, fall damage).
--   3. Quét object nghi ngờ quanh điểm chết CHỈ làm tham khảo (ưu tiên thấp).

--// Imports
local services = require("@routes/DungeonQuest/core/services")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local player = services.player

--// Configuration
--// Tổng số damage record giữ lại (ring buffer, giữ lịch sử gần nhất)
local MAX_RECORDS = 64
--// Bán kính quét các object nghi ngờ quanh điểm chết (chỉ tính trong bán kính này)
local LOG_RADIUS = 25
--// Số candidate top hiển thị trong danh sách tham khảo
local TOP_N = 3
--// Khoảng (giây) giữa lúc chết và đòn TakeDamage gần nhất để coi là "killing blow"
local KILL_WINDOW = 2.0

--// Các pattern tên nghi ngờ là hazard/skill (khớp chuỗi con, không phân biệt hoa thường)
local CANDIDATE_PATTERNS = {
	"firstBoss", "CrissCross", "Spike", "Hitbox", "hitBox",
	"Skill", "Orb", "Spear", "Poison", "Arrow", "Projectile",
}

--// Table
local deathLog = {}

--// State
local enabled = false
local hookInstalled = false
local characterAddedConnection = nil
local diedConnection = nil
local damageRecords = {}
local lastWarnClock = 0

--// Wrap closure để hook (một số executor bắt buộc C closure trên hook C function)
local wrapClosure = nil
if type(newcclosure) == "function" then
	wrapClosure = newcclosure
else
	wrapClosure = function(f) return f end
end

local function getLocalHumanoid()
	if not player then return nil end
	local character = player.Character
	if not character or not character.Parent then return nil end
	return character:FindFirstChildOfClass("Humanoid")
end

--// Tìm tên player sở hữu `source` (PvP) bằng cách đi lên chuỗi ancestor
local function resolveOwnerName(source)
	if not source then return nil end
	local ok, name = pcall(function()
		local Players = services.Players
		local ancestor = source
		local guard = 0
		while ancestor and ancestor.Parent and guard < 8 do
			local plr = Players:GetPlayerFromCharacter(ancestor)
			if plr then return plr.Name end
			ancestor = ancestor.Parent
			guard += 1
		end
		return nil
	end)
	return ok and name or nil
end

--// Liệt kê nguồn gây damage dưới dạng chuỗi (name + owner/tool + class + path)
local function describeSource(source)
	if not source then return "nil" end
	local name = nil
	local owner = nil
	local toolName = nil
	local cls = nil
	local path = nil
	pcall(function() name = source.Name end)
	pcall(function() cls = source.ClassName end)
	pcall(function()
		local ancestor = source.Parent
		local guard = 0
		while ancestor and ancestor.Parent and guard < 8 do
			if not toolName and ancestor:IsA("Tool") then toolName = ancestor.Name end
			ancestor = ancestor.Parent
			guard += 1
		end
	end)
	pcall(function() path = source:GetFullName() end)
	owner = resolveOwnerName(source)

	local out = name and name ~= "" and name or "?"
	if toolName then out = out .. " / " .. toolName end
	if owner then out = out .. " (by " .. owner .. ")" end
	out = out .. " [" .. (cls or "?") .. "]"
	if path and path ~= "" then out = out .. " {" .. path .. "}" end
	return out
end

--// Tạo record damage từ hook. Trả về rec để hook cập nhật healthAfter sau damage.
local function makeRecord(victim, amount, source)
	if type(amount) ~= "number" then return nil end
	local rec = {
		time = os.clock(),
		amount = amount,
		healthAfter = nil,
		source = source,
		victimPos = nil,
		sourcePos = nil,
		dist = nil,
	}
	if victim and victim.Parent then
		pcall(function()
			local root = victim.Parent:FindFirstChild("HumanoidRootPart")
			if root and root:IsA("BasePart") then rec.victimPos = root.Position end
		end)
	end
	if source then
		pcall(function()
			if source:IsA("BasePart") then
				rec.sourcePos = source.Position
			elseif source:IsA("Model") then
				local p = source.PrimaryPart
				if p and p:IsA("BasePart") then rec.sourcePos = p.Position end
			end
		end)
		if rec.sourcePos and rec.victimPos then
			rec.dist = (rec.sourcePos - rec.victimPos).Magnitude
		end
	end

	if #damageRecords >= MAX_RECORDS then
		table.remove(damageRecords, 1)
	end
	table.insert(damageRecords, rec)
	return rec
end

--// Cài hook `TakeDamage` GLOBAL cho mọi Humanoid, chỉ record khi victim là ta.
--// Đã hook thì giữ nguyên qua các lần respawn (character mới vẫn dùng chung method).
local function installTakeDamageHook()
	if hookInstalled then return true end
	if type(hookfunction) ~= "function" then return false end

	local ok = pcall(function()
		local prototype = Instance.new("Humanoid")
		local original = prototype.TakeDamage
		hookInstalled = hookfunction(original, wrapClosure(function(self, ...)
			if enabled and self and self == getLocalHumanoid() then
				local args = {...}
				local rec = makeRecord(self, args[1], args[2])
				local results = { original(self, ...) }
				if rec then pcall(function() rec.healthAfter = self.Health end) end
				return unpack(results)
			end
			return original(self, ...)
		end)) ~= nil
		prototype:Destroy()
	end)

	if not ok then hookInstalled = false end
	if not hookInstalled then
		local now = os.clock()
		if now - lastWarnClock > 5 then
			lastWarnClock = now
			warn("[DeathLog] Hook TakeDamage failed -> chỉ dùng engine props + scan tham khảo.")
		end
	end
	return hookInstalled
end

--// Đọc engine props xác định kẻ đã đánh phát cuối (chạy sát lúc chết)
local function engineKillerInfo(humanoid)
	local info = {}
	if not humanoid then return info end
	pcall(function()
		local v = humanoid.lastCombatant
		if v then
			if v.Parent then info.lastCombatant = v.Parent.Name else info.lastCombatant = tostring(v) end
		end
	end)
	pcall(function()
		local v = humanoid.LastHurtByHumanoid
		if v and v.Parent then info.lastHurtByHumanoid = v.Parent.Name else info.lastHurtByHumanoid = tostring(v) end
	end)
	pcall(function()
		local v = humanoid.LastHurtPart
		if v then info.lastHurtPart = v.Name end
	end)
	return info
end

--// Các pattern/hàm scan vật thể quanh điểm chết (tham khảo)
local function matchesCandidate(name)
	if not name then return false end
	local lower = name:lower()
	for _, p in ipairs(CANDIDATE_PATTERNS) do
		if lower:find(p:lower(), 1, true) then return true end
	end
	return false
end

local function describeObject(obj)
	local kind = nil
	local name = nil
	local rootPos = nil
	pcall(function()
		kind = obj:IsA("BasePart") and "Part" or obj.ClassName
		name = obj.Name
	end)
	if obj:IsA("BasePart") then
		rootPos = obj.Position
	elseif obj:IsA("Model") then
		local p = obj.PrimaryPart
		if p and p:IsA("BasePart") then
			rootPos = p.Position
		else
			for _, c in ipairs(obj:GetChildren()) do
				if c:IsA("BasePart") then rootPos = c.Position; break end
			end
		end
	end
	return name, kind, rootPos
end

local function scanCandidates(deathPos)
	local Workspace = game:GetService("Workspace")
	local hits = {}
	for _, child in ipairs(Workspace:GetChildren()) do
		if not child:IsA("Folder") and matchesCandidate(child.Name) then
			local name, kind, pos = describeObject(child)
			if pos then
				table.insert(hits, { name = name, kind = kind, dist = (pos - deathPos).Magnitude, lvl = 0 })
			end
		end
	end
	table.sort(hits, function(a, b) return a.dist < b.dist end)
	return hits
end

local function formatRecord(deathTime, rec)
	local amount = rec.amount or 0
	local ago = deathTime - (rec.time or deathTime)
	local dist = rec.dist and string.format("dist=%.1f", rec.dist) or "dist=?"
	local healthAfter = rec.healthAfter and string.format("remaining=%.1f", rec.healthAfter) or "remaining=?"
	return string.format("[DEATH-LOG]   | %-8.1f HP | %7.2fs before death | %s | %s | %s",
		amount, ago, dist, healthAfter, describeSource(rec.source))
end

local function logDeath(deathPos, humanoid)
	if not enabled then return end
	local deathTime = os.clock()

	print("[DEATH-LOG] ========================================")
	print("[DEATH-LOG] PLAYER DIED")
	print("[DEATH-LOG]   position: " .. tostring(deathPos))

	--// 1) Engine props: nguồn chính xác nhất nếu server tự đè Health
	local info = engineKillerInfo(humanoid)
	print("[DEATH-LOG] engine killsource:")
	print("[DEATH-LOG]   lastHurtPart      = " .. tostring(info.lastHurtPart or "none"))
	print("[DEATH-LOG]   lastHurtByHumanoid = " .. tostring(info.lastHurtByHumanoid or "none"))
	print("[DEATH-LOG]   lastCombatant     = " .. tostring(info.lastCombatant or "none"))

	--// 2) Hook records: killing blow
	local lastRec = damageRecords[#damageRecords]
	local hasRecent = lastRec and (deathTime - lastRec.time) <= KILL_WINDOW
	if hasRecent then
		print("[DEATH-LOG] >> KILLING BLOW (last TakeDamage within " .. KILL_WINDOW .. "s):")
		print("[DEATH-LOG]    " .. formatRecord(deathTime, lastRec))
	elseif #damageRecords > 0 then
		print("[DEATH-LOG] >> No TakeDamage hit within " .. KILL_WINDOW
			.. "s of death -> có thể do fall / killplane / damage do server đặt trực tiếp Health"
			.. " (xem engine killsource bên trên).")
	else
		print("[DEATH-LOG] >> No TakeDamage records captured (game không damage qua client).")
	end

	--// Liệt kê 3 hit gần nhất (để thấy chuỗi damage trước khi chết)
	local count = math.min(#damageRecords, 3)
	if count > 0 then
		print("[DEATH-LOG] last " .. count .. " damage hits:")
		for i = #damageRecords - count + 1, #damageRecords do
			print(formatRecord(deathTime, damageRecords[i]))
		end
	end

	--// 3) Tham khảo hazard quanh điểm chết (ưu tiên thấp)
	local hits = scanCandidates(deathPos)
	local inRange = {}
	for _, h in ipairs(hits) do
		if h.dist <= LOG_RADIUS then table.insert(inRange, h) end
	end
	local n = math.min(#inRange, TOP_N)
	if n > 0 then
		print("[DEATH-LOG] reference hazard near death (khoảng " .. LOG_RADIUS .. " stud):")
		for i = 1, n do
			local h = inRange[i]
			print(string.format("[DEATH-LOG]   %d) %-40s %-10s dist=%.1f", i, h.name, h.kind, h.dist))
		end
	end
	print("[DEATH-LOG] ========================================")
end

function deathLog.Init()
	installTakeDamageHook()

	local function bindCharacter(character)
		if not character or not character.Parent then return end
		local hum = character:FindFirstChildOfClass("Humanoid")
		if not hum then
			task.spawn(function()
				local h = character:WaitForChild("Humanoid", 10)
				if h then bindCharacter(character) end
			end)
			return
		end
		if diedConnection then
			pcall(function() diedConnection:Disconnect() end)
			diedConnection = nil
		end
		diedConnection = hum.Died:Connect(function()
			local root = character:FindFirstChild("HumanoidRootPart")
			logDeath(root and root.Position or Vector3.zero, hum)
		end)
	end

	if player then
		local initial = player.Character
		if initial then
			bindCharacter(initial)
		end
		characterAddedConnection = player.CharacterAdded:Connect(bindCharacter)
	end
end

function deathLog.Toggle(state)
	enabled = state == true
	if enabled then
		installTakeDamageHook()
	end
end

function deathLog.IsEnabled()
	return enabled
end

lifecycle.Register(function()
	enabled = false
	if diedConnection then pcall(function() diedConnection:Disconnect() end); diedConnection = nil end
	if characterAddedConnection then pcall(function() characterAddedConnection:Disconnect() end); characterAddedConnection = nil end
end)

return deathLog
