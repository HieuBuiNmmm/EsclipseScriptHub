-- HazardScannerV2 - Neon-Based Hazard Filter (with Ice Spikes Exception)
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
local services = require("@routes/DungeonQuest/core/services")

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
	local lp = services.player or Players.LocalPlayer
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
