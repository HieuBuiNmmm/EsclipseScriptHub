-- Map Recorder & Profile Manager (DungeonQuest - DevTools):
-- 1. Giới hạn CHỈ TÁC ĐỘNG VÀO DEPTH LEVEL 1 (Model hoặc Part cấp 1 trực thuộc Workspace.Map).
-- 2. Click-to-delete sẽ tự động bọc highlight và xóa TOÀN BỘ Model cha (Depth 1) thay vì xóa part con bên trong.
-- 3. Xuất dữ liệu đã xóa thành file JSON cấu hình riêng cho từng Dungeon.
-- 4. Nạp và áp dụng profile JSON để tự động tối ưu map (Xóa hoặc Tàng hình + No-clip).

--// Imports
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local services = require("@routes/DungeonQuest/core/services")
local shared = require("@routes/DungeonQuest/core/shared")
local notifier = require("@routes/DungeonQuest/core/notifier")
local lifecycle = require("@routes/DungeonQuest/core/lifecycle")

--// Table
local mapRecorder = {}

--// State
local isRecording = false
local recordedDeletions = {} -- list of { Name, Class, Path, Position, Size, IsModel }
local recordedSet = {} -- [Path or Fingerprint] = true (tránh trùng lặp)
local recordConnection = nil
local countCallbacks = {}

local clickToDeleteEnabled = false
local clickConnection = nil
local hoverConnection = nil
local hoverBox = nil
local hoveredTarget = nil

local PROFILES_FOLDER = "EsclipseHub/DungeonQuest/MapProfiles"

--// Helper: Làm tròn số thập phân
local function round(num, decimals)
	local mult = 10 ^ (decimals or 2)
	return math.floor(num * mult + 0.5) / mult
end

--// Helper: Lấy đường dẫn phân cấp (Path) của Instance
local function getInstancePath(inst)
	if not inst then return "" end
	local parts = {}
	local curr = inst
	while curr and curr ~= game do
		table.insert(parts, 1, curr.Name)
		curr = curr.Parent
	end
	return table.concat(parts, ".")
end

--// Helper: Lấy tâm và kích thước bao phủ (Bounding Box) của Model hoặc Part
local function getInstancePositionAndSize(inst)
	if not inst then return nil, nil end
	if inst:IsA("BasePart") then
		return inst.Position, inst.Size
	elseif inst:IsA("Model") then
		local cf, sz = inst:GetBoundingBox()
		return cf.Position, sz
	end
	return nil, nil
end

--// Helper: Tạo dấu vân tay độc nhất cho Object Depth Level 1
local function getObjectFingerprint(name, pos, sz)
	return string.format("%s_%.1f_%.1f_%.1f_%.1f_%.1f_%.1f",
		name,
		pos and pos.X or 0, pos and pos.Y or 0, pos and pos.Z or 0,
		sz and sz.X or 0, sz and sz.Y or 0, sz and sz.Z or 0
	)
end

--// Tìm phần tử gốc Model/Part (Depth Level 1) trực thuộc Map Container hoặc Sub-Folder
local function getDepth1Root(inst)
	if not inst or inst == Workspace or inst == Workspace.Terrain then return nil end

	-- Bỏ qua nếu thuộc Character của bất kỳ người chơi nào
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character and (inst == p.Character or inst:IsDescendantOf(p.Character)) then
			return nil
		end
	end

	-- Bỏ qua Camera, Terrain, RaycastIgnore, SmartDodge, ESP
	if inst:IsA("Camera") or inst:IsA("Terrain") or inst.Name == "Terrain" or inst.Name:find("Raycast") then
		return nil
	end
	if inst.Name:find("SmartDodge") or inst.Name:find("ESP") or inst.Name:find("Highlight") or inst.Name:find("MapRecorder") then
		return nil
	end

	local mapContainer = Workspace:FindFirstChild("Map")
		or Workspace:FindFirstChild("dungeon")
		or Workspace:FindFirstChild("Dungeon")
		or Workspace

	-- Duyệt ngược lên từ part con đến Model cao nhất (dưới Map Container hoặc dưới Folder)
	local curr = inst
	while curr.Parent and curr.Parent ~= mapContainer and not curr.Parent:IsA("Folder") and curr.Parent ~= Workspace do
		curr = curr.Parent
	end

	-- Nếu curr là Folder (tránh chọn toàn bộ folder chứa hàng trăm vật thể), trả về chính inst
	if curr:IsA("Folder") then
		return inst
	end

	return curr
end

--// File System Utilities (Tương thích mọi executor)
local function ensureDirectory(path)
	if makefolder and isfolder then
		pcall(function()
			local parts = string.split(path, "/")
			local current = ""
			for _, p in ipairs(parts) do
				current = (current == "") and p or (current .. "/" .. p)
				if not isfolder(current) then
					makefolder(current)
				end
			end
		end)
	end
