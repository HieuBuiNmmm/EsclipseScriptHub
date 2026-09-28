-- ElevatorJoiner: Tự động tìm thang máy (Raid: 1-4, Normal: 5-8), dịch chuyển ra trước cửa và bước vào bấm Start.

local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local zoneGuard = require("./zoneGuard")
local lifecycle = require("@routes/SlopTowerDefense/core/system/lifecycle")
local notifier = require("@routes/SlopTowerDefense/core/system/notifier")

local elevatorJoiner = {
	Enabled = false,
	Mode = "Normal", -- "Normal" | "Raid"
	StartDelay = 2, -- Giây chờ trước khi bấm nút Start
}

local activeThread: thread? = nil

-- Hàm click button an toàn, kết hợp đa phương thức (firesignal, VirtualInput, GuiService)
local function clickButton(button: GuiButton)
	if not button then return end

	-- Cách 1: firesignal
	pcall(function()
		local fs = (firesignal or (syn and syn.firesignal))
		if fs then
			fs(button.MouseButton1Click)
			fs(button.Activated)
			fs(button.MouseButton1Up)
		end
	end)

	-- Cách 2: VirtualInputManager click trực tiếp tại tâm nút
	pcall(function()
		local absPos = button.AbsolutePosition
		local absSize = button.AbsoluteSize
		local centerX = absPos.X + absSize.X / 2
		local centerY = absPos.Y + absSize.Y / 2
		VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
		task.wait(0.05)
		VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
	end)

	-- Cách 3: GuiService SelectedObject + phím Enter
	pcall(function()
		GuiService.SelectedObject = button
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
		task.wait(0.05)
		GuiService.SelectedObject = nil
	end)
end

-- Lấy danh sách tên elevator theo mode
local function getElevatorNames(mode: string): { string }
	if mode == "Raid" then
		return { "Elevator1", "Elevator2", "Elevator3", "Elevator4" }
	else
		return { "Elevator5", "Elevator6", "Elevator7", "Elevator8" }
	end
end

-- Lấy part sàn/hitbox cảm biến và tọa độ đứng bên trong thang máy
local function getElevatorParts(elevator: Instance): (BasePart?, Vector3)
	if not elevator then return nil, Vector3.zero end

	local hitbox: BasePart? = nil
	for _, name in ipairs({ "Hitbox", "Floor", "Zone", "Trigger", "Pad", "Base", "Primary" }) do
		local p = elevator:FindFirstChild(name, true)
		if p and p:IsA("BasePart") then
			hitbox = p
			break
		end
	end

	if not hitbox and elevator:IsA("Model") and elevator.PrimaryPart then
		hitbox = elevator.PrimaryPart
	end

	if not hitbox then
		hitbox = elevator:FindFirstChildWhichIsA("BasePart", true)
	end

	if not hitbox then return nil, Vector3.zero end

	-- Tâm đứng bên trong thang máy: lấy vị trí X, Z của hitbox, Y nâng lên +3.0 để chân chạm sàn
	local insidePos = hitbox.Position + Vector3.new(0, 3.0, 0)
	return hitbox, insidePos
end

