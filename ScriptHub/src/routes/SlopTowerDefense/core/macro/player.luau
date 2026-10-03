-- Player: Module tái hiện (Playback) các thao tác SpawnTower và SellTower từ file Macro đã ghi.
local types = require("./types")
local storage = require("./storage")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local raidManager = require("@routes/SlopTowerDefense/core/game/raidManager")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")
local mapMacroManager = require("./mapMacroManager")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

export type PlaybackSnapshot = {
	IsEnabled: boolean,
	IsPlaying: boolean,
	MacroName: string?,
	CurrentStep: number,
	TotalSteps: number,
	NextAction: string,
	StatusText: string,
	TimingMode: string,
	StepDelay: number,
	ApplySpeed: boolean,
	ApplyVoteSkip: boolean,
	AutoMapSwitch: boolean,
	AutoCatchUp: boolean?,
}

local player = {}

local isEnabled = false
local isPlaying = false
local activeMacroName: string? = nil
local currentStepIndex = 0
local totalSteps = 0
local timingMode = "Hybrid" -- "Hybrid" | "Timer" | "Wave & Cash"
local stepDelay = 0.2 -- Khoảng trễ (giây) sau khi thực hiện mỗi bước
local applyMacroSpeed = true -- Bật/Tắt đồng bộ hóa Speed theo Macro
local applyMacroVoteSkip = true -- Bật/Tắt thực thi bước VoteSkip theo Macro
local autoMapSwitch = true -- Bật/Tắt tự động đổi sang Macro tương ứng với Map hiện tại trong Raid
local autoCatchUp = true -- Bật/Tắt tự động nâng bù cấp cho tháp chưa đạt level sau khi hoàn tất macro
local activePlaybackThread: thread? = nil

-- Ánh xạ giữa TowerId ("T1", "T2") và Instance tháp trong ván đấu hiện tại
local idToTowerInstance: { [string]: Instance } = {}

-- Ánh xạ giữa TowerId ("T1", "T2") và Attribute("ID") từ server game
local idToTowerAttrId: { [string]: string } = {}

-- Bảng mô phỏng danh sách tháp đang hiện diện trên sân để tính toán LayoutOrder trong UnitManager.Units
local activeTowers: { string } = {}

-- Tham chiếu RemoteFunction
local spawnRemote: RemoteFunction? = nil
local sellRemote: RemoteFunction? = nil
local upgradeRemote: RemoteFunction? = nil
local changeModeRemote: RemoteFunction? = nil
local changeSpeedRemote: RemoteFunction? = nil
local voteSkipRemote: RemoteFunction? = nil

local currentSnapshot: PlaybackSnapshot = {
	IsEnabled = false,
	IsPlaying = false,
	MacroName = nil,
	CurrentStep = 0,
	TotalSteps = 0,
	NextAction = "None",
	StatusText = "Idle",
	TimingMode = "Hybrid",
	StepDelay = 0.2,
	ApplySpeed = true,
	ApplyVoteSkip = true,
	AutoMapSwitch = true,
	AutoCatchUp = true,
}

local subscribers: { (PlaybackSnapshot) -> () } = {}

local function notifySubscribers()
	currentSnapshot.IsEnabled = isEnabled
	currentSnapshot.IsPlaying = isPlaying
	currentSnapshot.MacroName = activeMacroName
	currentSnapshot.CurrentStep = currentStepIndex
	currentSnapshot.TotalSteps = totalSteps
	currentSnapshot.TimingMode = timingMode
	currentSnapshot.StepDelay = stepDelay
	currentSnapshot.ApplySpeed = applyMacroSpeed
	currentSnapshot.ApplyVoteSkip = applyMacroVoteSkip
	currentSnapshot.AutoMapSwitch = autoMapSwitch
	currentSnapshot.AutoCatchUp = autoCatchUp

	for _, sub in ipairs(subscribers) do
		task.spawn(pcall, sub, currentSnapshot)
	end
end

local function updateStatus(statusText: string, nextAction: string?)
	currentSnapshot.StatusText = statusText
	if nextAction then
		currentSnapshot.NextAction = nextAction
	end
	notifySubscribers()
end

local function getRemotes()
	if not spawnRemote or not sellRemote or not upgradeRemote or not changeModeRemote or not changeSpeedRemote or not voteSkipRemote then
		local functions = ReplicatedStorage:FindFirstChild("Functions")
		if functions then
			spawnRemote = functions:FindFirstChild("SpawnTower") :: RemoteFunction?
			sellRemote = functions:FindFirstChild("SellTower") :: RemoteFunction?
			upgradeRemote = functions:FindFirstChild("UpgradeTower") :: RemoteFunction?
			changeModeRemote = functions:FindFirstChild("ChangeTowerMode") :: RemoteFunction?
			changeSpeedRemote = functions:FindFirstChild("ChangeSpeed") :: RemoteFunction?
			voteSkipRemote = functions:FindFirstChild("VoteSkip") :: RemoteFunction?
		end
	end
	return spawnRemote, sellRemote, upgradeRemote, changeModeRemote, changeSpeedRemote, voteSkipRemote
end

-- Kiểm tra xem Model tháp có thuộc quyền sở hữu của LocalPlayer không (ManagerHandler: IsOwnTower)
local function isOwnTower(a1: Instance?): boolean
	if typeof(a1) ~= "Instance" then return false end
	local model: Model? = (a1:IsA("Model") and a1) or a1:FindFirstAncestorOfClass("Model")
	if not model then return false end

	for _, inst in pairs(idToTowerInstance) do
		if inst == model then
			return true
		end
	end

	local config = model:FindFirstChild("Config")
	if config then
		local owner = config:FindFirstChild("Owner")
		if owner and (owner:IsA("StringValue") or owner:IsA("ValueBase")) then
			local localPlayer = Players.LocalPlayer
			local localName = localPlayer and localPlayer.Name
			if localName and owner.Value == localName then
				return true
			elseif owner.Value ~= "" and owner.Value ~= localName then
				return false
			end
		end
	end

	local towersFolder = workspace:FindFirstChild("Towers")
	if towersFolder and model.Parent == towersFolder then
		return true
	end

	return false
end

-- Tham chiếu Module ReplicatedStorage.LVLs để tra cứu giá nâng cấp chuẩn xác 100%
local lvlsModule: any = nil

local function getLVLs(): any
	if not lvlsModule then
		pcall(function()
			local mod = ReplicatedStorage:FindFirstChild("LVLs")
			if mod and mod:IsA("ModuleScript") then
				lvlsModule = require(mod)
			end
		end)
	end
	return lvlsModule
end

-- Lấy cấp độ hiện tại của tháp từ model.Config.LVL.Value (mặc định 0 khi vừa đặt)
local function getTowerLevel(towerInst: Instance?): number
	if not towerInst or typeof(towerInst) ~= "Instance" then return 0 end
	local model: Model? = (towerInst:IsA("Model") and towerInst) or towerInst:FindFirstAncestorOfClass("Model")
	if not model then return 0 end
	local config = model:FindFirstChild("Config")
	local lvlObj = config and config:FindFirstChild("LVL")
	if lvlObj and lvlObj:IsA("ValueBase") then
		return tonumber(lvlObj.Value) or 0
	end
	return 0
end

-- Lấy cấp độ tối đa của loại tháp từ ReplicatedStorage.LVLs
local function getTowerMaxLevel(towerName: string): number
	if not towerName or towerName == "" then return 0 end
	local lvls = getLVLs()
	if lvls and type(lvls) == "table" then
		local data = lvls[towerName]
		if not data then
			local nameLower = towerName:lower():gsub("^%s+", ""):gsub("%s+$", "")
			for k, v in pairs(lvls) do
				if type(k) == "string" and k:lower() == nameLower then
					data = v
					break
				end
			end
		end
		if data and type(data) == "table" then
			return #data
		end
	end
	return 0
end