end

local function saveJsonFile(filePath, dataTable)
	if not writefile then
		warn("[MapRecorder] Executor không hỗ trợ hàm writefile!")
		return false
	end
	local success, jsonStr = pcall(function()
		return HttpService:JSONEncode(dataTable)
	end)
	if not success or not jsonStr then return false end

	ensureDirectory(PROFILES_FOLDER)
	local writeSuccess = pcall(writefile, filePath, jsonStr)
	return writeSuccess
end

local function loadJsonFile(filePath)
	if not readfile or not isfile then return nil end
	if not isfile(filePath) then return nil end

	local success, content = pcall(readfile, filePath)
	if not success or not content then return nil end

	local decodeSuccess, data = pcall(function()
		return HttpService:JSONDecode(content)
	end)
	if decodeSuccess and type(data) == "table" then
		return data
	end
	return nil
end

--// Thông báo số lượng part đã ghi nhận
local function fireCountChanged()
	local count = #recordedDeletions
	for _, cb in ipairs(countCallbacks) do
		pcall(cb, count, isRecording)
	end
end

--// Xử lý khi có Object bị xóa khỏi Workspace (Chỉ ghi nhận Depth Level 1)
local function onDescendantRemoving(inst)
	if not isRecording or not inst then return end

	local root = getDepth1Root(inst)
	if not root then return end

	-- Lấy thông tin của Root Depth Level 1
	local name = root.Name
	local className = root.ClassName
	local path = getInstancePath(root)
	local pos, size = getInstancePositionAndSize(root)

	local fp = getObjectFingerprint(name, pos, size)
	if recordedSet[fp] or (path and recordedSet[path]) then
		return
	end

	recordedSet[fp] = true
	if path and #path > 0 then
		recordedSet[path] = true
	end

	local entry = {
		Name = name,
		Class = className,
		Path = path,
		Position = pos and { round(pos.X, 2), round(pos.Y, 2), round(pos.Z, 2) } or nil,
		Size = size and { round(size.X, 2), round(size.Y, 2), round(size.Z, 2) } or nil,
		IsModel = root:IsA("Model"),
	}

	table.insert(recordedDeletions, entry)
	fireCountChanged()

	print(string.format("[MapRecorder][Depth-1] 🗑️ Recorded: '%s' (%s) | Path: %s | Pos: (%.2f, %.2f, %.2f)",
		name, className, path, pos and pos.X or 0, pos and pos.Y or 0, pos and pos.Z or 0
	))
end

--// Bắt đầu chế độ Ghi (Start Recording)
function mapRecorder.StartRecording()
	if isRecording then return end
	isRecording = true
	table.clear(recordedDeletions)
	table.clear(recordedSet)

	if recordConnection then
		recordConnection:Disconnect()
		recordConnection = nil
	end

	recordConnection = Workspace.DescendantRemoving:Connect(onDescendantRemoving)
	fireCountChanged()

	print("[MapRecorder] 🔴 Bắt đầu ghi nhận (Chế độ Depth Level 1)!")
	notifier:Notify("Map Recorder", "Đã bật chế độ ghi nhận xóa Map (Depth Level 1)!", 3)
end

