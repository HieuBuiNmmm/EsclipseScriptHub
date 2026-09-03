-- DodgeNode: lưới node xung quanh player dùng làm bản đồ an toàn cho SmartDodge.
-- Node nằm trong vùng precast của skill -> màu đỏ (nguy hiểm).
-- Node nằm ngoài mọi precast -> màu xanh (an toàn) + là ứng viên để tele tới.

local services = require("@routes/DungeonQuest/core/services")

--// Cấu hình
local NODE_RADIUS = 10          -- bán kính hình tròn phủ node quanh player (studs)
local NODE_SPACING = 2          -- khoảng cách giữa các node (studs)
local NODE_COLOR_SAFE = Color3.fromRGB(0, 255, 0)
local NODE_COLOR_DANGER = Color3.fromRGB(255, 60, 60)
local NODE_PART_NAME = "DodgeNode_ESP"
local NODE_TRANSPARENCY = 0.6
local NODE_THRESHOLD = 1.5       -- bán kính xem một node "dính" vào precast (studs)

--// Danh sách skill có precast telegraph (khớp SmartDodge).
local DODGE_SKILL_NAMES = {
	["northernMageShot"] = true,
	["northernWarriorCircleStrike"] = true,
	["northernWarriorLineStrike"] = true,
	["spearmanStrike"] = true,
	["spearmanStrikeHitbox"] = true,
}

local dodgeNodes = {}
local enabled = false
local thread = nil
local repeatCount = 0

--// Kiểm tra một điểm (chỉ theo X/Z, bỏ qua chiều cao Y) có nằm trong phạm vi ngang
--// của bất kỳ part skill nào hay không. Mở rộng mỗi part thêm NODE_THRESHOLD.
local function pointInDanger(center, parts)
	for _, part in ipairs(parts) do
		if part and part:IsA("BasePart") then
			if part:IsA("Part") and part.Shape == Enum.PartType.Ball then
				--// Part hình cầu: so theo bán kính thực từ tâm.
				local radius = (part.Size.X / 2) + NODE_THRESHOLD
				local d = (Vector3.new(center.X, 0, center.Z) - Vector3.new(part.Position.X, 0, part.Position.Z)).Magnitude
				if d <= radius then return true end
			else
				--// Phần lớn: so theo hình chiếu ngang (XZ) trong local space của part.
				local half = Vector3.new(part.Size.X / 2, part.Size.Z / 2, 0) + Vector3.one * NODE_THRESHOLD
				local localPos = part.CFrame:PointToObjectSpace(center)
				local dx = math.max(math.abs(localPos.X) - half.X, 0)
				local dz = math.max(math.abs(localPos.Z) - half.Y, 0)
				if dx * dx + dz * dz <= 0.25 then
					return true
				end
			end
		end
	end
	return false
end

--// Quét Workspace thu về toàn bộ BasePart của các model skill (không cần child "precast").
local function collectPrecasts()
	local Workspace = game:GetService("Workspace")
	local parts = {}
	local function collect(root)
		if DODGE_SKILL_NAMES[root.Name] then
			for _, desc in ipairs(root:GetDescendants()) do
				if desc:IsA("BasePart") and not desc:IsA("Terrain") then
					table.insert(parts, desc)
				end
			end
		end
	end
	for _, child in ipairs(Workspace:GetChildren()) do
		collect(child)
		for _, desc in ipairs(child:GetDescendants()) do
			if DODGE_SKILL_NAMES[desc.Name] then collect(desc) end
		end
	end
	return parts
end

--// Thu về tên các model skill đang hiện diện trong Workspace (cho log chẩn đoán).
local function collectSkillRoots()
	local Workspace = game:GetService("Workspace")
	local names = {}
	local function collect(root)
		if DODGE_SKILL_NAMES[root.Name] then
			table.insert(names, root.Name)
		end
	end
	for _, child in ipairs(Workspace:GetChildren()) do
		collect(child)
		for _, desc in ipairs(child:GetDescendants()) do
			collect(desc)
		end
	end
	return names
end

