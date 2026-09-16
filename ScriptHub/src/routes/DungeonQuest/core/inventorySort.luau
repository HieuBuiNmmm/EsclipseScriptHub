-- Inventory Sort Module (DungeonQuest)
-- Sắp xếp kho đồ game tức thì bằng cách thay đổi LayoutOrder trên UIGridLayout của ScrollingFrame
-- Hỗ trợ cơ chế kết hợp:
--   - Main filter (Tri-state): None (bỏ chọn) -> Descending (Power giảm dần) -> Ascending (Power tăng dần) -> None
--   - Rarity filter: Có thể bật/tắt kết hợp cùng 1 trong Physic/Spell/Health
--   - Stat filter: Chọn tối đa 1 trong Physic / Spell / Health
--   - Ability: Độc lập riêng biệt (không có thông số)

local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local services = require("@routes/DungeonQuest/core/services")
local notifier = require("@routes/DungeonQuest/core/notifier")
local createSortBarFrame = require("@routes/DungeonQuest/core/customUi/sortBar")
local macLib = require("@packages/Maclib")

local TweenService = services.TweenService or game:GetService("TweenService")
local HttpService = services.HttpService or game:GetService("HttpService")

local inventorySort = {}

--// Các kiểu trạng thái
export type MainFilterMode = "None" | "Descending" | "Ascending"
export type StatFilterType = "Physical Damage" | "Spell Power" | "Health"

local mainFilterMode: MainFilterMode = "None"
local rarityEnabled: boolean = false
local selectedStatFilter: StatFilterType? = nil
local abilityEnabled: boolean = false
local autoSortEnabled: boolean = true
local SORT_BAR_SCALE: number = 1.25

--// Persistence (Lưu/Tải trạng thái filter của người chơi vào file json)
local saveDebounceThread: thread? = nil

local function getBaseFolder(): string
	local base = "EsclipseHub"
	pcall(function()
		if macLib and macLib.Folder then
			base = macLib.Folder
		end
	end)
	return base
end

local function getSettingsFilePath(): string
	return getBaseFolder() .. "/settings/inventory_sort.json"
end

local function ensureSettingsFolder()
	if not (makefolder and isfolder) then return end
	pcall(function()
		local base = getBaseFolder()
		if not isfolder(base) then
			makefolder(base)
		end
		local settingsDir = base .. "/settings"
		if not isfolder(settingsDir) then
			makefolder(settingsDir)
		end
	end)
end

local function loadSettings()
	if not (isfile and readfile) then return end
	local filePath = getSettingsFilePath()
	if not isfile(filePath) then return end

	local ok, decoded = pcall(function()
		local content = readfile(filePath)
		return HttpService:JSONDecode(content)
	end)

	if not (ok and type(decoded) == "table") then return end

	if decoded.mainFilterMode == "Descending" or decoded.mainFilterMode == "Ascending" or decoded.mainFilterMode == "None" then
		mainFilterMode = decoded.mainFilterMode
	end

	if type(decoded.rarityEnabled) == "boolean" then
		rarityEnabled = decoded.rarityEnabled
	end

	if decoded.selectedStatFilter == "Physical Damage" or decoded.selectedStatFilter == "Spell Power" or decoded.selectedStatFilter == "Health" then
		selectedStatFilter = decoded.selectedStatFilter
	elseif decoded.selectedStatFilter == nil then
		selectedStatFilter = nil
	end

	if type(decoded.abilityEnabled) == "boolean" then
		abilityEnabled = decoded.abilityEnabled
	end

	if type(decoded.autoSortEnabled) == "boolean" then
		autoSortEnabled = decoded.autoSortEnabled
	end

	if abilityEnabled then
		rarityEnabled = false
		selectedStatFilter = nil
	elseif selectedStatFilter ~= nil then
		rarityEnabled = false
	end
end

local function saveSettings()
	if not (isfile and writefile) then return end

	if saveDebounceThread then
		task.cancel(saveDebounceThread)
		saveDebounceThread = nil
	end

	saveDebounceThread = task.delay(0.5, function()
		saveDebounceThread = nil
		pcall(function()
			ensureSettingsFolder()
			local filePath = getSettingsFilePath()
			local payload = {
				mainFilterMode = mainFilterMode,
				rarityEnabled = rarityEnabled,
				selectedStatFilter = selectedStatFilter,
				abilityEnabled = abilityEnabled,
				autoSortEnabled = autoSortEnabled,
			}
			writefile(filePath, HttpService:JSONEncode(payload))
		end)
	end)
end

--// Áp dụng UIScale lên sortBarFrame (cố định tỉ lệ 1.25x to hơn 25%)
local function applySortBarScale(sortBar: GuiObject?)
	if not sortBar then return end
	local uiScale = sortBar:FindFirstChildOfClass("UIScale")
	if not uiScale then
		uiScale = Instance.new("UIScale")
		uiScale.Name = "SortBarUIScale"
		uiScale.Parent = sortBar
	end
	uiScale.Scale = SORT_BAR_SCALE
end

--// Cache dữ liệu inventory
local cachedInventoryData: any = nil
local cachedLookupMap: { [string]: any }? = nil
local lastFetchTime = 0
local CACHE_LIFETIME = 30.0 -- 30 giây cache tránh spam invoke server
local FETCH_COOLDOWN = 6.0 -- Tối thiểu 6 giây giữa 2 lần InvokeServer
local isFetchingData = false

--// Thang điểm độ hiếm (càng cao càng hiếm)
local RARITY_SCORES: { [string]: number } = {
	common = 1,
	uncommon = 2,
	rare = 3,
	epic = 4,
	legendary = 5,
	ultimate = 6,
	mythic = 7,
}

local CATEGORY_PLURAL: { [string]: string } = {
	weapon = "weapons",
	chest = "chests",
	helmet = "helmets",
	ability = "abilities",
}

--// Icon tương ứng cho từng trạng thái Main Filter (Tri-state)
local MAIN_FILTER_ICONS: { [MainFilterMode]: string } = {
	None = "rbxassetid://73746166761985",
	Descending = "rbxassetid://130494621181478", -- Từ cao đến thấp
	Ascending = "rbxassetid://140381370510884", -- Từ thấp đến cao
}

