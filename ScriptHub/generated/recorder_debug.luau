local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- HazardScannerV2 - Neon-Based Hazard Filter (with Ice Spikes Exception)
-- Nguyên tắc phát hiện:
-- 1. CHỈ bắt các đối tượng là con trực tiếp (Level 1) của Workspace (child.Parent == Workspace).
-- 2. LOẠI TRỪ 100% các Level 1 "Folder" (như workspace.dungeon, workspace.drops, workspace.sounds...).
-- 3. LOẠI TRỪ nhân vật Player/Party, Enemy Models (có Humanoid) và chiêu Player (abilities/projectiles).
-- 4. BÊN TRONG đối tượng Level 1 hợp lệ:
--    - Mặc định: Chỉ lấy các BasePart có Material == Enum.Material.Neon.
--    - NGOẠI LỆ: largeIceSpikes, mediumIceSpikes, smallIceSpikes sử dụng Material Plastic -> Cho phép quét!

--// Imports
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Table
local filter = {}

--// State
local ignoreTemplateNames = {}

-- Danh sách TĨNH toàn bộ template chiêu thức & đạn của Player đã biết trong DungeonQuest
local KNOWN_PLAYER_TEMPLATES = {
	["groundaura"] = true,
	["genericneonball"] = true,
	["genericattachpart"] = true,
	["berserk"] = true,
	["demonspikeone"] = true,
	["demonspiketwo"] = true,
	["demonspikethree"] = true,
	["groundslam"] = true,
	["guardianblessingball"] = true,
	["holybarrier"] = true,
	["holycircle"] = true,
	["innervate"] = true,
	["lightningstrike"] = true,
	["overcharge"] = true,
	["overchargedeffects"] = true,
	["pulsefire"] = true,
	["pulsewaveswave"] = true,
	["redemption"] = true,
	["starfallstar"] = true,
	["starbarrage"] = true,
	["taunt"] = true,
	["tsunami"] = true,
	["voidspherespawn"] = true,
	["vortex"] = true,
	["whirlwind"] = true,
	["chainedenergyblasts"] = true,
	["orbofdestruction"] = true,
	["orbofdestructionholder"] = true,
	["explosivepunchcone"] = true,
	["explosivepunchring"] = true,
	["arrowrain"] = true,
	["arrowrainarrow"] = true,
	["phantomflames"] = true,
	["infernalblastcylinder"] = true,
	["chainlightning"] = true,
	["mightyleapslamcircle"] = true,
	["arrowbarrage"] = true,
	["moltenball"] = true,
	["smallmoltenball"] = true,
	["electricgrinder"] = true,
	["demoniccurse"] = true,
	["twinslash"] = true,
	["aquaticsmitecast"] = true,
	["aquaticsmitehit"] = true,
	["icecrash"] = true,
	["fungalpoison"] = true,
	["fungalpoisonparticles"] = true,
	["agonyorbsmainorb"] = true,
	["agonyorbssmall"] = true,
	["agonyorbsstarexplosion"] = true,
	["lightningburst"] = true,
	["piercingroots"] = true,
	["crystalinecannonblast"] = true,
	["crystalinecannonspiral"] = true,
	["concussiveblasttrail"] = true,
	["concussiveblastexplosion"] = true,
	["concussiveblastring"] = true,
	["windblast"] = true,
	["revitalize"] = true,
	["flamestrike"] = true,
	["frostcone"] = true,
	["souldrain"] = true,
	["souldrainparticles"] = true,
	["geyser"] = true,
	["flameshuriken"] = true,
	["galebarrage"] = true,
	["solarbeam"] = true,
	["godspearmodel"] = true,
	["godspearexplosioncylinder"] = true,
	["godspeardebrisring"] = true,
	["godspeardebris"] = true,
	["bladebarragesword"] = true,
	["bladefallsword"] = true,
	["amethystbeamorb"] = true,
	["amethystbeamgroundparticles"] = true,
	["amethystbeambeam"] = true,
	["amethystblast"] = true,
	["jaderoller"] = true,
	["jaderaincircle"] = true,
	["jaderaincrystal"] = true,
	["carrotbarrage"] = true,
	["carrotbarragecarrot"] = true,
	["eggbomb"] = true,
	["phaseball"] = true,
	["bigphaseball"] = true,
	["phasering"] = true,
	["phasebeammodel"] = true,
	["moltenshard"] = true,
	["lavabeam"] = true,
	["lavabarrageslash"] = true,
	["lavabarrageball"] = true,
	["spearstrike"] = true,
	["spearstriring"] = true,
	["spearstrikerng"] = true,
}

-- Hàm làm sạch tên: loại bỏ khoảng trắng, số đếm, (clone), gạch dưới, gạch ngang
local function sanitizeName(name)
	if typeof(name) ~= "string" then return "" end
	return name:lower():gsub("%s+", ""):gsub("%d+", ""):gsub("%(clone%)", ""):gsub("_", ""):gsub("%-", "")
end

local function addTemplateName(name)
	local clean = sanitizeName(name)
	if #clean > 0 then
		ignoreTemplateNames[clean] = true
	end
end

local function scanTemplateFolder(folder)
	if not folder then return end
	for _, item in ipairs(folder:GetChildren()) do
		addTemplateName(item.Name)
		for _, desc in ipairs(item:GetDescendants()) do
			addTemplateName(desc.Name)
		end
	end
end

-- Đọc template abilities & projectiles của người chơi từ ReplicatedStorage
local function loadPlayerIgnoreTemplates()
	local folders = { "abilities", "projectiles" }
	for _, fName in ipairs(folders) do
		local folder = ReplicatedStorage:FindFirstChild(fName)
		if folder then
			scanTemplateFolder(folder)
			folder.ChildAdded:Connect(function(child)
				addTemplateName(child.Name)
				child.DescendantAdded:Connect(function(desc)
					addTemplateName(desc.Name)
				end)
			end)
		end
	end
end

loadPlayerIgnoreTemplates()

-- Lắng nghe phòng trường hợp ReplicatedStorage nạp folder abilities / projectiles trễ
task.spawn(function()
	local folders = { "abilities", "projectiles" }
	for _, fName in ipairs(folders) do
		local folder = ReplicatedStorage:FindFirstChild(fName)
		if not folder then
			folder = ReplicatedStorage:WaitForChild(fName, 10)
			if folder then
				scanTemplateFolder(folder)
				folder.ChildAdded:Connect(function(child)
					addTemplateName(child.Name)
					child.DescendantAdded:Connect(function(desc)
						addTemplateName(desc.Name)
					end)
				end)
			end
		end
	end
end)

-- Danh sách từ khóa ngoại lệ Ice Spikes (Material Plastic)
local ICE_SPIKES_KEYWORDS = {
	"largeicespikes",
	"mediumicespikes",
	"smallicespikes",
	"icespikes",
}

-- Kiểm tra xem 1 tên hoặc instance có phải thuộc chuỗi Ice Spikes không
function filter.IsIceSpikes(nameOrInstance)
	if not nameOrInstance then return false end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 then return false end
	for _, kw in ipairs(ICE_SPIKES_KEYWORDS) do
		if string.find(clean, kw, 1, true) then
			return true
		end
	end
	return false
end

-- Kiểm tra xem 1 tên hoặc instance có phải là chiêu firstBossBigSpike (Boss 1) không
function filter.IsFirstBossBigSpike(nameOrInstance)
	if not nameOrInstance then return false end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = name:lower():gsub("%s+", "")
	if #clean == 0 or string.find(clean, "seekingspike", 1, true) then return false end
	return string.find(clean, "firstbossbigspike", 1, true) ~= nil
		or string.find(clean, "bigspike", 1, true) ~= nil
end

-- Kiểm tra xem 1 instance có thuộc nhân vật người chơi / party hay không
function filter.IsPlayerCharacter(instance)
	if not instance then return true end
	if Players:GetPlayerFromCharacter(instance) then return true end
	if Players:FindFirstChild(instance.Name) then return true end
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr.Character and (instance == plr.Character or instance:IsDescendantOf(plr.Character)) then
			return true
		end
	end
	local lp = Players.LocalPlayer
	local lpChar = lp and lp.Character
	if lpChar and (instance == lpChar or instance:IsDescendantOf(lpChar)) then
		return true
	end
	return false
end

-- Kiểm tra xem 1 instance có phải là Model quái vật (có Humanoid) hay không
function filter.IsEnemyModel(instance)
	if not instance then return false end
	if instance:IsA("Model") and instance:FindFirstChildOfClass("Humanoid") then
		return true
	end
	if instance.Parent and instance.Parent:IsA("Model") and instance.Parent:FindFirstChildOfClass("Humanoid") then
		return true
	end
	return false
end

-- Kiểm tra xem instance có phải là chiêu của player bản thân hoặc đồng đội
function filter.IsPlayerAbility(instance)
	if not instance then return false end

	-- Bỏ qua nhanh nếu là boss / bẫy đặc biệt đã biết
	if filter.IsMultiRing(instance) 
		or filter.IsIceSpikes(instance) 
		or filter.IsSweepingFlames(instance) 
		or filter.IsMemoryModel(instance) 
		or filter.IsFirstBossBigSpike(instance) 
		or filter.IsBouncingOrb(instance) then
		return false
	end

	-- Kiểm tra nếu instance có tag / thuộc tính sở hữu người chơi
	if instance:FindFirstChild("creator") or instance:FindFirstChild("owner") or instance:FindFirstChild("player") then
		return true
	end
	if instance:GetAttribute("Owner") or instance:GetAttribute("Creator") or instance:GetAttribute("Player") then
		return true
	end

	-- Duyệt từ instance ngược lên các cấp cha (tới Workspace)
	local cur = instance
	while cur and cur ~= Workspace and cur ~= game do
		local name = cur.Name
		if typeof(name) == "string" then
			local clean = sanitizeName(name)
			if #clean > 0 then
				if ignoreTemplateNames[clean] or KNOWN_PLAYER_TEMPLATES[clean] then
					return true
				end
				-- Kiểm tra khớp mẫu substring với các skill player đã biết (độ dài >= 6 ký tự)
				for tmpl, _ in pairs(KNOWN_PLAYER_TEMPLATES) do
					if #tmpl >= 6 and string.find(clean, tmpl, 1, true) then
						return true
					end
				end
			end
			-- Kiểm tra trực tiếp trong ReplicatedStorage.projectiles hoặc abilities
			local projFolder = ReplicatedStorage:FindFirstChild("projectiles")
			if projFolder and projFolder:FindFirstChild(name) then
				addTemplateName(name)
				return true
			end
			local abilFolder = ReplicatedStorage:FindFirstChild("abilities")
			if abilFolder and abilFolder:FindFirstChild(name) then
				addTemplateName(name)
				return true
			end
		end
		cur = cur.Parent
	end

	return false
end

-- KIỂM TRA ĐỐI TƯỢNG LEVEL 1 CỦA WORKSPACE:
-- Chỉ chấp nhận BasePart hoặc Model sinh ra trực tiếp dưới Workspace.
-- LOẠI BỎ hoàn toàn: Folder (workspace.dungeon...), Camera, Terrain, Player, Enemy, Player Skills.
function filter.IsValidLevel1WorkspaceChild(child)
	if not child or not child.Parent then return false end

	-- 1. Bắt buộc phải là con trực tiếp (Level 1) của Workspace
	if child.Parent ~= Workspace then
		return false
	end

	-- 2. LOẠI TRỪ 100% các Level 1 Folder, Terrain, Camera
	if child:IsA("Folder") or child:IsA("Terrain") or child:IsA("Camera") then
		return false
	end

	-- 3. Chỉ chấp nhận BasePart hoặc Model
	if not (child:IsA("BasePart") or child:IsA("Model")) then
		return false
	end

	-- 4. Bỏ qua nếu là nhân vật người chơi / đồng đội
	if filter.IsPlayerCharacter(child) then
		return false
	end

	-- 5. Bỏ qua nếu là Model quái vật / Boss (có Humanoid)
	if filter.IsEnemyModel(child) then
		return false
	end

	-- 6. Bỏ qua nếu là chiêu thức người chơi
	if filter.IsPlayerAbility(child) then
		return false
	end

	return true
end

-- Kiểm tra xem 1 tên hoặc instance có phải là chiêu thirdBossMultiRings không
function filter.IsMultiRing(nameOrInstance)
	if not nameOrInstance then return false end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = name:lower():gsub("%s+", "")
	return string.find(clean, "thirdbossmultirings", 1, true) ~= nil 
		or string.find(clean, "multiring", 1, true) ~= nil
end

-- Kiểm tra xem 1 tên hoặc instance có phải là chiêu bonusBossSweepingFlames không
function filter.IsSweepingFlames(nameOrInstance)
	if not nameOrInstance then return false end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = name:lower():gsub("%s+", "")
	return string.find(clean, "bonusbosssweepingflames", 1, true) ~= nil 
		or string.find(clean, "sweepingflames", 1, true) ~= nil
end

-- Kiểm tra xem 1 tên hoặc instance có phải là chiêu bonusBossMemoryModel không
function filter.IsMemoryModel(nameOrInstance)
	if not nameOrInstance then return false end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = name:lower():gsub("%s+", "")
	return string.find(clean, "bonusbossmemorymodel", 1, true) ~= nil 
		or string.find(clean, "memorymodel", 1, true) ~= nil
end

-- Kiểm tra xem 1 tên hoặc instance có phải là chiêu Bouncing Orb (Boss 3 hoặc Bonus Boss) không
function filter.IsBouncingOrb(nameOrInstance)
	if not nameOrInstance then return false end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = name:lower():gsub("%s+", "")
	return string.find(clean, "bouncingorb", 1, true) ~= nil
end

-- Kiểm tra xem một BasePart có phải là Hazard Part hợp lệ hay không
function filter.IsHazardPart(part, hazardContext)
	if not part or not part:IsA("BasePart") or not part.Parent then
		return false
	end

	-- Bỏ qua 100% PrimaryPart giả định/dummy
	if part.Name == "PrimaryPart" then
		return false
	end

	-- BỎ QUA 100% CHIÊU THỨC / HIỆU ỨNG CỦA PLAYER HOẶC PARTY
	if filter.IsPlayerCharacter(part) or (hazardContext and filter.IsPlayerCharacter(hazardContext)) then
		return false
	end
	if filter.IsPlayerAbility(part) or (hazardContext and filter.IsPlayerAbility(hazardContext)) then
		return false
	end

	-- NGOẠI LỆ 1: thirdBossMultiRings (Đại diện DUY NHẤT bằng Part 'center')
	if filter.IsMultiRing(part) or (part.Parent and filter.IsMultiRing(part.Parent)) or (hazardContext and filter.IsMultiRing(hazardContext)) then
		local pLower = part.Name:lower()
		if pLower == "center" or pLower:find("multiring") then
			return true
		end
		-- Chặn tuyệt đối tất cả các part con khác (ring1, ring2...) không đăng ký riêng lẻ
		return false
	end

	-- NGOẠI LỆ 2: largeIceSpikes, mediumIceSpikes, smallIceSpikes (Chỉ quét DUY NHẤT part 'precast')
	local isIceSpikes = filter.IsIceSpikes(part)
		or (part.Parent and filter.IsIceSpikes(part.Parent))
		or (hazardContext and filter.IsIceSpikes(hazardContext))

	if isIceSpikes then
		local pLower = part.Name:lower()
		-- CHỈ CHẤP NHẬN duy nhất part 'precast' (vùng cảnh báo hình tròn trên sàn)
		if pLower == "precast" or pLower:find("precast") then
			return true
		end
		-- Bỏ qua 100% tất cả các part gai nhọn, mesh phụ bên trong Model
		return false
	end

	-- NGOẠI LỆ 3: bonusBossSweepingFlames (Chỉ quét các part 'precast' ĐANG THỰC SỰ HOẠT ĐỘNG)
	local isSweepingFlames = filter.IsSweepingFlames(part)
		or (part.Parent and filter.IsSweepingFlames(part.Parent))
		or (part.Parent and part.Parent.Parent and filter.IsSweepingFlames(part.Parent.Parent))
		or (hazardContext and filter.IsSweepingFlames(hazardContext))

	if isSweepingFlames then
		local pLower = part.Name:lower()
		if pLower == "precast" then
			-- 1. Nếu part đang hiển thị rõ (Transparency <= 0.85)
			if part.Transparency <= 0.85 then
				return true
			end
			-- 2. Nếu có ParticleEmitter đang bật lửa (Enabled == true)
			local emitter = part:FindFirstChildWhichIsA("ParticleEmitter")
			if emitter and emitter.Enabled then
				return true
			end
			-- Chưa tới lượt quét -> Không đăng ký
			return false
		end
		-- Bỏ qua hitBox, PrimaryPart và các part phụ khác
		return false
	end

	-- NGOẠI LỆ 4: bonusBossMemoryModel (Quét các part Precast / PrecastGood / Hitbox khi active)
	local isMemory = filter.IsMemoryModel(part)
		or (part.Parent and filter.IsMemoryModel(part.Parent))
		or (hazardContext and filter.IsMemoryModel(hazardContext))

	if isMemory then
		local pLower = part.Name:lower()
		if pLower == "primarypart" then return false end
		if pLower:find("precast") or pLower:find("hitbox") then
			if part.Transparency <= 0.85 then
				return true
			end
			local emitter = part:FindFirstChildWhichIsA("ParticleEmitter")
			if emitter and emitter.Enabled then
				return true
			end
			return false
		end
		return false
	end

	-- NGOẠI LỆ 5: firstBossBigSpike (Material Plastic / MeshPart)
	local isBigSpike = filter.IsFirstBossBigSpike(part)
		or (part.Parent and filter.IsFirstBossBigSpike(part.Parent))
		or (hazardContext and filter.IsFirstBossBigSpike(hazardContext))

	if isBigSpike then
		local pLower = part.Name:lower()
		if pLower == "primarypart" then return false end
		return true
	end

	-- NGOẠI LỆ 6: Bouncing Orb (thirdBossBouncingOrb / bonusBossBouncingOrb)
	local isBouncingOrb = filter.IsBouncingOrb(part)
		or (part.Parent and filter.IsBouncingOrb(part.Parent))
		or (hazardContext and filter.IsBouncingOrb(hazardContext))

	if isBouncingOrb then
		local pLower = part.Name:lower()
		if pLower == "primarypart" then return false end
		if part.Transparency <= 0.85 then
			return true
		end
		return false
	end

	-- Kiểm tra độ trong suốt (bỏ qua part tàng hình / đã tan biến)
	if part.Transparency > 0.85 then
		return false
	end

	-- Mặc định: Vật liệu bắt buộc phải là NEON
	if part.Material == Enum.Material.Neon then
		return true
	end

	return false