-- Tra cứu giá nâng cấp chuẩn xác tuyệt đối từ ReplicatedStorage.LVLs theo cấp độ mục tiêu
local function getUpgradePriceFromLVLs(towerName: string, targetLevel: number): number?
	if not towerName or towerName == "" or targetLevel <= 0 then return nil end
	local lvls = getLVLs()
	if not lvls or type(lvls) ~= "table" then return nil end

	local data = lvls[towerName]
	if not data then
		local nameLower = towerName:lower():gsub("^%s+", ""):gsub("%s+$", "")
		for k, v in pairs(lvls) do
			if type(k) == "string" and k:lower() == nameLower then
				data = v
				break
			end
		end
	end

	if data and type(data) == "table" then
		local entry = data[targetLevel]
		if entry and type(entry) == "table" and type(entry.Price) == "number" and entry.Price > 0 then
			return entry.Price
		end
	end
	return nil
end

-- Tìm Model tháp trong workspace dựa trên Attribute("ID")
local function findTowerByAttributeId(attrId: string?): Model?
	if not attrId or attrId == "" then return nil end
	local towersFolder = workspace:FindFirstChild("Towers")
	if not towersFolder then return nil end

	for _, child in ipairs(towersFolder:GetChildren()) do
		if child:IsA("Model") and isOwnTower(child) then
			local cId = child:GetAttribute("ID")
			if cId and tostring(cId) == tostring(attrId) then
				return child
			end
		end
	end
	return nil
end

-- Tham chiếu Modules.TowersConfig để tra cứu giá đặt tháp chuẩn xác
local towersConfigModule: any = nil

local function getTowersConfig(): any
	if not towersConfigModule then
		pcall(function()
			local modules = ReplicatedStorage:FindFirstChild("Modules")
			local cfg = (modules and modules:FindFirstChild("TowersConfig")) or ReplicatedStorage:FindFirstChild("TowersConfig", true)
			if cfg and cfg:IsA("ModuleScript") then
				towersConfigModule = require(cfg)
			end
		end)
	end
	return towersConfigModule
end

local function getPlacePrice(towerName: string): number?
	if not towerName or towerName == "" then return nil end
	local cfg = getTowersConfig()
	if cfg then
		if type(cfg.GetTowerConfig) == "function" then
			local data = nil
			pcall(function() data = cfg.GetTowerConfig(towerName) end)
			if data and type(data.PlacePrice) == "number" then
				return data.PlacePrice
			end
		end
		local configTable = cfg.Config or cfg
		if type(configTable) == "table" then
			if configTable[towerName] and type(configTable[towerName].PlacePrice) == "number" then
				return configTable[towerName].PlacePrice
			end
			-- Tìm theo tên không phân biệt hoa thường hoặc loại bỏ variant name
			local nameLower = towerName:lower():gsub("^%s+", ""):gsub("%s+$", "")
			for k, v in pairs(configTable) do
				if type(k) == "string" and type(v) == "table" and type(v.PlacePrice) == "number" then
					local kLower = k:lower()
					if kLower == nameLower or nameLower:find(kLower, 1, true) or kLower:find(nameLower, 1, true) then
						return v.PlacePrice
					end
				end
			end
		end
	end
	return nil
end

local function getUpgradePrice(towerName: string, upgradeIndex: number?): number?
	local cfg = getTowersConfig()
	if not cfg then return nil end

	local data = nil
	if type(cfg.GetTowerConfig) == "function" then
		pcall(function() data = cfg.GetTowerConfig(towerName) end)
	end
	if not data and type(cfg.Config) == "table" then
		data = cfg.Config[towerName]
	end
	if type(data) ~= "table" then return nil end

	upgradeIndex = upgradeIndex or 1

	-- 1. Kiểm tra data.Upgrades (danh sách từng cấp nâng cấp)
	if type(data.Upgrades) == "table" then
		local upg = data.Upgrades[upgradeIndex] or data.Upgrades[tostring(upgradeIndex)]
		if type(upg) == "table" then
			local price = tonumber(upg.Cost or upg.Price or upg.UpgradeCost or upg.UpgradePrice)
			if price and price > 0 then return price end
		elseif type(upg) == "number" and upg > 0 then
			return upg
		end
	end

	-- 2. Kiểm tra data.UpgradePrices hoặc data.UpgradeCosts hoặc data.Prices
	local priceList = data.UpgradePrices or data.UpgradeCosts or data.Prices or data.UpgradeCost
	if type(priceList) == "table" then
		local p = tonumber(priceList[upgradeIndex] or priceList[tostring(upgradeIndex)])
		if p and p > 0 then return p end
	end

	return nil
end

-- Chuyển đổi text giá tiền trên UI (ví dụ "$500,000", "$1.5k", "500000") thành số nguyên
local function parsePriceText(text: string?): number?
	if not text or type(text) ~= "string" then return nil end
	local lower = text:lower()
	if lower:find("max") then return nil end

	local clean = text:gsub("%$", ""):gsub(",", ""):gsub("%s+", "")

	local numK = clean:match("(%d+%.?%d*)[kK]")
	if numK then
		local n = tonumber(numK)
		if n and n > 0 then return math.round(n * 1000) end
	end

	local numM = clean:match("(%d+%.?%d*)[mM]")
	if numM then
		local n = tonumber(numM)
		if n and n > 0 then return math.round(n * 1000000) end
	end

	local numPlain = clean:match("(%d+%.?%d*)")
	if numPlain then
		local n = tonumber(numPlain)
		if n and n > 0 then return math.round(n) end
	end

	return nil
end

-- Tự động làm tròn số tiền ghi nhận về các mốc chuẩn nếu bị hao hụt nhẹ do nhận bounty quái cùng tick
local function snapToCleanPrice(cost: number?): number?
	if not cost or cost <= 0 then return cost end

	local milestones = {
		500000, 450000, 400000, 350000, 300000, 250000, 200000, 150000, 100000,
		75000, 50000, 40000, 30000, 25000, 20000, 15000, 10000,
		7500, 5000, 4000, 3000, 2500, 2000, 1500, 1000,
		750, 500, 400, 350, 300, 250, 200, 150, 100, 50
	}

	for _, milestone in ipairs(milestones) do
		local diff = milestone - cost
		-- Với các mốc lớn (>= 100k) ở Speed cao (x4, x5), bounty có thể lên tới 8k - 15k trong 0.2s
		local maxAllowedDiff = (milestone >= 100000) and math.max(6500, milestone * 0.05) or math.max(30, milestone * 0.04)
		if diff > 0 and diff <= maxAllowedDiff then
			return milestone
		end
	end

	return cost
end

-- Trích xuất giá Upgrade trực tiếp từ giao diện UnitManager.Units theo LayoutOrder
local function getUpgradePriceFromUnitManager(targetLayoutOrder: number?, towerName: string?): number?
	local playerInstance = Players.LocalPlayer
	local playerGui = playerInstance and playerInstance:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return nil end

	local unitManager = gameGui:FindFirstChild("UnitManager", true)
	local units = unitManager and unitManager:FindFirstChild("Units", true)
	if not units then return nil end

	local targetCard: GuiObject? = nil

	-- 1. Ưu tiên khớp chính xác theo LayoutOrder của card
	if targetLayoutOrder and targetLayoutOrder > 0 then
		for _, child in ipairs(units:GetChildren()) do
			if child:IsA("GuiObject") and not child:IsA("UILayout") and not child:IsA("UIPadding") then
				if child.LayoutOrder == targetLayoutOrder then
					targetCard = child
					break
				end
			end
		end
	end

	-- 2. Fallback: Nếu không tìm thấy bằng LayoutOrder nhưng biết towerName
	if not targetCard and towerName and towerName ~= "" and towerName ~= "Unknown" then
		local nameLower = towerName:lower()
		for _, child in ipairs(units:GetChildren()) do
			if child:IsA("GuiObject") and not child:IsA("UILayout") and not child:IsA("UIPadding") then
				local cName = child.Name:lower()
				if cName == nameLower or cName:find(nameLower, 1, true) or nameLower:find(cName, 1, true) then
					targetCard = child
					break
				end
			end
		end
	end

	if not targetCard then return nil end

	-- Trong card: Tìm Upgrade -> Price
	local upgradeObj = targetCard:FindFirstChild("Upgrade", true)
	local priceLabel: TextLabel? = nil
	if upgradeObj then
		priceLabel = upgradeObj:FindFirstChild("Price", true) :: TextLabel?
		if not priceLabel and upgradeObj:IsA("TextLabel") then
			priceLabel = upgradeObj
		end
	end

	if not priceLabel then
		priceLabel = targetCard:FindFirstChild("Price", true) :: TextLabel?
	end

	if priceLabel and priceLabel:IsA("TextLabel") then
		local price = parsePriceText(priceLabel.Text)
		if price and price > 0 then
			return price
		end
	end

	return nil