--// Thiết lập giao diện tương tác (Sắc nét, viền rõ ràng, màu sắc Thematic sống động)
local STYLE = {
	TweenDuration = 0.16,
	EasingStyle = Enum.EasingStyle.Quad,
	EasingDirection = Enum.EasingDirection.Out,

	-- State ban đầu (chưa được chọn): Nút có nền khối rõ ràng, viền định hình, icon sáng 100%
	Inactive = {
		BackgroundTransparency = 0.2,
		BackgroundColor3 = Color3.fromRGB(28, 31, 40),
		ElementTransparency = 0.0,
		ElementColor3 = Color3.fromRGB(235, 240, 252),
		StrokeTransparency = 0.4,
		StrokeColor3 = Color3.fromRGB(65, 72, 90),
	},

	-- Khi hover: Tăng sáng nền và viền bắt mắt
	Hovered = {
		BackgroundTransparency = 0.1,
		BackgroundColor3 = Color3.fromRGB(45, 52, 68),
		ElementTransparency = 0.0,
		ElementColor3 = Color3.fromRGB(255, 255, 255),
		StrokeTransparency = 0.15,
		StrokeColor3 = Color3.fromRGB(150, 165, 195),
	},

	-- Active mặc định (fallback nếu không có theme riêng)
	Active = {
		BackgroundTransparency = 0.1,
		BackgroundColor3 = Color3.fromRGB(30, 55, 85),
		ElementTransparency = 0.0,
		ElementColor3 = Color3.fromRGB(255, 255, 255),
		StrokeTransparency = 0.0,
		StrokeColor3 = Color3.fromRGB(80, 180, 255),
	},

	-- Active + Hovered mặc định
	ActiveHovered = {
		BackgroundTransparency = 0.05,
		BackgroundColor3 = Color3.fromRGB(40, 75, 115),
		ElementTransparency = 0.0,
		ElementColor3 = Color3.fromRGB(255, 255, 255),
		StrokeTransparency = 0.0,
		StrokeColor3 = Color3.fromRGB(120, 210, 255),
	},
}

--// Bảng màu Thematic riêng biệt cho từng nút khi Active (Phong cách Thematic Accent)
local THEMATIC_COLORS = {
	IBmainFilter = {
		ActiveBg = Color3.fromRGB(28, 55, 90),
		ActiveStroke = Color3.fromRGB(80, 180, 255),
		ActiveHoverBg = Color3.fromRGB(38, 75, 120),
		ActiveHoverStroke = Color3.fromRGB(120, 210, 255),
	},
	IBphysic = {
		ActiveBg = Color3.fromRGB(75, 30, 22),
		ActiveStroke = Color3.fromRGB(245, 95, 55),
		ActiveHoverBg = Color3.fromRGB(105, 42, 30),
		ActiveHoverStroke = Color3.fromRGB(255, 130, 85),
	},
	IBspell = {
		ActiveBg = Color3.fromRGB(25, 45, 95),
		ActiveStroke = Color3.fromRGB(65, 150, 255),
		ActiveHoverBg = Color3.fromRGB(38, 65, 130),
		ActiveHoverStroke = Color3.fromRGB(105, 180, 255),
	},
	IBhealth = {
		ActiveBg = Color3.fromRGB(20, 60, 32),
		ActiveStroke = Color3.fromRGB(55, 210, 115),
		ActiveHoverBg = Color3.fromRGB(28, 85, 45),
		ActiveHoverStroke = Color3.fromRGB(90, 235, 145),
	},
	IBrarity = {
		ActiveBg = Color3.fromRGB(75, 58, 16),
		ActiveStroke = Color3.fromRGB(255, 205, 50),
		ActiveHoverBg = Color3.fromRGB(105, 82, 22),
		ActiveHoverStroke = Color3.fromRGB(255, 225, 95),
	},
	IBability = {
		ActiveBg = Color3.fromRGB(60, 25, 85),
		ActiveStroke = Color3.fromRGB(195, 90, 255),
		ActiveHoverBg = Color3.fromRGB(85, 35, 120),
		ActiveHoverStroke = Color3.fromRGB(215, 125, 255),
	},
}

--// Danh sách connection lifecycle & state tracking
local activeConnections: { RBXScriptConnection } = {}
local isSorting = false

local buttonHoverState: { [GuiObject]: boolean } = {}
local hookedButtons: { [GuiObject]: boolean } = {}
local hookedSortBars: { [GuiObject]: boolean } = {}
local knownSortBarButtons: { GuiObject } = {}

local criteriaCallbacks: { (string) -> () } = {}
local directionCallbacks: { (string) -> () } = {}

--// Forward declarations
local injectedSortBar: GuiObject? = nil
local ensureSortBar: () -> GuiObject?
local hookSortBar: (GuiObject) -> ()

--// Xây dựng bảng tra cứu O(1) từ inventoryData để không bao giờ bị lag khi duyệt 300 ô
local function buildItemLookup(invyData: any): { [string]: any }
	local lookup = {}
	if type(invyData) ~= "table" then return lookup end
	for catName, catTable in pairs(invyData) do
		if type(catTable) == "table" then
			local pluralCat = CATEGORY_PLURAL[catName] or catName
			for k, item in pairs(catTable) do
				local kStr = tostring(k)
				lookup[kStr] = item
				local num = string.match(kStr, "_(%d+)$")
				if num then
					lookup[catName .. "_" .. num] = item
					lookup[pluralCat .. "_" .. num] = item
					local sing = string.match(kStr, "^(.-)_")
					if sing then
						lookup[sing .. "_" .. num] = item
					end
				end
			end
		end
	end
	return lookup
end

--// Lấy dữ liệu kho đồ từ Remote reloadInvy (có cache và cooldown bảo vệ chống spam)
local function fetchInventoryData(forceRefresh: boolean?): any
	local now = os.clock()
	-- 1. Nếu có cache và chưa quá 30s -> luôn dùng cache
	if not forceRefresh and cachedInventoryData and (now - lastFetchTime) < CACHE_LIFETIME then
		return cachedInventoryData
	end

	-- 2. Chống spam: Dù forceRefresh hay cache = nil, nếu vừa gọi server trong vòng FETCH_COOLDOWN (6s) -> dùng cache cũ
	if cachedInventoryData and (now - lastFetchTime) < FETCH_COOLDOWN then
		return cachedInventoryData
	end

	-- 3. Nếu chưa có cache nhưng vừa fetch thất bại/xong trong vòng 3.0 giây -> không flood
	if (now - lastFetchTime) < 3.0 then
		return cachedInventoryData
	end

	-- 4. Chống re-entrancy
	if isFetchingData then
		return cachedInventoryData
	end

	isFetchingData = true
	local ok, result = pcall(function()
		local rs = services.ReplicatedStorage or game:GetService("ReplicatedStorage")
		local remotes = rs and rs:FindFirstChild("remotes")
		if not remotes then return nil end
		local reloadInvy = remotes:FindFirstChild("reloadInvy")
		if not reloadInvy or not reloadInvy:IsA("RemoteFunction") then return nil end
		return reloadInvy:InvokeServer()
	end)
	isFetchingData = false
	lastFetchTime = os.clock()

	if ok and result then
		if type(result) == "table" and result["1"] and type(result["1"]) == "table" then
			cachedInventoryData = result["1"]
		else
			cachedInventoryData = result
		end
		cachedLookupMap = nil
		return cachedInventoryData
	end

	return cachedInventoryData