end
filter.IsNeonHazardPart = filter.IsHazardPart

-- Tìm tất cả các Hazard Parts hợp lệ bên trong 1 đối tượng Level 1 hợp lệ
function filter.FindHazardPartsInLevel1Child(level1Child)
	local hazardParts = {}
	if not filter.IsValidLevel1WorkspaceChild(level1Child) then
		return hazardParts
	end
	if filter.IsPlayerAbility(level1Child) or filter.IsPlayerCharacter(level1Child) then
		return hazardParts
	end

	if level1Child:IsA("BasePart") then
		if filter.IsHazardPart(level1Child, level1Child) then
			table.insert(hazardParts, level1Child)
		end
	elseif level1Child:IsA("Model") then
		-- thirdBossMultiRings: Chỉ lấy đúng 1 part 'center' đại diện cho toàn bộ 7 vòng mê cung
		if filter.IsMultiRing(level1Child) then
			local centerPart = level1Child:FindFirstChild("center", true) 
				or level1Child:FindFirstChildWhichIsA("BasePart")
			if centerPart and centerPart.Name ~= "PrimaryPart" then
				table.insert(hazardParts, centerPart)
				return hazardParts
			end
		end

		-- firstBossBigSpike nếu là Model: Chỉ lấy 1 part chính duy nhất đại diện
		if filter.IsFirstBossBigSpike(level1Child) then
			local mainPart = level1Child.PrimaryPart or level1Child:FindFirstChildWhichIsA("BasePart")
			if mainPart and filter.IsHazardPart(mainPart, level1Child) then
				table.insert(hazardParts, mainPart)
				return hazardParts
			end
		end

		-- largeIceSpikes, mediumIceSpikes, smallIceSpikes: CHỈ lấy đúng 1 part 'precast' đại diện cho toàn bộ bãi gai
		if filter.IsIceSpikes(level1Child) then
			local precastPart = level1Child:FindFirstChild("precast", true)
			if precastPart and precastPart:IsA("BasePart") then
				table.insert(hazardParts, precastPart)
				return hazardParts
			end
			-- Fallback tìm part có tên chứa precast
			for _, desc in ipairs(level1Child:GetDescendants()) do
				if desc:IsA("BasePart") and desc.Name:lower():find("precast") then
					table.insert(hazardParts, desc)
					return hazardParts
				end
			end
			return hazardParts
		end

		for _, desc in ipairs(level1Child:GetDescendants()) do
			if desc:IsA("BasePart") and filter.IsHazardPart(desc, level1Child) then
				table.insert(hazardParts, desc)
			end
		end
	end

	return hazardParts
end
filter.FindNeonPartsInLevel1Child = filter.FindHazardPartsInLevel1Child

return filter
end function __DIST.b()-- HazardScannerV2 - Threat Corridor Engine (Whitelist-Based)
-- Quản lý danh sách các skill có hành lang nguy hiểm (Threat Corridor) kéo dài đón đầu.
-- Cứ skill nào có tên trong danh sách thì tự động sinh hành lang màu cam chuẩn xác.

--// Imports

local filter = __DIST.load('a')
local Players = game:GetService("Players")

--// Table
local corridor = {}

--// State
local corridorEnabled = true
local trackedCorridors = {} -- [Instance] = { fwd2D = Vector3, right2D = Vector3, yaw = number, velocityConfirmed = boolean, locked = boolean, lastBounceTime = number }

-- Helper lấy tọa độ nhân vật Player thời gian thực
local function getPlayerPos()
	local lp = Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	return root and root.Position or nil
end

-- Danh sách cấu hình Threat Corridor theo tên chuẩn hóa (lowercase, không khoảng trắng)
-- CHỈ bao gồm đúng các skill do người dùng yêu cầu:
-- Boss 1: firstBossCrissCross, firstBossSeekingSpikes, firstBossBigSpike
-- Boss 2: secondBossMovingBeam, secondBossGreenOrb, secondBossYellowOrb, secondBossRedOrb
-- Boss 3: thirdBossMissile, thirdBossBouncingOrb
-- Bonus Boss: bonusBossBouncingOrb
local CORRIDOR_SKILLS = {
	-- BOSS 1
	["firstbossbigspike"] = {
		name = "Boss 1 Big Spike",
		length = 120,
		width = 28,
		mode = "look_vector",
	},
	["firstbossseekingspikes"] = {
		name = "Boss 1 Seeking Spikes",
		length = 85,
		width = 10,
		mode = "look_vector",
	},
	["firstbosscrisscross"] = {
		name = "Boss 1 Criss Cross",
		length = 80,
		width = 8,
		mode = "look_vector",
	},

	-- BOSS 2
	["secondbossmovingbeam"] = {
		name = "Boss 2 Moving Beam",
		length = 80,
		width = 35,
		mode = "heading_or_look",
	},
	["secondbossgreenorb"] = {
		name = "Boss 2 Green Orb",
		length = 25,
		width = 10,
		mode = "homing_player",
	},
	["secondbossyelloworb"] = {
		name = "Boss 2 Yellow Orb",
		length = 25,
		width = 10,
		mode = "homing_player",
	},
	["secondbossredorb"] = {
		name = "Boss 2 Red Orb",
		length = 25,
		width = 10,
		mode = "homing_player",
	},

	-- BOSS 3
	["thirdbossmissile"] = {
		name = "Boss 3 Missile",
		length = 90,
		width = 8,
		mode = "heading_or_look",
	},
	["thirdbossbouncingorb"] = {
		name = "Boss 3 Bouncing Orb",
		length = 30,
		width = 10,
		mode = "bouncing",
	},

	-- BONUS BOSS
	["bonusbossbouncingorbbad"] = {
		name = "Bonus Boss Bouncing Orb Bad",
		length = 30,
		width = 10,
		mode = "bouncing",
	},
	["bonusbossbouncingorb"] = {
		name = "Bonus Boss Bouncing Orb",
		length = 30,
		width = 10,
		mode = "bouncing",
	},
}

-- Chuẩn hóa chuỗi (chữ thường, xóa dấu cách)
local function cleanString(str)
	if not str then return "" end
	return tostring(str):lower():gsub("%s+", "")
end

-- Lấy cấu hình Threat Corridor của 1 instance hoặc tên
function corridor.GetConfig(nameOrInstance)
	if not nameOrInstance then return nil end
	local name = typeof(nameOrInstance) == "Instance" and nameOrInstance.Name or tostring(nameOrInstance)
	local clean = cleanString(name)
	if #clean > 0 then
		for key, cfg in pairs(CORRIDOR_SKILLS) do
			if string.find(clean, key, 1, true) then
				return cfg, key
			end
		end
	end

	-- Duyệt toàn bộ tổ tiên (ancestors) lên tới Workspace/game
	if typeof(nameOrInstance) == "Instance" then
		local cur = nameOrInstance.Parent
		while cur and cur ~= workspace and cur ~= game do
			local pClean = cleanString(cur.Name)
			if #pClean > 0 then
				for key, cfg in pairs(CORRIDOR_SKILLS) do
					if string.find(pClean, key, 1, true) then
						return cfg, key
					end
				end
			end
			cur = cur.Parent
		end
	end

	return nil
end

-- Kiểm tra xem đối tượng có nằm trong danh sách Threat Corridor hay không
function corridor.IsCorridorSkill(nameOrInstance)
	return corridor.GetConfig(nameOrInstance) ~= nil
end

-- Đăng ký thêm skill mới vào danh sách
function corridor.RegisterSkill(key, config)
	if not key or type(config) ~= "table" then return end
	local cleanKey = cleanString(key)
	CORRIDOR_SKILLS[cleanKey] = {
		name = config.name or key,
		length = config.length or 60,
		width = config.width or 10,
		mode = config.mode or "look_vector",
	}
end

-- Hủy đăng ký một skill
function corridor.UnregisterSkill(key)
	if not key then return end
	local cleanKey = cleanString(key)
	CORRIDOR_SKILLS[cleanKey] = nil
end

-- Lấy toàn bộ danh sách cấu hình
function corridor.GetConfigMap()
	return CORRIDOR_SKILLS
end

-- Bật / tắt tính năng Threat Corridor
function corridor.SetEnabled(state)
	corridorEnabled = state and true or false
end

function corridor.IsEnabled()
	return corridorEnabled
end

-- Xóa bản ghi khóa hướng của 1 part/model khi despawn
function corridor.RemoveRecord(inst)
	if inst then
		trackedCorridors[inst] = nil
	end
end

-- Xóa toàn bộ bản ghi khóa hướng
function corridor.ClearAll()
	table.clear(trackedCorridors)
end

-- Helper tìm Model secondBossMovingBeam nếu part là con/hậu duệ
local function getMovingBeamModel(inst)
	if not inst then return nil end
	local cur = inst:IsA("Model") and inst or inst.Parent
	while cur and cur ~= workspace and cur ~= game do
		local pClean = cleanString(cur.Name)
		if (pClean:find("movingbeam", 1, true) or pClean:find("secondbossmovingbeam", 1, true)) and cur:IsA("Model") then
			return cur
		end
		cur = cur.Parent
	end
	return nil
end

-- Tìm duy nhất 1 part đại diện hợp lệ cho Model secondBossMovingBeam
local function getMovingBeamRepresentativePart(model)
	if not model then return nil end
	-- 1. Nếu PrimaryPart là một hazard part hợp lệ, ưu tiên PrimaryPart
	if model.PrimaryPart and filter.IsHazardPart(model.PrimaryPart, model) then
		return model.PrimaryPart
	end
	-- 2. Tìm BasePart đầu tiên trong Model thỏa mãn là hazard part hợp lệ (Neon, Transparency <= 0.85)
	for _, desc in ipairs(model:GetDescendants()) do
		if desc:IsA("BasePart") and filter.IsHazardPart(desc, model) then
			return desc
		end
	end
	-- 3. Dự phòng bất kỳ BasePart nào có trong Model
	return model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
end

-- Lấy độ rộng trực tiếp từ Ground Visualizer (shapeData) để Threat Corridor đồng bộ hoàn hảo 1:1
-- và triệt tiêu hoàn toàn hiện tượng dao động / rung lắc khi đạn xoay tròn trong không gian
local function getGroundVisualizerWidth(shapeData, cfg, modelSize)
	local baseWidth = (cfg and cfg.width) or 10
	local gWidth = 0

	if shapeData then
		-- 1. Nếu Ground Visualizer là Circle AOE hoặc có bán kính (Orb, Ball, Big Spike...):
		-- Đường kính Ground Visualizer = radius * 2
		if shapeData.radius and shapeData.radius > 0 then
			gWidth = shapeData.radius * 2
		-- 2. Nếu Ground Visualizer là Planar Box OBB (Moving Beam, Missile, Spikes, CrissCross...):
		-- Bề ngang Ground Visualizer = (halfWidth hoặc halfX) * 2
		elseif shapeData.halfWidth and shapeData.halfWidth > 0 then
			gWidth = shapeData.halfWidth * 2
		elseif shapeData.halfX and shapeData.halfX > 0 then
			gWidth = shapeData.halfX * 2
		-- 3. Trường hợp MultiRing:
		elseif shapeData.maxRadius and shapeData.maxRadius > 0 then
			gWidth = shapeData.maxRadius * 2
		elseif shapeData.coreRadius and shapeData.coreRadius > 0 then
			gWidth = shapeData.coreRadius * 2
		end
	end

	-- Đối với Model nhiều part (như secondBossMovingBeam)
	if modelSize then
		local mSpan = math.max(modelSize.X, modelSize.Z)
		if mSpan > gWidth then
			gWidth = mSpan
		end
	end

	-- Đảm bảo không nhỏ hơn baseWidth cấu hình và trong giới hạn an toàn tối đa 120 studs
	return math.clamp(math.max(baseWidth, gWidth), baseWidth, 120.0)
end

-- Tính toán hình học Threat Corridor cho Parent Model tổng thể (secondBossMovingBeam)
local function computeMovingBeamModelCorridor(model, repPart, shapeData, motionRecord, cfg)
	local ok, modelCF, modelSize = pcall(function()
		return model:GetBoundingBox()
	end)
	if not ok or not modelCF or not modelSize then
		modelCF = repPart.CFrame
		modelSize = repPart.Size
	end

	local startX = modelCF.Position.X
	local startZ = modelCF.Position.Z

	-- Hướng di chuyển và khóa hướng (tracked trên Model)
	local tracked = trackedCorridors[model]
	local fwd2D = nil
	local right2D = nil
	local yaw = nil

	if tracked and tracked.locked then
		fwd2D = tracked.fwd2D
		right2D = tracked.right2D
		yaw = tracked.yaw

		-- Nếu ban đầu khóa hướng Frame 0 trước khi kịp di chuyển,
		-- nay bắt đầu chuyển động tịnh tiến rõ rệt (speed >= 1.0 studs/s):
		-- Cập nhật 1 lần duy nhất theo vector vận tốc thực tế của thanh beam
		if not tracked.velocityConfirmed and motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
			yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked.fwd2D = fwd2D
			tracked.right2D = right2D
			tracked.yaw = yaw
			tracked.velocityConfirmed = true
		end
	else
		-- KHÓA HƯỚNG LẦN ĐẦU TIÊN (FRAME 0 LOCK CHO MODEL):
		-- 1. Ưu tiên vector vận tốc tịnh tiến nếu đã di chuyển
		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
			yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = yaw,
				velocityConfirmed = true,
				locked = true,
			}
		-- 2. Ưu tiên hướng fwd2D & right2D do shapeData đã tính toán (Section 3 Planar OBB)
		elseif shapeData and shapeData.fwd2D and shapeData.right2D and shapeData.fwd2D.Magnitude > 0.1 then
			fwd2D = shapeData.fwd2D.Unit
			right2D = shapeData.right2D.Unit
			yaw = shapeData.yaw or math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = yaw,
				velocityConfirmed = false,
				locked = true,
			}
		-- 3. Fallback theo LookVector của CFrame Model
		else
			local lv = modelCF.LookVector
			local hLv = Vector3.new(lv.X, 0, lv.Z)
			if hLv.Magnitude > 0.01 then
				fwd2D = hLv.Unit
			else
				fwd2D = Vector3.new(0, 0, -1)
			end
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
			yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = yaw,
				velocityConfirmed = false,
				locked = true,
			}
		end

		trackedCorridors[model] = tracked
	end

	-- Bề ngang bao quát toàn bộ Model của beam (Lấy trực tiếp từ Ground Visualizer / Model)
	local width = getGroundVisualizerWidth(shapeData, cfg, modelSize)

	local length = cfg.length or 80
	local halfLen = length / 2
	local centerX = startX + fwd2D.X * halfLen
	local centerZ = startZ + fwd2D.Z * halfLen
	local endX = startX + fwd2D.X * length
	local endZ = startZ + fwd2D.Z * length

	return {
		skillKey = cleanString(model.Name),
		name = cfg.name or "Boss 2 Moving Beam",
		length = length,
		width = width,
		fwd2D = fwd2D,
		right2D = right2D,
		startX = startX,
		startZ = startZ,
		centerX = centerX,
		centerZ = centerZ,
		endX = endX,
		endZ = endZ,
		yaw = yaw,
		isModelCorridor = true,
		model = model,
	}
end

