-- CaculationPot Extension Module (DungeonQuest)
-- Quản lý trạng thái và logic cho extension CaculationPot trong tab Utilities
-- Cơ chế "Làm chay + Truy xuất ngược": Hook trực tiếp sự kiện GUI và can thiệp TextLabel tooltip in-game

local lifecycle = require("@routes/DungeonQuest/core/lifecycle")
local services = require("@routes/DungeonQuest/core/services")

local caculationPot = {}

export type InspectorEntry = {
	name: string,
	value: string,
	kind: string,
	path: string,
	instance: TextLabel?,
	isPrimaryStat: boolean?,
	calculatedTotal: number?,
	remainingUpgrades: number?,
	curUpgrades: number?,
	maxUpgrades: number?,
}

local TARGET_CONTAINERS = { "inventory", "inspectGui", "sellShop", "tradingGui", "blacksmith" }
local TARGET_FRAMES = { "armorMain", "weaponMain" }
local STAT_PER_UPGRADE = 10 -- Cả Giáp và Vũ khí đều tăng 10 điểm mỗi lượt upgrade

local CLASS_MAP = {
	warrior = { className = "Warrior", primaryStat = "physicalDamage" },
	mage = { className = "Mage", primaryStat = "spellPower" },
	guardian = { className = "Guardian", primaryStat = "health" },
}

-- Phân loại Class dựa trên tên item
local function detectClass(name: string?): (string?, string?)
	if not name then return nil, nil end
	local lower = string.lower(name)
	for key, info in pairs(CLASS_MAP) do
		if string.find(lower, key) then
			return info.className, info.primaryStat
		end
	end
	return nil, nil
end

-- Trích xuất số nguyên/thực từ chuỗi, bỏ dấu phẩy và ký tự phụ
local function parseNumber(val: string?): number?
	if not val then return nil end
	local clean = string.match(val, "^%s*([%d,.-]+)")
	if not clean then return nil end
	local noCommas = string.gsub(clean, ",", "")
	return tonumber(noCommas)
end

-- Trích xuất curUpgrades và maxUpgrades từ chuỗi (vd: "0/123773" -> 0, 123773)
local function parseUpgrades(upgradesStr: string?): (number, number)
	if not upgradesStr then return 0, 0 end
	local clean = string.gsub(upgradesStr, ",", "")
	local curStr, maxStr = string.match(clean, "(%d+)%s*/%s*(%d+)")
	if curStr and maxStr then
		return tonumber(curStr) or 0, tonumber(maxStr) or 0
	end
	local single = parseNumber(clean)
	return 0, single or 0
end

-- Lấy chỉ số gốc ban đầu từ Text (loại bỏ phần (MAX POTENTIAL) hoặc [Max: ...] nếu đã bị format hoặc xuống dòng)
local function extractRawStat(text: string?): string
	if not text then return "" end
	local firstLine = string.match(text, "^([^\n\r]+)")
	local target = firstLine or text
	local raw = string.match(target, "^(.-)%s*[%(\\[]")
	if raw and raw ~= "" then
		return string.gsub(raw, "%s+$", "")
	end
	return string.gsub(target, "%s+$", "")
end

-- Kiểm tra xem chuỗi đã chứa phần tính toán thêm hay chưa (ở dòng mới hoặc cùng dòng)
local function hasCalculationSuffix(text: string?): boolean
	if not text then return false end
	if string.find(text, "[\n\r]%s*[%(\\[].-[%)\\]]") then return true end
	return string.find(text, "%s*[%(\\[].-[%)\\]]%s*$") ~= nil
end

--// Trạng thái module (Mặc định luôn bật dạng Passive)
local enabled = true
local inspectorThread: thread? = nil
local activeFrame: string? = nil
local activeEntries: { InspectorEntry } = {}
local activeClass: string? = nil
local activeSignature: string = ""

-- Flag chống đệ quy khi can thiệp property Text
local isUpdating = false

-- Lưu trữ trạng thái gốc của TextLabel để phục hồi khi hover ra ngoài
type OriginalLabelState = {
	text: string,
}
local originalStates: { [TextLabel]: OriginalLabelState } = {}