end

--// Tra cứu thông tin món đồ siêu tốc O(1)
local function getItemData(invyData: any, itemType: string, uniqueNum: string): any?
	if not invyData or type(invyData) ~= "table" then return nil end
	if not cachedLookupMap then
		cachedLookupMap = buildItemLookup(invyData)
	end
	return cachedLookupMap[itemType .. "_" .. uniqueNum]
end

--// Trích xuất chỉ số phục vụ sắp xếp
type ParsedItemSlot = {
	slot: GuiObject,
	originalOrder: number,
	category: string,
	physical: number,
	spell: number,
	health: number,
	rarityScore: number,
	levelReq: number,
	name: string,
}

local function parseSlot(slot: GuiObject, invyData: any, defaultIndex: number): ParsedItemSlot?
	if not slot:IsA("GuiObject") then return nil end

	local itemTypeVal = slot:FindFirstChild("itemType")
	if not itemTypeVal then return nil end

	local cat = tostring(itemTypeVal.Value or "")
	local uniqueNum = ""
	local uniqueChild = itemTypeVal:FindFirstChild("uniqueItemNum")
	if uniqueChild then
		uniqueNum = tostring(uniqueChild.Value or "")
	end

	local item = getItemData(invyData, cat, uniqueNum)

	local originalOrder = tonumber(slot.Name) or defaultIndex
	local physVal = 0
	local spellVal = 0
	local healthVal = 0
	local rarityVal = 0
	local levelReqVal = 0
	local itemName = ""

	if item and type(item) == "table" then
		physVal = tonumber(item.physicalDamage or item.physicalPower or 0) or 0
		spellVal = tonumber(item.spellPower or 0) or 0
		healthVal = tonumber(item.health or 0) or 0
		local rarityStr = string.lower(tostring(item.rarity or "common"))
		rarityVal = RARITY_SCORES[rarityStr] or 0
		levelReqVal = tonumber(item.levelReq or 0) or 0
		itemName = tostring(item.name or "")
	end

	return {
		slot = slot,
		originalOrder = originalOrder,
		category = string.lower(cat),
		physical = physVal,
		spell = spellVal,
		health = healthVal,
		rarityScore = rarityVal,
		levelReq = levelReqVal,
		name = itemName,
	}
end

--// Xếp hạng phân loại trang bị: Weapon (1) > Armor (2) > Ability (3)
local function getCategoryTier(category: string): number
	local c = string.lower(category)
	if c == "weapon" or c == "weapons" then
		return 1
	elseif c == "chest" or c == "chests" or c == "helmet" or c == "helmets" or c == "armor" then
		return 2
	elseif c == "ability" or c == "abilities" then
		return 3
	end
	return 4 -- Khác
end

--// So sánh 2 item theo tiêu chí kết hợp
local function compareItems(a: ParsedItemSlot, b: ParsedItemSlot): boolean
	-- 1. Nếu MainFilter là "None" và không bật Ability: giữ nguyên thứ tự mặc định của game
	if mainFilterMode == "None" and not abilityEnabled then
		return a.originalOrder < b.originalOrder
	end

	-- 2. Nếu đang chọn nút Ability riêng (Đưa Ability lên đầu để dễ soi skill):
	if abilityEnabled then
		local aIsAbility = (a.category == "ability" or a.category == "abilities")
		local bIsAbility = (b.category == "ability" or b.category == "abilities")
		if aIsAbility ~= bIsAbility then
			return aIsAbility -- Đưa toàn bộ Ability lên đầu
		end

		local isDesc = (mainFilterMode ~= "Ascending")

		if aIsAbility and bIsAbility then
			-- Cùng là ability: Sắp xếp theo Level Req trước tiên!
			if a.levelReq ~= b.levelReq then
				if isDesc then
					return a.levelReq > b.levelReq
				else
					return a.levelReq < b.levelReq
				end
			end

			-- Nếu cùng Level Req: Xét đến Độ hiếm (Rarity)
			if a.rarityScore ~= b.rarityScore then
				if isDesc then
					return a.rarityScore > b.rarityScore
				else
					return a.rarityScore < b.rarityScore
				end
			end

			-- Nếu cùng Độ hiếm: Xếp theo Tên (A-Z) để gom các skill giống nhau
			if a.name ~= b.name then
				return a.name < b.name
			end

			return a.originalOrder < b.originalOrder
		end

		-- Phía sau Ability: Weapons và Armors cũng tuân thủ Weapon > Armor
		local tierA = getCategoryTier(a.category)
		local tierB = getCategoryTier(b.category)
		if tierA ~= tierB then
			return tierA < tierB
		end

		-- Ưu tiên ẩn: Level Req cho trang bị phía sau Ability
		if a.levelReq ~= b.levelReq then
			if isDesc then
				return a.levelReq > b.levelReq
			else
				return a.levelReq < b.levelReq
			end
		end

		if a.name ~= b.name then
			return a.name < b.name
		end

		return a.originalOrder < b.originalOrder
	end

	local isDesc = (mainFilterMode == "Descending")

	-- 3. NGUYÊN TẮC CỐT LÕI: Weapon > Armor > Ability (luôn luôn ưu tiên hàng đầu)
	local tierA = getCategoryTier(a.category)
	local tierB = getCategoryTier(b.category)

	if tierA ~= tierB then
		return tierA < tierB -- Weapon (1) > Armor (2) > Ability (3)
	end

	-- 4. Nếu cả 2 đều là Ability (ở cuối kho đồ): Sắp xếp theo Level Req
	if tierA == 3 then
		if a.levelReq ~= b.levelReq then
			if isDesc then
				return a.levelReq > b.levelReq
			else
				return a.levelReq < b.levelReq
			end
		end

		if a.rarityScore ~= b.rarityScore then
			if isDesc then
				return a.rarityScore > b.rarityScore
			else
				return a.rarityScore < b.rarityScore
			end
		end

		if a.name ~= b.name then
			return a.name < b.name
		end

		return a.originalOrder < b.originalOrder
	end

	-- 5. Cùng nhóm Weapon hoặc cùng nhóm Armor: Sắp xếp theo chế độ độc lập được chọn
	-- CHẾ ĐỘ 1: Chọn 1 Stat cụ thể (Physic / Spell / Health):
	if selectedStatFilter ~= nil then
		local statA = 0
		local statB = 0
		if selectedStatFilter == "Physical Damage" then
			statA = a.physical
			statB = b.physical
		elseif selectedStatFilter == "Spell Power" then
			statA = a.spell
			statB = b.spell
		elseif selectedStatFilter == "Health" then
			statA = a.health
			statB = b.health
		end

		if statA ~= statB then
			if isDesc then
				return statA > statB
			else
				return statA < statB
			end
		end
	end

	-- CHẾ ĐỘ 2: Chọn Độ hiếm (Rarity):
	if rarityEnabled then
		if a.rarityScore ~= b.rarityScore then
			if isDesc then
				return a.rarityScore > b.rarityScore
			else
				return a.rarityScore < b.rarityScore
			end
		end
	end

	-- CHẾ ĐỘ 3: Không chọn Stat và không chọn Rarity -> Sắp xếp thuần túy theo Power:
	if selectedStatFilter == nil and not rarityEnabled then
		local powerA = math.max(a.physical, a.spell, a.health)
		local powerB = math.max(b.physical, b.spell, b.health)
		if powerA ~= powerB then
			if isDesc then
				return powerA > powerB
			else
				return powerA < powerB
			end
		end
	end

	-- 6. ƯU TIÊN ẨN TOÀN DIỆN CHO TẤT CẢ TRANG BỊ: Level Req (Cấp độ yêu cầu của đồ)
	if a.levelReq ~= b.levelReq then
		if isDesc then
			return a.levelReq > b.levelReq
		else
			return a.levelReq < b.levelReq
		end
	end

	-- 7. Tie-breakers phụ sau Level Req:
	-- Trong chế độ Rarity: xét tiếp Power khi cùng Level Req
	if rarityEnabled then
		local powerA = math.max(a.physical, a.spell, a.health)
		local powerB = math.max(b.physical, b.spell, b.health)
		if powerA ~= powerB then
			if isDesc then
				return powerA > powerB
			else
				return powerA < powerB
			end
		end
	end

	-- Trong chế độ Stat: xét tiếp Max Stat tổng quát khi cùng Level Req
	if selectedStatFilter ~= nil then
		local maxStatA = math.max(a.physical, a.spell, a.health)
		local maxStatB = math.max(b.physical, b.spell, b.health)
		if maxStatA ~= maxStatB then
			return maxStatA > maxStatB
		end
	end

	-- Tên A-Z (Gom các món trùng tên nằm cạnh nhau)
	if a.name ~= b.name then
		return a.name < b.name
	end

	-- Nếu cùng nhóm Armor: ưu tiên chest trước helmet
	if a.category ~= b.category then
		local isChestA = (a.category == "chest" or a.category == "chests")
		local isChestB = (b.category == "chest" or b.category == "chests")
		if isChestA ~= isChestB then
			return isChestA
		end
	end

	return a.originalOrder < b.originalOrder
