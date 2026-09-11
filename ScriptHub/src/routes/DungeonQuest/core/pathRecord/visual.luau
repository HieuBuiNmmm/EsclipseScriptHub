-- Path Record System – Visual: vẽ quỹ đạo record (đỏ khi đang record /
-- cyan khi đang play / xám xanh nhạt khi xem trước macro của map).

--// Imports
local Workspace = game:GetService("Workspace")

--// Table
local visual = {}

--// State
local anchor = nil
local lines = {}
local drawnKey = nil
local lastUpdate = 0

--// Style áp dụng lúc tạo LineHandleAdornment (thay đổi qua tab Path Record).
local style = {
	thickness = 3,
	transparency = 0.25,
}

function visual.SetStyle(update)
	if type(update) ~= "table" then return end
	if update.thickness ~= nil then
		style.thickness = math.clamp(update.thickness, 1, 10)
	end
	if update.transparency ~= nil then
		style.transparency = math.clamp(update.transparency, 0, 0.9)
	end
end

function visual.GetStyle()
	return { thickness = style.thickness, transparency = style.transparency }
end

--// Constants
local THROTTLE = 0.4 -- Giây tối thiểu giữa 2 lần rebuild (đang record điểm đổi liên tục)

local function ensureAnchor()
	if anchor and anchor.Parent then return anchor end
	anchor = Instance.new("Part")
	anchor.Name = "PR_PathAnchor_Visual"
	anchor.Anchored = true
	anchor.CanCollide = false
	anchor.CanQuery = false
	anchor.CanTouch = false
	anchor.Transparency = 1
	anchor.Size = Vector3.new(1, 1, 1)
	anchor.CFrame = CFrame.new(0, 0, 0)
	anchor.Parent = Workspace
	return anchor
end

function visual.Clear()
	for _, line in ipairs(lines) do
		pcall(function() line:Destroy() end)
	end
	table.clear(lines)
	drawnKey = nil
end

--// Vẽ nhiều polyline (mỗi segment 1 màu riêng). Tự skip khi key không đổi.
--// polys: { { points = {Vector3...}, color = Color3, tag = any }, ... }
function visual.DrawPolylines(polys, key, force)
	if not polys or #polys == 0 then
		visual.Clear()
		return
	end

	local strKey = tostring(key)
	if strKey == drawnKey then return end
	if not force and os.clock() - lastUpdate < THROTTLE and #lines > 0 then return end

	visual.Clear()
	drawnKey = strKey
	lastUpdate = os.clock()

	local adornee = ensureAnchor()
	for _, poly in ipairs(polys) do
		local points = poly.points
		if points and #points >= 2 then
			for i = 2, #points do
				local a = points[i - 1]
				local b = points[i]
				local dist = (b - a).Magnitude
				if dist > 0.01 then
					local line = Instance.new("LineHandleAdornment")
					line.Name = "PR_PathLine_Visual"
					line.Adornee = adornee
					line.Length = dist
					line.Thickness = style.thickness
					line.Transparency = style.transparency
					line.Color3 = poly.color or Color3.fromRGB(0, 230, 255)
					line.ZIndex = 1
					line.CFrame = CFrame.lookAt(a, b)
					line.Parent = Workspace
					table.insert(lines, line)
				end
			end
		end
	end
	if #lines == 0 then drawnKey = nil end
end

return visual