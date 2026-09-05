--// Anti AFK Universal: ngăn bị kick vì idle (auto click qua VirtualUser).
--// Có thể dùng ở bất kỳ route nào (Universal, Game 2, ...) mà không phụ thuộc game.

--// Imports
local binder = require("@core/binder")

--// Services
local VirtualUser = game:GetService("VirtualUser")

--// Table
local antiAfk = {}

--// State
local enabled = false
local interval = 60 -- giây giữa mỗi lần "hoạt động" giả lập
local thread = nil

--// Gửi 1 lần tín hiệu "đang hoạt động" (click chuột trái/phải)
local function sendActivity()
	pcall(function()
		VirtualUser:CaptureController()
		VirtualUser:Button1Down(Vector2.new(0, 0))
		VirtualUser:Button1Up(Vector2.new(0, 0))
		VirtualUser:Button2Down(Vector2.new(0, 0))
		VirtualUser:Button2Up(Vector2.new(0, 0))
	end)
end

--// Vòng lặp giữ session không bị kick
local function kickLoop()
	while enabled do
		sendActivity()

		local waitTime = interval
		while waitTime > 0 and enabled do
			local step = math.min(waitTime, 0.5)
			task.wait(step)
			waitTime -= step
		end
	end
	thread = nil
end

--// Methods
function antiAfk.Start()
	if enabled or thread then return end
	enabled = true

	--// Gửi ngay tức thì để session hoạt động ngay khi bật
	task.spawn(sendActivity)
	thread = task.spawn(kickLoop)
end

function antiAfk.Stop()
	enabled = false
end

function antiAfk.IsEnabled()
	return enabled
end

function antiAfk.SetInterval(seconds)
	seconds = tonumber(seconds)
	if seconds and seconds > 0 then
		interval = seconds
	else
		interval = 60
	end
end

function antiAfk.GetInterval()
	return interval
end

--// Wrap với binder để gán qua property (tương thích tab:Toggle/tab:Slider)
return binder.Wrap(antiAfk, {
	Enabled = function(value: boolean)
		if value then
			antiAfk.Start()
		else
			antiAfk.Stop()
		end
	end,

	Interval = function(value: number)
		antiAfk.SetInterval(value)
	end,
}) :: {
	Enabled: boolean,
	Interval: number,
	Start: () -> (),
	Stop: () -> (),
	IsEnabled: () -> boolean,
	SetInterval: (number) -> (),
	GetInterval: () -> number,
}