end

-- Lấy tốc độ trận đấu hiện tại từ GameGui.SpeedUp.Message (định dạng ": x1", ": x2", ...)
local function getCurrentGameSpeed(): number
	local playerInstance = Players.LocalPlayer
	local playerGui = playerInstance and playerInstance:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return 1 end

	local speedUp = gameGui:FindFirstChild("SpeedUp")
	local messageLabel = speedUp and speedUp:FindFirstChild("Message")
	if messageLabel and messageLabel:IsA("TextLabel") then
		local num = tonumber(messageLabel.Text:match("%d+"))
		if num and num >= 1 and num <= 5 then
			return num
		end
	end

	-- Fallback nếu SpeedUp nằm sâu hơn
	local deepSpeedUp = gameGui:FindFirstChild("SpeedUp", true)
	if deepSpeedUp then
		local deepMsg = deepSpeedUp:FindFirstChild("Message")
		if deepMsg and deepMsg:IsA("TextLabel") then
			local num = tonumber(deepMsg.Text:match("%d+"))
			if num and num >= 1 and num <= 5 then
				return num
			end
		end
	end

	return 1
end

-- Kiểm tra xem Model tháp đã được gán cho bất kỳ TowerId nào chưa
local function isInstanceClaimed(inst: Instance): boolean
	for _, mapped in pairs(idToTowerInstance) do
		if mapped == inst then
			return true
		end
	end
	return false
end

-- Tìm Model tháp trong workspace gần tọa độ (ưu tiên khoảng cách ngang XZ và hỗ trợ variant/skin)
local function findTowerNearPosition(name: string?, targetPos: Vector3, maxHorizontalDist: number?, excludeClaimed: boolean?, variantName: string?): Model?
	maxHorizontalDist = maxHorizontalDist or 3.8
	local maxVerticalDist = 12.0
	local bestModel: Model? = nil
	local bestDist = maxHorizontalDist
	local bestMatchScore = -1

	local searchContainers = {
		workspace:FindFirstChild("Towers"),
		workspace:FindFirstChild("PlacedTowers"),
		workspace:FindFirstChild("Units"),
		workspace,
	}

	for _, container in ipairs(searchContainers) do
		if not container then continue end

		local function checkCandidate(child: Instance)
			if not child:IsA("Model") or child.Parent == nil then return end
			if excludeClaimed and isInstanceClaimed(child) then return end

			-- Bỏ qua tháp của người chơi khác nếu đã có Owner
			local cfg = child:FindFirstChild("Config")
			local owner = cfg and cfg:FindFirstChild("Owner")
			local isOwnedByMe = false
			if owner and (owner:IsA("StringValue") or owner:IsA("ValueBase")) then
				local localPlayer = Players.LocalPlayer
				local localName = localPlayer and localPlayer.Name
				if localName and owner.Value ~= "" and owner.Value ~= localName then
					return
				elseif localName and owner.Value == localName then
					isOwnedByMe = true
				end
			end

			local pos: Vector3? = nil
			if child.PrimaryPart then
				pos = child.PrimaryPart.Position
			else
				pcall(function()
					pos = child:GetPivot().Position
				end)
			end

			if not pos then return end

			local xzDist = math.sqrt((pos.X - targetPos.X)^2 + (pos.Z - targetPos.Z)^2)
			local yDist = math.abs(pos.Y - targetPos.Y)

			if xzDist <= maxHorizontalDist and yDist <= maxVerticalDist then
				local childNameLower = child.Name:lower()
				local matchScore = 0

				if name and (childNameLower:find(name:lower(), 1, true) or name:lower():find(childNameLower, 1, true)) then
					matchScore = 100
				elseif variantName and (childNameLower:find(variantName:lower(), 1, true) or variantName:lower():find(childNameLower, 1, true)) then
					matchScore = 90
				elseif not name then
					matchScore = 50
				else
					-- Khác tên nhưng nằm cực gần vị trí đặt và chưa bị tháp nào nhận
					matchScore = (xzDist <= 2.5) and 40 or 10
				end

				-- Ưu tiên cao hơn nếu tháp đã xác nhận quyền sở hữu của LocalPlayer
				if isOwnedByMe then
					matchScore += 25
				end

				if matchScore > bestMatchScore or (matchScore == bestMatchScore and xzDist < bestDist) then
					bestMatchScore = matchScore
					bestDist = xzDist
					bestModel = child
				end
			end
		end

		for _, child in ipairs(container:GetChildren()) do
			checkCandidate(child)
			if child:IsA("Folder") or child:IsA("Configuration") then
				for _, subChild in ipairs(child:GetChildren()) do
					checkCandidate(subChild)
				end
			end
		end

		if bestModel and bestMatchScore >= 50 then break end
	end

	return bestModel
end

-- Gọi RemoteFunction an toàn có bảo vệ timeout chống treo vĩnh viễn thread
local function safeInvoke(remote: RemoteFunction, timeoutSec: number, ...): (boolean, any)
	local hasReturned = false
	local success = false
	local result = nil

	local t = task.spawn(function(...)
		local ok, res = pcall(remote.InvokeServer, remote, ...)
		success = ok
		result = res
		hasReturned = true
	end, ...)

	local tStart = os.clock()
	while not hasReturned and os.clock() - tStart < timeoutSec do
		task.wait(0.04)
	end

	if not hasReturned then
		pcall(task.cancel, t)
		return false, "Timeout"
	end

	return success, result
end

-- Thực thi lệnh đặt tháp (SpawnTower) với cơ chế xác thực đa tầng thông minh
function player.PlaceTower(towerName: string, cf: CFrame, arg3: boolean?, arg4: string?, arg5: { any }?): (boolean, Instance?)
	local sRemote, _ = getRemotes()
	if not sRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.SpawnTower")
		return false, nil
	end

	arg3 = arg3 == true
	arg4 = arg4 or towerName
	arg5 = arg5 or {}

	-- 1. Tiền kiểm tra (Pre-check): Nếu đã có tháp tại vị trí này (từ lần gọi trước hoặc lag), nhận luôn!
	local existing = findTowerNearPosition(towerName, cf.Position, 3.5, true, arg4)
	if existing then
		logger.Log(string.format("[Macro Player] Tháp %s đã tồn tại sẵn tại vị trí (%.1f, %.1f), nhận diện ngay lập tức.",
			towerName, cf.Position.X, cf.Position.Z))
		return true, existing
	end

	local oldCash = gameStats.GetCash()
	local success, result = safeInvoke(sRemote, 2.0, towerName, cf, arg3, arg4, arg5)

	if not success and result ~= "Timeout" then
		logger.Warn("[Macro Player] Lỗi gọi SpawnTower:", tostring(result))
		return false, nil
	end

	-- Nếu server trả về false, kiểm tra xem có phải do tháp đã xuất hiện khiến server báo trùng chỗ không
	if result == false then
		task.wait(0.1)
		local checkAgain = findTowerNearPosition(towerName, cf.Position, 3.5, true, arg4)
		if checkAgain then
			return true, checkAgain
		end
		return false, nil
	end

	-- 2. Xác thực cấp 1: Remote trả về trực tiếp Instance Model hợp lệ (như trích xuất Cobalt xác nhận)
	if typeof(result) == "Instance" then
		local modelInst: Model? = result:IsA("Model") and result or result:FindFirstAncestorOfClass("Model")
		if modelInst then
			-- Chờ tối đa 0.4s nếu Parent chưa kịp replicate vào workspace.Towers
			if not modelInst.Parent then
				local tEnd = os.clock() + 0.4
				while not modelInst.Parent and os.clock() < tEnd do
					task.wait(0.05)
				end
			end
			return true, modelInst
		end
	end

	-- 3. Xác thực cấp 2: Quét Workspace tìm Model mới xuất hiện tại vị trí đặt
	for _ = 1, 8 do
		task.wait(0.15)
		local spawnedInstance = findTowerNearPosition(towerName, cf.Position, 4.0, true, arg4)
		if spawnedInstance then
			return true, spawnedInstance
		end
	end

	-- 4. Xác thực cấp 3: Kiểm tra biến động tiền (Cash Deduction Guard)
	local currentCash = gameStats.GetCash()
	local cashDecreased = (currentCash < oldCash)

	if cashDecreased or result == true then
		-- Chờ thêm chút để Model kịp replicate sang client
		for _ = 1, 6 do
			task.wait(0.2)
			local spawnedInstance = findTowerNearPosition(towerName, cf.Position, 4.5, true, arg4)
			if spawnedInstance then
				return true, spawnedInstance
			end
		end

		-- Dù Model replicate chậm, nhưng tiền ĐÃ TRỪ hoặc Remote ĐÃ TRẢ VỀ TRUE -> Chắc chắn server đã tạo tháp!
		-- Trả về true để không retry đè vị trí, để background thread tiếp tục dò Model
		logger.Log(string.format("[Macro Player] SpawnTower %s thành công (tiền giảm: %d -> %d), đang đợi Model hiển thị.",
			towerName, oldCash, currentCash))
		return true, nil
	end

	logger.Warn(string.format("[Macro Player] Xác thực Spawn thất bại cho %s tại vị trí (%.1f, %.1f, %.1f) - không tìm thấy Model và không trừ tiền!",
		towerName, cf.Position.X, cf.Position.Y, cf.Position.Z))
	return false, nil
