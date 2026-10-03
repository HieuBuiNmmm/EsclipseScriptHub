-- Recorder: Ghi lại các thao tác SpawnTower và SellTower của người chơi khi bật Record.
local types = require("./types")
local storage = require("./storage")
local gameStats = require("@routes/SlopTowerDefense/core/game/gameStats")
local zoneGuard = require("@routes/SlopTowerDefense/core/game/zoneGuard")
local raidManager = require("@routes/SlopTowerDefense/core/game/raidManager")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local logger = require("@routes/SlopTowerDefense/core/system/logger")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local recorder = {}

recorder.InitialSpeed = 1

local isRecording = false
local activeMacroName: string? = nil
local recordedSteps: { types.MacroStep } = {}
local towerIndexCounter = 0
local recordingStartedAtWave = 0
local recordingStartedDuringIntermission = false

-- Bảng tra cứu định danh tháp giữa Instance và TowerId ("T1", "T2")
local instanceToId: { [Instance]: string } = {}
local idToInstance: { [string]: Instance } = {}
local idToInfo: { [string]: { TowerName: string, Position: Vector3 } } = {}

-- Bảng mô phỏng danh sách tháp đang hiện diện trên sân để tính toán LayoutOrder trong UnitManager.Units
local activeTowers: { string } = {}

-- Tham chiếu RemoteFunction từ ReplicatedStorage.Functions
local spawnRemote: RemoteFunction? = nil
local sellRemote: RemoteFunction? = nil
local upgradeRemote: RemoteFunction? = nil
local changeModeRemote: RemoteFunction? = nil
local changeSpeedRemote: RemoteFunction? = nil
local voteSkipRemote: RemoteFunction? = nil

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

	-- 1. Đã ghi nhận trong bảng tracking của Recorder
	if instanceToId[model] then
		return true
	end

	-- 2. Kiểm tra theo logic chuẩn của game (ManagerHandler: IsOwnTower)
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

	-- 3. Fallback: Nếu nằm trong workspace.Towers và không có Owner của người khác
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

	if type(data.Upgrades) == "table" then
		local upg = data.Upgrades[upgradeIndex] or data.Upgrades[tostring(upgradeIndex)]
		if type(upg) == "table" then
			local price = tonumber(upg.Cost or upg.Price or upg.UpgradeCost or upg.UpgradePrice)
			if price and price > 0 then return price end
		elseif type(upg) == "number" and upg > 0 then
			return upg
		end
	end

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
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
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

-- Lấy giá Upgrade từ ReplicatedStorage.LVLs hoặc UnitManager trước khi gọi Remote cho một tower instance
local function getUpgradePriceForTowerInstance(towerInstance: any): number?
	if typeof(towerInstance) ~= "Instance" then return nil end
	local model: Model? = (towerInstance:IsA("Model") and towerInstance) or towerInstance:FindFirstAncestorOfClass("Model")
	if not model then return nil end

	local matchedId = instanceToId[model]
	local towerName = model.Name

	if not matchedId then
		local targetPos: Vector3? = nil
		pcall(function() targetPos = model:GetPivot().Position end)
		if not targetPos and model.PrimaryPart then
			targetPos = model.PrimaryPart.Position
		end
		if targetPos then
			local bestDist = 5.0
			for id, info in pairs(idToInfo) do
				local xzDist = math.sqrt((info.Position.X - targetPos.X)^2 + (info.Position.Z - targetPos.Z)^2)
				local yDist = math.abs(info.Position.Y - targetPos.Y)
				if xzDist < bestDist and yDist <= 12.0 then
					bestDist = xzDist
					matchedId = id
					towerName = info.TowerName
				end
			end
		end
	end

	local curLvl = getTowerLevel(model)
	local nextLvl = curLvl + 1

	-- 1. Ưu tiên hàng đầu: Tra cứu chính xác từ ReplicatedStorage.LVLs
	local lvlsPrice = getUpgradePriceFromLVLs(towerName, nextLvl)
	if lvlsPrice and lvlsPrice > 0 then
		return lvlsPrice
	end

	-- 2. Tra cứu từ UnitManager UI theo LayoutOrder hoặc tên tháp
	local targetLayoutOrder: number? = nil
	if matchedId then
		targetLayoutOrder = table.find(activeTowers, matchedId)
	end

	local uiPrice = getUpgradePriceFromUnitManager(targetLayoutOrder, towerName)
	if uiPrice and uiPrice > 0 then
		return uiPrice
	end

	-- 3. Tra cứu từ Modules.TowersConfig
	local cfgPrice = getUpgradePrice(towerName, nextLvl)
	if cfgPrice and cfgPrice > 0 then
		return cfgPrice
	end

	return nil
end

-- Lấy tốc độ trận đấu hiện tại từ GameGui.SpeedUp.Message (định dạng ": x1", ": x2", ...)
local function getCurrentGameSpeed(): number
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
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

-- Tìm Model tháp trong workspace gần tọa độ đặt (ưu tiên khoảng cách ngang XZ và hỗ trợ variant/skin)
local function findTowerNearPosition(name: string?, targetPos: Vector3, maxHorizontalDist: number?, variantName: string?): Model?
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