end

--// Lấy ScrollingFrame của Inventory trong PlayerGui (chỉ trả về khi inventory đang mở)
local function getInventoryScrollingFrame(): (ScrollingFrame?, UIGridLayout?)
	local player = services.player or services.Players.LocalPlayer
	if not player then return nil, nil end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return nil, nil end
	local inventory = playerGui:FindFirstChild("inventory")
	if not inventory then return nil, nil end
	local mainBackground = inventory:FindFirstChild("mainBackground")
	if not mainBackground or not mainBackground.Visible then return nil, nil end
	local innerBackground = mainBackground:FindFirstChild("innerBackground")
	if not innerBackground then return nil, nil end
	local rightSideFrame = innerBackground:FindFirstChild("rightSideFrame")
	if not rightSideFrame then return nil, nil end
	local scrollingFrame = rightSideFrame:FindFirstChild("ScrollingFrame")
	if not scrollingFrame or not scrollingFrame:IsA("ScrollingFrame") then return nil, nil end
	local gridLayout = scrollingFrame:FindFirstChildOfClass("UIGridLayout")

	return scrollingFrame, gridLayout
end

local sortDebounceThread: thread? = nil

--// Yêu cầu sắp xếp có Debounce (gom các trigger dồn dập thành 1 lần thực thi duy nhất)
function inventorySort.RequestSort(delaySeconds: number?)
	if not autoSortEnabled then return end
	if mainFilterMode == "None" and not abilityEnabled then return end

	if sortDebounceThread then
		task.cancel(sortDebounceThread)
		sortDebounceThread = nil
	end

	local delayTime = delaySeconds or 0.15
	sortDebounceThread = task.delay(delayTime, function()
		sortDebounceThread = nil
		inventorySort.ApplySort()
	end)
end

--// Thực thi sắp xếp kho đồ
function inventorySort.ApplySort()
	if isSorting then return end
	local scrollingFrame, gridLayout = getInventoryScrollingFrame()
	if not scrollingFrame then return end

	isSorting = true
	local success, err = pcall(function()
		-- Đảm bảo SortOrder của GridLayout là LayoutOrder
		if gridLayout and gridLayout.SortOrder ~= Enum.SortOrder.LayoutOrder then
			gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
		end

		local invyData = fetchInventoryData()
		local parsedList: { ParsedItemSlot } = {}
		local counter = 0

		for _, child in ipairs(scrollingFrame:GetChildren()) do
			if child:IsA("GuiObject") and child.Name ~= "UIGridLayout" then
				counter = counter + 1
				local parsed = parseSlot(child, invyData, counter)
				if parsed then
					table.insert(parsedList, parsed)
				end
			end
		end

		if #parsedList == 0 then return end

		table.sort(parsedList, function(a, b)
			return compareItems(a, b)
		end)

		-- Gán LayoutOrder tăng dần từ 1 đến N (chỉ gán khi thay đổi để tránh lag engine C++)
		for orderIndex, item in ipairs(parsedList) do
			if item.slot.LayoutOrder ~= orderIndex then
				item.slot.LayoutOrder = orderIndex
			end
		end
	end)
	isSorting = false

	if not success and err then
		warn("[InventorySort] Lỗi khi sắp xếp kho đồ:", err)
	end
end