-- Xác định hướng ra cửa và vị trí bên ngoài cửa thang máy
local function getElevatorEntrance(elevator: Instance, hitbox: BasePart, insidePos: Vector3): (Vector3, Vector3)
	-- Mặc định World +Z (hướng ra ngoài cửa Wall3 theo phân tích hình học)
	local primaryDir = Vector3.new(0, 0, 1)

	-- 1. Ưu tiên kiểm tra vị trí SpawnLocation trong Lobby để biết sảnh chính nằm ở hướng nào
	local spawn = workspace:FindFirstChildOfClass("SpawnLocation")
	if spawn then
		local diffZ = spawn.Position.Z - insidePos.Z
		if diffZ < -5 then
			primaryDir = Vector3.new(0, 0, -1)
		elseif diffZ > 5 then
			primaryDir = Vector3.new(0, 0, 1)
		end
	else
		-- 2. Kiểm tra raycast xuống sàn: phía nào có mặt sàn Lobby thì đó là hướng cửa
		pcall(function()
			local params = RaycastParams.new()
			params.FilterType = RaycastFilterType.Exclude
			local localChar = Players.LocalPlayer and Players.LocalPlayer.Character
			local excludeList = { elevator }
			if localChar then table.insert(excludeList, localChar) end
			params.FilterDescendantsInstances = excludeList

			local rayPosPlus = insidePos + Vector3.new(0, 5, 11.5)
			local rayPosMinus = insidePos + Vector3.new(0, 5, -11.5)
			local hitPlus = workspace:Raycast(rayPosPlus, Vector3.new(0, -15, 0), params)
			local hitMinus = workspace:Raycast(rayPosMinus, Vector3.new(0, -15, 0), params)

			if hitMinus and not hitPlus then
				primaryDir = Vector3.new(0, 0, -1)
			elseif hitPlus and not hitMinus then
				primaryDir = Vector3.new(0, 0, 1)
			end
		end)
	end

	local entrancePos = Vector3.new(insidePos.X, insidePos.Y, insidePos.Z + primaryDir.Z * 11.5)
	return primaryDir, entrancePos
end

-- Kiểm tra và lấy MainUI của Elevator
local function getElevatorMainUI(): Frame?
	local player = Players.LocalPlayer
	if not player then return nil end

	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return nil end

	local elevatorGui = playerGui:FindFirstChild("Elevator")
	if not elevatorGui then return nil end

	local mainUI = elevatorGui:FindFirstChild("MainUI")
	if mainUI and mainUI:IsA("GuiObject") and mainUI.Visible then
		return mainUI :: Frame
	end

	return nil
end

-- Kích hoạt sự kiện Touched vào thang máy qua firetouchinterest (bổ trợ)
local function triggerElevatorTouch(character: Model, elevator: Instance)
	local hrp = character:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not hrp then return end

	local fti = (firetouchinterest or (syn and syn.firetouchinterest))
	if not fti then return end

	pcall(function()
		for _, part in ipairs(elevator:GetDescendants()) do
			if part:IsA("BasePart") then
				fti(hrp, part, 0)
				task.wait()
				fti(hrp, part, 1)
			end
		end
	end)
end

-- Dịch chuyển ra trước cửa rồi dùng Humanoid:MoveTo bước vào tự nhiên
local function attemptWalkIntoElevator(character: Model, elevator: Instance, hitbox: BasePart, insidePos: Vector3): boolean
	local hrp = character:FindFirstChild("HumanoidRootPart") :: BasePart?
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not hrp or not humanoid then return false end

	local primaryDir, entrancePos = getElevatorEntrance(elevator, hitbox, insidePos)

	-- Danh sách các hướng thử: hướng chính trước, hướng ngược lại dự phòng
	local entranceCandidates = {
		entrancePos,
		Vector3.new(insidePos.X, insidePos.Y, insidePos.Z - primaryDir.Z * 11.5),
	}

	for _, pos in ipairs(entranceCandidates) do
		if not elevatorJoiner.Enabled or not zoneGuard.IsLobby() then
			return false
		end

		-- Bước 1: Dịch chuyển nhân vật ra ngay trước cửa thang máy
		-- CFrame nhìn thẳng vào tâm bên trong thang máy (insidePos)
		local lookTarget = Vector3.new(insidePos.X, pos.Y, insidePos.Z)
		hrp.CFrame = CFrame.lookAt(pos, lookTarget)

		pcall(function()
			hrp.AssemblyLinearVelocity = Vector3.zero
			hrp.AssemblyAngularVelocity = Vector3.zero
		end)

		humanoid.PlatformStand = false
		humanoid.Sit = false
		if humanoid.WalkSpeed < 16 then
			humanoid.WalkSpeed = 16
		end
		pcall(humanoid.ChangeState, humanoid, Enum.HumanoidStateType.GettingUp)

		-- Chờ ngắn 0.05s để engine vật lý đồng bộ vị trí
		task.wait(0.05)

		-- Bước 2: Ra lệnh cho Humanoid tự bước chân vào tâm thang máy
		humanoid:MoveTo(insidePos)

		-- Bước 3: Lắng nghe và theo dõi trong tối đa 1.8 giây
		local startTime = os.clock()
		while (os.clock() - startTime) < 1.8 and elevatorJoiner.Enabled and zoneGuard.IsLobby() do
			if getElevatorMainUI() then
				-- Đã vào thang máy thành công và MainUI đã mở!
				pcall(function()
					humanoid:MoveTo(hrp.Position)
				end)
				return true
			end

			-- Khi nhân vật đã bước vào gần tâm thang máy (< 4 studs), kích hoạt thêm firetouchinterest
			local dist = (hrp.Position - insidePos).Magnitude
			if dist < 4 then
				triggerElevatorTouch(character, elevator)
			end

			task.wait(0.1)
		end

		-- Kiểm tra lần cuối sau khi kết thúc lượt di chuyển
		if getElevatorMainUI() then
			pcall(function()
				humanoid:MoveTo(hrp.Position)
			end)
			return true
		end
	end

	return false