--// Tạo lưới offset (X, Z) các node trong vòng tròn bán kính NODE_RADIUS.
local function buildOffsets()
	local offsets = {}
	local step = NODE_SPACING
	local maxCoord = math.floor(NODE_RADIUS / step) * step
	for x = -maxCoord, maxCoord, step do
		for z = -maxCoord, maxCoord, step do
			if x * x + z * z <= NODE_RADIUS * NODE_RADIUS then
				table.insert(offsets, Vector3.new(x, 0, z))
			end
		end
	end
	return offsets
end

local OFFSETS = buildOffsets()

--// Tạo tối đa số part node trong Workspace (theo số offset), một lần duy nhất.
local function ensureNodes()
	while #dodgeNodes < #OFFSETS do
		local part = Instance.new("Part")
		part.Name = NODE_PART_NAME
		part.Shape = Enum.PartType.Ball
		part.Size = Vector3.one * (NODE_SPACING * 0.6)
		part.Transparency = NODE_TRANSPARENCY
		part.Anchored = true
		part.CanCollide = false
		part.CanQuery = false
		part.CanTouch = false
		part.Material = Enum.Material.Neon
		part.Parent = workspace
		table.insert(dodgeNodes, part)
	end
end

--// Cập nhật màu + vị trí từng node quanh player.
local function updateNodes(character, parts)
	local rootPart = character and character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return end
	local center = rootPart.Position
	dodgeNodes.redCount = 0
	dodgeNodes.totalCount = #dodgeNodes
	for i, part in ipairs(dodgeNodes) do
		local offset = OFFSETS[i]
		local pos = Vector3.new(center.X + offset.X, center.Y, center.Z + offset.Z)
		part.CFrame = CFrame.new(pos)
		if pointInDanger(pos, parts) then
			part.Color = NODE_COLOR_DANGER
			dodgeNodes.redCount = dodgeNodes.redCount + 1
		else
			part.Color = NODE_COLOR_SAFE
		end
	end
	repeatCount = repeatCount + 1
	if repeatCount % 20 == 0 then
		print(("[DodgeNode] %d/%d nodes red, %d skill-parts nearby"):format(dodgeNodes.redCount, dodgeNodes.totalCount, #parts))
	end
end

--// Tìm node an toàn (xanh) gần player nhất. Trả về Vector3 hoặc nil.
local function getNearestSafeNode(character, precasts)
	local rootPart = character and character:FindFirstChild("HumanoidRootPart")
	if not rootPart then return nil end
	local center = rootPart.Position
	local best = nil
	local bestDist = math.huge
	for i, offset in ipairs(OFFSETS) do
		local pos = Vector3.new(center.X + offset.X, center.Y, center.Z + offset.Z)
		if not pointInDanger(pos, precasts) then
			local dist = (pos - center).Magnitude
			if dist > NODE_SPACING and dist < bestDist then
				bestDist = dist
				best = pos
			end
		end
	end
	return best
end

function dodgeNodes.Toggle(state)
	if state == enabled then return end
	enabled = state
	if enabled then
		if thread then task.cancel(thread); thread = nil end
		ensureNodes()
		thread = task.spawn(function()
			local lastSkillLog = 0
			while enabled do
				local ok, err = pcall(function()
					local parts = collectPrecasts()
					updateNodes(services.player.Character, parts)
					if os.clock() - lastSkillLog > 1 then
						lastSkillLog = os.clock()
						print(("[DodgeNode] skill roots found: %s"):format(table.concat(collectSkillRoots(), ", ")))
					end
				end)
				if not ok and os.clock() - (dodgeNodes.lastWarn or 0) > 5 then
					dodgeNodes.lastWarn = os.clock()
					warn("[DodgeNode] error:", tostring(err))
				end
				task.wait(0.05)
			end
		end)
	else
		if thread then task.cancel(thread); thread = nil end
		for _, part in ipairs(dodgeNodes) do part:Destroy() end
		table.clear(dodgeNodes)
	end
end

function dodgeNodes.IsEnabled()
	return enabled
end

--// API cho SmartDodge: trả về vị trí node an toàn gần nhất, hoặc nil.
function dodgeNodes.FindSafeSpot(character)
	local precasts = collectPrecasts()
	return getNearestSafeNode(character, precasts)
end

return dodgeNodes