--// Hiệu ứng tương tác giao diện (Visual Styling Controller)
local function applyButtonVisual(button: GuiObject, stateName: string, animate: boolean)
	local style = STYLE[stateName] or STYLE.Inactive
	local theme = THEMATIC_COLORS[button.Name]

	local bgTransparency = style.BackgroundTransparency
	local bgColor = style.BackgroundColor3
	local elemTransparency = style.ElementTransparency
	local elemColor = style.ElementColor3
	local strokeTransparency = style.StrokeTransparency
	local strokeColor = style.StrokeColor3

	if stateName == "Active" and theme then
		bgTransparency = 0.12
		bgColor = theme.ActiveBg
		strokeTransparency = 0.0
		strokeColor = theme.ActiveStroke
	elseif stateName == "ActiveHovered" and theme then
		bgTransparency = 0.05
		bgColor = theme.ActiveHoverBg
		strokeTransparency = 0.0
		strokeColor = theme.ActiveHoverStroke
	end

	local tweenInfo = TweenInfo.new(STYLE.TweenDuration, STYLE.EasingStyle, STYLE.EasingDirection)

	pcall(function()
		if animate then
			TweenService:Create(button, tweenInfo, {
				BackgroundTransparency = bgTransparency,
				BackgroundColor3 = bgColor,
			}):Play()
		else
			button.BackgroundTransparency = bgTransparency
			button.BackgroundColor3 = bgColor
		end
	end)

	for _, child in ipairs(button:GetDescendants()) do
		pcall(function()
			if child:IsA("ImageLabel") or child:IsA("ImageButton") then
				if animate then
					TweenService:Create(child, tweenInfo, {
						ImageTransparency = elemTransparency,
						ImageColor3 = elemColor,
					}):Play()
				else
					child.ImageTransparency = elemTransparency
					child.ImageColor3 = elemColor
				end
			elseif child:IsA("TextLabel") or child:IsA("TextButton") then
				if animate then
					TweenService:Create(child, tweenInfo, {
						TextTransparency = elemTransparency,
						TextColor3 = elemColor,
					}):Play()
				else
					child.TextTransparency = elemTransparency
					child.TextColor3 = elemColor
				end
			elseif child:IsA("UIStroke") then
				if animate then
					TweenService:Create(child, tweenInfo, {
						Transparency = strokeTransparency,
						Color = strokeColor,
					}):Play()
				else
					child.Transparency = strokeTransparency
					child.Color = strokeColor
				end
			end
		end)
	end
end

local function refreshButtonVisual(button: GuiObject, animate: boolean)
	if not button or not button.Parent then return end
	local isHovered = (buttonHoverState[button] == true)

	if button.Name == "IBmainFilter" then
		local isActive = (mainFilterMode ~= "None")
		local targetImage = MAIN_FILTER_ICONS[mainFilterMode] or MAIN_FILTER_ICONS.None

		if isActive then
			applyButtonVisual(button, isHovered and "ActiveHovered" or "Active", animate)
		else
			applyButtonVisual(button, isHovered and "Hovered" or "Inactive", animate)
		end

		-- Đổi icon theo trạng thái (None: ảnh gốc, Descending: cao -> thấp, Ascending: thấp -> cao)
		for _, child in ipairs(button:GetDescendants()) do
			if child:IsA("ImageLabel") then
				if child.Image ~= targetImage then
					child.Image = targetImage
				end
				child.Rotation = 0
			end
		end

	elseif button.Name == "IBrarity" then
		local isActive = (rarityEnabled == true)
		if isActive then
			applyButtonVisual(button, isHovered and "ActiveHovered" or "Active", animate)
		else
			applyButtonVisual(button, isHovered and "Hovered" or "Inactive", animate)
		end

	elseif button.Name == "IBphysic" then
		local isActive = (selectedStatFilter == "Physical Damage")
		if isActive then
			applyButtonVisual(button, isHovered and "ActiveHovered" or "Active", animate)
		else
			applyButtonVisual(button, isHovered and "Hovered" or "Inactive", animate)
		end

	elseif button.Name == "IBspell" then
		local isActive = (selectedStatFilter == "Spell Power")
		if isActive then
			applyButtonVisual(button, isHovered and "ActiveHovered" or "Active", animate)
		else
			applyButtonVisual(button, isHovered and "Hovered" or "Inactive", animate)
		end

	elseif button.Name == "IBhealth" then
		local isActive = (selectedStatFilter == "Health")
		if isActive then
			applyButtonVisual(button, isHovered and "ActiveHovered" or "Active", animate)
		else
			applyButtonVisual(button, isHovered and "Hovered" or "Inactive", animate)
		end

	elseif button.Name == "IBability" then
		local isActive = (abilityEnabled == true)
		if isActive then
			applyButtonVisual(button, isHovered and "ActiveHovered" or "Active", animate)
		else
			applyButtonVisual(button, isHovered and "Hovered" or "Inactive", animate)
		end
	end
end

local function refreshAllSortBarButtons(animate: boolean)
	for _, btn in ipairs(knownSortBarButtons) do
		refreshButtonVisual(btn, animate)
	end
end

local isNotifying = false

local function notifyStateChanged()
	if isNotifying then return end
	isNotifying = true
	local curCriteria = inventorySort.GetSortCriteria()
	local curDirection = inventorySort.GetSortDirection()
	for _, cb in ipairs(criteriaCallbacks) do
		pcall(cb, curCriteria)
	end
	for _, cb in ipairs(directionCallbacks) do
		pcall(cb, curDirection)
	end
	isNotifying = false
end