-- Tính toán hình học Threat Corridor cho Part
function corridor.ComputeCorridor(part, shapeData, motionRecord)
	if not corridorEnabled or not part or not part:IsA("BasePart") or not shapeData then
		return nil
	end

	local cfg = corridor.GetConfig(part)
	if not cfg then
		return nil
	end

	-- NGOẠI LỆ CHO MOVING BEAM:
	-- secondBossMovingBeam là một Model chứa rất nhiều Part nhỏ bên trong.
	-- Ta CHỈ vẽ Threat Corridor duy nhất 1 lần theo Parent Model tổng thể (secondBossMovingBeam).
	-- Mọi part con anh em khác đều trả về nil để không vẽ đè/lệch corridor.
	local beamModel = getMovingBeamModel(part)
	if beamModel then
		local repPart = getMovingBeamRepresentativePart(beamModel)
		if part ~= repPart then
			return nil
		end
		return computeMovingBeamModelCorridor(beamModel, repPart, shapeData, motionRecord, cfg)
	end

	-- NGOẠI LỆ CHO HOMING PLAYER ORBS (secondBossGreenOrb / YellowOrb / RedOrb):
	-- Kỹ năng này luôn dí theo Player, vì vậy Threat Corridor luôn luôn chĩa thẳng về phía nhân vật Player theo thời gian thực.
	-- KHÔNG khóa cứng hướng (không dùng Frame 0 Lock) và giữ nguyên chiều dài cố định (không dùng Dynamic Length).
	if cfg.mode == "homing_player" then
		local pPos = getPlayerPos()
		if pPos then
			local toPlayer2D = Vector3.new(pPos.X - shapeData.x, 0, pPos.Z - shapeData.z)
			if toPlayer2D.Magnitude > 0.5 then
				fwd2D = toPlayer2D.Unit
			end
		end

		if not fwd2D then
			if motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			else
				local lv = part.CFrame.LookVector
				local hLv = Vector3.new(lv.X, 0, lv.Z)
				fwd2D = hLv.Magnitude > 0.01 and hLv.Unit or Vector3.new(0, 0, -1)
			end
		end

		right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
		trackedCorridors[part] = {
			fwd2D = fwd2D,
			right2D = right2D,
			yaw = yaw,
			velocityConfirmed = true,
			locked = false,
		}

		local length = cfg.length or 25
		local width = getGroundVisualizerWidth(shapeData, cfg)

		local startX = shapeData.x
		local startZ = shapeData.z
		local halfLen = length / 2
		local centerX = startX + fwd2D.X * halfLen
		local centerZ = startZ + fwd2D.Z * halfLen
		local endX = startX + fwd2D.X * length
		local endZ = startZ + fwd2D.Z * length

		return {
			skillKey = cleanString(part.Name),
			name = cfg.name,
			length = length,
			width = width,
			fwd2D = fwd2D,
			right2D = right2D,
			startX = startX,
			startZ = startZ,
			centerX = centerX,
			centerZ = centerZ,
			endX = endX,
			endZ = endZ,
			yaw = yaw,
		}
	end

	local tracked = trackedCorridors[part]
	local fwd2D = nil
	local right2D = nil
	local yaw = nil

	if tracked and tracked.locked then
		fwd2D = tracked.fwd2D
		right2D = tracked.right2D
		yaw = tracked.yaw

		-- Nếu ban đầu khóa bằng LookVector lúc chưa kịp di chuyển (Frame 0),
		-- nay bắt đầu chuyển động tịnh tiến tuyến tính rõ rệt (speed >= 1.0 studs/s):
		-- Cập nhật theo vector vận tốc thực tế rồi chốt chặt
		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			-- Tự động đảo chiều nếu phát hiện hướng bay thực tế ngược chiều với fwd2D (Dot < -0.3)
			if fwd2D:Dot(motionRecord.headingDir) < -0.3 then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
				tracked.fwd2D = fwd2D
				tracked.right2D = right2D
				tracked.yaw = yaw
				tracked.velocityConfirmed = true
			elseif not tracked.velocityConfirmed then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
				tracked.fwd2D = fwd2D
				tracked.right2D = right2D
				tracked.yaw = yaw
				tracked.velocityConfirmed = true
			end
		end

		-- Xử lý riêng cho Bouncing Orb: Nếu vừa nảy vào tường đổi hướng (Dot product giữa vận tốc mới và hướng cũ < 0.70)
		if cfg.mode == "bouncing" and motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			local newHeading = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			local now = os.clock()
			local lastBounce = tracked.lastBounceTime or 0

			-- Kiểm tra xem vector vận tốc mới có bị bẻ góc (Dot < 0.70 tương đương góc lệch > 45 độ hoặc nảy ngược)
			if fwd2D:Dot(newHeading) < 0.70 and (now - lastBounce) > 0.20 then
				fwd2D = newHeading
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))
				tracked.fwd2D = fwd2D
				tracked.right2D = right2D
				tracked.yaw = yaw
				tracked.lastBounceTime = now
				tracked.velocityConfirmed = true
			end
		end
	else
		-- KHÓA HƯỚNG LẦN ĐẦU TIÊN (FRAME 0 DIRECTION LOCK):
		-- 1. Ưu tiên vector vận tốc tịnh tiến nếu đã chuyển động (dựa trên Position nên tuyệt đối không bị xoay tròn theo mesh)
		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			tracked = {
				fwd2D = fwd2D,
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X),
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z)),
				velocityConfirmed = true,
				locked = true,
			}
		-- 2. Nếu shapeData đã tính sẵn fwd2D và right2D (ví dụ: movingBeam hoặc planar box do analyzer tính riêng)
		elseif shapeData.fwd2D and shapeData.right2D and shapeData.fwd2D.Magnitude > 0.1 then
			fwd2D = shapeData.fwd2D.Unit
			right2D = shapeData.right2D.Unit
			tracked = {
				fwd2D = fwd2D,
				right2D = right2D,
				yaw = shapeData.yaw or math.deg(math.atan2(fwd2D.X, -fwd2D.Z)),
				velocityConfirmed = false,
				locked = true,
			}
		else
			-- 3. Khóa cố định theo CFrame.LookVector tại thời điểm Frame 0 lúc vừa spawn
			local cf = part.CFrame
			local lv = cf.LookVector
			local hLv = Vector3.new(lv.X, 0, lv.Z)
			if hLv.Magnitude > 0.01 then
				fwd2D = hLv.Unit
			elseif motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
				fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			else
				fwd2D = Vector3.new(0, 0, -1)
			end
			tracked = {
				fwd2D = fwd2D,
				right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X),
				yaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z)),
				velocityConfirmed = false,
				locked = true,
			}
		end

		right2D = tracked.right2D
		yaw = tracked.yaw
		trackedCorridors[part] = tracked
	end

	-- Kích thước hành lang (Lấy trực tiếp từ Ground Visualizer, không rung lắc khi đạn xoay)
	local length = cfg.length or 60
	local width = getGroundVisualizerWidth(shapeData, cfg)

	local startX = shapeData.x
	local startZ = shapeData.z
	local halfLen = length / 2
	local centerX = startX + fwd2D.X * halfLen
	local centerZ = startZ + fwd2D.Z * halfLen
	local endX = startX + fwd2D.X * length
	local endZ = startZ + fwd2D.Z * length

	return {
		skillKey = cleanString(part.Name),
		name = cfg.name,
		length = length,
		width = width,
		fwd2D = fwd2D,
		right2D = right2D,
		startX = startX,
		startZ = startZ,
		centerX = centerX,
		centerZ = centerZ,
		endX = endX,
		endZ = endZ,
		yaw = yaw,
	}
end

-- Vận tốc mặc định (studs/s) cho các skill có Threat Corridor (nếu motion chưa kịp đo đạc)
local DEFAULT_CORRIDOR_SPEEDS = {
	["firstbossbigspike"] = 28.0,
	["firstbossseekingspikes"] = 32.0,
	["firstbosscrisscross"] = 30.0,
	["secondbossmovingbeam"] = 18.0,
	["secondbossgreenorb"] = 22.0,
	["secondbossyelloworb"] = 22.0,
	["secondbossredorb"] = 22.0,
	["thirdbossmissile"] = 35.0,
	["thirdbossbouncingorb"] = 25.0,
	["bonusbossbouncingorb"] = 25.0,
	["bonusbossbouncingorbbad"] = 25.0,
}

-- Lấy vận tốc bay thực tế hoặc mặc định của đạn trong hành lang
function corridor.GetProjectileSpeed(corridorData, motionRecord)
	if motionRecord and motionRecord.speed and motionRecord.speed >= 3.0 then
		return motionRecord.speed
	end
	if corridorData and corridorData.skillKey then
		for key, spd in pairs(DEFAULT_CORRIDOR_SPEEDS) do
			if string.find(corridorData.skillKey, key, 1, true) then
				return spd
			end
		end
	end
	return 28.0
end

-- Trích xuất các chỉ số thời gian & khoảng cách thực tế giữa một điểm (hoặc nhân vật) với đạn đang lao tới:
-- Trả về:
-- 1. isInsideGeom: có nằm trong hình học bao của hành lang không
-- 2. projU: khoảng cách dọc (longitudinal) từ đạn tới điểm (>0: đạn đang lao tới, <0: đạn đã bay qua)
-- 3. projN: khoảng cách ngang (lateral) từ tâm hành lang tới điểm (dương: lệch phải, âm: lệch trái)
-- 4. timeToImpact: thời gian (giây) đạn sẽ chạm tới mặt phẳng của điểm
-- 5. isImminent: mối nguy hiểm có CẬP KỀ không (đến ngưỡng khẩn cấp cần né, tránh "tàu cách 100km mà đã né")
-- 6. lateralEscapeDir: vector đơn vị thoát ngang tối ưu ra khỏi hành lang (vuông góc với hướng bay)
-- 7. lateralEscapeDist: cự ly cần bước ngang để thoát ra khỏi hành lang
function corridor.GetThreatMetrics(point, corridorData, motionRecord, extraRadius)
	if not point or not corridorData then
		return false, 0, 0, 999.0, false, Vector3.zero, 0
	end

	extraRadius = extraRadius or 0
	local px, pz = point.X, point.Z
	local vx = px - corridorData.startX
	local vz = pz - corridorData.startZ

	local fwd = corridorData.fwd2D
	local right = corridorData.right2D
	local halfWidth = (corridorData.width / 2) + extraRadius

	local projU = vx * fwd.X + vz * fwd.Z
	local projN = vx * right.X + vz * right.Z

	local minU = -2.5
	local maxU = corridorData.length + extraRadius

	local isInsideGeom = (projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth)
	if not isInsideGeom and extraRadius > 0 then
		local dU = 0
		if projU < minU then
			dU = minU - projU
		elseif projU > maxU then
			dU = projU - maxU
		end
		local dN = math.max(0, math.abs(projN) - (corridorData.width / 2))
		if (dU * dU + dN * dN) <= (extraRadius * extraRadius) then
			isInsideGeom = true
		end
	end

	local speed = corridor.GetProjectileSpeed(corridorData, motionRecord)
	local distAhead = math.max(0, projU)
	local timeToImpact = (speed > 0.1) and (distAhead / speed) or 999.0

	-- Cự ly cần thoát ngang khỏi mép hành lang
	local distToEdge = math.max(0, (corridorData.width / 2) - math.abs(projN))
	local lateralEscapeDist = distToEdge + 2.5

	-- Vector thoát ngang tối ưu (vuông góc với hướng bay của hành lang)
	local lateralEscapeDir
	if projN >= 0 then
		lateralEscapeDir = right
	else
		lateralEscapeDir = -right
	end

	-- Ngưỡng thời gian / khoảng cách phản xạ khẩn cấp (Imminent Lead):
	-- Ước tính với tốc độ chạy của Player ~18 studs/s
	local escapeTime = lateralEscapeDist / 18.0
	local leadTimeThreshold = math.clamp(escapeTime + 0.35, 0.85, 1.40)
	local leadDistThreshold = math.max(22.0, speed * leadTimeThreshold)

	-- Threat được coi là IMMINENT nếu:
	-- 1. Điểm nằm trong hình học bao của hành lang
	-- 2. Đạn chưa bay qua khỏi người chơi (projU >= minU)
	-- 3. Thời gian chạm đích <= leadTimeThreshold HOẶC cự ly phía trước <= leadDistThreshold
	local isImminent = isInsideGeom and (projU >= minU) and (timeToImpact <= leadTimeThreshold or projU <= leadDistThreshold)

	return isInsideGeom, projU, projN, timeToImpact, isImminent, lateralEscapeDir, lateralEscapeDist
end

-- Kiểm tra xem điểm này có đang gặp nguy hiểm CẬP KỀ (Imminent Threat) từ Threat Corridor không
function corridor.IsThreatImminent(point, corridorData, motionRecord, extraRadius)
	local _, _, _, _, isImminent = corridor.GetThreatMetrics(point, corridorData, motionRecord, extraRadius)
	return isImminent
end

-- Kiểm tra xem điểm này có nằm trên đường đạn sắp bay tới không (dùng để cấm Safe Spot trên đường ray)
function corridor.IsPointInThreatPath(point, corridorData, extraRadius)
	if not point or not corridorData then return false end
	extraRadius = extraRadius or 0
	local px, pz = point.X, point.Z
	local vx = px - corridorData.startX
	local vz = pz - corridorData.startZ
	local fwd = corridorData.fwd2D
	local right = corridorData.right2D
	local halfWidth = (corridorData.width / 2) + extraRadius

	local projU = vx * fwd.X + vz * fwd.Z
	local projN = vx * right.X + vz * right.Z

	-- Chỉ tính vùng PHÍA TRƯỚC đạn (từ đạn trở đi)
	local minU = -2.5
	local maxU = corridorData.length + extraRadius

	if extraRadius <= 0 then
		return (projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth)
	else
		local dU = 0
		if projU < minU then
			dU = minU - projU
		elseif projU > maxU then
			dU = projU - maxU
		end
		local dN = math.max(0, math.abs(projN) - (corridorData.width / 2))
		return (dU * dU + dN * dN) <= (extraRadius * extraRadius)
	end
end

-- Kiểm tra xem 1 điểm (hoặc vòng tròn bán kính extraRadius) có nằm trong Threat Corridor hay không
function corridor.IsPointInCorridor(point, corridorData, extraRadius)
	if not point or not corridorData then return false end
	extraRadius = extraRadius or 0

	local px, pz = point.X, point.Z
	local vx = px - corridorData.startX
	local vz = pz - corridorData.startZ

	local fwd = corridorData.fwd2D
	local right = corridorData.right2D
	local halfWidth = corridorData.width / 2

	-- Chiếu lên trục U (dọc theo hướng bay) và trục N (vuông góc hướng bay)
	local projU = vx * fwd.X + vz * fwd.Z
	local projN = vx * right.X + vz * right.Z

	-- Phủ lùi nhẹ 2.5 studs về sau điểm gốc để bao trọn đuôi đạn
	local minU = -2.5
	local maxU = corridorData.length

	if extraRadius <= 0 then
		return (projU >= minU and projU <= maxU and math.abs(projN) <= halfWidth)
	else
		local dU = 0
		if projU < minU then
			dU = minU - projU
		elseif projU > maxU then
			dU = projU - maxU
		end
		local dN = math.max(0, math.abs(projN) - halfWidth)
		return (dU * dU + dN * dN) <= (extraRadius * extraRadius)
	end
end

return corridor
end function __DIST.c()-- HazardScannerV2 - Shape & Color Analyzer
-- Trích xuất hình học chính xác (Circle / Box OBB) và Màu sắc phát sáng Neon thực tế từ Part.

--// Imports

local filter = __DIST.load('a')
local corridor = __DIST.load('b')

--// Table
local analyzer = {}

-- Chuyển đổi Color3 sang mã màu Hex cho Web Canvas
local function colorToHex(color)
	if not color then return "#ff2a55" end
	local r = math.clamp(math.floor(color.R * 255), 0, 255)
	local g = math.clamp(math.floor(color.G * 255), 0, 255)
	local b = math.clamp(math.floor(color.B * 255), 0, 255)
	return string.format("#%02x%02x%02x", r, g, b)
end

-- Lấy góc hướng Yaw chuẩn (0° = North/-Z, +90° = East/+X, 180° = South/+Z, -90° = West/-X)
local function getYawDegrees(cf)
	if not cf then return 0 end
	local lv = cf.LookVector
	if not lv or lv.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lv.X, -lv.Z))
end

-- Ground-Truth Data từ Dungeon Quest Studio (image2.png):
-- Core: R = 12.5 studs (Diameter 25 studs)
-- Ring 1: R_in = 12.5, R_out = 25.0, YawOffset = 180° (Side B)
-- Ring 2: R_in = 25.0, R_out = 37.5, YawOffset = 0°   (Side A)
-- Ring 3: R_in = 37.5, R_out = 50.0, YawOffset = 180° (Side B)
-- Ring 4: R_in = 50.0, R_out = 62.5, YawOffset = 0°   (Side A)
-- Ring 5: R_in = 62.5, R_out = 75.0, YawOffset = 180° (Side B)
-- Ring 6: R_in = 75.0, R_out = 87.5, YawOffset = 0°   (Side A)
-- Ring 7: R_in = 87.5, R_out = 105.0, YawOffset = 180° (Side B)
local MULTI_RINGS_GROUND_TRUTH = {
	coreRadius = 12.5,
	maxRadius = 105.0,
	rings = {
		{ rIn = 12.5, rOut = 25.0, yawOffset = 180, side = 1 },
		{ rIn = 25.0, rOut = 37.5, yawOffset = 0,   side = 0 },
		{ rIn = 37.5, rOut = 50.0, yawOffset = 180, side = 1 },
		{ rIn = 50.0, rOut = 62.5, yawOffset = 0,   side = 0 },
		{ rIn = 62.5, rOut = 75.0, yawOffset = 180, side = 1 },
		{ rIn = 75.0, rOut = 87.5, yawOffset = 0,   side = 0 },
		{ rIn = 87.5, rOut = 105.0, yawOffset = 180, side = 1 },
	}
}