end

-- Thực thi lệnh bán tháp (SellTower)
function player.SellTower(target: Instance): boolean
	local _, selRemote = getRemotes()
	if not selRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.SellTower")
		return false
	end

	if not target or not target.Parent then
		logger.Warn("[Macro Player] Tháp mục tiêu để bán không tồn tại hoặc đã bị hủy!")
		return false
	end

	local initialCash = gameStats.GetCash()
	local success, err = safeInvoke(selRemote, 1.8, target)

	if not success and err ~= "Timeout" then
		logger.Warn("[Macro Player] Lỗi gọi SellTower:", tostring(err))
		return false
	end

	return true
end

-- Thực thi lệnh nâng cấp tháp (UpgradeTower)
function player.UpgradeTower(target: Instance, variantName: string?): (boolean, Instance?)
	local _, _, upRemote = getRemotes()
	if not upRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.UpgradeTower")
		return false, nil
	end

	if not target or not target.Parent then
		logger.Warn("[Macro Player] Tháp mục tiêu để nâng cấp không tồn tại hoặc đã bị hủy!")
		return false, nil
	end

	variantName = variantName or target.Name
	local initialCash = gameStats.GetCash()
	local initialLvl = 0
	local cfg = target:FindFirstChild("Config")
	local lvlVal = cfg and cfg:FindFirstChild("LVL")
	if lvlVal and lvlVal:IsA("ValueBase") then
		initialLvl = tonumber(lvlVal.Value) or 0
	end

	-- Sử dụng Attribute "ID" của tháp (chuẩn theo ManagerHandler), fallback variantName
	local towerAttrId: any = nil
	pcall(function()
		towerAttrId = target:GetAttribute("ID")
	end)
	towerAttrId = towerAttrId or variantName or target.Name

	local success, result = safeInvoke(upRemote, 1.8, target, towerAttrId)

	-- 1. Kiểm tra Level tăng
	local currentLvl = (lvlVal and tonumber(lvlVal.Value)) or initialLvl
	if currentLvl > initialLvl then
		success = true
		result = true
	end

	-- 2. Nếu timeout nhưng tiền đã bị trừ hoặc Level tăng trong khi chờ -> chắc chắn server đã upgrade thành công!
	if not success and result == "Timeout" and (gameStats.GetCash() < initialCash or currentLvl > initialLvl) then
		success = true
		result = true
	end

	-- 3. Hoặc nếu server trả về false nhưng tiền đã trừ hoặc Level tăng -> cũng coi là thành công!
	if result == false and (gameStats.GetCash() < initialCash or currentLvl > initialLvl) then
		result = true
		success = true
	end

	if not success and result ~= "Timeout" then
		logger.Warn("[Macro Player] Lỗi gọi UpgradeTower:", tostring(result))
		return false, nil
	end

	if result == false then
		return false, nil
	end

	local isOk = false
	local updatedModel: Instance? = nil

	if typeof(result) == "Instance" then
		isOk = true
		updatedModel = result:IsA("Model") and result or result:FindFirstAncestorOfClass("Model")
	elseif result == true then
		isOk = true
	else
		-- result == nil hoặc Timeout: Chờ kiểm tra Level tăng hoặc tiền có trừ không
		for _ = 1, 4 do
			task.wait(0.06)
			currentLvl = (lvlVal and tonumber(lvlVal.Value)) or initialLvl
			if currentLvl > initialLvl or gameStats.GetCash() < initialCash then
				isOk = true
				break
			end
		end
		-- Nếu server không trừ tiền ngay trên UI nhưng tháp vẫn còn tồn tại
		if not isOk and target and target.Parent then
			isOk = true
		end
	end

	if not isOk then
		return false, nil
	end

	return true, updatedModel or target
end

-- Thực thi lệnh đổi chế độ ngắm bắn của tháp (ChangeTowerMode)
function player.ChangeTowerMode(target: Instance): boolean
	local _, _, _, modeRemote = getRemotes()
	if not modeRemote then
		logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.ChangeTowerMode")
		return false
	end

	if not target or not target.Parent then
		logger.Warn("[Macro Player] Tháp mục tiêu để đổi Target không tồn tại hoặc đã bị hủy!")
		return false
	end

	local success, result = safeInvoke(modeRemote, 1.8, target)

	if not success and result ~= "Timeout" then
		logger.Warn("[Macro Player] Lỗi gọi ChangeTowerMode:", tostring(result))
		return false
	end

	if result == false then
		return false
	end

	return true
end

-- Thay đổi tốc độ trận đấu (chỉ gửi trực tiếp qua RemoteFunction)
function player.ChangeSpeed(speedNum: number): boolean
	local _, _, _, _, csRemote = getRemotes()
	if not csRemote then
		csRemote = ReplicatedStorage:FindFirstChild("ChangeSpeed", true) :: RemoteFunction?
	end

	if csRemote and csRemote:IsA("RemoteFunction") then
		task.spawn(function()
			pcall(function()
				csRemote:InvokeServer(speedNum)
			end)
		end)
		return true
	end

	logger.Warn("[Macro Player] Không tìm thấy RemoteFunction: Functions.ChangeSpeed")
	return false
end

-- Bỏ phiếu Skip Wave (VoteSkip)
function player.VoteSkip(): boolean
	local _, _, _, _, _, vsRemote = getRemotes()
	if not vsRemote then
		vsRemote = ReplicatedStorage:FindFirstChild("VoteSkip", true) :: RemoteFunction?
	end

	if vsRemote and vsRemote:IsA("RemoteFunction") then
		task.spawn(function()
			pcall(function()
				vsRemote:InvokeServer()
			end)
		end)
	end

	return true
end