--// Gắn sự kiện và hiệu ứng cho từng nút trong sortBarFrame
local function hookSortBarButton(button: GuiObject)
	if hookedButtons[button] then return end
	hookedButtons[button] = true
	table.insert(knownSortBarButtons, button)

	-- Tắt AutoButtonColor mặc định để hiệu ứng mượt mà, không bị flash đen
	if button:IsA("ImageButton") or button:IsA("TextButton") then
		button.AutoButtonColor = false
	end

	-- Bo góc nhẹ cho thẩm mỹ nếu chưa có
	if not button:FindFirstChildOfClass("UICorner") then
		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 6)
		corner.Parent = button
	end

	-- Viền nổi bật cho nút nếu chưa có
	if not button:FindFirstChildOfClass("UIStroke") then
		local stroke = Instance.new("UIStroke")
		stroke.Thickness = 1.2
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Transparency = STYLE.Inactive.StrokeTransparency
		stroke.Color = STYLE.Inactive.StrokeColor3
		stroke.Parent = button
	end

	-- Padding bên trong nút để icon không bị tràn sát viền
	if not button:FindFirstChildOfClass("UIPadding") then
		local pad = Instance.new("UIPadding")
		pad.PaddingTop = UDim.new(0, 7)
		pad.PaddingBottom = UDim.new(0, 7)
		pad.PaddingLeft = UDim.new(0, 7)
		pad.PaddingRight = UDim.new(0, 7)
		pad.Parent = button
	end

	-- Căn chỉnh lại icon con bên trong nếu có
	for _, child in ipairs(button:GetChildren()) do
		if child:IsA("ImageLabel") then
			child.AnchorPoint = Vector2.new(0.5, 0.5)
			child.Position = UDim2.new(0.5, 0, 0.5, 0)
			child.Size = UDim2.new(1, 0, 1, 0)
			child.ScaleType = Enum.ScaleType.Fit
		elseif child:IsA("UIListLayout") then
			child:Destroy()
		end
	end

	buttonHoverState[button] = false

	-- Hover vào: Tăng độ đậm background và font/icon rõ ràng
	local enterConn = button.MouseEnter:Connect(function()
		buttonHoverState[button] = true
		refreshButtonVisual(button, true)
	end)
	table.insert(activeConnections, enterConn)

	-- Hover ra: Trở về mờ (hoặc active nếu đang chọn)
	local leaveConn = button.MouseLeave:Connect(function()
		buttonHoverState[button] = false
		refreshButtonVisual(button, true)
	end)
	table.insert(activeConnections, leaveConn)

	-- Click nút
	if button:IsA("GuiButton") then
		local clickConn = button.Activated:Connect(function()
			if button.Name == "IBmainFilter" then
				-- Tri-state: None -> Descending (Power giảm dần) -> Ascending (Power tăng dần) -> None (Bỏ chọn)
				if mainFilterMode == "None" then
					mainFilterMode = "Descending"
					notifier.Notify("Main Filter", "Giảm dần (Power cao -> thấp)", 1.5)
				elseif mainFilterMode == "Descending" then
					mainFilterMode = "Ascending"
					notifier.Notify("Main Filter", "Tăng dần (Power thấp -> cao)", 1.5)
				else
					mainFilterMode = "None"
					notifier.Notify("Main Filter", "Bỏ chọn (Khôi phục kho đồ mặc định)", 1.5)
				end
				refreshAllSortBarButtons(true)
				notifyStateChanged()
				if autoSortEnabled then inventorySort.RequestSort(0.05) end
				saveSettings()

			elseif button.Name == "IBrarity" then
				rarityEnabled = not rarityEnabled
				if rarityEnabled then
					selectedStatFilter = nil
					abilityEnabled = false
					if mainFilterMode == "None" then
						mainFilterMode = "Descending"
					end
					notifier.Notify("Filter", "Chế độ: Độ hiếm (Rarity)", 1.5)
				else
					notifier.Notify("Filter", "Tắt lọc Độ hiếm", 1.5)
				end
				refreshAllSortBarButtons(true)
				notifyStateChanged()
				if autoSortEnabled then inventorySort.RequestSort(0.05) end
				saveSettings()

			elseif button.Name == "IBphysic" or button.Name == "IBspell" or button.Name == "IBhealth" then
				local statName: StatFilterType = (button.Name == "IBphysic" and "Physical Damage")
					or (button.Name == "IBspell" and "Spell Power")
					or "Health"

				if selectedStatFilter == statName then
					selectedStatFilter = nil
					notifier.Notify("Filter", "Bỏ chọn " .. statName, 1.5)
				else
					selectedStatFilter = statName
					rarityEnabled = false
					abilityEnabled = false
					if mainFilterMode == "None" then
						mainFilterMode = "Descending"
					end
					notifier.Notify("Filter", "Chọn chỉ số: " .. statName, 1.5)
				end
				refreshAllSortBarButtons(true)
				notifyStateChanged()
				if autoSortEnabled then inventorySort.RequestSort(0.05) end
				saveSettings()

			elseif button.Name == "IBability" then
				abilityEnabled = not abilityEnabled
				if abilityEnabled then
					rarityEnabled = false
					selectedStatFilter = nil
					if mainFilterMode == "None" then
						mainFilterMode = "Descending"
					end
					notifier.Notify("Filter", "Sắp xếp: Kỹ năng (Ability)", 1.5)
				else
					notifier.Notify("Filter", "Bỏ chọn Kỹ năng", 1.5)
				end
				refreshAllSortBarButtons(true)
				notifyStateChanged()
				if autoSortEnabled then inventorySort.RequestSort(0.05) end
				saveSettings()
			end
		end)
		table.insert(activeConnections, clickConn)
	end

	-- Thiết lập trạng thái ban đầu mờ mờ
	refreshButtonVisual(button, false)
end

--// Hook container sortBarFrame
function hookSortBar(sortBar: GuiObject)
	if hookedSortBars[sortBar] then return end
	hookedSortBars[sortBar] = true

	-- Thiết lập khung Dock Panel chuyên nghiệp cho sortBarFrame
	pcall(function()
		sortBar.BackgroundColor3 = Color3.fromRGB(18, 20, 26)
		sortBar.BackgroundTransparency = 0.15
		sortBar.BorderSizePixel = 0

		if not sortBar:FindFirstChildOfClass("UICorner") then
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0, 8)
			corner.Parent = sortBar
		end

		local dockStroke = sortBar:FindFirstChild("DockStroke") or sortBar:FindFirstChildOfClass("UIStroke")
		if not dockStroke then
			dockStroke = Instance.new("UIStroke")
			dockStroke.Name = "DockStroke"
			dockStroke.Thickness = 1.2
			dockStroke.Color = Color3.fromRGB(65, 72, 90)
			dockStroke.Transparency = 0.3
			dockStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			dockStroke.Parent = sortBar
		end

		if not sortBar:FindFirstChildOfClass("UIPadding") then
			local pad = Instance.new("UIPadding")
			pad.PaddingTop = UDim.new(0, 5)
			pad.PaddingBottom = UDim.new(0, 5)
			pad.PaddingLeft = UDim.new(0, 5)
			pad.PaddingRight = UDim.new(0, 5)
			pad.Parent = sortBar
		end
	end)

	-- Đảm bảo padding cách đều giữa các nút bấm
	local listLayout = sortBar:FindFirstChildOfClass("UIListLayout")
	if listLayout then
		listLayout.Padding = UDim.new(0, 6)
	end

	local validNames = {
		IBmainFilter = true,
		IBrarity = true,
		IBphysic = true,
		IBspell = true,
		IBhealth = true,
		IBability = true,
	}

	for _, child in ipairs(sortBar:GetChildren()) do
		if child:IsA("GuiObject") and validNames[child.Name] then
			hookSortBarButton(child)
		end
	end

	local childConn = sortBar.ChildAdded:Connect(function(child)
		if child:IsA("GuiObject") and validNames[child.Name] then
			hookSortBarButton(child)
		end
	end)
	table.insert(activeConnections, childConn)

	applySortBarScale(sortBar)
	refreshAllSortBarButtons(false)