-- Danh sách RBXScriptConnection để dọn dẹp lifecycle
local activeConnections: { RBXScriptConnection } = {}
local hookedFrames: { [GuiObject]: boolean } = {}
local hookedLabels: { [TextLabel]: boolean } = {}
local hookedItemStatFrames: { [GuiObject]: boolean } = {}
local hookedContainers: { [Instance]: boolean } = {}

local stateCallbacks: { (boolean) -> () } = {}
local inspectorCallbacks: { (string?, { InspectorEntry }, string?) -> () } = {}

--// Phục hồi lại TextLabel về trạng thái ban đầu của game
local function restoreLabel(label: TextLabel)
	local state = originalStates[label]
	if state and label and label.Parent then
		isUpdating = true
		pcall(function()
			label.Text = state.text
		end)
		isUpdating = false
	end
	originalStates[label] = nil
end

local function restoreAllLabels()
	for label, _ in pairs(originalStates) do
		restoreLabel(label)
	end
	table.clear(originalStates)
end

--// [TRUY XUẤT NGƯỢC & LÀM CHAY]: Tìm TextLabel hiển thị giá trị của chỉ số mục tiêu
-- Hỗ trợ:
-- 1. Direct TextLabel: frame:FindFirstChild(statName) là TextLabel
-- 2. Container Frame: frame:FindFirstChild(statName) chứa child named "valueText", "value", "TextLabel"...
-- 3. Nested/Reverse: Duyệt ngược từ các TextLabel descendants hoặc parent name
local function findStatValueLabel(frame: GuiObject, statName: string): TextLabel?
	local targetLower = string.lower(statName)

	-- 1. Thử trực tiếp child cùng tên
	local direct = frame:FindFirstChild(statName)
	if direct then
		if direct:IsA("TextLabel") then
			return direct
		elseif direct:IsA("GuiObject") then
			-- Truy xuất ngược / tìm child chứa text giá trị (ví dụ: valueText, value, label...)
			for _, candidateName in ipairs({ "valueText", "ValueText", "value", "Value", "amount", "Amount", "text", "label" }) do
				local candidate = direct:FindFirstChild(candidateName)
				if candidate and candidate:IsA("TextLabel") then
					return candidate
				end
			end
			local firstChildLabel = direct:FindFirstChildOfClass("TextLabel")
			if firstChildLabel then
				return firstChildLabel
			end
		end
	end

	-- 2. Duyệt tìm trong descendants theo tên (case-insensitive)
	for _, desc in ipairs(frame:GetDescendants()) do
		if desc:IsA("TextLabel") then
			local descNameLower = string.lower(desc.Name)
			-- Tên label trùng với stat
			if descNameLower == targetLower then
				return desc
			end
			-- Label tên là valueText nằm trong container có tên chứa stat
			if (descNameLower == "valuetext" or descNameLower == "value" or descNameLower == "amount") and desc.Parent then
				local parentNameLower = string.lower(desc.Parent.Name)
				if string.find(parentNameLower, targetLower) then
					return desc
				end
			end
		end
	end

	-- 3. Trường hợp đặc biệt cho upgrades: tìm bất kỳ TextLabel nào có định dạng "X/Y"
	if targetLower == "upgrades" then
		for _, desc in ipairs(frame:GetDescendants()) do
			if desc:IsA("TextLabel") and not string.find(string.lower(desc.Name), "title") then
				if string.find(desc.Text, "%d+%s*/%s*%d+") then
					return desc
				end
			end
		end
	end

	return nil
end