-- Rời rạc hóa (tessellation) một cung tròn thành Đa giác Polygon (mảng đỉnh 2D x, z)
local function generateArcPolygon(cx, cz, rIn, rOut, centerYaw, angleSpan, steps)
	steps = steps or 12
	local vertices = {}
	local halfSpan = (angleSpan or 180) / 2
	local startDeg = centerYaw - halfSpan
	local endDeg = centerYaw + halfSpan
	local startRad = math.rad(startDeg)
	local endRad = math.rad(endDeg)
	local span = endRad - startRad

	-- Đi dọc theo cung ngoài (Outer Arc)
	for i = 0, steps do
		local a = startRad + (span * (i / steps))
		local x = cx + math.sin(a) * rOut
		local z = cz - math.cos(a) * rOut
		table.insert(vertices, { x = x, z = z })
	end

	-- Đi ngược lại dọc theo cung trong (Inner Arc)
	for i = steps, 0, -1 do
		local a = startRad + (span * (i / steps))
		local x = cx + math.sin(a) * rIn
		local z = cz - math.cos(a) * rIn
		table.insert(vertices, { x = x, z = z })
	end

	return vertices
end

-- Rời rạc hóa vòng tròn tâm thành Polygon
local function generateCirclePolygon(cx, cz, radius, steps)
	steps = steps or 16
	local vertices = {}
	for i = 0, steps - 1 do
		local a = (math.pi * 2) * (i / steps)
		local x = cx + math.sin(a) * radius
		local z = cz - math.cos(a) * radius
		table.insert(vertices, { x = x, z = z })
	end
	return vertices
end

-- Phân tích 1 Hazard Part đơn lẻ thành dạng hình học 2D chuẩn xác
local function analyzeHazardPartInternal(part, motionRecord)
	if not part or not part:IsA("BasePart") or not part.Parent then
		return nil
	end

	local size = part.Size
	local cf = part.CFrame
	local pos = cf.Position
	local yaw = getYawDegrees(cf)
	local hexColor = colorToHex(part.Color)

	-- Xử lý màu riêng cho bonusBossSweepingFlames (Lửa cam neon rực rỡ)
	if filter.IsSweepingFlames(part) or (part.Parent and filter.IsSweepingFlames(part.Parent)) or (part.Parent and part.Parent.Parent and filter.IsSweepingFlames(part.Parent.Parent)) then
		hexColor = "#ff6b22"
	end

	-- Xử lý màu riêng cho bonusBossMemoryModel (Good = Xanh lá #22ff88, Danger/Hitbox = Đỏ #ff2a55)
	if filter.IsMemoryModel(part) or (part.Parent and filter.IsMemoryModel(part.Parent)) then
		local pLower = part.Name:lower()
		if pLower:find("good") then
			hexColor = "#22ff88"
		else
			hexColor = "#ff2a55"
		end
	end

	-- Xử lý scale nếu có SpecialMesh
	local mesh = part:FindFirstChildWhichIsA("SpecialMesh", true)
	if mesh then
		local sx = math.abs(mesh.Scale.X)
		local sy = math.abs(mesh.Scale.Y)
		local sz = math.abs(mesh.Scale.Z)
		size = Vector3.new(size.X * sx, size.Y * sy, size.Z * sz)
	end

	-- 0. Nhận diện thirdBossMultiRings (Đại diện bằng Part 'center' hoặc Model)
	local pName = part.Name:lower()
	local parentName = (part.Parent and part.Parent.Name:lower()) or ""
	local isMultiRingSkill = filter.IsMultiRing(part) or filter.IsMultiRing(part.Parent) or (pName == "center" and string.find(parentName, "ring") ~= nil)

	if isMultiRingSkill then
		local centerPos = pos
		local centerPart = part
		local model = (part.Parent and part.Parent:IsA("Model")) and part.Parent or nil

		if model then
			local cObj = model:FindFirstChild("center", true)
			if cObj and cObj:IsA("BasePart") then
				centerPos = cObj.Position
				centerPart = cObj
			end
		end

		local skillYaw = yaw
		if centerPart and centerPart.CFrame then
			skillYaw = (getYawDegrees(centerPart.CFrame) + 180) % 360
		end

		local ringsList = {}
		local polygonsList = {}
		
		-- Core Polygon
		table.insert(polygonsList, generateCirclePolygon(centerPos.X, centerPos.Z, MULTI_RINGS_GROUND_TRUTH.coreRadius, 16))

		-- 7 Ground-Truth Semicircle Rings
		for idx, rDef in ipairs(MULTI_RINGS_GROUND_TRUTH.rings) do
			local ringYaw = (skillYaw + rDef.yawOffset) % 360
			local poly = generateArcPolygon(centerPos.X, centerPos.Z, rDef.rIn, rDef.rOut, ringYaw, 180, 12)
			
			table.insert(ringsList, {
				rIn = rDef.rIn,
				rOut = rDef.rOut,
				yaw = ringYaw,
				yawOffset = rDef.yawOffset,
				span = 180,
				side = rDef.side,
				polygon = poly,
			})
			table.insert(polygonsList, poly)
		end

		return {
			shape = "compound_multiring",
			x = centerPos.X,
			y = centerPos.Y,
			z = centerPos.Z,
			yaw = skillYaw,
			color = "#3cd0d0",
			transparency = part.Transparency or 0.5,
			coreRadius = MULTI_RINGS_GROUND_TRUTH.coreRadius,
			maxRadius = MULTI_RINGS_GROUND_TRUTH.maxRadius,
			rings = ringsList,
			polygons = polygonsList,
			part = part,
		}
	end

	-- 0.7. Nhận diện Ice Spikes precast (largeIceSpikes, mediumIceSpikes, smallIceSpikes): Vùng báo động gai băng hình tròn
	local isIceSpikes = filter.IsIceSpikes(part) or (part.Parent and filter.IsIceSpikes(part.Parent))
	if isIceSpikes then
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local rad = math.max(dims[2], dims[3]) / 2
		if rad < 2.0 then rad = 4.0 end
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 0.8. Nhận diện firstBossBigSpike (Boss 1): Gai xoay tròn -> Đổ bóng Hình tròn Circle
	local isBigSpike = filter.IsFirstBossBigSpike(part) or (part.Parent and filter.IsFirstBossBigSpike(part.Parent))
	if isBigSpike then
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local maxDim = math.max(dims[2], dims[3])
		local rad = math.clamp(maxDim / 2, 10.0, 35.0)
		if rad < 12.0 then rad = 14.0 end
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 0.9. Nhận diện Bouncing Orb (thirdBossBouncingOrb / bonusBossBouncingOrb): Vòng tròn Circle
	local isBouncingOrb = filter.IsBouncingOrb(part) or (part.Parent and filter.IsBouncingOrb(part.Parent))
	if isBouncingOrb then
		local dims = { size.X, size.Y, size.Z }
		table.sort(dims)
		local rad = math.max(dims[2], dims[3]) / 2
		if rad < 2.0 then rad = 4.0 end
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 1. Nếu là Ball -> Hình tròn Circle
	if part:IsA("Part") and part.Shape == Enum.PartType.Ball then
		local rad = math.max(size.X, size.Y, size.Z) / 2
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = rad,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 1.5. Nếu là Cylinder -> Chỉ là Circle nếu Cylinder ĐỨNG THẲNG
	if part:IsA("Part") and part.Shape == Enum.PartType.Cylinder then
		if math.abs(cf.RightVector.Y) > 0.75 then
			local rad = math.max(size.Y, size.Z) / 2
			return {
				shape = "circle",
				x = pos.X,
				y = pos.Y,
				z = pos.Z,
				radius = rad,
				color = hexColor,
				transparency = part.Transparency,
				part = part,
			}
		end
		-- Nếu Cylinder nằm ngang (Laser / Beam) -> Xuống mục 3 thành Box OBB!
	end

	-- 2. Nếu đĩa tròn mỏng đứng trên sàn -> Hình tròn Circle
	local maxXZ = math.max(size.X, size.Z)
	local minXZ = math.min(size.X, size.Z)
	if minXZ > 0 and (maxXZ / minXZ) <= 1.15 and not part:IsA("WedgePart") and size.Y <= math.min(size.X, size.Z) then
		return {
			shape = "circle",
			x = pos.X,
			y = pos.Y,
			z = pos.Z,
			radius = maxXZ / 2,
			color = hexColor,
			transparency = part.Transparency,
			part = part,
		}
	end

	-- 3. Hộp chữ nhật chuẩn hóa theo mặt phẳng 2D (Planar OBB Box)
	local isHorizontalCylinder = (part:IsA("Part") and part.Shape == Enum.PartType.Cylinder)
	local isMovingBeam = (pName:find("movingbeam") ~= nil) or (parentName:find("movingbeam") ~= nil)
	local isMissile = (pName:find("missile") ~= nil) or (parentName:find("missile") ~= nil)

	local fwd2D, right2D, halfWidth, halfLength

	if isMovingBeam then
		-- BOSS 2: Moving Beam (Sải ngang rộng dọc theo right2D, bề dày mỏng dọc theo fwd2D)
		halfWidth = math.max(size.X, size.Z) / 2
		halfLength = math.max(2.0, math.min(size.X, math.max(size.Y, size.Z)) / 2)

		local horizRv = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
		if horizRv.Magnitude > 0.01 then
			right2D = horizRv.Unit
		else
			right2D = Vector3.new(1, 0, 0)
		end
		fwd2D = Vector3.new(-right2D.Z, 0, right2D.X)

		if motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			if fwd2D:Dot(motionRecord.headingDir) < 0 then
				fwd2D = -fwd2D
				right2D = -right2D
			end
		end
	elseif isMissile then
		-- BOSS 3: Missile (Chiều dài dọc theo fwd2D, tiết diện ngang dọc theo right2D)
		local maxDim = math.max(size.X, math.max(size.Y, size.Z))
		local minDim = math.min(size.X, math.min(size.Y, size.Z))
		halfLength = math.max(0.5, maxDim / 2)
		halfWidth = math.max(1.5, minDim / 2)

		if motionRecord and motionRecord.speed and motionRecord.speed >= 1.0 and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 then
			fwd2D = Vector3.new(motionRecord.headingDir.X, 0, motionRecord.headingDir.Z).Unit
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		else
			local lv = cf.LookVector
			local horizLv = Vector3.new(lv.X, 0, lv.Z)
			if horizLv.Magnitude > 0.01 then
				fwd2D = horizLv.Unit
			else
				fwd2D = Vector3.new(0, 0, -1)
			end
			right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		end

		if motionRecord and motionRecord.headingDir and motionRecord.headingDir.Magnitude > 0.1 and motionRecord.speed and motionRecord.speed >= 1.0 then
			if fwd2D:Dot(motionRecord.headingDir) < 0 then
				fwd2D = -fwd2D
				right2D = -right2D
			end
		end
	elseif isHorizontalCylinder then
		local rv = cf.RightVector
		local horizRv = Vector3.new(rv.X, 0, rv.Z)
		if horizRv.Magnitude > 0.01 then
			fwd2D = horizRv.Unit
		else
			fwd2D = Vector3.new(0, 0, -1)
		end
		right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
		halfLength = math.max(0.5, size.X / 2)
		halfWidth = math.max(0.5, math.max(size.Y, size.Z) / 2)
	else
		-- Hazard tĩnh thông thường: dùng trục chuẩn LookVector và RightVector
		local halfX = math.max(0.5, size.X / 2)
		local halfZ = math.max(0.5, size.Z / 2)
		halfWidth = halfX
		halfLength = halfZ

		local lv = cf.LookVector
		local horizLv = Vector3.new(lv.X, 0, lv.Z)
		if horizLv.Magnitude > 0.01 then
			fwd2D = horizLv.Unit
		else
			fwd2D = Vector3.new(0, 0, -1)
		end
		right2D = Vector3.new(-fwd2D.Z, 0, fwd2D.X)
	end

	local planarYaw = math.deg(math.atan2(fwd2D.X, -fwd2D.Z))

	local cx, cz = pos.X, pos.Z
	local c1 = Vector3.new(cx, pos.Y, cz) + right2D * halfWidth + fwd2D * halfLength
	local c2 = Vector3.new(cx, pos.Y, cz) - right2D * halfWidth + fwd2D * halfLength
	local c3 = Vector3.new(cx, pos.Y, cz) - right2D * halfWidth - fwd2D * halfLength
	local c4 = Vector3.new(cx, pos.Y, cz) + right2D * halfWidth - fwd2D * halfLength

	local boxVertices = {
		{ x = c1.X, z = c1.Z },
		{ x = c2.X, z = c2.Z },
		{ x = c3.X, z = c3.Z },
		{ x = c4.X, z = c4.Z },
	}

	return {
		shape = "box",
		x = pos.X,
		y = pos.Y,
		z = pos.Z,
		halfX = halfWidth,
		halfZ = halfLength,
		halfWidth = halfWidth,
		halfLength = halfLength,
		fwd2D = fwd2D,
		right2D = right2D,
		yaw = planarYaw,
		vertices = boxVertices,
		color = hexColor,
		transparency = part.Transparency,
		part = part,
	}
end
function analyzer.AnalyzeHazardPart(part, motionRecord)
	local shapeData = analyzeHazardPartInternal(part, motionRecord)
	if shapeData and corridor.IsCorridorSkill(part) then
		shapeData.corridor = corridor.ComputeCorridor(part, shapeData, motionRecord)
	end
	return shapeData
end
analyzer.AnalyzeNeonPart = analyzer.AnalyzeHazardPart

return analyzer
end function __DIST.d()-- HazardScannerV2 - Neon Kinematics & Motion Engine
-- Đo lường vận tốc tịnh tiến, vận tốc góc xoay quanh trục và dự báo quỹ đạo cho các Neon Hazard Parts.

--// Imports

local Players = game:GetService("Players")

--// Table
local motion = {}

--// State
local trackedRecords = {} -- [BasePart] = { lastPos, lastYaw, lastTime, velocity, speed, angularVel, motionType }

--// Constants
local MIN_MOVING_SPEED = 2.0 -- studs/s
local MIN_SPINNING_ANGULAR_VEL = 15.0 -- degrees/s

local function getPlayerPos()
	local lp = Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	return root and root.Position or nil
end

function motion.UpdateRecord(part, currentPos, currentYaw)
	if not part or not currentPos then return nil end

	local now = os.clock()
	local record = trackedRecords[part]

	if not record then
		record = {
			part = part,
			lastPos = currentPos,
			lastYaw = currentYaw or 0,
			lastTime = now,
			velocity = Vector3.zero,
			speed = 0,
			angularVel = 0,
			headingDir = Vector3.zero,
			motionType = "STATIC",
			spawnTime = now,
		}
		trackedRecords[part] = record
		return record
	end

	local dt = now - record.lastTime
	if dt >= 0.015 then
		local deltaPos = currentPos - record.lastPos
		local deltaPos2D = Vector3.new(deltaPos.X, 0, deltaPos.Z)
		local currentSpeed = deltaPos2D.Magnitude / dt
		local currentVel = deltaPos2D / dt

		local deltaYaw = (currentYaw or 0) - record.lastYaw
		while deltaYaw > 180 do deltaYaw -= 360 end
		while deltaYaw < -180 do deltaYaw += 360 end
		local currentAngularVel = deltaYaw / dt

		record.speed = record.speed * 0.4 + currentSpeed * 0.6
		record.velocity = record.velocity * 0.4 + currentVel * 0.6
		record.angularVel = record.angularVel * 0.4 + currentAngularVel * 0.6

		if record.speed > 0.1 then
			record.headingDir = record.velocity.Unit
		end

		if record.speed >= MIN_MOVING_SPEED then
			local pPos = getPlayerPos()
			if pPos and (pPos - currentPos).Magnitude < 100 then
				local toPlayer = (pPos - currentPos).Unit
				local dot = record.headingDir:Dot(toPlayer)
				if dot > 0.85 then
					record.motionType = "HOMING"
				else
					record.motionType = "LINEAR"
				end
			else
				record.motionType = "LINEAR"
			end
			record.angularVel = 0
		elseif math.abs(record.angularVel) >= MIN_SPINNING_ANGULAR_VEL then
			record.motionType = "SPINNING"
		else
			record.motionType = "STATIC"
		end

		record.lastPos = currentPos
		record.lastYaw = currentYaw or 0
		record.lastTime = now
	end

	return record
end

function motion.GetRecord(part)
	return trackedRecords[part]
end

function motion.GetTrajectoryProjection(part, duration)
	local rec = trackedRecords[part]
	if not rec or rec.motionType == "STATIC" then
		return nil
	end

	duration = duration or 1.5
	local points = {}
	local steps = 5
	local stepTime = duration / steps

	for i = 1, steps do
		local t = i * stepTime
		if rec.motionType == "SPINNING" then
			local futureYaw = rec.lastYaw + (rec.angularVel * t)
			table.insert(points, {
				time = t,
				x = rec.lastPos.X,
				z = rec.lastPos.Z,
				yaw = futureYaw,
			})
		else
			local fPos = rec.lastPos + (rec.velocity * t)
			table.insert(points, {
				time = t,
				x = fPos.X,
				z = fPos.Z,
				yaw = rec.lastYaw,
			})
		end
	end

	return {
		motionType = rec.motionType,
		speed = rec.speed,
		angularVel = rec.angularVel,
		dirX = rec.headingDir.X,
		dirZ = rec.headingDir.Z,
		futurePoints = points,
	}
end

function motion.RemoveRecord(part)
	trackedRecords[part] = nil
end

function motion.ClearAll()
	table.clear(trackedRecords)
end

return motion
end function __DIST.e()-- HazardScannerV2 - Boss Telegraph & Animation Tracker
-- Theo dõi Boss độc lập: Bắt Animation Track đang chạy (Cast animation),
-- Tiến độ niệm chiêu (TimePosition / Length), Góc nhìn và Trạng thái chiến đấu.

--// Imports

local Workspace = game:GetService("Workspace")

--// Table
local bossWatcher = {}

--// State
local currentBossModel = nil
local lastPlayingTracks = {}
local isRunning = false

-- Tìm Model của Boss trong dungeon hoặc Workspace
local function findBossModel()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon then
		for _, child in ipairs(dungeon:GetChildren()) do
			if child:IsA("Model") then
				local hum = child:FindFirstChildOfClass("Humanoid")
				local root = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
				if hum and hum.Health > 0 and root then
					local mName = child.Name:lower()
					if string.find(mName, "boss") ~= nil or (child.Parent and string.find(child.Parent.Name:lower(), "boss") ~= nil) then
						return child, hum, root
					end
				end
			end
		end
	end
	for _, child in ipairs(Workspace:GetChildren()) do
		if child:IsA("Model") and child.Name ~= "dungeon" then
			local hum = child:FindFirstChildOfClass("Humanoid")
			local root = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
			if hum and hum.Health > 0 and root then
				local mName = child.Name:lower()
				if string.find(mName, "boss") ~= nil then
					return child, hum, root
				end
			end
		end
	end
	return nil, nil, nil
end

-- Trích xuất danh sách Animation Tracks đang phát trên Boss
local function getBossAnimationTracks(humanoid)
	local activeTracks = {}
	if not humanoid then return activeTracks end

	local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid
	local tracks = {}
	pcall(function()
		tracks = animator:GetPlayingAnimationTracks()
	end)

	for _, track in ipairs(tracks) do
		if track and track.IsPlaying and track.WeightCurrent > 0.1 then
			local animId = ""
			if track.Animation then
				animId = track.Animation.AnimationId or ""
			end
			local length = math.max(0.1, track.Length)
			local progress = math.clamp(track.TimePosition / length, 0, 1)

			table.insert(activeTracks, {
				name = track.Name or "Anim",
				animId = animId,
				speed = track.Speed,
				length = length,
				timePos = track.TimePosition,
				progress = progress,
				weight = track.WeightCurrent,
			})
		end
	end

	return activeTracks
end

-- Trích xuất góc quay Yaw (degrees)
local function getYawDegrees(lookVector)
	if not lookVector or lookVector.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lookVector.X, -lookVector.Z))