end

--// Lấy hoặc tự động tạo sortBarFrame trong PlayerGui nếu chưa có
function ensureSortBar(): GuiObject?
	local player = services.player or services.Players.LocalPlayer
	if not player then return nil end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return nil end
	local inventory = playerGui:FindFirstChild("inventory")
	if not inventory then return nil end
	local mainBackground = inventory:FindFirstChild("mainBackground")
	if not mainBackground then return nil end
	local innerBackground = mainBackground:FindFirstChild("innerBackground")
	if not innerBackground then return nil end

	-- Đảm bảo không bị che khuất bởi ClipsDescendants
	if innerBackground:IsA("GuiObject") then
		innerBackground.ClipsDescendants = false
	end
	if mainBackground:IsA("GuiObject") then
		mainBackground.ClipsDescendants = false
	end

	local sortBar = innerBackground:FindFirstChild("sortBarFrame") :: GuiObject?
	if not sortBar and typeof(createSortBarFrame) == "function" then
		local ok, newBar = pcall(createSortBarFrame, innerBackground)
		if ok and newBar then
			sortBar = newBar
			injectedSortBar = newBar
		end
	end

	if sortBar and typeof(hookSortBar) == "function" and not hookedSortBars[sortBar] then
		hookSortBar(sortBar)
	end

	return sortBar
end

local function getSortBarFrame(): GuiObject?
	return ensureSortBar()
end

--// Public APIs điều khiển Scale
function inventorySort.GetScale(): number
	return SORT_BAR_SCALE
end

--// Public APIs điều khiển trạng thái
function inventorySort.GetMainFilterMode(): MainFilterMode
	return mainFilterMode
end

function inventorySort.SetMainFilterMode(mode: MainFilterMode)
	if mainFilterMode == mode then return end
	mainFilterMode = mode
	refreshAllSortBarButtons(true)
	notifyStateChanged()
	if autoSortEnabled then inventorySort.RequestSort(0.05) end
	saveSettings()
end

function inventorySort.IsRarityEnabled(): boolean
	return rarityEnabled
end

function inventorySort.SetRarityEnabled(state: boolean)
	local newState = state and true or false
	if rarityEnabled == newState then return end
	rarityEnabled = newState
	if rarityEnabled then
		selectedStatFilter = nil
		abilityEnabled = false
		if mainFilterMode == "None" then mainFilterMode = "Descending" end
	end
	refreshAllSortBarButtons(true)
	notifyStateChanged()
	if autoSortEnabled then inventorySort.RequestSort(0.05) end
	saveSettings()
end

function inventorySort.GetStatFilter(): StatFilterType?
	return selectedStatFilter
end

function inventorySort.SetStatFilter(stat: StatFilterType?)
	if selectedStatFilter == stat then return end
	selectedStatFilter = stat
	if selectedStatFilter then
		rarityEnabled = false
		abilityEnabled = false
		if mainFilterMode == "None" then mainFilterMode = "Descending" end
	end
	refreshAllSortBarButtons(true)
	notifyStateChanged()
	if autoSortEnabled then inventorySort.RequestSort(0.05) end
	saveSettings()
end

function inventorySort.IsAbilityEnabled(): boolean
	return abilityEnabled
end

function inventorySort.SetAbilityEnabled(state: boolean)
	local newState = state and true or false
	if abilityEnabled == newState then return end
	abilityEnabled = newState
	if abilityEnabled then
		rarityEnabled = false
		selectedStatFilter = nil
		if mainFilterMode == "None" then mainFilterMode = "Descending" end
	end
	refreshAllSortBarButtons(true)
	notifyStateChanged()
	if autoSortEnabled then inventorySort.RequestSort(0.05) end
	saveSettings()
end

-- Tương thích ngược với UI dropdown cũ (có bảo vệ chống lặp đệ quy)
function inventorySort.SetSortCriteria(criteria: string?)
	if not criteria or type(criteria) ~= "string" then return end
	local oldCriteria = inventorySort.GetSortCriteria()

	if criteria == "None" then
		if mainFilterMode == "None" and not rarityEnabled and not selectedStatFilter and not abilityEnabled then
			return
		end
		mainFilterMode = "None"
		rarityEnabled = false
		selectedStatFilter = nil
		abilityEnabled = false
	elseif criteria == "Rarity" then
		if rarityEnabled and not abilityEnabled and selectedStatFilter == nil then
			return
		end
		rarityEnabled = true
		selectedStatFilter = nil
		abilityEnabled = false
		if mainFilterMode == "None" then mainFilterMode = "Descending" end
	elseif criteria == "Ability" then
		if abilityEnabled then return end
		abilityEnabled = true
		rarityEnabled = false
		selectedStatFilter = nil
		if mainFilterMode == "None" then mainFilterMode = "Descending" end
	elseif criteria == "Physical Damage" or criteria == "Spell Power" or criteria == "Health" then
		if selectedStatFilter == criteria and not abilityEnabled and not rarityEnabled then return end
		selectedStatFilter = criteria :: StatFilterType
		rarityEnabled = false
		abilityEnabled = false
		if mainFilterMode == "None" then mainFilterMode = "Descending" end
	elseif criteria == "Power" then
		if mainFilterMode ~= "None" and not rarityEnabled and selectedStatFilter == nil and not abilityEnabled then
			return
		end
		if mainFilterMode == "None" then mainFilterMode = "Descending" end
		rarityEnabled = false
		selectedStatFilter = nil
		abilityEnabled = false
	else
		-- Tiêu chí lạ hoặc chuỗi kết hợp -> không xử lý từ dropdown đơn
		return
	end

	if inventorySort.GetSortCriteria() == oldCriteria then
		return
	end

	refreshAllSortBarButtons(true)
	notifyStateChanged()
	if autoSortEnabled then inventorySort.RequestSort(0.05) end
	saveSettings()
end

function inventorySort.GetSortCriteria(): string
	if abilityEnabled then
		return "Ability"
	end
	if rarityEnabled then
		return "Rarity"
	end
	if selectedStatFilter then
		return selectedStatFilter
	end
	if mainFilterMode ~= "None" then
		return "Power"
	end
	return "None"
end