end

local function runLoop()
	while elevatorJoiner.Enabled and lifecycle.IsActive() do
		-- Chỉ hoạt động khi ở Lobby
		if not zoneGuard.IsLobby() then
			task.wait(1)
			continue
		end

		local player = Players.LocalPlayer
		local character = player and player.Character
		local hrp = character and character:FindFirstChild("HumanoidRootPart") :: BasePart?
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if not hrp or not humanoid or humanoid.Health <= 0 then
			task.wait(0.5)
			continue
		end

		-- 1. Kiểm tra xem giao diện MainUI đã hiện sẵn chưa (đã ở trong thang máy)
		local mainUI = getElevatorMainUI()
		if mainUI then
			-- Chờ n giây theo cấu hình slider Start Delay
			if elevatorJoiner.StartDelay > 0 then
				task.wait(elevatorJoiner.StartDelay)
			end

			-- Kiểm tra lại sau khi chờ
			mainUI = getElevatorMainUI()
			if mainUI and elevatorJoiner.Enabled and zoneGuard.IsLobby() then
				local startBtn = mainUI:FindFirstChild("Start", true)
				if startBtn and startBtn:IsA("GuiButton") then
					clickButton(startBtn)
					notifier.Notify("Elevator", "Pressed Start button!", 2)
					-- Chờ chuyển map
					task.wait(3)
				end
			end

			task.wait(1)
			continue
		end

		-- 2. Nếu MainUI chưa hiện -> Dịch chuyển ra trước cửa thang máy rồi bước vào
		local elevatorsFolder = workspace:FindFirstChild("Elevators")
		if elevatorsFolder then
			local targetNames = getElevatorNames(elevatorJoiner.Mode)

			for _, name in ipairs(targetNames) do
				if not elevatorJoiner.Enabled or not zoneGuard.IsLobby() then
					break
				end

				-- Nếu MainUI đã bật lên giữa chừng -> dừng lặp để xử lý bấm Start
				if getElevatorMainUI() then
					break
				end

				local targetElevator = elevatorsFolder:FindFirstChild(name)
				if targetElevator then
					local hitbox, insidePos = getElevatorParts(targetElevator)
					if hitbox and hrp then
						local entered = attemptWalkIntoElevator(character, targetElevator, hitbox, insidePos)
						if entered then
							break
						end
					end
				end
			end
		end

		task.wait(0.5)
	end
	activeThread = nil
end

function elevatorJoiner.SetEnabled(state: boolean)
	if elevatorJoiner.Enabled == state then return end
	elevatorJoiner.Enabled = state

	if state then
		if not activeThread then
			activeThread = task.spawn(runLoop)
		end
	end
end

function elevatorJoiner.SetMode(mode: string)
	if mode == "Raid" or mode == "Normal" then
		elevatorJoiner.Mode = mode
	end
end

function elevatorJoiner.SetStartDelay(seconds: number)
	seconds = tonumber(seconds) or 0
	elevatorJoiner.StartDelay = math.clamp(seconds, 0, 30)
end

function elevatorJoiner.GetStartDelay(): number
	return elevatorJoiner.StartDelay
end

-- Tự động dọn dẹp khi reload script
lifecycle.Register(function()
	elevatorJoiner.Enabled = false
end)

return elevatorJoiner