end

function bossWatcher.Start()
	isRunning = true
end

function bossWatcher.Stop()
	isRunning = false
	currentBossModel = nil
end

function bossWatcher.Update(now)
	-- Periodic check if needed
end

-- Lấy dữ liệu Boss Telegraph toàn diện cho Telemetry
function bossWatcher.GetTelegraphData()
	local model, humanoid, root = findBossModel()

	if not model or not root or not humanoid then
		return {
			active = false,
			bossIndex = 0,
			name = "None",
			x = 0, y = 0, z = 0,
			health = 0, maxHealth = 100, healthPercent = 100,
			yaw = 0,
			isCasting = false,
			activeAnimations = {},
			arenaActive = false,
			arenaCenterX = 0,
			arenaCenterZ = 0,
			arenaRadius = 80.0,
			innerDeadzoneActive = false,
			innerDeadzoneRadius = 0,
		}
	end

	local animTracks = getBossAnimationTracks(humanoid)
	local isCasting = #animTracks > 0
	local primaryAnim = animTracks[1] or nil

	return {
		active = true,
		bossIndex = 1,
		name = model.Name,
		x = math.round(root.Position.X * 10) / 10,
		y = math.round(root.Position.Y * 10) / 10,
		z = math.round(root.Position.Z * 10) / 10,
		health = math.max(0, math.round(humanoid.Health)),
		maxHealth = math.max(1, math.round(humanoid.MaxHealth)),
		healthPercent = math.clamp((humanoid.Health / humanoid.MaxHealth) * 100, 0, 100),
		yaw = math.round(getYawDegrees(root.CFrame.LookVector) * 10) / 10,
		isCasting = isCasting,
		activeAnimations = animTracks,
		primaryAnimation = primaryAnim,
		arenaActive = false,
		arenaCenterX = 0,
		arenaCenterZ = 0,
		arenaRadius = 80.0,
		innerDeadzoneActive = false,
		innerDeadzoneRadius = 0,
	}
end

bossWatcher.GetBossTelegraphData = bossWatcher.GetTelegraphData
bossWatcher.FindBossModel = findBossModel

return bossWatcher
end function __DIST.f()-- HazardScannerV2 - Bonus Boss Memory Game (Simon Says) Watcher
-- Tự động theo dõi, ghi nhớ chuỗi gợi ý (Left/Right) và hiển thị vùng an toàn thời gian thực.

--// Imports

local Workspace = game:GetService("Workspace")
local filter = __DIST.load('a')

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
end function __DIST.g()-- HazardScannerV2 - In-Game Ground Visualizer V2
-- Trực quan hóa các vùng nguy hiểm (Ground Shadows) của HazardScannerV2 trực tiếp trong Roblox 3D Viewport.
-- Khóa 100% phẳng sát mặt sàn (2D Ground Shadows), triệt tiêu hoàn toàn rung lắc và xoay tròn 3D.

--// Imports

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

--// Table
local visualizerV2 = {}

--// State
local enabled = false
local groundShadowsEnabled = false
local corridorEnabled = false
local activeVisuals = {} -- [BasePart] = { adornments = {}, part = part, lastFloorY = number }
local heartbeatConn = nil
local visualFolder = nil

--// Constants
local GROUND_THICKNESS = 0.22 -- studs
local FADE_THRESHOLD = 0.85
local DEFAULT_TRANSPARENCY = 0.48
local COLOR_YELLOW = Color3.fromRGB(255, 220, 20)
local COLOR_SAFE_GREEN = Color3.fromRGB(34, 255, 136)
local COLOR_CORRIDOR = Color3.fromRGB(255, 140, 0) -- Màu cam nổi bật cho Threat Corridor
local CORRIDOR_TRANSPARENCY = 0.60
local CORRIDOR_THICKNESS = 0.20

-- Xác định màu sắc hiển thị (Mặc định màu vàng sáng nổi bật cho toàn bộ hazard)
local function getVisualColor(shape)
	if shape and shape.color == "#22ff88" then
		return COLOR_SAFE_GREEN
	end
	return COLOR_YELLOW
end

-- Lấy điểm Y mặt sàn theo chân của Player (đơn giản, ổn định)
local function getFloorY(pos)
	local lp = Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	local hum = char and char:FindFirstChildOfClass("Humanoid")

	if root and pos and math.abs(root.Position.Y - pos.Y) < 15 then
		local halfY = (root.Size and root.Size.Y > 0) and (root.Size.Y / 2) or 1.0
		local hip = (hum and hum.HipHeight and hum.HipHeight > 0) and hum.HipHeight or 1.8
		return root.Position.Y - (hip + halfY) + 0.10
	end

	return (pos and (pos.Y - 1.5) or 0) + 0.10
end

-- Lấy Folder chứa Adornment
local function getVisualFolder()
	if visualFolder and visualFolder.Parent then
		return visualFolder
	end
	local targetParent = Workspace.Terrain or Workspace
	local existing = targetParent:FindFirstChild("HazardVisualizerV2")
	if existing then
		visualFolder = existing
		return visualFolder
	end
	local folder = Instance.new("Folder")
	folder.Name = "HazardVisualizerV2"
	local ok = pcall(function() folder.Parent = targetParent end)
	if not ok or not folder.Parent then
		pcall(function() folder.Parent = Workspace end)
	end
	visualFolder = folder
	return folder
end

-- Xóa visual của một Hazard Part
function visualizerV2.Detach(part)
	if not part then return end
	local record = activeVisuals[part]
	if not record then return end

	if record.adornments then
		for _, ad in ipairs(record.adornments) do
			pcall(function() ad:Destroy() end)
		end
		table.clear(record.adornments)
	end

	if record.corridorAdornment then
		pcall(function() record.corridorAdornment:Destroy() end)
		record.corridorAdornment = nil
	end

	activeVisuals[part] = nil
end

-- Xóa toàn bộ visual đang có
function visualizerV2.ClearAll()
	for part, _ in pairs(activeVisuals) do
		visualizerV2.Detach(part)
	end
	table.clear(activeVisuals)
	if visualFolder then
		pcall(function() visualFolder:ClearAllChildren() end)
	end
end

-- Vẽ hoặc cập nhật Visual Ground Shadow cho 1 Hazard Part
function visualizerV2.Update(part, data)
	if not enabled or not part or not part.Parent or not data then return end
	if part.Transparency > FADE_THRESHOLD then
		visualizerV2.Detach(part)
		return
	end

	local shape = data.shape
	if not shape then return end

	local pos = Vector3.new(shape.x, shape.y, shape.z)
	local floorY = getFloorY(pos)
	local color = getVisualColor(shape)
	local folder = getVisualFolder()

	local record = activeVisuals[part]
	if not record then
		record = {
			part = part,
			adornments = {},
			shapeType = shape.shape,
			lastFloorY = floorY,
		}
		activeVisuals[part] = record
	else
		record.lastFloorY = floorY
		if record.shapeType ~= shape.shape then
			for _, ad in ipairs(record.adornments) do
				pcall(function() ad:Destroy() end)
			end
			table.clear(record.adornments)
			record.shapeType = shape.shape
		end
	end

	-- 1. VẼ GROUND SHADOW (Bóng sàn 2D vàng / xanh ngọc)
	if groundShadowsEnabled then
		-- 1. HÌNH TRÒN (CIRCLE AOE)
		if shape.shape == "circle" then
		local cyl = record.adornments[1]
		if not cyl or not cyl.Parent or not cyl:IsA("CylinderHandleAdornment") then
			if cyl then
				pcall(function() cyl:Destroy() end)
			end
			cyl = Instance.new("CylinderHandleAdornment")
			cyl.Name = "GroundCircle_" .. part.Name
			cyl.Adornee = Workspace.Terrain
			cyl.AlwaysOnTop = true
			cyl.ZIndex = 2
			cyl.Transparency = DEFAULT_TRANSPARENCY
			cyl.Parent = folder
			record.adornments[1] = cyl
		end

		cyl.Radius = shape.radius or 5
		cyl.Height = GROUND_THICKNESS
		cyl.Color3 = color
		cyl.CFrame = CFrame.new(shape.x, floorY, shape.z) * CFrame.Angles(math.rad(90), 0, 0)

	-- 2. HỘP CHỮ NHẬT KHÓA MẶT SÀN (PLANAR OBB BOX - Moving Beam, Missiles, Static Boxes)
	elseif shape.shape == "box" then
		local box = record.adornments[1]
		if not box or not box.Parent or not box:IsA("BoxHandleAdornment") then
			if box then
				pcall(function() box:Destroy() end)
			end
			box = Instance.new("BoxHandleAdornment")
			box.Name = "GroundBox_" .. part.Name
			box.Adornee = Workspace.Terrain
			box.AlwaysOnTop = true
			box.ZIndex = 2
			box.Transparency = DEFAULT_TRANSPARENCY
			box.Parent = folder
			record.adornments[1] = box
		end

		local hw = shape.halfWidth or shape.halfX or 2
		local hl = shape.halfLength or shape.halfZ or 2
		local fwd = shape.fwd2D or Vector3.new(0, 0, -1)
		if fwd.Magnitude < 0.001 then
			fwd = Vector3.new(0, 0, -1)
		else
			fwd = fwd.Unit
		end
		local right = shape.right2D
		if not right or right.Magnitude < 0.001 then
			right = Vector3.new(-fwd.Z, 0, fwd.X)
		else
			right = right.Unit
		end

		box.Size = Vector3.new(hw * 2, GROUND_THICKNESS, hl * 2)
		box.Color3 = color
		local ok, cf = pcall(function()
			return CFrame.fromMatrix(Vector3.new(shape.x, floorY, shape.z), right, Vector3.yAxis, -fwd)
		end)
		if ok and cf then
			box.CFrame = cf
		else
			box.CFrame = CFrame.new(shape.x, floorY, shape.z)
		end

	-- 3. 7 VÒNG BÁN NGUYỆT CỦA BOSS 3 (COMPOUND MULTI-RINGS)
	elseif shape.shape == "compound_multiring" then
		-- Lõi tâm (Core Circle)
		local coreCyl = record.adornments[1]
		if not coreCyl or not coreCyl.Parent or not coreCyl:IsA("CylinderHandleAdornment") then
			if coreCyl then
				pcall(function() coreCyl:Destroy() end)
			end
			coreCyl = Instance.new("CylinderHandleAdornment")
			coreCyl.Name = "MultiRingCore"
			coreCyl.Adornee = Workspace.Terrain
			coreCyl.AlwaysOnTop = true
			coreCyl.ZIndex = 3
			coreCyl.Transparency = 0.45
			coreCyl.Color3 = Color3.fromRGB(255, 235, 60)
			coreCyl.Parent = folder
			record.adornments[1] = coreCyl
		end
		coreCyl.Radius = shape.coreRadius or 12.5
		coreCyl.Height = GROUND_THICKNESS
		coreCyl.CFrame = CFrame.new(shape.x, floorY, shape.z) * CFrame.Angles(math.rad(90), 0, 0)

		-- 7 Vành bán nguyệt (Mỗi vành tạo 14 cung cong tiếp tuyến BoxHandleAdornment để đường tròn mịn mượt)
		local rings = shape.rings or {}
		local adIndex = 2
		local segmentsPerRing = 14

		for _, ring in ipairs(rings) do
			local rIn = ring.rIn or 12.5
			local rOut = ring.rOut or 25.0
			local rMid = (rIn + rOut) / 2
			local bandThick = rOut - rIn
			local ringYaw = ring.yaw or 0

			local angleSpan = math.pi -- 180 độ
			local angleStep = angleSpan / segmentsPerRing
			local startAngle = math.rad(ringYaw - 90)
			local segLen = rMid * angleStep * 1.04 -- Chồng nhẹ 4% để mép khép kín hoàn hảo mà không lộ khớp nối

			for s = 1, segmentsPerRing do
				local a = startAngle + (s - 0.5) * angleStep
				local segX = shape.x + math.sin(a) * rMid
				local segZ = shape.z - math.cos(a) * rMid
				local tangent = Vector3.new(math.cos(a), 0, math.sin(a))
				local normal = Vector3.new(math.sin(a), 0, -math.cos(a))

				local segBox = record.adornments[adIndex]
				if not segBox or not segBox.Parent or not segBox:IsA("BoxHandleAdornment") then
					if segBox then
						pcall(function() segBox:Destroy() end)
					end
					segBox = Instance.new("BoxHandleAdornment")
					segBox.Name = "RingArcSeg"
					segBox.Adornee = Workspace.Terrain
					segBox.AlwaysOnTop = true
					segBox.ZIndex = 2
					segBox.Transparency = 0.55
					segBox.Color3 = COLOR_YELLOW
					segBox.Parent = folder
					record.adornments[adIndex] = segBox
				end

				segBox.Size = Vector3.new(bandThick, GROUND_THICKNESS, segLen)
				local ok, cf = pcall(function()
					return CFrame.fromMatrix(Vector3.new(segX, floorY, segZ), normal, Vector3.yAxis, -tangent)
				end)
				if ok and cf then
					segBox.CFrame = cf
				else
					segBox.CFrame = CFrame.new(segX, floorY, segZ)
				end
				adIndex += 1
			end
		end

		-- Xóa các adornment thừa nếu số lượng giảm
		for i = adIndex, #record.adornments do
			if record.adornments[i] then
				pcall(function() record.adornments[i]:Destroy() end)
				record.adornments[i] = nil
			end
		end
	end
	else
		if record and record.adornments and #record.adornments > 0 then
			for _, ad in ipairs(record.adornments) do
				pcall(function() ad:Destroy() end)
			end
			table.clear(record.adornments)
		end
	end

	-- 4. XỬ LÝ THREAT CORRIDOR (Hành lang màu cam đón đầu theo Whitelist)
	if corridorEnabled and shape.corridor then
		local corr = shape.corridor
		local cBox = record.corridorAdornment
		if not cBox or not cBox.Parent or not cBox:IsA("BoxHandleAdornment") then
			if cBox then
				pcall(function() cBox:Destroy() end)
			end
			cBox = Instance.new("BoxHandleAdornment")
			cBox.Name = "ThreatCorridor_" .. (corr.model and corr.model.Name or part.Name)
			cBox.Adornee = Workspace.Terrain
			cBox.AlwaysOnTop = true
			cBox.ZIndex = 1 -- Nằm dưới Ground Shadow (ZIndex = 2)
			cBox.Transparency = CORRIDOR_TRANSPARENCY
			cBox.Color3 = COLOR_CORRIDOR
			cBox.Parent = folder
			record.corridorAdornment = cBox
		end

		cBox.Size = Vector3.new(corr.width, CORRIDOR_THICKNESS, corr.length)
		local corridorFloorY = floorY
		if corr.isModelCorridor then
			corridorFloorY = getFloorY(Vector3.new(corr.centerX, pos.Y, corr.centerZ))
		end
		local centerPos = Vector3.new(corr.centerX, corridorFloorY, corr.centerZ)
		local targetLook = centerPos + Vector3.new(corr.fwd2D.X, 0, corr.fwd2D.Z)
		local ok, cf = pcall(function()
			return CFrame.lookAt(centerPos, targetLook)
		end)
		if ok and cf then
			cBox.CFrame = cf
		else
			cBox.CFrame = CFrame.new(centerPos)
		end
		if not cBox.Visible then
			cBox.Visible = true
		end
	else
		if record.corridorAdornment and record.corridorAdornment.Visible then
			record.corridorAdornment.Visible = false
		end
	end