-- Thêm 1 bước hành động vào danh sách ghi nhận
function recorder.AddStep(actionType: types.ActionType, details: { [string]: any })
	if not isRecording then return end

	local wave, _ = gameStats.GetWave()
	local elapsedTime = gameStats.GetElapsedTime()
	local cash = gameStats.GetCash()

	local stepIndex = #recordedSteps + 1
	local currentSpeed = getCurrentGameSpeed()
	local step: types.MacroStep = {
		Index = stepIndex,
		Type = actionType,
		TowerId = details.TowerId or ("T" .. tostring(stepIndex)),
		TowerName = details.TowerName or "Unknown",
		Level = details.Level,
		Speed = details.Speed,
		RecordSpeed = currentSpeed,
		CFrame = details.CFrame,
		Position = details.Position,
		Arg3 = details.Arg3,
		Arg4 = details.Arg4,
		Arg5 = details.Arg5,
		Wave = wave,
		Time = elapsedTime,
		Cost = details.Cost or cash,
		TowerCost = details.TowerCost,
		LayoutOrder = details.LayoutOrder,
		TargetMode = details.TargetMode,
		RawData = details.RawData,
	}

	table.insert(recordedSteps, step)

	if actionType == "Place" then
		notifier.Notify("Macro Record", string.format("Recorded Place: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
	elseif actionType == "Sell" then
		notifier.Notify("Macro Record", string.format("Recorded Sell: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
	elseif actionType == "Upgrade" then
		local lvlStr = (step.Level ~= nil) and string.format(" -> LVL %d", step.Level) or ""
		local costVal = step.Cost or step.TowerCost
		local costStr = (costVal and costVal > 0) and string.format(" ($%s)", tostring(costVal):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")) or ""
		notifier.Notify("Macro Record", string.format("Recorded Upgrade: %s (%s)%s%s [%.2fs]", step.TowerName, step.TowerId, lvlStr, costStr, step.Time), 1.5)
	elseif actionType == "Target" then
		notifier.Notify("Macro Record", string.format("Recorded Target: %s (%s) [%.2fs]", step.TowerName, step.TowerId, step.Time), 1.5)
	elseif actionType == "VoteSkip" then
		notifier.Notify("Macro Record", string.format("Recorded VoteSkip [%.2fs]", step.Time), 1.5)
	end
end

-- Xử lý ghi nhận SpawnTower khi Remote được gọi
local function handleSpawnTower(args: { any }, returnedModel: any)
	local ok, err = pcall(function()
		local towerName = type(args[1]) == "string" and args[1] or "Unknown"
		local cf = typeof(args[2]) == "CFrame" and args[2] or nil
		local pos: Vector3? = nil
		if cf then
			pos = cf.Position
		elseif typeof(args[2]) == "Vector3" then
			pos = args[2]
			cf = CFrame.new(pos)
		end

		local arg3 = args[3] == true
		local arg4 = type(args[4]) == "string" and args[4] or nil
		local arg5 = type(args[5]) == "table" and args[5] or nil

		local cfComponents = cf and { cf:GetComponents() } or nil
		local posTable = pos and { pos.X, pos.Y, pos.Z } or nil
		local initialCash = gameStats.GetCash()

		-- Xác thực thành công:
		-- 1. Server trả về Instance Model trực tiếp
		-- 2. Hoặc tìm thấy Model mới xuất hiện gần vị trí đặt trong vòng 0.6s
		-- 3. Hoặc tiền bị trừ (curCash < initialCash)
		local spawnedModel: Model? = nil
		if typeof(returnedModel) == "Instance" then
			spawnedModel = (returnedModel:IsA("Model") and returnedModel or returnedModel:FindFirstAncestorOfClass("Model")) :: Model?
		end

		if not spawnedModel and pos then
			for _ = 1, 6 do
				task.wait(0.1)
				if not isRecording then return end
				spawnedModel = findTowerNearPosition(towerName, pos, 4.0, arg4)
				if spawnedModel then break end
				if gameStats.GetCash() < initialCash then break end
			end
		end

		local curCash = gameStats.GetCash()
		local cashDeducted = curCash < initialCash
		local isSuccess = (spawnedModel ~= nil) or cashDeducted or (returnedModel == true)

		if not isSuccess then
			-- Thao tác đặt tháp thất bại (thiếu tiền, vị trí không hợp lệ, v.v.), bỏ qua không ghi nhận!
			return
		end

		-- Kiểm tra xem Model có thuộc về người chơi khác không nếu model đã xuất hiện
		if spawnedModel then
			local cfg = spawnedModel:FindFirstChild("Config")
			local owner = cfg and cfg:FindFirstChild("Owner")
			if owner and (owner:IsA("StringValue") or owner:IsA("ValueBase")) then
				local localPlayer = Players.LocalPlayer
				local localName = localPlayer and localPlayer.Name
				if localName and owner.Value ~= "" and owner.Value ~= localName then
					return
				end
			end
		end

		-- Tự động dừng Record và lưu Macro nếu người chơi đặt tháp ở Map mới mà watcher chưa kịp dừng
		local curWave, _ = gameStats.GetWave()
		if recordingStartedAtWave > 0 and curWave >= (recordingStartedAtWave + 25) then
			logger.Log(string.format("[Recorder] Map cũ đã hoàn thành (Wave %d) -> Tự động dừng và lưu Macro!", curWave))
			task.spawn(function()
				recorder.StopRecording("MapCompleted")
			end)
			return
		end

		towerIndexCounter += 1
		local towerId = "T" .. tostring(towerIndexCounter)
		table.insert(activeTowers, towerId)

		if pos then
			idToInfo[towerId] = {
				TowerName = towerName,
				Position = pos,
			}
		end

		if spawnedModel then
			instanceToId[spawnedModel] = towerId
			idToInstance[towerId] = spawnedModel
		end

		-- Trích xuất Attribute ID từ Model tháp
		local towerAttrId: string? = nil
		if spawnedModel then
			pcall(function()
				towerAttrId = spawnedModel:GetAttribute("ID")
			end)
		end

		local configPrice = getPlacePrice(towerName)
		local exactTowerCost = configPrice or (cashDeducted and (initialCash - curCash) or nil)

		-- Tra cứu giá đặt từ Config.Price nếu model đã khởi tạo giá trị
		if not exactTowerCost and spawnedModel then
			local cfg = spawnedModel:FindFirstChild("Config")
			local prc = cfg and cfg:FindFirstChild("Price")
			if prc and (prc:IsA("IntValue") or prc:IsA("NumberValue")) and prc.Value > 0 then
				exactTowerCost = prc.Value
			end
		end

		local stepIndex = #recordedSteps + 1

		recorder.AddStep("Place", {
			TowerId = towerId,
			TowerName = towerName,
			Level = 0,
			LayoutOrder = #activeTowers,
			CFrame = cfComponents,
			Position = posTable,
			Arg3 = arg3,
			Arg4 = arg4,
			Arg5 = arg5,
			Cost = exactTowerCost,
			TowerCost = exactTowerCost,
			RawData = {
				Arg1 = args[1],
				Arg2 = tostring(args[2]),
				Arg3 = args[3],
				Arg4 = args[4],
				Arg5 = args[5],
				AttributeID = towerAttrId,
			},
		})

		-- Theo dõi thêm biến động tiền, liên kết Model và AttributeID nếu lúc đặt chưa kịp lấy
		if pos and (not exactTowerCost or not idToInstance[towerId] or not towerAttrId) then
			task.spawn(function()
				for _ = 1, 15 do
					task.wait(0.2)
					if not isRecording then break end

					local nowCash = gameStats.GetCash()
					if nowCash < initialCash and recordedSteps[stepIndex] then
						local exactPrice = initialCash - nowCash
						if exactPrice > 0 then
							if not recordedSteps[stepIndex].TowerCost then
								recordedSteps[stepIndex].TowerCost = exactPrice
							end
							if not recordedSteps[stepIndex].Cost or recordedSteps[stepIndex].Cost == initialCash then
								recordedSteps[stepIndex].Cost = exactPrice
							end
						end
					end

					if not idToInstance[towerId] then
						local model = findTowerNearPosition(towerName, pos, 4.0, arg4)
						if model and isOwnTower(model) then
							instanceToId[model] = towerId
							idToInstance[towerId] = model
						end
					end

					local curModel = idToInstance[towerId]
					if curModel and not towerAttrId then
						pcall(function()
							towerAttrId = curModel:GetAttribute("ID")
						end)
						if towerAttrId and recordedSteps[stepIndex] and recordedSteps[stepIndex].RawData then
							recordedSteps[stepIndex].RawData.AttributeID = towerAttrId
						end
					end

					if recordedSteps[stepIndex] and recordedSteps[stepIndex].TowerCost and idToInstance[towerId] and towerAttrId then
						break
					end
				end
			end)
		end
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận SpawnTower:", tostring(err))
	end
end

-- Xử lý ghi nhận SellTower khi Remote được gọi
local function handleSellTower(args: { any }, returnedResult: any)
	local ok, err = pcall(function()
		local rawInst = args[1]
		if typeof(rawInst) ~= "Instance" then return end
		local towerInstance: Model? = (rawInst:IsA("Model") and rawInst) or rawInst:FindFirstAncestorOfClass("Model")
		if not towerInstance then return end

		-- Lọc tháp: Chỉ ghi nhận bán tháp của chính người chơi
		if not isOwnTower(towerInstance) then
			logger.Log(string.format("[Recorder] Bỏ qua SellTower cho '%s' vì không phải tháp của người chơi.", towerInstance.Name))
			return
		end

		local initialCash = gameStats.GetCash()

		-- Xác thực thành công:
		-- 1. Server trả về kết quả hợp lệ (không phải false/nil)
		-- 2. Tháp bị gỡ khỏi workspace (towerInstance.Parent == nil) trong vòng 0.6s
		-- 3. Hoặc tiền tăng lên (nhận lại tiền bán tháp)
		local isSuccess = false
		if returnedResult == true or (returnedResult ~= nil and returnedResult ~= false) then
			isSuccess = true
		end

		if not isSuccess then
			for _ = 1, 6 do
				task.wait(0.1)
				if not isRecording then return end
				if towerInstance.Parent == nil or gameStats.GetCash() > initialCash then
					isSuccess = true
					break
				end
			end
		end

		if not isSuccess then
			-- Thao tác bán tháp thất bại, bỏ qua không ghi nhận!
			return
		end

		local matchedId: string? = nil
		local towerName = towerInstance.Name
		local targetPos: Vector3? = nil

		if instanceToId[towerInstance] then
			matchedId = instanceToId[towerInstance]
		else
			-- Thử tìm theo khoảng cách gần nhất với các tháp đã lưu
			pcall(function()
				targetPos = towerInstance:GetPivot().Position
			end)
			if not targetPos and towerInstance.PrimaryPart then
				targetPos = towerInstance.PrimaryPart.Position
			end

			if targetPos then
				local bestDist = 5.0
				for id, info in pairs(idToInfo) do
					local xzDist = math.sqrt((info.Position.X - targetPos.X)^2 + (info.Position.Z - targetPos.Z)^2)
					local yDist = math.abs(info.Position.Y - targetPos.Y)
					if xzDist < bestDist and yDist <= 12.0 then
						bestDist = xzDist
						matchedId = id
						towerName = info.TowerName
					end
				end
			end
		end

		if not matchedId then
			matchedId = "T_Sold_" .. tostring(#recordedSteps + 1)
		end

		local posTable: { number }? = nil
		if matchedId and idToInfo[matchedId] then
			local p = idToInfo[matchedId].Position
			posTable = { p.X, p.Y, p.Z }
		elseif targetPos then
			posTable = { targetPos.X, targetPos.Y, targetPos.Z }
		end

		local currentLayoutOrder: number? = nil
		if matchedId then
			currentLayoutOrder = table.find(activeTowers, matchedId)
		end

		-- Lấy Attribute ID của tháp
		local towerAttrId: string? = nil
		pcall(function()
			towerAttrId = towerInstance:GetAttribute("ID")
		end)

		recorder.AddStep("Sell", {
			TowerId = matchedId,
			TowerName = towerName,
			LayoutOrder = currentLayoutOrder,
			Position = posTable,
			RawData = {
				InstanceName = towerInstance.Name,
				AttributeID = towerAttrId,
			},
		})

		if towerInstance then
			instanceToId[towerInstance] = nil
		end
		if matchedId then
			local actIdx = table.find(activeTowers, matchedId)
			if actIdx then
				table.remove(activeTowers, actIdx)
			end
			idToInstance[matchedId] = nil
			idToInfo[matchedId] = nil
		end
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận SellTower:", tostring(err))
	end
end

-- Xử lý ghi nhận UpgradeTower khi Remote được gọi
local function handleUpgradeTower(args: { any }, returnedModel: any, preUpgPrice: number?, preRecordedLvl: number?)
	local ok, err = pcall(function()
		local rawInst = args[1]
		if typeof(rawInst) ~= "Instance" then return end
		local towerInstance: Model? = (rawInst:IsA("Model") and rawInst) or rawInst:FindFirstAncestorOfClass("Model")
		if not towerInstance then return end

		-- 1. Lọc tháp: Chỉ ghi nhận tháp của chính người chơi, bỏ qua tháp của đồng đội
		if not isOwnTower(towerInstance) then
			logger.Log(string.format("[Recorder] Bỏ qua Upgrade cho '%s' vì không phải tháp của người chơi.", towerInstance.Name))
			return
		end

		local towerName = towerInstance.Name
		local initialLvl = preRecordedLvl or getTowerLevel(towerInstance)
		local maxLvl = getTowerMaxLevel(towerName)
		if maxLvl > 0 and initialLvl >= maxLvl then
			-- Tháp đã đạt Max level, không thể nâng cấp tiếp -> Bỏ qua
			return
		end

		local initialCash = gameStats.GetCash()

		-- 2. Xác thực thành công 100% dựa trên game internals:
		-- - Server trả về Model Instance hoặc true
		-- - Hoặc Config.LVL.Value tăng lên (replicate từ server)
		-- - Hoặc tiền bị trừ trong cửa sổ chờ 0.4s
		local isSuccess = false
		local updatedModel: Instance? = nil

		if typeof(returnedModel) == "Instance" then
			isSuccess = true
			updatedModel = (returnedModel:IsA("Model") and returnedModel) or returnedModel:FindFirstAncestorOfClass("Model")
		elseif returnedModel == true then
			isSuccess = true
		end

		local currentLvl = getTowerLevel(towerInstance)
		if currentLvl > initialLvl then
			isSuccess = true
		end

		if not isSuccess then
			-- Đợi tối đa 0.4s để kiểm tra Level tăng hoặc Tiền giảm
			for _ = 1, 8 do
				task.wait(0.05)
				if not isRecording then return end
				currentLvl = getTowerLevel(towerInstance)
				if currentLvl > initialLvl then
					isSuccess = true
					break
				end
				if gameStats.GetCash() < initialCash then
					isSuccess = true
					break
				end
			end
		end

		if not isSuccess then
			-- Thao tác nâng cấp không thành công (thiếu tiền, spam click, server từ chối) -> Bỏ qua
			return
		end

		-- 3. Xác định Model mới (nếu có) và Level mới
		currentLvl = getTowerLevel(towerInstance)
		local newLvl = math.max(currentLvl, initialLvl + 1)

		-- 4. Tìm ID và vị trí của tháp
		local matchedId: string? = nil
		local targetPos: Vector3? = nil

		if instanceToId[towerInstance] then
			matchedId = instanceToId[towerInstance]
		else
			pcall(function()
				targetPos = towerInstance:GetPivot().Position
			end)
			if not targetPos and towerInstance.PrimaryPart then
				targetPos = towerInstance.PrimaryPart.Position
			end

			if targetPos then
				local bestDist = 5.0
				for id, info in pairs(idToInfo) do
					local xzDist = math.sqrt((info.Position.X - targetPos.X)^2 + (info.Position.Z - targetPos.Z)^2)
					local yDist = math.abs(info.Position.Y - targetPos.Y)
					if xzDist < bestDist and yDist <= 12.0 then
						bestDist = xzDist
						matchedId = id
						towerName = info.TowerName
					end
				end
			end
		end

		if not matchedId then
			matchedId = "T_Upgraded_" .. tostring(#recordedSteps + 1)
		end

		-- Nếu server trả về Model mới của tháp sau nâng cấp, cập nhật mapping
		if updatedModel and matchedId then
			instanceToId[updatedModel] = matchedId
			idToInstance[matchedId] = updatedModel
		end

		local posTable: { number }? = nil
		if matchedId and idToInfo[matchedId] then
			local p = idToInfo[matchedId].Position
			posTable = { p.X, p.Y, p.Z }
		elseif targetPos then
			posTable = { targetPos.X, targetPos.Y, targetPos.Z }
		end

		local targetLayoutOrder: number? = nil
		if matchedId then
			targetLayoutOrder = table.find(activeTowers, matchedId)
		end

		-- 5. Lấy Attribute ID của tháp (rất quan trọng cho server remote)
		local towerAttrId: string? = nil
		pcall(function()
			towerAttrId = towerInstance:GetAttribute("ID")
		end)
		if not towerAttrId and type(args[2]) == "string" then
			towerAttrId = args[2]
		end

		-- 6. Tính toán chi phí chính xác tuyệt đối
		local exactCost: number? = nil

		-- Ưu tiên 1: Tra cứu trực tiếp từ ReplicatedStorage.LVLs[towerName][newLvl].Price
		exactCost = getUpgradePriceFromLVLs(towerName, newLvl)

		-- Ưu tiên 2: Giá đã lưu trước khi gọi remote (preUpgPrice)
		if not exactCost or exactCost <= 0 then
			exactCost = preUpgPrice
		end

		-- Ưu tiên 3: Đọc trực tiếp từ UnitManager UI theo thẻ
		if not exactCost or exactCost <= 0 then
			exactCost = getUpgradePriceFromUnitManager(targetLayoutOrder, towerName)
		end

		-- Ưu tiên 4: Tra cứu từ TowersConfig
		if not exactCost or exactCost <= 0 then
			exactCost = getUpgradePrice(towerName, newLvl)
		end

		-- Ưu tiên 5: Chênh lệch ví tiền với snapToCleanPrice
		local curCash = gameStats.GetCash()
		if not exactCost or exactCost <= 0 then
			if curCash < initialCash then
				local diff = initialCash - curCash
				exactCost = snapToCleanPrice(diff) or diff
			end
		end

		local stepIndex = #recordedSteps + 1

		recorder.AddStep("Upgrade", {
			TowerId = matchedId,
			TowerName = towerName,
			Level = newLvl,
			LayoutOrder = targetLayoutOrder,
			Arg4 = towerAttrId or (type(args[2]) == "string" and args[2] or nil),
			Position = posTable,
			Cost = exactCost,
			TowerCost = exactCost,
			RawData = {
				InstanceName = towerInstance.Name,
				AttributeID = towerAttrId,
				TargetLevel = newLvl,
				InitialLevel = initialLvl,
				Arg2 = args[2],
			},
		})

		-- Dự phòng: Nếu lúc này vẫn chưa chốt được giá, tiếp tục quan sát ví tiền thêm 1.5s
		if not exactCost then
			task.spawn(function()
				for _ = 1, 10 do
					task.wait(0.15)
					if not isRecording then break end
					local nowCash = gameStats.GetCash()
					if nowCash < initialCash and recordedSteps[stepIndex] then
						local diff = initialCash - nowCash
						if diff > 0 then
							diff = snapToCleanPrice(diff) or diff
							if not recordedSteps[stepIndex].TowerCost then
								recordedSteps[stepIndex].TowerCost = diff
							end
							if not recordedSteps[stepIndex].Cost or recordedSteps[stepIndex].Cost == initialCash then
								recordedSteps[stepIndex].Cost = diff
							end
							break
						end
					end
				end
			end)
		end
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận UpgradeTower:", tostring(err))
	end
end

-- Xử lý ghi nhận VoteSkip khi Remote được gọi
local function handleVoteSkip()
	local ok, err = pcall(function()
		recorder.AddStep("VoteSkip", {
			TowerId = "SKIP",
			TowerName = "VoteSkip",
			Cost = 0,
		})
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận VoteSkip:", tostring(err))
	end
end

-- Xử lý ghi nhận ChangeTowerMode khi Remote được gọi
local function handleChangeTowerMode(args: { any }, returnedResult: any)
	local ok, err = pcall(function()
		if returnedResult == false then return end
		local rawInst = args[1]
		if typeof(rawInst) ~= "Instance" then return end
		local towerInstance: Model? = (rawInst:IsA("Model") and rawInst) or rawInst:FindFirstAncestorOfClass("Model")
		if not towerInstance then return end

		-- Lọc tháp: Chỉ ghi nhận đổi chế độ tháp của chính người chơi
		if not isOwnTower(towerInstance) then
			return
		end

		local matchedId: string? = nil
		local towerName = towerInstance.Name
		local targetPos: Vector3? = nil

		if instanceToId[towerInstance] then
			matchedId = instanceToId[towerInstance]
		else
			-- Thử tìm theo khoảng cách gần nhất với các tháp đã lưu
			pcall(function()
				targetPos = towerInstance:GetPivot().Position
			end)
			if not targetPos and towerInstance.PrimaryPart then
				targetPos = towerInstance.PrimaryPart.Position
			end

			if targetPos then
				local bestDist = 5.0
				for id, info in pairs(idToInfo) do
					local xzDist = math.sqrt((info.Position.X - targetPos.X)^2 + (info.Position.Z - targetPos.Z)^2)
					local yDist = math.abs(info.Position.Y - targetPos.Y)
					if xzDist < bestDist and yDist <= 12.0 then
						bestDist = xzDist
						matchedId = id
						towerName = info.TowerName
					end
				end
			end
		end

		if not matchedId then
			matchedId = "T_Target_" .. tostring(#recordedSteps + 1)
		end

		local posTable: { number }? = nil
		if matchedId and idToInfo[matchedId] then
			local p = idToInfo[matchedId].Position
			posTable = { p.X, p.Y, p.Z }
		elseif targetPos then
			posTable = { targetPos.X, targetPos.Y, targetPos.Z }
		end

		-- Thử đọc thuộc tính TargetMode nếu có
		local targetModeStr: string? = nil
		pcall(function()
			targetModeStr = towerInstance:GetAttribute("TargetMode")
				or towerInstance:GetAttribute("Target")
				or towerInstance:GetAttribute("Mode")
		end)

		local towerAttrId: string? = nil
		pcall(function()
			towerAttrId = towerInstance:GetAttribute("ID")
		end)

		local targetLayoutOrder: number? = nil
		if matchedId then
			targetLayoutOrder = table.find(activeTowers, matchedId)
		end

		recorder.AddStep("Target", {
			TowerId = matchedId,
			TowerName = towerName,
			LayoutOrder = targetLayoutOrder,
			TargetMode = targetModeStr,
			Position = posTable,
			RawData = {
				InstanceName = towerInstance.Name,
				AttributeID = towerAttrId,
				TargetMode = targetModeStr,
			},
		})
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận ChangeTowerMode:", tostring(err))
	end
end

-- Xử lý ghi nhận đổi Speed trận đấu
local function handleChangeSpeed(args: { any })
	local ok, err = pcall(function()
		local speedArg = args[1]
		local speedNum = tonumber(speedArg)
		if not speedNum then return end

		-- Tránh duplicate nếu spam cùng một tốc độ liên tiếp
		if #recordedSteps > 0 then
			local last = recordedSteps[#recordedSteps]
			if last.Type == "Speed" and last.Speed == speedNum then
				return
			end
		end

		recorder.AddStep("Speed", {
			TowerId = "SPEED",
			TowerName = "GameSpeed",
			Speed = speedNum,
			Cost = 0,
			RawData = {
				Speed = speedNum,
			},
		})
		notifier.Notify("Macro Recorder", string.format("Recorded speed change: x%d", speedNum), 1.5)
	end)

	if not ok then
		logger.Warn("[Recorder] Lỗi ghi nhận ChangeSpeed:", tostring(err))
	end
end

-- Hook Remote an toàn, không block main thread và không làm biến đổi Namecall register
local isHookInstalled = false
local oldNamecall

local function setupRemoteHook()
	if isHookInstalled then return end

	getRemotes()

	local wrapC = newcclosure or function(f) return f end
	local setnc = setnamecallmethod or function(...) end

	if hookmetamethod then
		isHookInstalled = true
		oldNamecall = hookmetamethod(game, "__namecall", wrapC(function(self, ...)
			local method = getnamecallmethod and getnamecallmethod()
			if isRecording and typeof(self) == "Instance" and method == "InvokeServer" then
				local remoteName = nil
				pcall(function()
					remoteName = self.Name
				end)

				if remoteName == "SpawnTower" or (spawnRemote and self == spawnRemote) then
					if not spawnRemote then spawnRemote = self end
					local args = { ... }
					if setnc and method then setnc(method) end
					local res = table.pack(oldNamecall(self, ...))
					task.spawn(handleSpawnTower, args, res[1])
					return table.unpack(res, 1, res.n)
				elseif remoteName == "SellTower" or (sellRemote and self == sellRemote) then
					if not sellRemote then sellRemote = self end
					local args = { ... }
					if setnc and method then setnc(method) end
					local res = table.pack(oldNamecall(self, ...))
					task.spawn(handleSellTower, args, res[1])
					return table.unpack(res, 1, res.n)
				elseif remoteName == "UpgradeTower" or (upgradeRemote and self == upgradeRemote) then
					if not upgradeRemote then upgradeRemote = self end
					local args = { ... }
					local towerInst = args[1]
					local initialLvl = getTowerLevel(towerInst)
					local preUpgPrice = getUpgradePriceForTowerInstance(towerInst)
					if setnc and method then setnc(method) end
					local res = table.pack(oldNamecall(self, ...))
					task.spawn(handleUpgradeTower, args, res[1], preUpgPrice, initialLvl)
					return table.unpack(res, 1, res.n)
				elseif remoteName == "ChangeTowerMode" or (changeModeRemote and self == changeModeRemote) then
					if not changeModeRemote then changeModeRemote = self end
					local args = { ... }
					if setnc and method then setnc(method) end
					local res = table.pack(oldNamecall(self, ...))
					task.spawn(handleChangeTowerMode, args, res[1])
					return table.unpack(res, 1, res.n)
				elseif remoteName == "ChangeSpeed" or (changeSpeedRemote and self == changeSpeedRemote) then
					if not changeSpeedRemote then changeSpeedRemote = self end
					local args = { ... }
					task.spawn(handleChangeSpeed, args)
				elseif remoteName == "VoteSkip" or (voteSkipRemote and self == voteSkipRemote) then
					if not voteSkipRemote then voteSkipRemote = self end
					task.spawn(handleVoteSkip)
				end
			end

			if setnc and method then
				setnc(method)
			end
			return oldNamecall(self, ...)
		end))
	elseif hookfunction and spawnRemote and sellRemote then
		isHookInstalled = true
		local oldSpawnInvoke
		oldSpawnInvoke = hookfunction(spawnRemote.InvokeServer, wrapC(function(self, ...)
			if isRecording then
				local args = { ... }
				local res = table.pack(oldSpawnInvoke(self, ...))
				task.spawn(handleSpawnTower, args, res[1])
				return table.unpack(res, 1, res.n)
			end
			return oldSpawnInvoke(self, ...)
		end))

		local oldSellInvoke
		oldSellInvoke = hookfunction(sellRemote.InvokeServer, wrapC(function(self, ...)
			if isRecording then
				local args = { ... }
				local res = table.pack(oldSellInvoke(self, ...))
				task.spawn(handleSellTower, args, res[1])
				return table.unpack(res, 1, res.n)
			end
			return oldSellInvoke(self, ...)
		end))

		if upgradeRemote then
			local oldUpgradeInvoke
			oldUpgradeInvoke = hookfunction(upgradeRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					local args = { ... }
					local towerInst = args[1]
					local initialLvl = getTowerLevel(towerInst)
					local preUpgPrice = getUpgradePriceForTowerInstance(towerInst)
					local res = table.pack(oldUpgradeInvoke(self, ...))
					task.spawn(handleUpgradeTower, args, res[1], preUpgPrice, initialLvl)
					return table.unpack(res, 1, res.n)
				end
				return oldUpgradeInvoke(self, ...)
			end))
		end

		if changeModeRemote then
			local oldChangeModeInvoke
			oldChangeModeInvoke = hookfunction(changeModeRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					local args = { ... }
					local res = table.pack(oldChangeModeInvoke(self, ...))
					task.spawn(handleChangeTowerMode, args, res[1])
					return table.unpack(res, 1, res.n)
				end
				return oldChangeModeInvoke(self, ...)
			end))
		end

		if changeSpeedRemote then
			local oldChangeSpeedInvoke
			oldChangeSpeedInvoke = hookfunction(changeSpeedRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					local args = { ... }
					task.spawn(handleChangeSpeed, args)
				end
				return oldChangeSpeedInvoke(self, ...)
			end))
		end

		if voteSkipRemote then
			local oldVoteSkipInvoke
			oldVoteSkipInvoke = hookfunction(voteSkipRemote.InvokeServer, wrapC(function(self, ...)
				if isRecording then
					task.spawn(handleVoteSkip)
				end
				return oldVoteSkipInvoke(self, ...)
			end))
		end
	else
		logger.Warn("[Recorder] Executor không hỗ trợ hookmetamethod hoặc hookfunction!")
	end
end

function recorder.IsRecording(): boolean
	return isRecording
end

function recorder.GetActiveMacro(): string?
	return activeMacroName
end

function recorder.SetActiveMacro(name: string)
	activeMacroName = name
end

function recorder.GetSteps(): { types.MacroStep }
	return recordedSteps
end

function recorder.ClearSteps()
	table.clear(recordedSteps)
	table.clear(activeTowers)
	table.clear(instanceToId)
	table.clear(idToInstance)
	table.clear(idToInfo)
	towerIndexCounter = 0
end

local stateListeners: { (boolean) -> () } = {}

local function notifyState(recording: boolean)
	for _, cb in ipairs(stateListeners) do
		task.spawn(pcall, cb, recording)
	end
end

-- Đăng ký lắng nghe thay đổi trạng thái Record (ví dụ: tự động dừng khi xuất hiện EndScreen)
function recorder.OnRecordingStateChanged(callback: (boolean) -> ()): () -> ()
	table.insert(stateListeners, callback)
	return function()
		local idx = table.find(stateListeners, callback)
		if idx then
			table.remove(stateListeners, idx)
		end
	end
end

-- Giám sát EndScreen để tự động ngừng Record khi ván đấu kết thúc
local activeWatcherThread: thread? = nil
local activeEndScreenConn: RBXScriptConnection? = nil
local activeNotifConn: RBXScriptConnection? = nil
local unsubRaidIntermission: (() -> ())? = nil
local unsubRaidMap: (() -> ())? = nil

local function getEndScreen(): GuiObject?
	local player = Players.LocalPlayer
	local playerGui = player and player:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	if not gameGui then return nil end

	local endScreen = gameGui:FindFirstChild("EndScreen", true)
	if endScreen and endScreen:IsA("GuiObject") then
		return endScreen
	end
	return nil
end

local function isEndScreenVisible(): boolean
	local endScreen = getEndScreen()
	return endScreen ~= nil and endScreen.Visible == true
end

local function cleanupEndScreenWatcher()
	if activeEndScreenConn then
		pcall(function()
			activeEndScreenConn:Disconnect()
		end)
		activeEndScreenConn = nil
	end
	if activeNotifConn then
		pcall(function()
			activeNotifConn:Disconnect()
		end)
		activeNotifConn = nil
	end
	if unsubRaidIntermission then
		pcall(unsubRaidIntermission)
		unsubRaidIntermission = nil
	end
	if unsubRaidMap then
		pcall(unsubRaidMap)
		unsubRaidMap = nil
	end
	if activeWatcherThread then
		pcall(task.cancel, activeWatcherThread)
		activeWatcherThread = nil
	end
end

local function startEndScreenWatcher()
	cleanupEndScreenWatcher()

	-- 1. Lắng nghe trực tiếp qua PropertyChangedSignal của EndScreen nếu đã có
	local endScreen = getEndScreen()
	if endScreen then
		activeEndScreenConn = endScreen:GetPropertyChangedSignal("Visible"):Connect(function()
			if isRecording and endScreen.Visible == true then
				logger.Log("[Recorder] Phát hiện EndScreen (Signal)! Tự động dừng Record...")
				task.spawn(function()
					recorder.StopRecording("EndScreen")
				end)
			end
		end)
	end

	-- 2. Lắng nghe trạng thái Intermission từ RaidManager (PlayerGui.RaidReady)
	-- Khi kết thúc map (hết 25 wave), game vào Intermission -> Tự động dừng và lưu Macro cho map đó (Cách 1)
	unsubRaidIntermission = raidManager.OnIntermissionChanged(function(isActive, curMap)
		if not isRecording then return end
		if not isActive then
			-- Khi Intermission kết thúc (bắt đầu vào đợt sóng), đánh dấu đã qua giai đoạn chuẩn bị ban đầu
			recordingStartedDuringIntermission = false
			return
		end

		-- Khi isActive == true: Intermission bắt đầu!
		-- Nếu người chơi vừa mới bấm Record ngay trong Intermission hiện tại thì chưa dừng vội
		if recordingStartedDuringIntermission then
			return
		end

		local curWave, _ = gameStats.GetWave()
		local stepCount = #recordedSteps
		if stepCount > 0 or curWave >= 25 then
			logger.Log(string.format("[Recorder] 🏁 Raid Intermission xuất hiện (Wave %d, Map: %s) -> Map hoàn thành! Tự động dừng và lưu Macro '%s'!",
				curWave, tostring(curMap or "Unknown"), tostring(activeMacroName or "Unknown")))
			task.spawn(function()
				recorder.StopRecording("MapCompleted")
			end)
		end
	end)

	-- 3. Lắng nghe trực tiếp khi workspace.Map đổi map mới
	unsubRaidMap = raidManager.OnMapChanged(function(newMap, oldMap)
		if not isRecording then return end
		if newMap and oldMap and newMap ~= oldMap then
			local curWave, _ = gameStats.GetWave()
			logger.Log(string.format("[Recorder] 🗺️ Phát hiện đổi Map từ '%s' sang '%s' (Wave %d) -> Tự động dừng và lưu Macro cho map cũ '%s'!",
				tostring(oldMap), tostring(newMap), curWave, tostring(activeMacroName or "Unknown")))
			task.spawn(function()
				recorder.StopRecording("MapChanged")
			end)
		end
	end)

	-- 4. Lắng nghe Landmark 'New raid map!' hoặc 'towers refunded' trong Notifications UI (Real-time 0ms delay)
	local playerGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
	local gameGui = playerGui and playerGui:FindFirstChild("GameGui")
	local notifs = gameGui and gameGui:FindFirstChild("Notifications", true)
	if notifs then
		activeNotifConn = notifs.DescendantAdded:Connect(function(desc)
			if not isRecording then return end
			if desc:IsA("TextLabel") then
				local cText = desc.Text:lower():gsub("%s+", "")
				if cText:find("newraidmap") or cText:find("towersrefunded") then
					local curWave, _ = gameStats.GetWave()
					local stepCount = #recordedSteps
					if stepCount > 0 or curWave >= 20 then
						logger.Log(string.format("[Recorder] 🔔 Phát hiện landmark '%s' -> Map hoàn thành! Tự động dừng và lưu Macro '%s'!",
							desc.Text, tostring(activeMacroName or "Unknown")))
						task.spawn(function()
							recorder.StopRecording("MapCompleted")
						end)
					end
				end
			end
		end)
	end

	-- 5. Vòng lặp định kỳ: quét EndScreen, kiểm tra trạng thái trong trận, và fallback tự động dừng khi kết thúc map
	activeWatcherThread = task.spawn(function()
		while isRecording and lifecycle.IsActive() do
			task.wait(0.35)
			if not isRecording then break end

			pcall(function()
				if isEndScreenVisible() then
					logger.Log("[Recorder] Phát hiện EndScreen (Polling)! Tự động dừng Record...")
					recorder.StopRecording("EndScreen")
					return
				end

				if not zoneGuard.IsInGame() then
					logger.Log("[Recorder] Người chơi đã rời ván đấu! Tự động dừng Record...")
					recorder.StopRecording("LeftGame")
					return
				end

				-- Kiểm tra thông báo chuyển map trong GameGui.Info.Message
				local curWave, _ = gameStats.GetWave()
				local stats = gameStats.GetSnapshot()
				local msgLower = stats.Message and stats.Message:lower() or ""

				local pGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChild("PlayerGui")
				local gGui = pGui and pGui:FindFirstChild("GameGui")
				local directInfo = gGui and gGui:FindFirstChild("Info")
				local directMsg = directInfo and directInfo:FindFirstChild("Message")
				local directMsgText = (directMsg and directMsg:IsA("TextLabel") and directMsg.Text:lower()) or ""

				local combinedMsg = (msgLower .. " " .. directMsgText):lower()
				local compactMsg = combinedMsg:gsub("%s+", "")

				local isRaidTransition = compactMsg:find("movestoraid")
					or compactMsg:find("movingtoraid")
					or compactMsg:find("raid%d+starting")
					or compactMsg:find("newraidmap")
					or compactMsg:find("towersrefunded")

				if isRaidTransition and (#recordedSteps > 0 or curWave >= 20) then
					logger.Log(string.format("[Recorder] Phát hiện thông báo chuyển map ('%s') -> Tự động dừng và lưu Macro!", directMsgText ~= "" and directMsgText or msgLower))
					recorder.StopRecording("MapCompleted")
					return
				end

				-- Fallback theo wave: nếu đã hoàn thành đủ 25 wave kể từ lúc bắt đầu record
				if recordingStartedAtWave > 0 and curWave >= (recordingStartedAtWave + 25) then
					logger.Log(string.format("[Recorder] Đã hoàn thành 25 wave (Start: %d, Hiện tại: %d) -> Tự động dừng và lưu Macro!", recordingStartedAtWave, curWave))
					recorder.StopRecording("MapCompleted")
					return
				end
			end)
		end
	end)
end

-- Bắt đầu ghi lại hành động
function recorder.StartRecording(macroName: string?): boolean
	local targetName = macroName or activeMacroName
	if not targetName or targetName == "" or targetName == "None" then
		local currentMap = raidManager.GetCurrentMap()
		if currentMap and currentMap ~= "" and currentMap ~= "None" then
			targetName = currentMap
			activeMacroName = currentMap
		else
			notifier.Notify("Macro", "Please select or create a Macro first!", 2)
			return false
		end
	end

	activeMacroName = targetName
	recorder.ClearSteps()
	recorder.InitialSpeed = getCurrentGameSpeed()
	recordingStartedAtWave = gameStats.GetWave()
	recordingStartedDuringIntermission = raidManager.IsIntermissionActive()
	isRecording = true
	setupRemoteHook()
	startEndScreenWatcher()
	notifyState(true)

	notifier.Notify("Macro", string.format("Started Recording: %s (Initial Speed: x%d)", targetName, recorder.InitialSpeed), 2)
	return true
end

-- Dừng ghi và tự động lưu vào storage
function recorder.StopRecording(reason: string?): number
	if not isRecording then return 0 end
	isRecording = false
	cleanupEndScreenWatcher()
	notifyState(false)

	local count = #recordedSteps
	if activeMacroName and count > 0 then
		local existing = storage.GetMacro(activeMacroName) or storage.CreateMacro(activeMacroName)
		existing.Steps = table.clone(recordedSteps)
		existing.Metadata.TotalSteps = count
		existing.Metadata.TotalDuration = gameStats.GetElapsedTime()
		existing.Metadata.InitialSpeed = recorder.InitialSpeed or 1
		local currentMap = raidManager.GetCurrentMap()
		if currentMap and currentMap ~= "" and currentMap ~= "None" then
			existing.Metadata.Map = currentMap
		end
		storage.SaveMacro(activeMacroName, existing)

		if reason == "EndScreen" then
			notifier.Notify("Macro", string.format("🏁 Match ended! Saved %d steps to '%s' (Speed x%d)!", count, activeMacroName, existing.Metadata.InitialSpeed or 1), 3)
		elseif reason == "MapCompleted" then
			local mapInfo = (currentMap and currentMap ~= "") and string.format(" (Map: %s)", currentMap) or ""
			notifier.Notify("Macro", string.format("🏁 Map completed%s! Saved %d steps to '%s'!", mapInfo, count, activeMacroName), 3.5)
		elseif reason == "MapChanged" then
			notifier.Notify("Macro", string.format("🔄 Map changed! Saved %d steps to '%s'!", count, activeMacroName), 3.5)
		elseif reason == "LeftGame" then
			notifier.Notify("Macro", string.format("Left match! Saved %d steps to '%s'", count, activeMacroName), 2.5)
		else
			notifier.Notify("Macro", string.format("Saved %d steps to '%s' (Speed x%d)!", count, activeMacroName, existing.Metadata.InitialSpeed or 1), 2.5)
		end
	else
		notifier.Notify("Macro", "Stopped Recording (0 steps)", 2)
	end

	return count
end

lifecycle.Register(function()
	if isRecording then
		recorder.StopRecording()
	end
	cleanupEndScreenWatcher()
	table.clear(stateListeners)
end)

return recorder