--// Xử lý đọc dữ liệu, tính toán và trực tiếp overwrite TextLabel trên giao diện game
local function processFrame(frame: GuiObject)
	if not enabled then return end
	if not frame or not frame:IsA("GuiObject") or not frame.Visible then return end
	local parent = frame.Parent
	if parent and parent:IsA("GuiObject") and not parent.Visible then return end
	if isUpdating then return end

	local frameName = frame.Name
	local entries: { InspectorEntry } = {}
	local hashParts: { string } = { frameName }

	-- Thu thập tất cả các TextLabel và ValueBase trong frame để phục vụ Inspector và phân loại
	for _, desc in ipairs(frame:GetDescendants()) do
		local lowerName = string.lower(desc.Name)
		if not string.find(lowerName, "title") then
			if desc:IsA("TextLabel") then
				local relPath = (desc.Parent ~= frame and desc.Parent.Name .. "/" .. desc.Name) or desc.Name
				local rawText = extractRawStat(desc.Text)
				table.insert(entries, {
					name = desc.Name,
					value = rawText,
					kind = "TextLabel",
					path = relPath,
					instance = desc,
				})
				table.insert(hashParts, relPath .. "=" .. rawText)
			elseif desc:IsA("ValueBase") then
				local valStr = tostring(desc.Value)
				local relPath = (desc.Parent ~= frame and desc.Parent.Name .. "/" .. desc.Name) or desc.Name
				table.insert(entries, {
					name = desc.Name,
					value = valStr,
					kind = "ValueBase",
					path = relPath,
				})
				table.insert(hashParts, relPath .. "=" .. valStr)
			end
		end
	end

	-- Tìm tên item và nâng cấp
	local nameLabel = findStatValueLabel(frame, "name")
	local itemName = (nameLabel and extractRawStat(nameLabel.Text)) or nil
	if not itemName then
		for _, entry in ipairs(entries) do
			if string.lower(entry.name) == "name" then
				itemName = entry.value
				break
			end
		end
	end

	local upgradesLabel = findStatValueLabel(frame, "upgrades")
	local upgradesStr = (upgradesLabel and extractRawStat(upgradesLabel.Text)) or nil
	if not upgradesStr then
		for _, entry in ipairs(entries) do
			if string.lower(entry.name) == "upgrades" or string.find(entry.value, "%d+%s*/%s*%d+") then
				upgradesStr = entry.value
				break
			end
		end
	end

	-- Tìm các TextLabel của 3 chỉ số chính
	local physLabel = findStatValueLabel(frame, "physicalDamage") or findStatValueLabel(frame, "physicalPower")
	local spellLabel = findStatValueLabel(frame, "spellPower")
	local healthLabel = findStatValueLabel(frame, "health")

	local physVal = physLabel and parseNumber(extractRawStat(physLabel.Text))
	local spellVal = spellLabel and parseNumber(extractRawStat(spellLabel.Text))
	local healthVal = healthLabel and parseNumber(extractRawStat(healthLabel.Text))

	-- Phân loại Class & Primary Stat
	local detectedClass: string? = nil
	local primaryStat: string? = nil
	local targetStatLabel: TextLabel? = nil

	if frameName == "weaponMain" then
		-- Vũ khí: Phân biệt Mage vs Warrior dựa vào spellPower vs physicalDamage
		if (spellVal or 0) > (physVal or 0) then
			detectedClass = "Mage"
			primaryStat = "spellPower"
			targetStatLabel = spellLabel
		else
			detectedClass = "Warrior"
			primaryStat = "physicalDamage"
			targetStatLabel = physLabel
		end
	else
		-- Giáp: Phân loại theo tên item (Warrior, Mage, Guardian)
		detectedClass, primaryStat = detectClass(itemName)
		if detectedClass == "Warrior" then
			targetStatLabel = physLabel
		elseif detectedClass == "Mage" then
			targetStatLabel = spellLabel
		elseif detectedClass == "Guardian" then
			targetStatLabel = healthLabel
		else
			-- Fallback so sánh chỉ số
			if (healthVal or 0) > 10000 and (healthVal or 0) > ((physVal or 0) * 10) then
				detectedClass = "Guardian"
				primaryStat = "health"
				targetStatLabel = healthLabel
			elseif (spellVal or 0) > (physVal or 0) then
				detectedClass = "Mage"
				primaryStat = "spellPower"
				targetStatLabel = spellLabel
			else
				detectedClass = "Warrior"
				primaryStat = "physicalDamage"
				targetStatLabel = physLabel
			end
		end
	end

	-- Tính toán Max Potential
	local curUpgrades, maxUpgrades = parseUpgrades(upgradesStr)
	local remainingUpgrades = math.max(0, maxUpgrades - curUpgrades)

	if targetStatLabel and targetStatLabel:IsA("TextLabel") and maxUpgrades > 0 then
		local rawStatStr = extractRawStat(targetStatLabel.Text)
		local currentStatNum = parseNumber(rawStatStr)
		if currentStatNum then
			-- Công thức: MAX POTENTIAL = CurrentStat + (RemainingUpgrades * 10)
			local maxPotential = currentStatNum + (remainingUpgrades * STAT_PER_UPGRADE)
			local formattedText = string.format("%s\n(%s)", rawStatStr, tostring(maxPotential))

			-- Đánh dấu vào inspector entries
			for _, entry in ipairs(entries) do
				if entry.instance == targetStatLabel or entry.name == primaryStat then
					entry.isPrimaryStat = true
					entry.calculatedTotal = maxPotential
					entry.remainingUpgrades = remainingUpgrades
					entry.curUpgrades = curUpgrades
					entry.maxUpgrades = maxUpgrades
				end
			end
			table.insert(hashParts, "calc=" .. tostring(maxPotential))

			-- [CAN THIỆP TRỰC TIẾP LÊN GIAO DIỆN GAME]
			if targetStatLabel.Text ~= formattedText then
				-- Lưu lại trạng thái ban đầu của game nếu chưa lưu
				if not originalStates[targetStatLabel] then
					originalStates[targetStatLabel] = {
						text = targetStatLabel.Text,
					}
				end

				isUpdating = true
				pcall(function()
					-- Áp dụng text mới kèm chỉ số nâng cấp tối đa (2 dòng, giữ nguyên màu và size gốc của game)
					targetStatLabel.Text = formattedText
					targetStatLabel.ClipsDescendants = false
				end)
				isUpdating = false
			end
		end
	end

	-- Sắp xếp entries cho hiển thị Inspector
	local PREFERRED_ORDER: { [string]: number } = {
		name = 1,
		levelReq = 2,
		physicalDamage = 3,
		spellPower = 4,
		health = 5,
		upgrades = 6,
		sellPrice = 7,
		description = 8,
	}

	table.sort(entries, function(a, b)
		local orderA = PREFERRED_ORDER[a.name] or 99
		local orderB = PREFERRED_ORDER[b.name] or 99
		if orderA ~= orderB then
			return orderA < orderB
		end
		return a.path < b.path
	end)

	local signature = table.concat(hashParts, "|")
	if signature ~= activeSignature then
		activeSignature = signature
		activeFrame = frameName
		activeEntries = entries
		activeClass = detectedClass

		for _, cb in ipairs(inspectorCallbacks) do
			pcall(cb, activeFrame, activeEntries, activeClass)
		end
	end