end

-- Vòng lặp cập nhật liên tục mỗi frame
local function onHeartbeat()
	if not enabled then return end

	local deadParts = {}
	for part, record in pairs(activeVisuals) do
		if not part or not part:IsDescendantOf(Workspace) or part.Transparency > FADE_THRESHOLD then
			table.insert(deadParts, part)
		end
	end

	for _, dead in ipairs(deadParts) do
		visualizerV2.Detach(dead)
	end
end

local function updateActiveState()
	local shouldBeActive = groundShadowsEnabled or corridorEnabled
	if enabled == shouldBeActive then return end
	enabled = shouldBeActive

	if enabled then
		visualizerV2.ClearAll()
		if not heartbeatConn then
			heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
		end
	else
		if heartbeatConn then
			heartbeatConn:Disconnect()
			heartbeatConn = nil
		end
		visualizerV2.ClearAll()
	end
end

-- Bật / tắt Ground Visualizer V2 (Bóng sàn 2D)
function visualizerV2.SetEnabled(state)
	groundShadowsEnabled = state and true or false
	updateActiveState()
	if not groundShadowsEnabled then
		for _, rec in pairs(activeVisuals) do
			if rec.adornments then
				for _, ad in ipairs(rec.adornments) do
					pcall(function() ad:Destroy() end)
				end
				table.clear(rec.adornments)
			end
		end
	end
end

function visualizerV2.IsEnabled()
	return groundShadowsEnabled
end

-- Bật / tắt hiển thị Threat Corridor V2 (Hành lang màu cam)
function visualizerV2.SetCorridorEnabled(state)
	corridorEnabled = state and true or false
	updateActiveState()
	if not corridorEnabled then
		for _, rec in pairs(activeVisuals) do
			if rec.corridorAdornment then
				pcall(function() rec.corridorAdornment:Destroy() end)
				rec.corridorAdornment = nil
			end
		end
	end
end

function visualizerV2.IsCorridorEnabled()
	return corridorEnabled
end

return visualizerV2
end function __DIST.h()-- HazardScannerV2 - Core Hazard Detection & Telemetry Manager (Recorder Standalone Edition)
-- Tuyệt đối không chứa SafeSpot, Danger, DodgeController hay HUD Indicator.

--// Imports

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local filter = __DIST.load('a')
local analyzer = __DIST.load('c')
local motion = __DIST.load('d')
local bossWatcher = __DIST.load('e')
local memoryWatcher = __DIST.load('f')
local visualizerV2 = __DIST.load('g')
local corridor = __DIST.load('b')

--// Table
local scanner = {}

--// State
local enabled = false
local activeHazards = {} -- [BasePart] = { part, level1Parent, name, spawnTime, shape, motion }
local childConnections = {} -- [Instance] = { conn1, conn2 }
local connections = {}
local heartbeatConn = nil

-- Đăng ký 1 Hazard Part vào tập theo dõi
local function registerHazardPart(part, level1Child)
	if not part or not part:IsA("BasePart") then return end
	if filter.IsPlayerCharacter(part) or (level1Child and filter.IsPlayerCharacter(level1Child)) then return end
	if filter.IsPlayerAbility(part) or (level1Child and filter.IsPlayerAbility(level1Child)) then return end
	if not filter.IsHazardPart(part, level1Child) then return end
	if activeHazards[part] then return end

	local rootName = level1Child and level1Child.Name or (part.Parent and part.Parent.Name) or part.Name
	local isMultiRing = filter.IsMultiRing(rootName) 
		or filter.IsMultiRing(part) 
		or (part.Parent and filter.IsMultiRing(part.Parent.Name))
		or (level1Child and filter.IsMultiRing(level1Child))

	-- Đảm bảo mỗi đối tượng MultiRing chỉ có DUY NHẤT 1 Hazard trong activeHazards
	if isMultiRing then
		for p, data in pairs(activeHazards) do
			if data.level1Parent == level1Child or (level1Child and p:IsDescendantOf(level1Child)) or p == part then
				return
			end
		end
	end

	local isIceSpikes = filter.IsIceSpikes(rootName) 
		or filter.IsIceSpikes(part) 
		or (part.Parent and filter.IsIceSpikes(part.Parent.Name))
		or (level1Child and filter.IsIceSpikes(level1Child))

	-- Đảm bảo mỗi cụm IceSpikes chỉ có DUY NHẤT 1 Hazard (part 'precast') trong activeHazards
	if isIceSpikes then
		for p, data in pairs(activeHazards) do
			if data.level1Parent == level1Child or (level1Child and p:IsDescendantOf(level1Child)) or p == part then
				return
			end
		end
	end

	local shapeData = analyzer.AnalyzeHazardPart(part)
	if not shapeData then return end

	local now = os.clock()
	local pos = Vector3.new(shapeData.x, shapeData.y, shapeData.z)
	local motionRec = motion.UpdateRecord(part, pos, shapeData.yaw or 0)

	local displayName = (part.Name == rootName) and rootName or (rootName .. "/" .. part.Name)
	if isMultiRing then
		displayName = rootName
	elseif filter.IsSweepingFlames(rootName) and part.Parent and part.Parent ~= level1Child then
		displayName = rootName .. "/" .. part.Parent.Name
	elseif filter.IsMemoryModel(rootName) then
		displayName = rootName .. "/" .. part.Name
	end

	local hazardData = {
		part = part,
		level1Parent = level1Child or part,
		name = displayName,
		spawnTime = now,
		shape = shapeData,
		motion = motionRec,
	}
	activeHazards[part] = hazardData

	if visualizerV2.IsEnabled() or visualizerV2.IsCorridorEnabled() then
		visualizerV2.Update(part, hazardData)
	end
end

-- Hủy đăng ký 1 Hazard Part
local function unregisterHazardPart(part)
	local data = activeHazards[part]
	if data then
		visualizerV2.Detach(part)
		activeHazards[part] = nil
		motion.RemoveRecord(part)
		corridor.RemoveRecord(part)
		if part.Parent and part.Parent:IsA("Model") then
			corridor.RemoveRecord(part.Parent)
		end
	end
end

-- Xử lý khi một Level 1 Child được thêm vào Workspace
local function onWorkspaceChildAdded(child)
	if not filter.IsValidLevel1WorkspaceChild(child) then
		return
	end
	if filter.IsPlayerAbility(child) or filter.IsPlayerCharacter(child) then
		return
	end

	-- Tìm tất cả các Hazard Parts đang có trong đối tượng Level 1 này
	local hazardParts = filter.FindHazardPartsInLevel1Child(child)
	for _, p in ipairs(hazardParts) do
		registerHazardPart(p, child)
	end

	-- Nếu là Model, lắng nghe thêm DescendantAdded để bắt kịp các Part xuất hiện trễ
	if child:IsA("Model") then
		childConnections[child] = child.DescendantAdded:Connect(function(desc)
			if desc:IsA("BasePart") then
				if filter.IsPlayerAbility(desc) or filter.IsPlayerAbility(child) then
					return
				end
				if filter.IsPlayerCharacter(desc) or filter.IsPlayerCharacter(child) then
					return
				end
				if filter.IsMultiRing(child) or filter.IsIceSpikes(child) then
					local alreadyRegistered = false
					for p, data in pairs(activeHazards) do
						if data.level1Parent == child or p:IsDescendantOf(child) or p == child then
							alreadyRegistered = true
							break
						end
					end
					if not alreadyRegistered and filter.IsHazardPart(desc, child) then
						registerHazardPart(desc, child)
					end
				elseif filter.IsHazardPart(desc, child) then
					registerHazardPart(desc, child)
				end
			end
		end)
	end
end

-- Xử lý khi một Level 1 Child bị xóa khỏi Workspace
local function onWorkspaceChildRemoved(child)
	if childConnections[child] then
		childConnections[child]:Disconnect()
		childConnections[child] = nil
	end

	local toRemove = {}
	for part, data in pairs(activeHazards) do
		if data.level1Parent == child or part == child or (child:IsA("Instance") and part:IsDescendantOf(child)) then
			table.insert(toRemove, part)
		end
	end

	for _, p in ipairs(toRemove) do
		unregisterHazardPart(p)
	end

	corridor.RemoveRecord(child)
end

-- Quét toàn bộ các đối tượng Level 1 đang có trong Workspace
local function scanExistingWorkspaceChildren()
	for _, child in ipairs(Workspace:GetChildren()) do
		if filter.IsValidLevel1WorkspaceChild(child) then
			local parts = filter.FindHazardPartsInLevel1Child(child)
			for _, p in ipairs(parts) do
				registerHazardPart(p, child)
			end
		end
	end
end

-- Cập nhật động học thời gian thực & Dọn dẹp hazard đã biến mất/hết hạn
local function onHeartbeat()
	if not enabled then return end

	local deadList = {}
	local now = os.clock()

	-- Cập nhật bộ theo dõi Memory Game của Bonus Boss
	memoryWatcher.Update(now)

	for part, data in pairs(activeHazards) do
		-- 1. Kiểm tra tồn tại trong Workspace Hierarchy
		if not part or not part:IsDescendantOf(Workspace) then
			table.insert(deadList, part)
			continue
		end

		if data.level1Parent and not data.level1Parent:IsDescendantOf(Workspace) then
			table.insert(deadList, part)
			continue
		end

		local isMultiRing = filter.IsMultiRing(data.name) 
			or filter.IsMultiRing(part) 
			or (data.level1Parent and filter.IsMultiRing(data.level1Parent))

		local isSweepingFlames = filter.IsSweepingFlames(data.name)
			or filter.IsSweepingFlames(part)
			or (data.level1Parent and filter.IsSweepingFlames(data.level1Parent))

		local isMemoryModel = filter.IsMemoryModel(data.name)
			or filter.IsMemoryModel(part)
			or (data.level1Parent and filter.IsMemoryModel(data.level1Parent))

		local isBigSpike = filter.IsFirstBossBigSpike(data.name)
			or filter.IsFirstBossBigSpike(part)
			or (data.level1Parent and filter.IsFirstBossBigSpike(data.level1Parent))

		-- 2. Kiểm tra sống/chết cho MultiRing
		if isMultiRing then
			local age = now - data.spawnTime
			if age > 4.5 then
				table.insert(deadList, part)
				continue
			end

			local model = (data.level1Parent and data.level1Parent:IsA("Model") and data.level1Parent) 
				or (part.Parent and part.Parent:IsA("Model") and part.Parent)

			if model then
				local hasVisiblePart = false
				for _, desc in ipairs(model:GetDescendants()) do
					if desc:IsA("BasePart") and desc.Name ~= "PrimaryPart" then
						if desc.Transparency <= 0.85 then
							hasVisiblePart = true
							break
						end
					end
				end
				if not hasVisiblePart then
					table.insert(deadList, part)
					continue
				end
			elseif part.Transparency > 0.85 then
				table.insert(deadList, part)
				continue
			end
		elseif isSweepingFlames then
			local isStillActive = false
			if part.Transparency <= 0.85 then
				isStillActive = true
			else
				local emitter = part:FindFirstChildWhichIsA("ParticleEmitter")
				if emitter and emitter.Enabled then
					isStillActive = true
				end
			end

			local age = now - data.spawnTime
			if not isStillActive or age > 2.0 then
				table.insert(deadList, part)
				continue
			end
		elseif isMemoryModel then
			local isStillActive = false
			if part.Transparency <= 0.85 then
				isStillActive = true
			else
				local emitter = part:FindFirstChildWhichIsA("ParticleEmitter")
				if emitter and emitter.Enabled then
					isStillActive = true
				end
			end

			local age = now - data.spawnTime
			if not isStillActive or age > 2.5 then
				table.insert(deadList, part)
				continue
			end
		elseif isBigSpike then
			local isStillActive = false
			if part.Transparency <= 0.85 then
				isStillActive = true
			else
				local beamPart = Workspace:FindFirstChild("firstBossBeamPart")
				if beamPart then
					isStillActive = true
				end
			end

			local age = now - data.spawnTime
			if not isStillActive or age > 5.0 then
				table.insert(deadList, part)
				continue
			end
		else
			-- 3. Hazard thông thường: Bỏ nếu độ trong suốt > 0.85
			if part.Transparency > 0.85 then
				table.insert(deadList, part)
				continue
			end
		end

		-- 4. Cập nhật phân tích hình học & chuyển động
		local existingRec = motion.GetRecord(part)
		local shapeData = analyzer.AnalyzeHazardPart(part, existingRec)
		if shapeData then
			data.shape = shapeData
			local pos = Vector3.new(shapeData.x, shapeData.y, shapeData.z)
			data.motion = motion.UpdateRecord(part, pos, shapeData.yaw or 0)
			if visualizerV2.IsEnabled() or visualizerV2.IsCorridorEnabled() then
				visualizerV2.Update(part, data)
			end
		else
			table.insert(deadList, part)
		end
	end

	for _, dead in ipairs(deadList) do
		unregisterHazardPart(dead)
	end

	-- 5. Quét định kỳ bổ sung các part sinh trễ trong Model đặc biệt
	for _, child in ipairs(Workspace:GetChildren()) do
		if filter.IsSweepingFlames(child) and child:IsA("Model") then
			for _, desc in ipairs(child:GetDescendants()) do
				if desc:IsA("BasePart") and desc.Name:lower() == "precast" and not activeHazards[desc] then
					if filter.IsHazardPart(desc, child) then
						registerHazardPart(desc, child)
					end
				end
			end
		elseif filter.IsMemoryModel(child) and child:IsA("Model") then
			for _, desc in ipairs(child:GetDescendants()) do
				if desc:IsA("BasePart") and not activeHazards[desc] then
					if filter.IsHazardPart(desc, child) then
						registerHazardPart(desc, child)
					end
				end
			end
		elseif filter.IsFirstBossBigSpike(child) then
			local parts = filter.FindHazardPartsInLevel1Child(child)
			for _, p in ipairs(parts) do
				if not activeHazards[p] and filter.IsHazardPart(p, child) then
					registerHazardPart(p, child)
				end
			end
		end
	end
end

-- Khởi động bộ quét
function scanner.StartScan()
	if enabled then return end
	enabled = true

	table.clear(activeHazards)
	table.clear(childConnections)
	motion.ClearAll()
	memoryWatcher.Reset()

	table.insert(connections, Workspace.ChildAdded:Connect(onWorkspaceChildAdded))
	table.insert(connections, Workspace.ChildRemoved:Connect(onWorkspaceChildRemoved))

	heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)

	scanExistingWorkspaceChildren()
end
scanner.Start = scanner.StartScan

-- Dừng bộ quét
function scanner.StopScan()
	if not enabled then return end
	enabled = false

	if heartbeatConn then
		heartbeatConn:Disconnect()
		heartbeatConn = nil
	end

	for _, conn in ipairs(connections) do
		if conn and conn.Disconnect then
			conn:Disconnect()
		end
	end
	table.clear(connections)

	for _, conn in pairs(childConnections) do
		if conn and conn.Disconnect then
			conn:Disconnect()
		end
	end
	table.clear(childConnections)

	visualizerV2.ClearAll()
	table.clear(activeHazards)
	motion.ClearAll()
	corridor.ClearAll()
	memoryWatcher.Reset()
end
scanner.Stop = scanner.StopScan

function scanner.IsEnabled()
	return enabled
end

function scanner.SetVisualizerEnabled(state)
	if state and not scanner.IsEnabled() then
		scanner.StartScan()
	end
	visualizerV2.SetEnabled(state)
	visualizerV2.SetCorridorEnabled(state)
	if visualizerV2.IsEnabled() or visualizerV2.IsCorridorEnabled() then
		for part, data in pairs(activeHazards) do
			visualizerV2.Update(part, data)
		end
	end
end

function scanner.IsVisualizerEnabled()
	return visualizerV2.IsEnabled()
end

-- Trích xuất Telemetry chuẩn hóa gửi qua WebSocket
function scanner.GetActiveHazardsTelemetry()
	local list = {}
	local now = os.clock()

	for part, data in pairs(activeHazards) do
		local shape = data.shape
		if not shape then continue end

		local trajProj = motion.GetTrajectoryProjection(part, 1.5)
		local age = now - data.spawnTime

		if shape.shape == "compound_multiring" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "compound_multiring",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				yaw = shape.yaw or 0,
				coreRadius = shape.coreRadius or 12.5,
				maxRadius = shape.maxRadius or 105.0,
				rings = shape.rings,
				polygons = shape.polygons,
				color = shape.color or "#3cd0d0",
				transparency = shape.transparency or 0.5,
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		elseif shape.shape == "circle" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "circle",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				radius = shape.radius,
				color = shape.color or "#ff2a55",
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		elseif shape.shape == "box" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "box",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				halfX = shape.halfX,
				halfZ = shape.halfZ,
				halfWidth = shape.halfWidth or shape.halfX,
				halfLength = shape.halfLength or shape.halfZ,
				width = (shape.halfWidth and shape.halfWidth * 2) or (shape.halfX and shape.halfX * 2) or shape.width or 10,
				length = (shape.halfLength and shape.halfLength * 2) or (shape.halfZ and shape.halfZ * 2) or shape.length or 10,
				fwd2D = shape.fwd2D,
				right2D = shape.right2D,
				yaw = shape.yaw,
				vertices = shape.vertices,
				color = shape.color or "#ff2a55",
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		elseif shape.shape == "polygon" then
			table.insert(list, {
				id = tostring(part),
				name = data.name,
				shape = "polygon",
				x = shape.x,
				y = shape.y,
				z = shape.z,
				vertices = shape.vertices,
				color = shape.color or "#ff2a55",
				age = age,
				motionType = data.motion and data.motion.motionType or "STATIC",
				speed = data.motion and data.motion.speed or 0,
				angularVel = data.motion and data.motion.angularVel or 0,
				trajectory = trajProj,
				corridor = shape.corridor,
			})
		end
	end

	return list