function inventorySort.SetSortDirection(direction: string?)
	if not direction or type(direction) ~= "string" then return end
	local newMode: MainFilterMode = "None"
	if direction == "Ascending" or string.find(direction, "Ascending") then
		newMode = "Ascending"
	elseif direction == "Descending" or string.find(direction, "Descending") then
		newMode = "Descending"
	else
		newMode = "None"
	end

	if mainFilterMode == newMode then return end
	mainFilterMode = newMode

	refreshAllSortBarButtons(true)
	notifyStateChanged()
	if autoSortEnabled then inventorySort.RequestSort(0.05) end
	saveSettings()
end

function inventorySort.GetSortDirection(): string
	if mainFilterMode == "Ascending" then
		return "Ascending"
	elseif mainFilterMode == "Descending" then
		return "Descending"
	else
		return "None"
	end
end

function inventorySort.OnCriteriaChanged(callback: (string) -> ())
	if type(callback) == "function" then
		table.insert(criteriaCallbacks, callback)
	end
end

function inventorySort.OnDirectionChanged(callback: (string) -> ())
	if type(callback) == "function" then
		table.insert(directionCallbacks, callback)
	end
end

function inventorySort.SetAutoSort(state: boolean)
	local newState = state and true or false
	if autoSortEnabled == newState then return end
	autoSortEnabled = newState
	saveSettings()
end

function inventorySort.IsAutoSort(): boolean
	return autoSortEnabled
end

--// Gắn sự kiện theo dõi GUI và Remote game
function inventorySort.Init()
	for _, conn in ipairs(activeConnections) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(activeConnections)
	table.clear(hookedButtons)
	table.clear(hookedSortBars)
	table.clear(knownSortBarButtons)
	table.clear(buttonHoverState)

	-- Tải trạng thái filter đã lưu của người chơi
	loadSettings()
	notifyStateChanged()

	-- 1. Lắng nghe Remote reloadInventory của game để cập nhật cache và auto-sort
	local rs = services.ReplicatedStorage or game:GetService("ReplicatedStorage")
	local remotes = rs and rs:FindFirstChild("remotes")
	if remotes then
		local reloadInvEvent = remotes:FindFirstChild("reloadInventory")
		if reloadInvEvent and reloadInvEvent:IsA("RemoteEvent") then
			local conn = reloadInvEvent.OnClientEvent:Connect(function()
				local now = os.clock()
				-- Chỉ invalidate cache nếu đã qua FETCH_COOLDOWN (6s) kể từ lần fetch gần nhất
				-- Tránh triệt để vòng lặp ping-pong: invoke server -> server bắn reloadInventory -> client xóa cache -> invoke server tiếp
				if (now - lastFetchTime) >= FETCH_COOLDOWN then
					cachedInventoryData = nil
				end
				inventorySort.RequestSort(0.35)
			end)
			table.insert(activeConnections, conn)
		end
	end

	-- 2. Khởi tạo theo dõi và Inject GUI (hỗ trợ cả khi script chạy trước khi GUI load hoặc khi respawn)
	local function bindInventoryUI()
		local player = services.player or services.Players.LocalPlayer
		if not player then return end
		local playerGui = player:WaitForChild("PlayerGui", 15)
		if not playerGui then return end
		local inventory = playerGui:WaitForChild("inventory", 15)
		if not inventory then return end
		local mainBackground = inventory:WaitForChild("mainBackground", 15)
		if not mainBackground then return end
		local innerBackground = mainBackground:WaitForChild("innerBackground", 15)
		if not innerBackground then return end

		ensureSortBar()

		-- Nếu kho đồ đang mở sẵn thì sắp xếp ngay theo cấu hình vừa tải
		if mainBackground.Visible and autoSortEnabled and (mainFilterMode ~= "None" or abilityEnabled) then
			inventorySort.RequestSort(0.2)
		end

		local visConn = mainBackground:GetPropertyChangedSignal("Visible"):Connect(function()
			if mainBackground.Visible then
				ensureSortBar()
				inventorySort.RequestSort(0.15)
			end
		end)
		table.insert(activeConnections, visConn)

		local innerConn = innerBackground.ChildAdded:Connect(function(child)
			if child.Name == "sortBarFrame" and child:IsA("GuiObject") then
				hookSortBar(child)
			end
		end)
		table.insert(activeConnections, innerConn)

		local rightSide = innerBackground:WaitForChild("rightSideFrame", 10)
		local scrollingFrame = rightSide and rightSide:WaitForChild("ScrollingFrame", 10)
		if scrollingFrame then
			local childConn = scrollingFrame.ChildAdded:Connect(function(child)
				if child:IsA("GuiObject") and autoSortEnabled and (mainFilterMode ~= "None" or abilityEnabled) then
					-- Debounce 0.3s gom toàn bộ 200-300 slots item load dồn dập thành 1 lần sắp xếp duy nhất
					inventorySort.RequestSort(0.3)
				end
			end)
			table.insert(activeConnections, childConn)
		end
	end

	task.spawn(bindInventoryUI)

	local player = services.player or services.Players.LocalPlayer
	if player then
		local charConn = player.CharacterAdded:Connect(function()
			task.delay(1.0, bindInventoryUI)
		end)
		table.insert(activeConnections, charConn)
	end
end

lifecycle.Register(function()
	if sortDebounceThread then
		task.cancel(sortDebounceThread)
		sortDebounceThread = nil
	end

	-- Nếu có tác vụ lưu đang chờ, flush ghi file ngay trước khi reset biến
	if saveDebounceThread then
		task.cancel(saveDebounceThread)
		saveDebounceThread = nil
		pcall(function()
			ensureSettingsFolder()
			local filePath = getSettingsFilePath()
			local payload = {
				mainFilterMode = mainFilterMode,
				rarityEnabled = rarityEnabled,
				selectedStatFilter = selectedStatFilter,
				abilityEnabled = abilityEnabled,
				autoSortEnabled = autoSortEnabled,
			}
			writefile(filePath, HttpService:JSONEncode(payload))
		end)
	end

	for _, conn in ipairs(activeConnections) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(activeConnections)
	table.clear(hookedButtons)
	table.clear(hookedSortBars)
	table.clear(knownSortBarButtons)
	table.clear(buttonHoverState)
	table.clear(criteriaCallbacks)
	table.clear(directionCallbacks)
	cachedInventoryData = nil
	mainFilterMode = "None"
	rarityEnabled = false
	selectedStatFilter = nil
	abilityEnabled = false

	if injectedSortBar and injectedSortBar.Parent then
		pcall(function()
			injectedSortBar:Destroy()
		end)
		injectedSortBar = nil
	end
end)

-- Khởi tạo ngay khi module được nạp
inventorySort.Init()

return inventorySort