end

--// Gắn sự kiện (Hooking) cho một frame cụ thể
local function hookLabel(frame: GuiObject, label: TextLabel)
	if hookedLabels[label] then return end
	hookedLabels[label] = true

	local conn = label:GetPropertyChangedSignal("Text"):Connect(function()
		if not enabled or isUpdating then return end
		-- Nếu game cập nhật lại text (chưa có đuôi tính toán), thực thi xử lý ngay lập tức
		if frame.Visible and not hasCalculationSuffix(label.Text) then
			processFrame(frame)
		end
	end)
	table.insert(activeConnections, conn)
end

local function hookTargetFrame(frame: GuiObject)
	if hookedFrames[frame] then return end
	hookedFrames[frame] = true

	-- Bắt sự kiện khi Frame hiển thị / ẩn
	local visConn = frame:GetPropertyChangedSignal("Visible"):Connect(function()
		if not enabled then return end
		if frame.Visible then
			processFrame(frame)
		else
			-- Khi frame ẩn, phục hồi lại các nhãn đã can thiệp
			restoreAllLabels()
			activeSignature = ""
			activeFrame = nil
			activeEntries = {}
			activeClass = nil
			for _, cb in ipairs(inspectorCallbacks) do
				pcall(cb, nil, {}, nil)
			end
		end
	end)
	table.insert(activeConnections, visConn)

	-- Bắt các nhãn TextLabel hiện có
	for _, desc in ipairs(frame:GetDescendants()) do
		if desc:IsA("TextLabel") then
			hookLabel(frame, desc)
		end
	end

	-- Bắt các nhãn TextLabel được sinh ra mới (DescendantAdded)
	local addConn = frame.DescendantAdded:Connect(function(desc)
		if desc:IsA("TextLabel") then
			hookLabel(frame, desc)
			if frame.Visible then
				task.defer(function()
					processFrame(frame)
				end)
			end
		end
	end)
	table.insert(activeConnections, addConn)

	-- Nếu frame đang mở sẵn tại thời điểm hook
	if frame.Visible then
		task.defer(function()
			processFrame(frame)
		end)
	end