end

-- Lấy Boss & Animation Telegraph Telemetry
function scanner.GetBossTelegraphTelemetry()
	return bossWatcher.GetBossTelegraphData()
end

-- Lấy Dữ liệu Simon-Says Memory Dance Telemetry
function scanner.GetMemoryGameTelemetry()
	return memoryWatcher.GetMemoryTelemetry()
end

return scanner
end function __DIST.i()--// Observer: Ghi nhận vi mô toàn bộ hành vi di chuyển và phản xạ của Player (Read-Only)
--// Thu thập trực tiếp MoveDirection, LinearVelocity, Yaw, Jump, và tương quan với Hazards.


local Players = game:GetService("Players")

local observer = {}

local function getYawDegrees(lookVector)
	if not lookVector or lookVector.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lookVector.X, -lookVector.Z))
end

-- Tính toán xem điểm P có nằm trong vùng nguy hiểm không và khoảng cách tới tâm/mép
local function evaluateHazardOverlap(playerX, playerZ, hazard)
	if not hazard or not hazard.x or not hazard.z then
		return false, 99999, 99999
	end

	local dx = playerX - hazard.x
	local dz = playerZ - hazard.z
	local distCenter = math.sqrt(dx * dx + dz * dz)
	local shapeName = tostring(hazard.shape):lower()

	if shapeName == "circle" then
		local rad = hazard.radius or 10
		local inHazard = distCenter <= rad
		local distEdge = distCenter - rad -- âm nếu ở trong, dương nếu ở ngoài
		return inHazard, distCenter, distEdge
	elseif shapeName == "compound_multiring" then
		local maxRad = hazard.maxRadius or 105
		local inHazard = distCenter <= maxRad
		local distEdge = distCenter - maxRad
		return inHazard, distCenter, distEdge
	else
		-- Dạng Box OBB xoay theo Yaw
		local yawRad = math.rad(hazard.yaw or 0)
		local cosY = math.cos(-yawRad)
		local sinY = math.sin(-yawRad)
		local localX = math.abs(dx * cosY - dz * sinY)
		local localZ = math.abs(dx * sinY + dz * cosY)

		local halfW = (hazard.halfWidth or hazard.halfX or (hazard.width and hazard.width / 2) or 5)
		local halfL = (hazard.halfLength or hazard.halfZ or (hazard.length and hazard.length / 2) or 5)

		local inHazard = (localX <= halfW) and (localZ <= halfL)
		local edgeDx = math.max(0, localX - halfW)
		local edgeDz = math.max(0, localZ - halfL)
		local distEdge = inHazard and -math.min(halfW - localX, halfL - localZ) or math.sqrt(edgeDx * edgeDx + edgeDz * edgeDz)

		return inHazard, distCenter, distEdge
	end
end

-- Lấy mẫu toàn diện của Player tại thời điểm t (được bọc an toàn tuyệt đối)
function observer.Sample(activeHazards, bossData)
	local lp = Players.LocalPlayer
	local char = lp and lp.Character
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
	local hum = char and char:FindFirstChildOfClass("Humanoid")

	if not root or not hum then
		return nil
	end

	local pos = root.Position
	local lookVec = root.CFrame.LookVector
	local yaw = getYawDegrees(lookVec)
	local moveDir = hum.MoveDirection or Vector3.zero
	local vel = Vector3.zero
	pcall(function()
		vel = root.AssemblyLinearVelocity or root.Velocity or Vector3.zero
	end)

	-- Đánh giá tương quan với tất cả các hazards
	local inDanger = false
	local nearestHazard = nil
	local minEdgeDist = 99999
	local minCenterDist = 99999

	if activeHazards and #activeHazards > 0 then
		for _, h in ipairs(activeHazards) do
			local inside, dCenter, dEdge = evaluateHazardOverlap(pos.X, pos.Z, h)
			if inside then
				inDanger = true
			end
			if dEdge < minEdgeDist then
				minEdgeDist = dEdge
				minCenterDist = dCenter
				nearestHazard = {
					name = h.name or "Hazard",
					shape = h.shape or "box",
					distEdge = math.round(dEdge * 10) / 10,
					distCenter = math.round(dCenter * 10) / 10,
				}
			end
		end
	end

	-- Đánh giá tương quan với Boss (chỉ khi có Boss active)
	local bossRelation = nil
	if bossData and bossData.active and bossData.x and bossData.z then
		local bdx = bossData.x - pos.X
		local bdz = bossData.z - pos.Z
		local bossDist = math.sqrt(bdx * bdx + bdz * bdz)
		local angleToBoss = math.deg(math.atan2(bdx, -bdz))
		local deltaYaw = (yaw - angleToBoss)
		if deltaYaw > 180 then deltaYaw = deltaYaw - 360 elseif deltaYaw < -180 then deltaYaw = deltaYaw + 360 end

		bossRelation = {
			name = bossData.name or "Boss",
			distance = math.round(bossDist * 10) / 10,
			angleToBoss = math.round(deltaYaw * 10) / 10, -- 0° = đang nhìn thẳng Boss
			bossHp = bossData.health or bossData.hp or 0,
			bossMaxHp = bossData.maxHealth or bossData.maxHp or 100,
		}
	end

	return {
		player = {
			name = lp.Name or "Player",
			x = math.round(pos.X * 10) / 10,
			y = math.round(pos.Y * 10) / 10,
			z = math.round(pos.Z * 10) / 10,
			yaw = math.round(yaw * 10) / 10,
			moveX = math.round((moveDir.X or 0) * 1000) / 1000,
			moveZ = math.round((moveDir.Z or 0) * 1000) / 1000,
			moveMagnitude = math.round(Vector3.new(moveDir.X or 0, 0, moveDir.Z or 0).Magnitude * 1000) / 1000,
			velX = math.round((vel.X or 0) * 10) / 10,
			velY = math.round((vel.Y or 0) * 10) / 10,
			velZ = math.round((vel.Z or 0) * 10) / 10,
			speed = math.round(Vector3.new(vel.X or 0, 0, vel.Z or 0).Magnitude * 10) / 10,
			walkSpeed = hum.WalkSpeed or 16,
			health = math.round(hum.Health or 100),
			maxHealth = math.round(hum.MaxHealth or 100),
			isJumping = hum.Jump or ((vel.Y or 0) > 5),
		},
		danger = {
			inDanger = inDanger,
			nearestHazard = nearestHazard,
		},
		boss = bossRelation,
	}
end

return observer
end function __DIST.j()--// Logger: Flight Data Recorder & WebSocket Telemetry Streamer
--// Sử dụng trực tiếp Scanner tinh gọn. Tuyệt đối KHÔNG nạp SafeSpot hay Danger HUD Indicator.


local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local scanner = __DIST.load('h')
local observer = __DIST.load('i')

local logger = {}

--// State
local isInitialized = false
local isRecording = false
local recordingStartTime = 0
local frameIndex = 0
local buffer = {}
local targetFps = 30
local lastSampleTime = 0
local heartbeatConn = nil
local wsConn = nil
local wsUrl = "ws://127.0.0.1:8765"
local wsStreamEnabled = true
local wsStatus = "Disconnected"
local lastSavedFilePath = nil

-- Callbacks
local statsChangedCallbacks = {}

local function notifyStatsChanged()
	local stats = logger.GetStats()
	for _, cb in ipairs(statsChangedCallbacks) do
		pcall(cb, stats)
	end
end

--// WebSocket Helper
local function getWebSocketConnectFunction()
	if typeof(WebSocket) == "table" and typeof(WebSocket.connect) == "function" then
		return WebSocket.connect
	elseif typeof(WebSocket) == "table" and typeof(WebSocket.Connect) == "function" then
		return WebSocket.Connect
	elseif typeof(websocket) == "table" and typeof(websocket.connect) == "function" then
		return websocket.connect
	elseif typeof(syn) == "table" and typeof(syn.websocket) == "table" and typeof(syn.websocket.connect) == "function" then
		return syn.websocket.connect
	end
	return nil
end

local function safeWsSend(ws, data)
	if not ws then return false end
	if typeof(ws.Send) == "function" then
		return pcall(function() ws:Send(data) end)
	elseif typeof(ws.send) == "function" then
		return pcall(function() ws:send(data) end)
	end
	return false
end

function logger.ConnectWebSocket()
	if not wsStreamEnabled then return end
	if wsConn then return end

	local connectFn = getWebSocketConnectFunction()
	if not connectFn then
		wsStatus = "Unsupported"
		notifyStatsChanged()
		return
	end

	wsStatus = "Connecting"
	notifyStatsChanged()
	task.spawn(function()
		local success, socket = pcall(connectFn, wsUrl)
		if success and socket then
			wsConn = socket
			wsStatus = "Connected"
			if socket.OnClose then
				socket.OnClose:Connect(function()
					wsConn = nil
					wsStatus = "Disconnected"
					notifyStatsChanged()
				end)
			end
			if socket.OnError then
				socket.OnError:Connect(function()
					wsConn = nil
					wsStatus = "Error"
					notifyStatsChanged()
				end)
			end
		else
			wsConn = nil
			wsStatus = "Disconnected"
		end
		notifyStatsChanged()
	end)
end

function logger.DisconnectWebSocket()
	if wsConn then
		pcall(function()
			if typeof(wsConn.Close) == "function" then wsConn:Close()
			elseif typeof(wsConn.close) == "function" then wsConn:close() end
		end)
		wsConn = nil
		wsStatus = "Disconnected"
		notifyStatsChanged()
	end
end

local function getYawDegrees(lookVector)
	if not lookVector or lookVector.Magnitude < 0.001 then return 0 end
	return math.deg(math.atan2(lookVector.X, -lookVector.Z))
end