--// Dừng chế độ Ghi (Stop Recording) và tùy chọn tự động lưu
function mapRecorder.StopRecording(autoSave)
	if not isRecording then return end
	isRecording = false

	if recordConnection then
		recordConnection:Disconnect()
		recordConnection = nil
	end

	fireCountChanged()
	print(string.format("[MapRecorder] ⏹️ Dừng ghi. Tổng cộng đã ghi nhận: %d objects (Depth 1).", #recordedDeletions))

	if autoSave and #recordedDeletions > 0 then
		local dungeonName = shared.GetCurrentDungeonName() or "Default_Dungeon"
		mapRecorder.SaveProfile(dungeonName)
	end
end

function mapRecorder.IsRecording()
	return isRecording
end

function mapRecorder.GetRecordedCount()
	return #recordedDeletions
end

function mapRecorder.GetRecordedData()
	return recordedDeletions
end

function mapRecorder.ClearBuffer()
	table.clear(recordedDeletions)
	table.clear(recordedSet)
	fireCountChanged()
	print("[MapRecorder] 🧹 Đã xóa sạch bộ nhớ tạm.")
end

function mapRecorder.OnCountChanged(callback)
	if type(callback) == "function" then
		table.insert(countCallbacks, callback)
	end
end

--// Lưu Profile ra file JSON
function mapRecorder.SaveProfile(customName)
	if #recordedDeletions == 0 then
		warn("[MapRecorder] Không có dữ liệu để lưu!")
		notifier:Notify("Map Recorder", "Không có Object nào trong bộ nhớ để lưu!", 3)
		return false
	end

	local dungeonName = customName
	if not dungeonName or #dungeonName == 0 then
		dungeonName = shared.GetCurrentDungeonName() or "Default_Dungeon"
	end

	local cleanName = dungeonName:gsub("[\\/:*?\"<>|]", "_")
	local filePath = string.format("%s/%s.json", PROFILES_FOLDER, cleanName)

	local profileData = {
		DungeonName = dungeonName,
		SavedAt = os.date("%Y-%m-%d %H:%M:%S"),
		Scope = "DepthLevel1",
		TotalCount = #recordedDeletions,
		Objects = recordedDeletions,
	}

	local success = saveJsonFile(filePath, profileData)
	if success then
		print(string.format("[MapRecorder] 💾 Đã lưu profile thành công: %s (%d Depth-1 objects)", filePath, #recordedDeletions))
		notifier:Notify("Map Recorder", string.format("Đã lưu %d Depth-1 objects vào '%s.json'!", #recordedDeletions, cleanName), 4)
		return true
	else
		warn(string.format("[MapRecorder] ❌ Lưu file thất bại: %s", filePath))
		notifier:Notify("Map Recorder", "Lưu file JSON thất bại!", 4)
		return false
	end
end

--// Sao chép JSON vào Clipboard
function mapRecorder.ExportToClipboard()
	if #recordedDeletions == 0 then
		notifier:Notify("Map Recorder", "Không có dữ liệu để sao chép!", 3)
		return false
	end

	local dungeonName = shared.GetCurrentDungeonName() or "Default_Dungeon"
	local profileData = {
		DungeonName = dungeonName,
		SavedAt = os.date("%Y-%m-%d %H:%M:%S"),
		Scope = "DepthLevel1",
		TotalCount = #recordedDeletions,
		Objects = recordedDeletions,
	}

	local jsonStr = HttpService:JSONEncode(profileData)
	if setclipboard then
		setclipboard(jsonStr)
		notifier:Notify("Map Recorder", "Đã copy JSON vào Clipboard!", 3)
		return true
	end
	return false
end

--// Nạp và Áp dụng Profile JSON vào Map hiện tại (Khớp chính xác theo Tọa độ 3D)
function mapRecorder.ApplyProfile(customName, mode)
	local dungeonName = customName
	if not dungeonName or #dungeonName == 0 then
		dungeonName = shared.GetCurrentDungeonName() or "Default_Dungeon"
	end

	local cleanName = dungeonName:gsub("[\\/:*?\"<>|]", "_")
	local filePath = string.format("%s/%s.json", PROFILES_FOLDER, cleanName)

	local profile = loadJsonFile(filePath)
	if not profile or not profile.Objects then
		warn(string.format("[MapRecorder] Không tìm thấy file profile: %s", filePath))
		notifier:Notify("Map Recorder", string.format("Không tìm thấy profile '%s.json'!", cleanName), 4)
		return 0
	end

	local applyMode = mode or "Destroy" -- "Destroy" hoặc "Ghost"
	local cleanedCount = 0
	local objects = profile.Objects

	-- Chuyển danh sách object thành mảng vector tọa độ để so khớp khoảng cách
	local targetList = {}
	for _, entry in ipairs(objects) do
		if entry.Position then
			table.insert(targetList, {
				Pos = Vector3.new(entry.Position[1], entry.Position[2], entry.Position[3]),
				Name = entry.Name,
				Class = entry.Class,
				Size = entry.Size and Vector3.new(entry.Size[1], entry.Size[2], entry.Size[3]) or nil,
			})
		end
	end

	local mapContainer = Workspace:FindFirstChild("Map")
		or Workspace:FindFirstChild("dungeon")
		or Workspace:FindFirstChild("Dungeon")
		or Workspace

	-- Tập hợp tất cả các candidate cấp 1 hoặc Model trong Map
	local candidates = {}
	for _, child in ipairs(mapContainer:GetChildren()) do
		if not child:IsA("Camera") and not child:IsA("Terrain") and child.Name ~= "Terrain" then
			table.insert(candidates, child)
			-- Nếu child là Folder (chứa các sub-models), thêm cả các Model bên trong folder
			if child:IsA("Folder") or child:IsA("Configuration") then
				for _, sub in ipairs(child:GetChildren()) do
					table.insert(candidates, sub)
				end
			end
		end
	end

	local alreadyCleaned = {}

	for _, candidate in ipairs(candidates) do
		if not alreadyCleaned[candidate] and candidate.Parent then
			local candPos, candSize = getInstancePositionAndSize(candidate)
			if candPos then
				local matched = false

				-- CHỈ SO KHỚP KHI TỌA ĐỘ VỊ TRÍ TRÙNG KHỚP (Khoảng cách <= 2.5 studs)
				for _, target in ipairs(targetList) do
					local dist = (candPos - target.Pos).Magnitude
					if dist <= 2.5 then
						-- Đảm bảo trùng tên hoặc Class
						if candidate.Name == target.Name or candidate.ClassName == target.Class or candidate:IsA(target.Class) then
							matched = true
							break
						end
					end
				end

				if matched then
					alreadyCleaned[candidate] = true
					cleanedCount = cleanedCount + 1

					pcall(function()
						if applyMode == "Destroy" then
							candidate:Destroy()
						else
							if candidate:IsA("BasePart") then
								candidate.Transparency = 1
								candidate.CanCollide = false
								candidate.CanTouch = false
							elseif candidate:IsA("Model") then
								for _, desc in ipairs(candidate:GetDescendants()) do
									if desc:IsA("BasePart") then
										desc.Transparency = 1
										desc.CanCollide = false
										desc.CanTouch = false
									end
								end
							end
						end
					end)
				end
			end
		end
	end

	print(string.format("[MapRecorder][Spatial Match] ⚡ Đã áp dụng profile '%s': Đã xử lý %d / %d objects (Mode: %s)!",
		cleanName, cleanedCount, #objects, applyMode
	))
	notifier:Notify("Map Recorder", string.format("Đã tối ưu %d objects đúng vị trí theo '%s'!", cleanedCount, cleanName), 4)
	return cleanedCount
end

--// Công cụ Click-To-Delete: Tự động bọc Highlight và Xóa toàn bộ Model/Part Depth Level 1
local function getOrCreateHoverBox()
	if hoverBox and hoverBox.Parent then return hoverBox end
	local box = Instance.new("SelectionBox")
	box.Name = "MapRecorder_HoverBox"
	box.Color3 = Color3.fromRGB(255, 60, 60)
	box.SurfaceColor3 = Color3.fromRGB(255, 20, 20)
	box.SurfaceTransparency = 0.55
	box.LineThickness = 0.06
	box.Parent = Workspace.Terrain
	hoverBox = box
	return box
end

function mapRecorder.SetClickToDelete(state)
	clickToDeleteEnabled = state and true or false

	if hoverConnection then hoverConnection:Disconnect(); hoverConnection = nil end
	if clickConnection then clickConnection:Disconnect(); clickConnection = nil end
	if hoverBox then hoverBox.Adornee = nil end

	if not clickToDeleteEnabled then
		hoveredTarget = nil
		return
	end

	local player = services.player
	local mouse = player and player:GetMouse()
	if not mouse then return end

	local box = getOrCreateHoverBox()

	-- Lắng nghe di chuột: Tự động trỏ lên Root Depth Level 1
	hoverConnection = RunService.RenderStepped:Connect(function()
		if not clickToDeleteEnabled then return end
		local target = mouse.Target
		local root = getDepth1Root(target)

		if root and root ~= Workspace.Terrain then
			hoveredTarget = root
			box.Adornee = root
		else
			hoveredTarget = nil
			box.Adornee = nil
		end
	end)

	-- Lắng nghe click chuột trái hoặc phím X để xóa toàn bộ Root Depth Level 1
	clickConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed or not clickToDeleteEnabled then return end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.KeyCode == Enum.KeyCode.X then
			if hoveredTarget and hoveredTarget.Parent then
				local targetToDelete = hoveredTarget
				box.Adornee = nil
				hoveredTarget = nil

				print(string.format("[MapRecorder][Click-To-Delete] 💥 Deleted Depth-1 Root: '%s' (%s)",
					targetToDelete.Name, targetToDelete.ClassName
				))

				pcall(function()
					targetToDelete:Destroy()
				end)
			end
		end
	end)

	notifier:Notify("Click-To-Delete", "Đã bật! Di chuột sẽ tự bọc toàn bộ Model (Depth 1). Click hoặc bấm X để xóa.", 4)
end

function mapRecorder.IsClickToDeleteEnabled()
	return clickToDeleteEnabled
end

--// Cleanup khi unload script
lifecycle.Register(function()
	mapRecorder.StopRecording(false)
	mapRecorder.SetClickToDelete(false)
	if hoverBox then
		pcall(function() hoverBox:Destroy() end)
		hoverBox = nil
	end
	table.clear(recordedDeletions)
	table.clear(recordedSet)
	table.clear(countCallbacks)
end)

return mapRecorder