end

--// Gắn sự kiện cho một itemStatFrame cụ thể
local function hookItemStatFrame(itemStatFrame: GuiObject)
	if not itemStatFrame or not itemStatFrame:IsA("GuiObject") or hookedItemStatFrames[itemStatFrame] then return end
	hookedItemStatFrames[itemStatFrame] = true

	local itemStatVisConn = itemStatFrame:GetPropertyChangedSignal("Visible"):Connect(function()
		if not enabled then return end
		if not itemStatFrame.Visible then
			restoreAllLabels()
			if activeFrame ~= nil then
				activeFrame = nil
				activeEntries = {}
				activeClass = nil
				activeSignature = ""
				for _, cb in ipairs(inspectorCallbacks) do
					pcall(cb, nil, {}, nil)
				end
			end
		end
	end)
	table.insert(activeConnections, itemStatVisConn)

	for _, frameName in ipairs(TARGET_FRAMES) do
		local frame = itemStatFrame:FindFirstChild(frameName)
		if frame and frame:IsA("GuiObject") then
			hookTargetFrame(frame)
			if frame.Visible and itemStatFrame.Visible then
				processFrame(frame)
			end
		end
	end

	local childConn = itemStatFrame.ChildAdded:Connect(function(child)
		if child:IsA("GuiObject") then
			for _, frameName in ipairs(TARGET_FRAMES) do
				if child.Name == frameName then
					hookTargetFrame(child)
					if child.Visible and itemStatFrame.Visible then
						processFrame(child)
					end
				end
			end
		end
	end)
	table.insert(activeConnections, childConn)
end

--// Gắn sự kiện cho Container chứa itemStatFrame (inventory, inspectGui, sellShop, tradingGui, blacksmith)
local function hookContainer(container: Instance)
	if not container or hookedContainers[container] then return end
	hookedContainers[container] = true

	local itemStatFrame = container:FindFirstChild("itemStatFrame")
	if itemStatFrame and itemStatFrame:IsA("GuiObject") then
		hookItemStatFrame(itemStatFrame)
	end

	local childConn = container.ChildAdded:Connect(function(child)
		if child.Name == "itemStatFrame" and child:IsA("GuiObject") then
			hookItemStatFrame(child)
		end
	end)
	table.insert(activeConnections, childConn)

	-- Bắt sự kiện khi container bị hủy hoặc gỡ khỏi PlayerGui (vd khi player rời khỏi Blacksmith NPC)
	local ancConn = container.AncestryChanged:Connect(function(_, parent)
		if not parent then
			hookedContainers[container] = nil
			restoreAllLabels()
		end
	end)
	table.insert(activeConnections, ancConn)
end

--// Khởi tạo và theo dõi cây UI
local function ensureHooks()
	local player = services.player or services.Players.LocalPlayer
	if not player then return end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return end

	for _, containerName in ipairs(TARGET_CONTAINERS) do
		local container = playerGui:FindFirstChild(containerName)
		if not container then
			for _, child in ipairs(playerGui:GetChildren()) do
				if string.lower(child.Name) == string.lower(containerName) then
					container = child
					break
				end
			end
		end
		if container then
			hookContainer(container)
		end
	end

	-- Lắng nghe nếu blacksmith, inspectGui, sellShop, tradingGui được tạo động khi player tương tác
	local pgConn = playerGui.ChildAdded:Connect(function(child)
		for _, containerName in ipairs(TARGET_CONTAINERS) do
			if string.lower(child.Name) == string.lower(containerName) then
				hookContainer(child)
			end
		end
	end)
	table.insert(activeConnections, pgConn)
end

--// Vòng lặp bổ trợ đảm bảo không sót frame nào khi đổi phòng/rejoin/mở NPC
local function stopInspectorLoop()
	if inspectorThread then
		task.cancel(inspectorThread)
		inspectorThread = nil
	end

	for _, conn in ipairs(activeConnections) do
		pcall(function() conn:Disconnect() end)
	end
	table.clear(activeConnections)
	table.clear(hookedFrames)
	table.clear(hookedLabels)
	table.clear(hookedItemStatFrames)
	table.clear(hookedContainers)

	restoreAllLabels()

	activeFrame = nil
	activeEntries = {}
	activeClass = nil
	activeSignature = ""
	for _, cb in ipairs(inspectorCallbacks) do
		pcall(cb, nil, {}, nil)
	end