local function getEnemiesTelemetry()
	local list = {}
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon then
		for _, child in ipairs(dungeon:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChildOfClass("Humanoid") then
				local hum = child:FindFirstChildOfClass("Humanoid")
				local root = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
				if hum and hum.Health > 0 and root then
					local mName = child.Name
					table.insert(list, {
						name = mName,
						x = math.round(root.Position.X * 10) / 10,
						y = math.round(root.Position.Y * 10) / 10,
						z = math.round(root.Position.Z * 10) / 10,
						yaw = math.round(getYawDegrees(root.CFrame.LookVector) * 10) / 10,
						health = math.round(hum.Health),
						maxHealth = math.round(hum.MaxHealth),
						isBoss = string.find(mName:lower(), "boss") ~= nil,
					})
				end
			end
		end
	end
	return list
end

local function getCurrentDungeonName()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon and dungeon:FindFirstChild("dungeonName") then
		local val = dungeon.dungeonName.Value
		if typeof(val) == "string" and #val > 0 then return val end
	end
	return "DungeonQuest"
end

local function getCurrentRoomIndex()
	local dungeon = Workspace:FindFirstChild("dungeon")
	if dungeon and dungeon:FindFirstChild("currentRoom") then
		local val = dungeon.currentRoom.Value
		if typeof(val) == "number" then return val end
	end
	return 0
end

local function onHeartbeat()
	pcall(function()
		local now = os.clock()
		local interval = 1 / targetFps
		if (now - lastSampleTime) < interval then
			return
		end
		lastSampleTime = now

		-- Cập nhật dữ liệu từ Scanner
		local hazards = scanner.GetActiveHazardsTelemetry()
		local boss = scanner.GetBossTelegraphTelemetry()
		local mobs = getEnemiesTelemetry()
		local memory = scanner.GetMemoryGameTelemetry and scanner.GetMemoryGameTelemetry() or nil

		-- Lấy mẫu hành vi nhân vật
		local sample = observer.Sample(hazards, boss)
		if not sample then
			local lp = Players.LocalPlayer
			sample = {
				player = {
					name = lp and lp.Name or "Player",
					x = 0, y = 0, z = 0, yaw = 0,
					moveX = 0, moveZ = 0, moveMagnitude = 0,
					velX = 0, velY = 0, velZ = 0, speed = 0,
					walkSpeed = 16, health = 100, maxHealth = 100, isJumping = false,
				},
				danger = { inDanger = false, nearestHazard = nil },
				boss = nil,
			}
		end

		if isRecording then
			frameIndex = frameIndex + 1
			local frameData = {
				f = frameIndex,
				t = math.round((now - recordingStartTime) * 1000) / 1000,
				player = sample.player,
				danger = sample.danger,
				boss = boss,
				hazards = hazards,
				memory = memory,
				mobsCount = #mobs,
			}
			if #buffer < 40000 then
				table.insert(buffer, frameData)
			end
		end

		-- Stream gói Telemetry chuẩn V2 sang Web 2D Radar liên tục
		if wsConn and wsStatus == "Connected" then
			local isInvuln, invulnReason = false, nil
			local lp = Players.LocalPlayer
			if lp and lp.Character and lp.Character:FindFirstChildOfClass("ForceField") then
				isInvuln = true
				invulnReason = "ForceField"
			end

			local telemetryPacket = {
				type = "TELEMETRY",
				version = "V2",
				timestamp = now,
				dungeon = getCurrentDungeonName(),
				inLobby = (Workspace:FindFirstChild("dungeon") == nil),
				room = getCurrentRoomIndex(),
				player = {
					name = sample.player.name,
					x = sample.player.x,
					y = sample.player.y,
					z = sample.player.z,
					yaw = sample.player.yaw,
					moveX = sample.player.moveX,
					moveZ = sample.player.moveZ,
					health = sample.player.health,
					maxHealth = sample.player.maxHealth,
					healthPercent = math.clamp((sample.player.health / math.max(1, sample.player.maxHealth)) * 100, 0, 100),
					isInvulnerable = isInvuln,
					invulnReason = invulnReason,
					isDead = sample.player.health <= 0,
				},
				boss = boss,
				enemies = mobs,
				hazards = hazards,
				memory = memory,
			}

			pcall(function()
				safeWsSend(wsConn, HttpService:JSONEncode(telemetryPacket))
			end)
		end

		local ticker = isRecording and frameIndex or math.floor(now * 4)
		if ticker % 6 == 0 then
			notifyStatsChanged()
		end
	end)
end

-- Khởi tạo Engine (quét & stream ngầm)
function logger.Init()
	if isInitialized then return end
	isInitialized = true

	scanner.Start()
	logger.ConnectWebSocket()

	if not heartbeatConn then
		heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
	end
end

-- API Ghi chép (Record)
function logger.Start()
	logger.Init()
	if isRecording then return end
	isRecording = true
	recordingStartTime = os.clock()
	frameIndex = 0
	table.clear(buffer)
	lastSavedFilePath = nil
	notifyStatsChanged()
end

function logger.Stop()
	if not isRecording then return end
	isRecording = false
	notifyStatsChanged()
end

function logger.Clear()
	table.clear(buffer)
	frameIndex = 0
	lastSavedFilePath = nil
	notifyStatsChanged()
end

function logger.SaveToFile(customName)
	if #buffer == 0 then
		return false, "Buffer trống, chưa có dữ liệu nào được ghi!"
	end

	local now = os.date("!*t")
	local timeStr = string.format("%04d%02d%02d_%02d%02d%02d", now.year, now.month, now.day, now.hour, now.min, now.sec)
	local mapName = getCurrentDungeonName():gsub("%s+", "_"):gsub("[^%w_]", "")
	local fileName = customName or string.format("DQ_FlightLog_%s_%s.json", mapName, timeStr)
	local folderName = "DQ_FlightLogs"

	pcall(function()
		if typeof(makefolder) == "function" then
			makefolder(folderName)
		end
	end)

	local fullPath = folderName .. "/" .. fileName
	local sessionPayload = {
		metadata = {
			game = "DungeonQuest",
			dungeon = getCurrentDungeonName(),
			room = getCurrentRoomIndex(),
			date = os.date("%Y-%m-%d %H:%M:%S"),
			totalFrames = #buffer,
			durationSeconds = math.round((os.clock() - recordingStartTime) * 10) / 10,
			targetFps = targetFps,
			player = Players.LocalPlayer and Players.LocalPlayer.Name or "Unknown",
		},
		frames = buffer,
	}

	local jsonStr
	local encodeOk, encodeErr = pcall(function()
		jsonStr = HttpService:JSONEncode(sessionPayload)
	end)

	if not encodeOk or not jsonStr then
		return false, "Lỗi mã hoá JSON: " .. tostring(encodeErr)
	end

	local writeOk, writeErr = pcall(function()
		if typeof(writefile) == "function" then
			writefile(fullPath, jsonStr)
			return true
		end
		error("Executor không hỗ trợ writefile")
	end)

	if writeOk then
		lastSavedFilePath = fullPath
		notifyStatsChanged()
		return true, fullPath
	else
		return false, "Lỗi ghi file: " .. tostring(writeErr)
	end
end

function logger.GetStats()
	local duration = isRecording and (os.clock() - recordingStartTime) or (#buffer > 0 and (buffer[#buffer].t or 0) or 0)
	local hazardsList = scanner.GetActiveHazardsTelemetry()
	return {
		isRecording = isRecording,
		frameCount = #buffer,
		duration = math.round(duration * 10) / 10,
		activeHazards = #hazardsList,
		wsStatus = wsStatus,
		lastSavedFilePath = lastSavedFilePath,
	}
end

function logger.SetFps(fps)
	targetFps = math.clamp(fps or 30, 10, 60)
end

function logger.GetFps()
	return targetFps
end

function logger.SetWsUrl(url)
	wsUrl = url or "ws://127.0.0.1:8765"
end

function logger.GetWsUrl()
	return wsUrl
end

function logger.ToggleWsStream(enable)
	wsStreamEnabled = enable
	if enable then
		logger.ConnectWebSocket()
	else
		logger.DisconnectWebSocket()
	end
end

function logger.IsWsStreamEnabled()
	return wsStreamEnabled
end

function logger.OnStatsChanged(callback)
	table.insert(statsChangedCallbacks, callback)
end

function logger.Cleanup()
	logger.Stop()
	scanner.Stop()
	logger.DisconnectWebSocket()
	if heartbeatConn then
		pcall(function() heartbeatConn:Disconnect() end)
		heartbeatConn = nil
	end
	table.clear(buffer)
	table.clear(statsChangedCallbacks)
	isInitialized = false
end

return logger
end function __DIST.k()--// HUD: Giao diện nổi siêu nhỏ gọn (Mini Floating HUD) điều khiển ghi chép Flight Log
--// Hỗ trợ bật/tắt In-Game Visuals, WebSocket Radar, kéo thả và thu gọn.


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local logger = __DIST.load('j')
local scanner = __DIST.load('h')

local hud = {}
local screenGui = nil
local isMinimized = false

local function getGuiContainer()
	if typeof(gethui) == "function" then
		local ok, hui = pcall(gethui)
		if ok and hui then return hui end
	end
	local lp = Players.LocalPlayer
	if lp then
		local pgui = lp:FindFirstChild("PlayerGui")
		if pgui then return pgui end
	end
	local ok, coreGui = pcall(function() return game:GetService("CoreGui") end)
	if ok and coreGui then
		return coreGui
	end
	if lp then
		local ok, waitPgui = pcall(function() return lp:WaitForChild("PlayerGui", 3) end)
		if ok and waitPgui then return waitPgui end
	end
	return nil
end

function hud.Create()
	if screenGui then
		screenGui:Destroy()
		screenGui = nil
	end

	local container = getGuiContainer()
	if not container then
		return warn("[FlightRecorder HUD] Không tìm thấy GUI Container phù hợp.")
	end

	screenGui = Instance.new("ScreenGui")
	screenGui.Name = "Esclipse_FlightRecorder_HUD"
	screenGui.ResetOnSpawn = false
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	pcall(function()
		screenGui.Parent = container
	end)

	-- Main Container Frame
	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainCard"
	mainFrame.Size = UDim2.fromOffset(260, 245)
	mainFrame.Position = UDim2.new(0, 20, 0, 100)
	mainFrame.BackgroundColor3 = Color3.fromRGB(12, 18, 28)
	mainFrame.BorderSizePixel = 0
	mainFrame.Active = true
	mainFrame.ClipsDescendants = true
	mainFrame.Parent = screenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = mainFrame

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(30, 48, 80)
	stroke.Thickness = 1.5
	stroke.Parent = mainFrame

	-- Dragging Logic
	local dragging, dragInput, dragStart, startPos
	local function update(input)
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end

	mainFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = mainFrame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	mainFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	-- Title Bar
	local titleBar = Instance.new("Frame")
	titleBar.Size = UDim2.new(1, 0, 0, 32)
	titleBar.BackgroundColor3 = Color3.fromRGB(18, 26, 40)
	titleBar.BorderSizePixel = 0
	titleBar.Parent = mainFrame

	local titleCorner = Instance.new("UICorner")
	titleCorner.CornerRadius = UDim.new(0, 10)
	titleCorner.Parent = titleBar

	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -60, 1, 0)
	titleLabel.Position = UDim2.new(0, 12, 0, 0)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = "⚡ Flight Recorder"
	titleLabel.TextColor3 = Color3.fromRGB(0, 240, 255)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextSize = 13
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.Parent = titleBar

	-- Minimize Button
	local minBtn = Instance.new("TextButton")
	minBtn.Size = UDim2.fromOffset(24, 24)
	minBtn.Position = UDim2.new(1, -52, 0, 4)
	minBtn.BackgroundColor3 = Color3.fromRGB(28, 40, 60)
	minBtn.Text = "—"
	minBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	minBtn.Font = Enum.Font.GothamBold
	minBtn.TextSize = 12
	minBtn.Parent = titleBar

	local minBtnCorner = Instance.new("UICorner")
	minBtnCorner.CornerRadius = UDim.new(0, 6)
	minBtnCorner.Parent = minBtn

	-- Close Button
	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.fromOffset(24, 24)
	closeBtn.Position = UDim2.new(1, -26, 0, 4)
	closeBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 25)
	closeBtn.Text = "✕"
	closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 11
	closeBtn.Parent = titleBar

	local closeBtnCorner = Instance.new("UICorner")
	closeBtnCorner.CornerRadius = UDim.new(0, 6)
	closeBtnCorner.Parent = closeBtn

	-- Content Container
	local content = Instance.new("Frame")
	content.Name = "Content"
	content.Size = UDim2.new(1, -20, 1, -42)
	content.Position = UDim2.new(0, 10, 0, 36)
	content.BackgroundTransparency = 1
	content.Parent = mainFrame

	-- Status Label
	local statusLabel = Instance.new("TextLabel")
	statusLabel.Size = UDim2.new(1, 0, 0, 20)
	statusLabel.BackgroundTransparency = 1
	statusLabel.Text = "Status: ⚪ IDLE"
	statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
	statusLabel.Font = Enum.Font.GothamMedium
	statusLabel.TextSize = 12
	statusLabel.TextXAlignment = Enum.TextXAlignment.Left
	statusLabel.RichText = true
	statusLabel.Parent = content

	-- Frame Stats Label
	local framesLabel = Instance.new("TextLabel")
	framesLabel.Size = UDim2.new(1, 0, 0, 18)
	framesLabel.Position = UDim2.new(0, 0, 0, 22)
	framesLabel.BackgroundTransparency = 1
	framesLabel.Text = "Recorded: 0 frames (0.0s)"
	framesLabel.TextColor3 = Color3.fromRGB(140, 150, 170)
	framesLabel.Font = Enum.Font.Gotham
	framesLabel.TextSize = 11
	framesLabel.TextXAlignment = Enum.TextXAlignment.Left
	framesLabel.Parent = content

	-- Environment Info Label
	local envLabel = Instance.new("TextLabel")
	envLabel.Size = UDim2.new(1, 0, 0, 18)
	envLabel.Position = UDim2.new(0, 0, 0, 40)
	envLabel.BackgroundTransparency = 1
	envLabel.Text = "Hazards: 0 | Radar: Disconnected"
	envLabel.TextColor3 = Color3.fromRGB(140, 150, 170)
	envLabel.Font = Enum.Font.Gotham
	envLabel.TextSize = 11
	envLabel.TextXAlignment = Enum.TextXAlignment.Left
	envLabel.Parent = content

	-- Buttons Container
	local btnRec = Instance.new("TextButton")
	btnRec.Size = UDim2.new(1, 0, 0, 28)
	btnRec.Position = UDim2.new(0, 0, 0, 62)
	btnRec.BackgroundColor3 = Color3.fromRGB(0, 160, 90)
	btnRec.Text = "🔴 START RECORDING"
	btnRec.TextColor3 = Color3.fromRGB(255, 255, 255)
	btnRec.Font = Enum.Font.GothamBold
	btnRec.TextSize = 12
	btnRec.Parent = content

	local btnRecCorner = Instance.new("UICorner")
	btnRecCorner.CornerRadius = UDim.new(0, 6)
	btnRecCorner.Parent = btnRec

	local btnSave = Instance.new("TextButton")
	btnSave.Size = UDim2.new(0.48, 0, 0, 24)
	btnSave.Position = UDim2.new(0, 0, 0, 94)
	btnSave.BackgroundColor3 = Color3.fromRGB(30, 60, 100)
	btnSave.Text = "💾 Save JSON"
	btnSave.TextColor3 = Color3.fromRGB(200, 230, 255)
	btnSave.Font = Enum.Font.GothamMedium
	btnSave.TextSize = 11
	btnSave.Parent = content

	local btnSaveCorner = Instance.new("UICorner")
	btnSaveCorner.CornerRadius = UDim.new(0, 6)
	btnSaveCorner.Parent = btnSave

	local btnClear = Instance.new("TextButton")
	btnClear.Size = UDim2.new(0.48, 0, 0, 24)
	btnClear.Position = UDim2.new(0.52, 0, 0, 94)
	btnClear.BackgroundColor3 = Color3.fromRGB(50, 30, 40)
	btnClear.Text = "🗑 Clear Buffer"
	btnClear.TextColor3 = Color3.fromRGB(255, 180, 180)
	btnClear.Font = Enum.Font.GothamMedium
	btnClear.TextSize = 11
	btnClear.Parent = content

	local btnClearCorner = Instance.new("UICorner")
	btnClearCorner.CornerRadius = UDim.new(0, 6)
	btnClearCorner.Parent = btnClear

	local btnVisuals = Instance.new("TextButton")
	btnVisuals.Size = UDim2.new(1, 0, 0, 22)
	btnVisuals.Position = UDim2.new(0, 0, 0, 122)
	btnVisuals.BackgroundColor3 = Color3.fromRGB(40, 50, 30)
	btnVisuals.Text = "👁 In-Game 3D Visuals: OFF"
	btnVisuals.TextColor3 = Color3.fromRGB(200, 230, 150)
	btnVisuals.Font = Enum.Font.Gotham
	btnVisuals.TextSize = 10
	btnVisuals.Parent = content

	local btnVisualsCorner = Instance.new("UICorner")
	btnVisualsCorner.CornerRadius = UDim.new(0, 6)
	btnVisualsCorner.Parent = btnVisuals

	local btnWs = Instance.new("TextButton")
	btnWs.Size = UDim2.new(1, 0, 0, 22)
	btnWs.Position = UDim2.new(0, 0, 0, 148)
	btnWs.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
	btnWs.Text = "📡 Live Radar: ws://localhost:8765"
	btnWs.TextColor3 = Color3.fromRGB(150, 180, 220)
	btnWs.Font = Enum.Font.Gotham
	btnWs.TextSize = 10
	btnWs.Parent = content

	local btnWsCorner = Instance.new("UICorner")
	btnWsCorner.CornerRadius = UDim.new(0, 6)
	btnWsCorner.Parent = btnWs

	local logPathLabel = Instance.new("TextLabel")
	logPathLabel.Size = UDim2.new(1, 0, 0, 16)
	logPathLabel.Position = UDim2.new(0, 0, 0, 174)
	logPathLabel.BackgroundTransparency = 1
	logPathLabel.Text = "Ready to record."
	logPathLabel.TextColor3 = Color3.fromRGB(100, 220, 150)
	logPathLabel.Font = Enum.Font.Gotham
	logPathLabel.TextSize = 10
	logPathLabel.TextTruncate = Enum.TextTruncate.AtEnd
	logPathLabel.Parent = content

	-- Update UI State Function
	local function updateDisplay(stats)
		pcall(function()
			stats = stats or logger.GetStats()
			if stats.isRecording then
				statusLabel.Text = "Status: <font color='rgb(255,50,80)'><b>🔴 RECORDING...</b></font>"
				btnRec.Text = "⏹ STOP RECORDING"
				btnRec.BackgroundColor3 = Color3.fromRGB(180, 30, 40)
			else
				statusLabel.Text = "Status: <font color='rgb(160,160,160)'>⚪ IDLE</font>"
				btnRec.Text = "🔴 START RECORDING"
				btnRec.BackgroundColor3 = Color3.fromRGB(0, 160, 90)
			end

			framesLabel.Text = string.format("Recorded: %d frames (%.1fs)", stats.frameCount, stats.duration)
			envLabel.Text = string.format("Hazards: %d | Radar: %s", stats.activeHazards, stats.wsStatus)

			if stats.lastSavedFilePath then
				logPathLabel.Text = "Saved: " .. stats.lastSavedFilePath
			end
		end)
	end

	logger.OnStatsChanged(function(stats)
		updateDisplay(stats)
	end)

	-- Event Handlers
	btnRec.MouseButton1Click:Connect(function()
		local stats = logger.GetStats()
		if stats.isRecording then
			logger.Stop()
		else
			logger.Start()
		end
	end)

	btnSave.MouseButton1Click:Connect(function()
		local success, result = logger.SaveToFile()
		if success then
			logPathLabel.Text = "Saved: " .. tostring(result)
			logPathLabel.TextColor3 = Color3.fromRGB(0, 255, 140)
		else
			logPathLabel.Text = "Err: " .. tostring(result)
			logPathLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
	end)

	btnClear.MouseButton1Click:Connect(function()
		logger.Clear()
		logPathLabel.Text = "Buffer cleared."
		logPathLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
	end)

	btnVisuals.MouseButton1Click:Connect(function()
		local newState = not scanner.IsVisualizerEnabled()
		scanner.SetVisualizerEnabled(newState)
		btnVisuals.Text = newState and "👁 In-Game 3D Visuals: ON (Shadows)" or "👁 In-Game 3D Visuals: OFF"
		btnVisuals.BackgroundColor3 = newState and Color3.fromRGB(0, 140, 70) or Color3.fromRGB(40, 50, 30)
	end)

	btnWs.MouseButton1Click:Connect(function()
		local newState = not logger.IsWsStreamEnabled()
		logger.ToggleWsStream(newState)
		btnWs.Text = newState and "📡 Live Radar: STREAMING" or "📡 Live Radar: OFF"
	end)

	minBtn.MouseButton1Click:Connect(function()
		isMinimized = not isMinimized
		if isMinimized then
			content.Visible = false
			mainFrame.Size = UDim2.fromOffset(260, 32)
			minBtn.Text = "□"
		else
			content.Visible = true
			mainFrame.Size = UDim2.fromOffset(260, 245)
			minBtn.Text = "—"
		end
	end)

	closeBtn.MouseButton1Click:Connect(function()
		hud.Destroy()
	end)

	updateDisplay()
end

function hud.Destroy()
	if screenGui then
		screenGui:Destroy()
		screenGui = nil
	end
end

return hud
end function __DIST.l()--// DungeonQuest_Recorder: Entry Point cho Flight Data Recorder & Reverse Engineering Route
--// Thuần quan sát (Passive Read-Only), siêu nhẹ, tương thích 100% khi chạy song song với script khác.


local Players = game:GetService("Players")

local logger = __DIST.load('j')
local hud = __DIST.load('k')

return function(self)
	-- Nâng quyền thread nếu executor hỗ trợ
	pcall(function()
		local fn = setthreadidentity or set_thread_identity or setidentity or (syn and syn.set_thread_identity)
		if fn then
			local ok = pcall(fn, 7)
			if not ok then pcall(fn, 8) end
		end
	end)

	-- Chờ LocalPlayer sẵn sàng
	local localPlayer = Players.LocalPlayer
	if not localPlayer then
		local timeout = os.clock() + 5
		while not Players.LocalPlayer and os.clock() < timeout do
			task.wait(0.1)
		end
		localPlayer = Players.LocalPlayer
	end

	if not localPlayer then
		return warn("[DQ_Recorder] Failed to retrieve LocalPlayer, aborting.")
	end

	-- Khởi tạo HUD nổi TRƯỚC
	local okHud, errHud = pcall(function()
		hud.Create()
	end)
	if not okHud then
		warn("[DQ_Recorder] HUD Create Error:", tostring(errHud))
	end

	-- Khởi tạo Scanner & Telemetry loop
	local okInit, errInit = pcall(function()
		logger.Init()
	end)
	if not okInit then
		warn("[DQ_Recorder] Logger Init Error:", tostring(errInit))
	end

	-- Đăng ký Cleanup hook
	_G.ScriptHub_Cleanup = function()
		hud.Destroy()
		logger.Cleanup()
	end

	print("=======================================================")
	print("⚡ [Esclipse] DungeonQuest Flight Data Recorder Loaded!")
	print("🎯 Mode: Passive Black-Box Reverse Engineering")
	print("💡 Bật script đối thủ lên và bấm [🔴 START RECORDING] trên Mini HUD")
	print("📡 Live 2D Radar: Mở http://localhost:8765 trên trình duyệt")
	print("=======================================================")
end
end end--// EsclipseHub - Flight Data Recorder Entry Point

--// Dừng logic cũ trước khi inject

local oldCleanup = _G.ScriptHub_Cleanup
if typeof(oldCleanup) == "function" then
	pcall(oldCleanup)
end
_G.ScriptHub_Cleanup = nil

local oldUI = _G.ScriptHub_UI
if typeof(oldUI) == "table" and typeof(oldUI.Unload) == "function" then
	pcall(oldUI.Unload, oldUI)
end
_G.ScriptHub_UI = nil

--// Nạp DungeonQuest Flight Recorder trực tiếp không delay
local recorderRoute = __DIST.load('l')
recorderRoute()
