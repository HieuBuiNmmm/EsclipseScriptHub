-- Auto-press nút Start ở LOBBY cho DungeonQuest: chờ nút Start (introGui.title.Frame.
-- TextButton) xuất hiện rồi mô phỏng nhấn Enter như Script3.txt. Chỉ hoạt động khi
-- đang ở lobby place; vào dungeon (đổi place) thì script reload ngừng hẳn. Sau khi
-- bấm, introGui biến mất nên phải chờ cả introGui + nút xuất hiện lại mới bấm lần nữa.

--// Imports

--// Lobby placeId — auto-press chỉ hoạt động tại đây
local LOBBY_PLACE_IDS = {
	[77649408247578] = true,
	[115445507767090] = true,
}

--// Có đang ở lobby place không
local function inLobbyPlace()
	return LOBBY_PLACE_IDS[game.PlaceId] == true
end

--// State
local enabled = false

--// References
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

--// Nút Start trong introGui; button tồn tại khi introGui tồn tại (introGui biến mất
--// sau khi bấm -> phải check cả introGui lẫn chính nút).
local function findStartButton()
	local player = game:GetService("Players").LocalPlayer
	if not player then return nil end
	local playerGui = player:FindFirstChild("PlayerGui")
	if not playerGui then return nil end
	local introGui = playerGui:FindFirstChild("introGui")
	if not introGui or not introGui:IsA("ScreenGui") or not introGui.Enabled then return nil end
	local title = introGui:FindFirstChild("title")
	if not title then return nil end
	local frame = title:FindFirstChild("Frame")
	if not frame then return nil end
	local button = frame:FindFirstChild("TextButton")
	if not button or not button:IsA("TextButton") or not button.Visible then return nil end
	--// Chỉ chấp nhận nút có nhãn chứa "Play" để chắc tìm đúng nút Start.
	local labelText = ""
	if button.Text and type(button.Text) == "string" then
		labelText = button.Text
	end
	if not string.find(string.lower(labelText), "play") then return nil end
	return button
end

--// Mô phỏng chọn nút + nhấn Enter (theo Script3.txt), rồi BỎ CHỌN để thoát trạng
--// thái selection/focus sau khi bấm cho sạch.
local function pressStartButton(button)
	pcall(function()
		GuiService.SelectedObject = button
	end)
	task.wait(0.1)
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
	task.wait()
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
	task.wait(0.1)
	pcall(function()
		GuiService.SelectedObject = nil
	end)
end

--// Loop: bấm lặp lại nút Start tới khi introGui biến mất (đã press được) rồi NGỪNG
--// HẲN. Chống bấm quá sớm do animation: nếu nút chưa sẵn sàng lần đầu, các lần sau
--// bấm tới khi dính. Chỉ hoạt động ở lobby place; vào dungeon ngừng hẳn.
local function runLoop()
	task.spawn(function()
		local hadButton = false
		while enabled do
			--// Chỉ hoạt động ở lobby place; vào dungeon ngừng hẳn.
			if not inLobbyPlace() then
				task.wait(1)
				continue
			end

			local button = findStartButton()
			if button then
				--// Bấm; nếu press thành công, introGui biến mất -> vòng sau không thấy nút.
				pressStartButton(button)
				hadButton = true
			elseif hadButton then
				--// Đã từng bấm mà giờ nút biến mất -> press thành công (introGui đóng).
				print("[AutoStartLobby] Pressed Start")
				break
			end

			if not enabled then break end
			task.wait(0.2)
		end
	end)
end

--// Table
local autoStartLobby = {}

--// Methods
function autoStartLobby.Toggle(state)
	enabled = state
	if enabled then
		runLoop()
	end
end

return autoStartLobby