end

local function startInspectorLoop()
	if inspectorThread then return end

	-- Hook ngay lập tức
	ensureHooks()

	inspectorThread = task.spawn(function()
		while enabled do
			task.wait(1.5)
			if not enabled then break end

			local anyVisible = false
			local player = services.player or services.Players.LocalPlayer
			if player then
				local playerGui = player:FindFirstChild("PlayerGui")
				if playerGui then
					for _, containerName in ipairs(TARGET_CONTAINERS) do
						local container = playerGui:FindFirstChild(containerName)
						if not container then
							for _, child in ipairs(playerGui:GetChildren()) do
								if string.lower(child.Name) == string.lower(containerName) then
									container = child
									break
								end
							end
						end

						if container then
							if not hookedContainers[container] then
								hookContainer(container)
							end

							local itemStatFrame = container:FindFirstChild("itemStatFrame")
							if itemStatFrame and itemStatFrame:IsA("GuiObject") then
								if not hookedItemStatFrames[itemStatFrame] then
									hookItemStatFrame(itemStatFrame)
								end

								if itemStatFrame.Visible then
									for _, frameName in ipairs(TARGET_FRAMES) do
										local frame = itemStatFrame:FindFirstChild(frameName)
										if frame and frame:IsA("GuiObject") then
											if not hookedFrames[frame] then
												hookTargetFrame(frame)
											end
											if frame.Visible then
												anyVisible = true
												processFrame(frame)
											end
										end
									end
								end
							end
						end
					end
				end
			end

			if not anyVisible and next(originalStates) ~= nil then
				restoreAllLabels()
				if activeFrame ~= nil then
					activeFrame = nil
					activeEntries = {}
					activeClass = nil
					activeSignature = ""
					for _, cb in ipairs(inspectorCallbacks) do
						pcall(cb, nil, {}, nil)
					end
				end
			end
		end
		inspectorThread = nil
	end)
end

--// Public API
function caculationPot.IsEnabled(): boolean
	return enabled
end

function caculationPot.GetActiveInspector(): (string?, { InspectorEntry }, string?)
	return activeFrame, activeEntries, activeClass
end

function caculationPot.SetEnabled(state: boolean)
	local newState = state and true or false
	if enabled == newState then return end
	enabled = newState

	if enabled then
		startInspectorLoop()
	else
		stopInspectorLoop()
	end

	for _, cb in ipairs(stateCallbacks) do
		pcall(cb, enabled)
	end
end

function caculationPot.OnChanged(callback: (boolean) -> ())
	if type(callback) == "function" then
		table.insert(stateCallbacks, callback)
	end
end

function caculationPot.OnInspectorChanged(callback: (string?, { InspectorEntry }, string?) -> ())
	if type(callback) == "function" then
		table.insert(inspectorCallbacks, callback)
	end
end

-- Tương thích ngược
function caculationPot.GetActiveFrame(): (string?, string?)
	local itemName = nil
	for _, entry in ipairs(activeEntries) do
		if entry.name == "name" and entry.value ~= "" then
			itemName = entry.value
			break
		end
	end
	return activeFrame, itemName
end

function caculationPot.OnFrameChanged(callback: (string?, string?) -> ())
	if type(callback) == "function" then
		table.insert(inspectorCallbacks, function(frameName, entries, _)
			local itemName = nil
			for _, entry in ipairs(entries) do
				if entry.name == "name" and entry.value ~= "" then
					itemName = entry.value
					break
				end
			end
			pcall(callback, frameName, itemName)
		end)
	end
end

function caculationPot.Init()
	if not enabled then
		enabled = true
	end
	startInspectorLoop()
end

lifecycle.Register(function()
	enabled = false
	stopInspectorLoop()
	table.clear(stateCallbacks)
	table.clear(inspectorCallbacks)
end)

-- Tự động khởi chạy chế độ Passive ngay khi nạp module
startInspectorLoop()

return caculationPot
