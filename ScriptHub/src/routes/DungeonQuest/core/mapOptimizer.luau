-- Map Optimizer (DungeonQuest): gộp 3 script thành 1 tính năng toggle.
-- Script1: ép hiện hình liên tục các phần map bị ẩn/thuỷ tinh.
-- Script2: dọn dẹp vật thể rác (decoration) ở lớp ngoài cùng của Map.
-- Script3: radar hitbox quét quanh nhân vật, xóa part có độ cao (Y) > 80.

--// Imports
local services = require("@routes/DungeonQuest/core/services")

--// Table
local mapOptimizer = {}

--// State
local enabled = false
local cleanupThread = nil
local visibilityThread = nil
local radarThread = nil

local CLEANUP_INTERVAL = 2
local FORCE_VISIBLE_INTERVAL = 0.5
local RADAR_INTERVAL = 0.2
local RADAR_HITBOX_SIZE = Vector3.new(20, 200, 20)
local RADAR_MIN_Y = 80

--// DANH SÁCH 1: Xóa nếu tên object ở Depth 1 khớp chính xác
local DEPTH1_NAMES_TO_DELETE = {
	["Stone"] = true,
	["Dead Tree"] = true,
	["Eye Rune"] = true,
	["Meshes/Ice shard"] = true,
	["Small snow patch"] = true,
	["snow patch"] = true,
	["Meshes/Root4"] = true,
	["snow machine"] = true,
	["Meshes/Ice3"] = true,
	["Meshes/ice plates_Circle.004"] = true,
}

--// DANH SÁCH 2: Xóa object Depth 1 nếu BÊN TRONG nó có chứa tên này
local DESCENDANT_NAMES_TO_TARGET = {
	["Wooden plank"] = true,
	["Meshes/Root4"] = true,
}

local function getMap()
	return workspace:WaitForChild("Map", 5)
end

--// Dọn dẹp vật thể rác ở Depth 1 (Script2)
local function cleanUpMap()
	local map = getMap()
	if not map then return end

	for _, child in ipairs(map:GetChildren()) do
		local shouldDelete = DEPTH1_NAMES_TO_DELETE[child.Name]
		if not shouldDelete then
			for _, descendant in ipairs(child:GetDescendants()) do
				if DESCENDANT_NAMES_TO_TARGET[descendant.Name] then
					shouldDelete = true
					break
				end
			end
		end
		if shouldDelete then
			child:Destroy()
		end
	end
end

--// Ép hiện hình cho một container (Script1)
local function forceVisible(container)
	if not container then return end
	for _, object in ipairs(container:GetDescendants()) do
		if object:IsA("BasePart") and object.Transparency ~= 0 then
			object.Transparency = 0
		end
	end
end

--// Radar hitbox: quét quanh nhân vật và xóa part cao (Y > RADAR_MIN_Y) (Script3)
local function runRadar()
	local player = services.player
	if not player then return end
	local character = player.Character
	local hrp = character and character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local map = getMap()
	if not map then return end

	local filterList = {}
	local borders = map:FindFirstChild("borders")
	local container143 = map:GetChildren()[143]
	if borders then table.insert(filterList, borders) end
	if container143 then table.insert(filterList, container143) end

	local overlapParams = OverlapParams.new()
	overlapParams.FilterType = Enum.RaycastFilterType.Include
	overlapParams.FilterDescendantsInstances = filterList

	local hitboxCFrame = hrp.CFrame * CFrame.new(0, 100, 0)
	local partsInHitbox = workspace:GetPartBoundsInBox(hitboxCFrame, RADAR_HITBOX_SIZE, overlapParams)

	for _, hitPart in ipairs(partsInHitbox) do
		if hitPart.Name ~= "borders" and hitPart.Name ~= "Baseplate" then
			if hitPart.CFrame.Position.Y > RADAR_MIN_Y then
				hitPart:Destroy()
			end
		end
	end
end

function mapOptimizer.Toggle(state)
	if state == enabled then return end
	enabled = state

	if enabled then
		local ok, err = pcall(cleanUpMap)
		if not ok then
			warn("[MapOptimizer] cleanup error:", tostring(err))
		end

		if cleanupThread then task.cancel(cleanupThread); cleanupThread = nil end
		cleanupThread = task.spawn(function()
			while enabled do
				task.wait(CLEANUP_INTERVAL)
				local ok, err = pcall(cleanUpMap)
				if not ok then
					warn("[MapOptimizer] cleanup error:", tostring(err))
				end
			end
		end)

		if visibilityThread then task.cancel(visibilityThread); visibilityThread = nil end
		visibilityThread = task.spawn(function()
			while enabled do
				local ok, err = pcall(function()
					local map = getMap()
					local container143 = map and map:GetChildren()[143]
					local borders = map and map:FindFirstChild("borders")
					forceVisible(container143)
					forceVisible(borders)
				end)
				if not ok then
					warn("[MapOptimizer] visibility error:", tostring(err))
				end
				task.wait(FORCE_VISIBLE_INTERVAL)
			end
		end)

		if radarThread then task.cancel(radarThread); radarThread = nil end
		radarThread = task.spawn(function()
			while enabled do
				local ok, err = pcall(runRadar)
				if not ok then
					warn("[MapOptimizer] radar error:", tostring(err))
				end
				task.wait(RADAR_INTERVAL)
			end
		end)
	else
		if cleanupThread then task.cancel(cleanupThread); cleanupThread = nil end
		if visibilityThread then task.cancel(visibilityThread); visibilityThread = nil end
		if radarThread then task.cancel(radarThread); radarThread = nil end
	end
end

function mapOptimizer.IsEnabled()
	return enabled
end

return mapOptimizer