-- Thực thi 1 bước cụ thể
function player.ExecuteStep(step: types.MacroStep): boolean
	if step.Type == "Place" then
		if not step.CFrame then
			logger.Warn("[Macro Player] Bước Place thiếu dữ liệu CFrame!")
			return false
		end

		local cf = CFrame.new(table.unpack(step.CFrame))
		local ok, inst = player.PlaceTower(step.TowerName, cf, step.Arg3, step.Arg4, step.Arg5)
		if ok then
			table.insert(activeTowers, step.TowerId)
			if inst and inst.Parent then
				idToTowerInstance[step.TowerId] = inst
				local attrId = inst:GetAttribute("ID") or (step.RawData and step.RawData.AttributeID)
				if attrId then
					idToTowerAttrId[step.TowerId] = tostring(attrId)
				end
			else
				-- Nếu Model chưa kịp replicate, task nền sẽ tự động tìm và bind ngay khi xuất hiện
				task.spawn(function()
					for _ = 1, 30 do
						task.wait(0.3)
						if not isEnabled or not isPlaying then break end
						local found = findTowerNearPosition(step.TowerName, cf.Position, 4.5, true, step.Arg4)
						if found then
							idToTowerInstance[step.TowerId] = found
							local attrId = found:GetAttribute("ID") or (step.RawData and step.RawData.AttributeID)
							if attrId then
								idToTowerAttrId[step.TowerId] = tostring(attrId)
							end
							break
						end
					end
				end)
			end
			notifier.Notify("Macro Play", string.format("Placed %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
			return true
		end

		return false

	elseif step.Type == "Sell" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			local savedAttr = idToTowerAttrId[step.TowerId] or (step.RawData and step.RawData.AttributeID)
			if savedAttr then
				inst = findTowerByAttributeId(savedAttr)
				if inst then idToTowerInstance[step.TowerId] = inst end
			end
		end

		if not inst or not inst.Parent then
			local pos = step.Position and Vector3.new(step.Position[1], step.Position[2], step.Position[3])
			for _ = 1, 5 do
				inst = idToTowerInstance[step.TowerId]
				if (not inst or not inst.Parent) and pos then
					inst = findTowerNearPosition(step.TowerName, pos, 4.5, false, step.Arg4)
				end
				if inst and inst.Parent then
					idToTowerInstance[step.TowerId] = inst
					break
				end
				task.wait(0.15)
			end
		end

		if inst then
			local ok = player.SellTower(inst)
			if ok then
				idToTowerInstance[step.TowerId] = nil
				idToTowerAttrId[step.TowerId] = nil
				local actIdx = table.find(activeTowers, step.TowerId)
				if actIdx then
					table.remove(activeTowers, actIdx)
				end
				notifier.Notify("Macro Play", string.format("Sold %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
				return true
			end
		else
			logger.Warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để bán!", step.TowerId))
		end

	elseif step.Type == "Upgrade" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			-- 1. Ưu tiên tìm lại qua Attribute("ID")
			local savedAttr = idToTowerAttrId[step.TowerId] or (step.RawData and step.RawData.AttributeID) or (step.Arg4)
			if savedAttr then
				inst = findTowerByAttributeId(savedAttr)
				if inst then idToTowerInstance[step.TowerId] = inst end
			end
		end

		if not inst or not inst.Parent then
			local pos = step.Position and Vector3.new(step.Position[1], step.Position[2], step.Position[3])
			for _ = 1, 5 do
				inst = idToTowerInstance[step.TowerId]
				if (not inst or not inst.Parent) and pos then
					inst = findTowerNearPosition(step.TowerName, pos, 4.5, false, step.Arg4)
				end
				if inst and inst.Parent then
					idToTowerInstance[step.TowerId] = inst
					break
				end
				task.wait(0.15)
			end
		end

		if inst then
			-- 2. Smart Skip: Nếu tháp đã đạt hoặc vượt cấp độ yêu cầu của bước này
			local curLvl = getTowerLevel(inst)
			if step.Level and curLvl >= step.Level then
				logger.Log(string.format("[Macro Player] Tháp %s (%s) đã đạt LVL %d (hiện tại %d) -> Bỏ qua nâng cấp.", step.TowerName, step.TowerId, step.Level, curLvl))
				return true
			end

			local variant = step.Arg4 or inst.Name
			local ok, updatedInst = player.UpgradeTower(inst, variant)
			if ok then
				local finalInst = (updatedInst and updatedInst:IsA("Model") and updatedInst.Parent ~= nil) and updatedInst or inst
				idToTowerInstance[step.TowerId] = finalInst
				local newAttr = finalInst:GetAttribute("ID")
				if newAttr then
					idToTowerAttrId[step.TowerId] = tostring(newAttr)
				end
				local newLvl = getTowerLevel(finalInst)
				local lvlStr = newLvl > 0 and string.format(" -> LVL %d", newLvl) or ""
				notifier.Notify("Macro Play", string.format("Upgraded %s (%s)%s [%.2fs]", step.TowerName, step.TowerId, lvlStr, step.Time), 1.5)
				return true
			end
		else
			logger.Warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để nâng cấp!", step.TowerId))
		end

	elseif step.Type == "Target" then
		local inst = idToTowerInstance[step.TowerId]
		if not inst or not inst.Parent then
			local pos = step.Position and Vector3.new(step.Position[1], step.Position[2], step.Position[3])
			for _ = 1, 5 do
				inst = idToTowerInstance[step.TowerId]
				if (not inst or not inst.Parent) and pos then
					inst = findTowerNearPosition(step.TowerName, pos, 4.5, false, step.Arg4)
				end
				if inst and inst.Parent then
					idToTowerInstance[step.TowerId] = inst
					break
				end
				task.wait(0.15)
			end
		end

		if inst then
			local ok = player.ChangeTowerMode(inst)
			if ok then
				notifier.Notify("Macro Play", string.format("Changed Target: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
				return true
			end
		else
			logger.Warn(string.format("[Macro Player] Không tìm thấy tháp '%s' để đổi Target!", step.TowerId))
		end

	elseif step.Type == "Speed" then
		if not applyMacroSpeed then
			return true
		end
		local speedNum = step.Speed or 1
		local ok = player.ChangeSpeed(speedNum)
		if ok then
			notifier.Notify("Macro Play", string.format("Changed Speed to: x%d [%.2fs]", speedNum, step.Time), 1.5)
			return true
		end

	elseif step.Type == "VoteSkip" then
		if not applyMacroVoteSkip then
			return true
		end
		local ok = player.VoteSkip()
		if ok then
			notifier.Notify("Macro Play", string.format("Vote Skip Wave [%.2fs]", step.Time), 1.5)
			return true
		end
	end

	return false
end

-- Kiểm tra và tự động nâng bù cấp cho các tháp chưa đạt level tối đa của Macro sau khi hoàn tất các bước
function player.PerformPostPlaybackCatchUp(macroData: types.MacroData)
	if not macroData or not macroData.Steps then return end

	-- 1. Tính toán cấp độ mục tiêu tối đa của từng TowerId trong macro
	local targetLevels: { [string]: { TowerName: string, Level: number } } = {}

	for _, step in ipairs(macroData.Steps) do
		if step.Type == "Place" then
			if not targetLevels[step.TowerId] then
				targetLevels[step.TowerId] = { TowerName = step.TowerName, Level = 0 }
			end
		elseif step.Type == "Upgrade" then
			if not targetLevels[step.TowerId] then
				targetLevels[step.TowerId] = { TowerName = step.TowerName, Level = 1 }
			else
				local expectedLvl = step.Level or (targetLevels[step.TowerId].Level + 1)
				targetLevels[step.TowerId].Level = math.max(targetLevels[step.TowerId].Level, expectedLvl)
			end
		elseif step.Type == "Sell" then
			-- Tháp đã bị bán thì không cần catch-up
			targetLevels[step.TowerId] = nil
		end
	end

	local hasAnyTarget = false
	for _, _ in pairs(targetLevels) do
		hasAnyTarget = true
		break
	end
	if not hasAnyTarget then return end

	logger.Log("[Macro Player] 🔍 Bắt đầu quét kiểm tra cấp độ tháp (Post-Playback Catch-up)...")
	updateStatus("Catch-up: Checking tower levels...", "Verifying full levels")

	local upgradedCount = 0
	local maxCatchUpRounds = 40
	local round = 0

	while isEnabled and gameStats.IsMatchActive() and round < maxCatchUpRounds do
		round += 1
		local hasPendingUpgrades = false
		local anyUpgradedThisPass = false

		for towerId, info in pairs(targetLevels) do
			if not isEnabled or not gameStats.IsMatchActive() then break end

			local inst = idToTowerInstance[towerId]
			if not inst or not inst.Parent then
				local savedAttr = idToTowerAttrId[towerId]
				if savedAttr then
					inst = findTowerByAttributeId(savedAttr)
					if inst then
						idToTowerInstance[towerId] = inst
					end
				end
			end

			if inst and inst.Parent then
				local curLvl = getTowerLevel(inst)
				local maxAllowed = getTowerMaxLevel(info.TowerName)
				local goalLvl = info.Level
				if maxAllowed > 0 then
					goalLvl = math.min(goalLvl, maxAllowed)
				end

				if curLvl < goalLvl then
					hasPendingUpgrades = true
					local nextLvl = curLvl + 1
					local cost = getUpgradePriceFromLVLs(info.TowerName, nextLvl) or getUpgradePrice(info.TowerName, nextLvl)
					local curCash = gameStats.GetCash()

					if cost and curCash >= cost then
						local ok, updatedInst = player.UpgradeTower(inst)
						if ok then
							local finalInst = (updatedInst and updatedInst:IsA("Model") and updatedInst.Parent ~= nil) and updatedInst or inst
							idToTowerInstance[towerId] = finalInst
							local newLvl = getTowerLevel(finalInst)
							upgradedCount += 1
							anyUpgradedThisPass = true
							logger.Log(string.format("[Macro Player] 🛠️ Catch-up: Đã nâng cấp %s (%s) từ LVL %d lên LVL %d (Mục tiêu: %d)!",
								info.TowerName, towerId, curLvl, newLvl, goalLvl))
							notifier.Notify("Macro Player", string.format("🛠️ Catch-up: %s (%s) -> LVL %d", info.TowerName, towerId, newLvl), 1.5)
							task.wait(0.2)
						end
					end
				end
			end
		end

		if not hasPendingUpgrades then
			-- Tất cả tháp đã đạt đủ cấp độ mong muốn!
			break
		end

		-- Chờ quái sinh thêm tiền rồi quét lại
		task.wait(0.5)
	end

	if upgradedCount > 0 then
		logger.Log(string.format("[Macro Player] ✅ Hoàn thành Catch-up: Đã nâng cấp bù tổng cộng %d lần!", upgradedCount))
		notifier.Notify("Macro Player", string.format("✅ Catch-up completed: %d upgrades applied!", upgradedCount), 3)
	else
		logger.Log("[Macro Player] ✅ Kiểm tra hoàn tất: Tất cả tháp đều đã đạt cấp độ yêu cầu!")
	end
end

-- Vòng lặp quản lý Playback tự động xuyên suốt các ván đấu
local function startRunnerLoop()
	if activePlaybackThread then
		pcall(task.cancel, activePlaybackThread)
		activePlaybackThread = nil
	end

	activePlaybackThread = task.spawn(function()
		while isEnabled do
			-- 1. Kiểm tra đã ở trong ván đấu chưa
			if not zoneGuard.IsInGame() then
				isPlaying = false
				updateStatus("Waiting for in-game...", "None")
				task.wait(1.0)
				continue
			end

			-- 2. Kiểm tra trận đấu đã bắt đầu chưa (Timer đếm, wave >= 1)
			if not gameStats.IsMatchActive() then
				isPlaying = false
				updateStatus("Waiting for match to start...", "None")
				task.wait(0.5)
				continue
			end

			-- 3. Xác định Macro cần chạy theo thứ tự ưu tiên:
			-- Ưu tiên số 1: Cấu hình gán cụ thể trong tab Map Macro
			local currentMap = raidManager.GetCurrentMap()
			local mappedMacro = mapMacroManager.GetMapMacro(currentMap)
			if mappedMacro and mappedMacro ~= "None" and storage.HasMacro(mappedMacro) then
				if mappedMacro ~= activeMacroName then
					logger.Log(string.format("[Macro Player] 🎯 Sử dụng Map Macro '%s' cho Map '%s'!", mappedMacro, currentMap))
					notifier.Notify("Macro Player", string.format("Map Macro: %s (Map: %s)", mappedMacro, currentMap), 2.5)
					activeMacroName = mappedMacro
					currentSnapshot.MacroName = mappedMacro
					notifySubscribers()
				end
			end

			-- 4. Kiểm tra macro được chọn
			local macroName = activeMacroName
			if not macroName or macroName == "" or macroName == "None" then
				isPlaying = false
				updateStatus("No macro selected!", "None")
				task.wait(1.0)
				continue
			end

			local macroData = storage.GetMacro(macroName)
			if not macroData or not macroData.Steps or #macroData.Steps == 0 then
				isPlaying = false
				updateStatus("Macro is empty!", "None")
				task.wait(1.0)
				continue
			end

			-- 5. Bắt đầu phiên Playback cho ván đấu này
			local currentSessionMap = raidManager.GetCurrentMap()
			isPlaying = true
			currentStepIndex = 0
			totalSteps = #macroData.Steps
			table.clear(idToTowerInstance)
			table.clear(idToTowerAttrId)
			table.clear(activeTowers)

			-- Khôi phục tốc độ ban đầu của Macro nếu bật đồng bộ Speed
			if applyMacroSpeed then
				local initialSpeed = (macroData.Metadata and macroData.Metadata.InitialSpeed) or 1
				player.ChangeSpeed(initialSpeed)
				notifier.Notify("Macro Player", string.format("Started Play: %s (Initial Speed: x%d, %d steps)", macroName, initialSpeed, totalSteps), 2.5)
			else
				notifier.Notify("Macro Player", string.format("Started Play: %s (%d steps, skipping Speed)", macroName, totalSteps), 2.5)
			end

			-- Khởi tạo đồng hồ thời gian ảo (Virtual Elapsed Time) tự động co giãn theo tốc độ trận đấu
			local macroBaseSpeed = (macroData.Metadata and macroData.Metadata.InitialSpeed) or 1
			if macroBaseSpeed <= 0 then macroBaseSpeed = 1 end

			local startPlaySpeed = getCurrentGameSpeed()
			if startPlaySpeed <= 0 then startPlaySpeed = 1 end

			local lastTickClock = os.clock()
			local realElapsedOnStart = gameStats.GetElapsedTime()
			local virtualElapsedTime = realElapsedOnStart * (startPlaySpeed / macroBaseSpeed)

			for i, step in ipairs(macroData.Steps) do
				if not isEnabled or not isPlaying then break end
				if not gameStats.IsMatchActive() then
					updateStatus("Match ended early", "None")
					break
				end

				-- Nếu step là Speed nhưng người dùng tắt Apply Macro Speed -> Bỏ qua
				if step.Type == "Speed" and not applyMacroSpeed then
					currentStepIndex = i
					continue
				end

				-- Nếu step là VoteSkip nhưng người dùng tắt Apply Macro Skip Wave -> Bỏ qua
				if step.Type == "VoteSkip" and not applyMacroVoteSkip then
					currentStepIndex = i
					continue
				end

				currentStepIndex = i
				local actualPrice: number? = nil

				if step.Type == "Place" then
					actualPrice = step.Cost or step.TowerCost or getPlacePrice(step.TowerName)
				elseif step.Type == "Upgrade" then
					local targetLvl = step.Level
					if not targetLvl or targetLvl <= 0 then
						local upgIdx = 1
						for prev = 1, i - 1 do
							local prevStep = macroData.Steps[prev]
							if prevStep and prevStep.Type == "Upgrade" and prevStep.TowerId == step.TowerId then
								upgIdx += 1
							end
						end
						targetLvl = upgIdx
					end

					-- 1. Ưu tiên 1: Tra cứu chính xác tuyệt đối từ ReplicatedStorage.LVLs
					local lvlsPrice = getUpgradePriceFromLVLs(step.TowerName, targetLvl)
					if lvlsPrice and lvlsPrice > 0 then
						actualPrice = lvlsPrice
					end

					-- 2. Ưu tiên 2: Cost (hoặc TowerCost) đã ghi nhận trong macro step
					if not actualPrice or actualPrice <= 0 then
						local stepCost = step.Cost or step.TowerCost
						if stepCost and stepCost > 0 then
							actualPrice = stepCost
						end
					end

					-- 3. Ưu tiên 3: UnitManager UI theo LayoutOrder
					if not actualPrice or actualPrice <= 0 then
						local layoutOrder = step.LayoutOrder or table.find(activeTowers, step.TowerId)
						local livePrice = getUpgradePriceFromUnitManager(layoutOrder, step.TowerName)
						if livePrice and livePrice > 0 then
							actualPrice = livePrice
						end
					end

					-- 4. Ưu tiên 4: Modules.TowersConfig
					if not actualPrice or actualPrice <= 0 then
						actualPrice = getUpgradePrice(step.TowerName, targetLvl)
					end

					-- 5. Ưu tiên 5: snapToCleanPrice
					if not actualPrice or actualPrice <= 0 then
						local recordedCost = step.Cost or step.TowerCost
						if recordedCost and recordedCost > 0 then
							actualPrice = snapToCleanPrice(recordedCost) or recordedCost
						end
					end
				end

				-- stepCost hiển thị trên giao diện status:
				local displayCost = actualPrice or step.Cost or step.TowerCost or 0

				local nextDesc: string
				if step.Type == "Speed" then
					nextDesc = string.format("Speed x%d [W%d - %.2fs]", step.Speed or 1, step.Wave, step.Time)
				elseif step.Type == "VoteSkip" then
					nextDesc = string.format("VoteSkip [W%d - %.2fs]", step.Wave, step.Time)
				else
					local tName = step.TowerName or "Unknown"
					local tId = step.TowerId or "N/A"
					nextDesc = string.format("%s %s (%s) [W%d - %.2fs]", step.Type, tName, tId, step.Wave, step.Time)
				end
				if timingMode == "Cash (Timed Sell)" and (step.Type == "Place" or step.Type == "Upgrade") and displayCost > 0 then
					updateStatus(string.format("Waiting for Step %d/%d (Need $%d)", i, totalSteps, displayCost), nextDesc)
				else
					updateStatus(string.format("Waiting for Step %d/%d (Wave %d)", i, totalSteps, step.Wave), nextDesc)
				end

				-- Chờ điều kiện thực thi bước i
				local canExecute = false
				while isEnabled and isPlaying and gameStats.IsMatchActive() do
					-- Phát hiện đổi Map giữa chừng (hỗ trợ Map Macro tự động đổi map)
					local liveMap = raidManager.GetCurrentMap()
					if liveMap and currentSessionMap and liveMap ~= currentSessionMap then
						break
					end

					-- Tích lũy Virtual Elapsed Time theo nhịp thực tế và tốc độ game hiện tại
					local now = os.clock()
					local dt = now - lastTickClock
					lastTickClock = now

					local curPlaySpeed = getCurrentGameSpeed()
					if curPlaySpeed <= 0 then curPlaySpeed = 1 end

					local stepRecordSpeed = step.RecordSpeed or macroBaseSpeed
					if stepRecordSpeed <= 0 then stepRecordSpeed = 1 end

					-- Co giãn thời gian: Tốc độ hiện tại càng cao thì đồng hồ ảo chạy càng nhanh tương ứng
					virtualElapsedTime += dt * (curPlaySpeed / stepRecordSpeed)

					local curWave, _ = gameStats.GetWave()
					local curCash = gameStats.GetCash()

					local waveMet = curWave >= step.Wave
					local timePassed = virtualElapsedTime >= step.Time

					-- Nếu là bước Upgrade mà chưa có actualPrice, định kỳ cập nhật từ LVLs hoặc UnitManager
					if step.Type == "Upgrade" and (not actualPrice or actualPrice <= 0) then
						local targetLvl = step.Level or 1
						actualPrice = getUpgradePriceFromLVLs(step.TowerName, targetLvl)
						if not actualPrice or actualPrice <= 0 then
							local layoutOrder = step.LayoutOrder or table.find(activeTowers, step.TowerId)
							actualPrice = getUpgradePriceFromUnitManager(layoutOrder, step.TowerName)
						end
						if actualPrice and actualPrice > 0 then
							displayCost = actualPrice
							if timingMode == "Cash (Timed Sell)" and displayCost > 0 then
								updateStatus(string.format("Waiting for Step %d/%d (Need $%d)", i, totalSteps, displayCost), nextDesc)
							end
						end
					end

					-- Kiểm tra điều kiện tiền thực tế:
					-- 1. Nếu biết actualPrice (giá thực của Place hoặc Upgrade): kiểm tra curCash >= actualPrice
					-- 2. Nếu không biết actualPrice: kiểm tra theo step.Cost (nếu > 0)
					local hasCash = false
					if actualPrice and actualPrice > 0 then
						hasCash = (curCash >= actualPrice)
					elseif step.Type == "Place" then
						local placeCost = (step.Cost and step.Cost > 0 and step.Cost) or 0
						if placeCost > 0 then
							hasCash = (curCash >= placeCost)
						else
							hasCash = (curCash > 0)
						end
					elseif step.Type == "Upgrade" then
						local upgCost = (step.Cost and step.Cost > 0 and step.Cost) or 0
						if upgCost > 0 then
							hasCash = (curCash >= upgCost)
						else
							hasCash = (curCash > 0)
						end
					else
						hasCash = (curCash > 0)
					end

					local requirementMet = false
					if timingMode == "Cash (Timed Sell)" then
						if step.Type == "Sell" then
							-- Sell: Bắt buộc đúng thời gian co giãn tương đương
							requirementMet = waveMet and timePassed
						elseif step.Type == "Target" or step.Type == "Speed" then
							requirementMet = waveMet
						elseif step.Type == "VoteSkip" then
							requirementMet = waveMet and (curWave > step.Wave or timePassed)
						else
							-- Place / Upgrade:
							-- Thuần theo tiền (Cash): Đủ tiền là thực thi ngay!
							requirementMet = hasCash
						end
					elseif step.Type == "Speed" then
						-- Speed ở các chế độ: đổi ngay khi đạt Wave tương ứng
						requirementMet = waveMet
					elseif step.Type == "Sell" or step.Type == "Target" or step.Type == "VoteSkip" then
						requirementMet = waveMet and (curWave > step.Wave or timePassed)
					else
						if timingMode == "Timer" then
							-- Chế độ Timer: Thực thi chuẩn xác theo nhịp thời gian
							requirementMet = waveMet and timePassed
						elseif timingMode == "Wave & Cash" then
							requirementMet = waveMet and hasCash
						else
							-- Hybrid (Mặc định):
							if step.Type == "Place" or step.Type == "Upgrade" then
								requirementMet = waveMet and hasCash
							else
								requirementMet = waveMet and (hasCash or timePassed)
							end
						end
					end

					if requirementMet then
						canExecute = true
						break
					end

					task.wait(0.05)
				end

				if not canExecute or not isEnabled or not isPlaying or not gameStats.IsMatchActive() then
					break
				end

				-- Thực thi bước i với cơ chế Smart Retry
				updateStatus(string.format("Executing Step %d/%d...", i, totalSteps), nextDesc)

				local execOk = false
				local maxAttempts = (step.Type == "Place") and 5 or 3

				for attempt = 1, maxAttempts do
					if not isEnabled or not gameStats.IsMatchActive() then break end

					if attempt > 1 then
						local retryName = (step.Type == "Speed" and string.format("x%d", step.Speed or 1))
							or (step.Type == "VoteSkip" and "")
							or (step.TowerName or "")
						updateStatus(string.format("Retrying %s %s (attempt %d/%d)...", step.Type, retryName, attempt, maxAttempts), nextDesc)
					end

					execOk = player.ExecuteStep(step)
					if execOk then break end

					task.wait(0.35)
				end

				if not execOk then
					local failName = (step.Type == "Speed" and string.format("x%d", step.Speed or 1))
						or (step.Type == "VoteSkip" and "")
						or (step.TowerName or "")
					logger.Warn(string.format("[Macro Player] Thất bại thực thi Step %d (%s %s) sau %d lần thử!", i, step.Type, failName, maxAttempts))
					if step.Type == "Place" then
						notifier.Notify("Macro Player", string.format("⚠️ Failed to place %s (%s) after %d attempts!", step.TowerName or "Unknown", step.TowerId or "N/A", maxAttempts), 3)
					end
				end

				currentStepIndex = i
				notifySubscribers()
				task.wait(math.max(0.2, stepDelay))
			end

			if isEnabled and currentStepIndex >= totalSteps then
				updateStatus(string.format("Completed (%d/%d steps)", totalSteps, totalSteps), "All done")
				notifier.Notify("Macro Player", string.format("Macro completed: %s!", macroName), 3)
				pcall(function()
					local webhook = require("@routes/SlopTowerDefense/core/system/webhook")
					webhook.SendMacro(macroName, totalSteps, "Completed")
				end)

				-- Tự động kiểm tra và nâng bù các tháp chưa đạt level tối đa
				if autoCatchUp then
					player.PerformPostPlaybackCatchUp(macroData)
				end
			end

			isPlaying = false
			notifySubscribers()

			-- Chờ trận đấu hiện tại kết thúc hoặc đổi sang Map/Stage mới trước khi lặp lại ở ván tiếp theo
			while isEnabled and gameStats.IsMatchActive() do
				local liveMap = raidManager.GetCurrentMap()
				if liveMap and liveMap ~= currentSessionMap then
					local hasMapped = mapMacroManager.GetMapMacro(liveMap)
					if hasMapped and hasMapped ~= "None" then
						logger.Log(string.format("[Macro Player] 🔄 Phát hiện đổi Map từ '%s' sang '%s'! Chuẩn bị sang kịch bản mới...", tostring(currentSessionMap or "None"), liveMap))
						break
					end
				end
				task.wait(0.5)
			end

			updateStatus("Match finished. Waiting for next match...", "None")
			task.wait(2.0)
		end

		isPlaying = false
		currentStepIndex = 0
		updateStatus("Idle", "None")
	end)
end

function player.IsEnabled(): boolean
	return isEnabled
end

function player.SetEnabled(state: boolean)
	if isEnabled == state then return end
	isEnabled = state

	if isEnabled then
		startRunnerLoop()
	else
		player.Stop()
	end
end

function player.IsPlaying(): boolean
	return isPlaying
end

function player.GetActiveMacro(): string?
	return activeMacroName
end

function player.SetActiveMacro(name: string)
	if activeMacroName == name and currentSnapshot.MacroName == name then
		return
	end
	activeMacroName = name
	currentSnapshot.MacroName = name
	notifySubscribers()
end

function player.GetTimingMode(): string
	return timingMode
end

function player.SetTimingMode(mode: string)
	timingMode = mode
	currentSnapshot.TimingMode = mode
	notifySubscribers()
end

function player.GetStepDelay(): number
	return stepDelay
end

function player.SetStepDelay(delaySec: number)
	stepDelay = math.clamp(delaySec, 0.2, 1)
	currentSnapshot.StepDelay = stepDelay
	notifySubscribers()
end

function player.IsSpeedSyncEnabled(): boolean
	return applyMacroSpeed
end

function player.SetSpeedSync(enabled: boolean)
	applyMacroSpeed = enabled
	currentSnapshot.ApplySpeed = enabled
	notifySubscribers()
end

function player.IsVoteSkipEnabled(): boolean
	return applyMacroVoteSkip
end

function player.SetVoteSkipEnabled(enabled: boolean)
	applyMacroVoteSkip = enabled
	currentSnapshot.ApplyVoteSkip = enabled
	notifySubscribers()
end

player.IsSkipWaveEnabled = player.IsVoteSkipEnabled
player.SetSkipWaveEnabled = player.SetVoteSkipEnabled

function player.IsAutoCatchUp(): boolean
	return autoCatchUp
end

function player.SetAutoCatchUp(state: boolean)
	autoCatchUp = state
	currentSnapshot.AutoCatchUp = state
	notifySubscribers()
end

-- Tương thích ngược: Tính năng Auto Map Switch cũ đã được thay thế hoàn toàn bởi Map Macro
function player.IsAutoMapSwitchEnabled(): boolean
	return true
end

function player.SetAutoMapSwitch(enabled: boolean)
	-- No-op: Map Macro quản lý trực tiếp
end

function player.GetCurrentStepIndex(): number
	return currentStepIndex
end

function player.GetTotalSteps(): number
	return totalSteps
end

function player.GetStatus(): PlaybackSnapshot
	return currentSnapshot
end

function player.Restart()
	if not isEnabled then return end
	table.clear(idToTowerInstance)
	table.clear(idToTowerAttrId)
	table.clear(activeTowers)
	currentStepIndex = 0
	isPlaying = false
	startRunnerLoop()
end

function player.Stop()
	isEnabled = false
	isPlaying = false
	currentStepIndex = 0
	table.clear(idToTowerInstance)
	table.clear(idToTowerAttrId)
	table.clear(activeTowers)
	if activePlaybackThread then
		pcall(task.cancel, activePlaybackThread)
		activePlaybackThread = nil
	end
	updateStatus("Idle", "None")
end

function player.Subscribe(callback: (PlaybackSnapshot) -> ()): () -> ()
	table.insert(subscribers, callback)
	task.spawn(pcall, callback, currentSnapshot)

	return function()
		local idx = table.find(subscribers, callback)
		if idx then
			table.remove(subscribers, idx)
		end
	end
end

-- Bộ giám sát đổi Map toàn cục: Tự động đổi Selected Macro tương ứng kể cả khi Player đang chạy hoặc chờ
local unsubGlobalMap: (() -> ())? = nil
local unsubMapMacroChanged: (() -> ())? = nil

local function setupGlobalAutoMapWatcher()
	if unsubGlobalMap then
		pcall(unsubGlobalMap)
		unsubGlobalMap = nil
	end

	unsubGlobalMap = raidManager.OnMapChanged(function(newMap, oldMap)
		if not newMap or newMap == "" or newMap == oldMap then return end

		-- Kiểm tra cấu hình trong tab Map Macro
		local mapped = mapMacroManager.GetMapMacro(newMap)

		if mapped and mapped ~= "None" and storage.HasMacro(mapped) then
			if mapped ~= activeMacroName then
				logger.Log(string.format("[Macro Player] 🔄 Chuyển sang Macro '%s' cho Map/Stage mới '%s'!", mapped, newMap))
				notifier.Notify("Macro Player", string.format("Switched to Macro: %s (Map: %s)", mapped, newMap), 3)
				player.SetActiveMacro(mapped)
			end

			-- Nếu đang bật Play Macro, tự động khởi động lại playback cho Map/Stage mới
			if isEnabled then
				task.spawn(function()
					task.wait(0.2)
					player.Restart()
				end)
			end
		end
	end)

	if unsubMapMacroChanged then
		pcall(unsubMapMacroChanged)
		unsubMapMacroChanged = nil
	end

	unsubMapMacroChanged = mapMacroManager.OnMappingChanged(function(mapName, macroName)
		if not isEnabled then return end
		local curMap = raidManager.GetCurrentMap()
		if curMap and (curMap == mapName or mapName == "*") then
			local newTarget = mapMacroManager.GetMapMacro(curMap)
			if newTarget and newTarget ~= "None" and storage.HasMacro(newTarget) and newTarget ~= activeMacroName then
				player.SetActiveMacro(newTarget)
				task.spawn(function()
					task.wait(0.2)
					player.Restart()
				end)
			end
		end
	end)
end

setupGlobalAutoMapWatcher()

lifecycle.Register(function()
	player.Stop()
	if unsubGlobalMap then
		pcall(unsubGlobalMap)
		unsubGlobalMap = nil
	end
	if unsubMapMacroChanged then
		pcall(unsubMapMacroChanged)
		unsubMapMacroChanged = nil
	end
end)

return player
