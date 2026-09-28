type LocationType__DARKLUA_TYPE_a = "Lobby" | "InGame"
local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Constants: Định danh và phân định môi trường (Lobby vs InGame) cho Slop Tower Defense.


local constants = {
	UNIVERSE_ID = 10529769390,
	LOBBY_PLACE_ID = 134459712190924,
}

-- Kiểm tra xem Player có đang ở Lobby không


function constants.IsLobby(): boolean
	return game.PlaceId == constants.LOBBY_PLACE_ID
end

-- Ngoại trừ PlaceId của Lobby (134459712190924) ra, tất cả các place còn lại đều là InGame
function constants.IsInGame(): boolean
	return game.PlaceId ~= constants.LOBBY_PLACE_ID
end

-- Trả về loại môi trường hiện tại ("Lobby" hoặc "InGame")
function constants.GetLocation(): LocationType__DARKLUA_TYPE_a
	return constants.IsLobby() and "Lobby" or "InGame"
end

-- Chuỗi hiển thị thân thiện trên UI
function constants.GetLocationName(): string
	return constants.IsLobby() and "Lobby" or "In-Game"
end

return constants
end function __DIST.b()-- Lifecycle: Quản lý đăng ký và giải phóng tài nguyên (Connections, Tasks, Objects) khi script unload hoặc reload.


local lifecycle = {
	cleaned = false,
	callbacks = {},
}

function lifecycle.Register(callback: () -> ()): () -> ()
	if type(callback) ~= "function" then
		return function() end
	end
	if lifecycle.cleaned then
		pcall(callback)
		return function() end
	end

	table.insert(lifecycle.callbacks, callback)
	return function()
		for index, registered in ipairs(lifecycle.callbacks) do
			if registered == callback then
				table.remove(lifecycle.callbacks, index)
				break
			end
		end
	end
end

function lifecycle.Cleanup(): ()
	if lifecycle.cleaned then return end
	lifecycle.cleaned = true
	for index = #lifecycle.callbacks, 1, -1 do
		pcall(lifecycle.callbacks[index])
	end
	table.clear(lifecycle.callbacks)
end

function lifecycle.IsActive(): boolean
	return not lifecycle.cleaned
end

lifecycle.OnCleanup = lifecycle.Register

return lifecycle
end function __DIST.c()-- Tracker: Giám sát trạng thái trận đấu (Wave, Máu Base, Trạng thái trận đấu)


local lifecycle = __DIST.load('b')

local tracker = {
	Wave = 0,
	MaxWave = 0,
	BaseHealth = 100,
	MaxBaseHealth = 100,
	GameActive = false,
	AutoSkipEnabled = false,
}

local callbacks = {}

function tracker.OnWaveChanged(fn: (number) -> ()): () -> ()
	table.insert(callbacks, fn)
	return function()
		local idx = table.find(callbacks, fn)
		if idx then table.remove(callbacks, idx) end
	end
end

function tracker.SetWave(wave: number)
	if tracker.Wave ~= wave then
		tracker.Wave = wave
		for _, fn in ipairs(callbacks) do
			pcall(fn, wave)
		end
	end
end

function tracker.Init()
	-- Kết nối tự động phát hiện wave / match state khi vào game
	-- (Sẽ được bổ sung path cụ thể sau khi kiểm tra hierarchy trong game)
end

return tracker
end function __DIST.d()-- RangeVisual: Vẽ vòng tròn bán kính tầm bắn của tháp.


local rangeVisual = {
	Enabled = false,
}

function rangeVisual.SetEnabled(state: boolean)
	rangeVisual.Enabled = state
end

return rangeVisual
end function __DIST.e()-- Visuals Facade


local rangeVisual = __DIST.load('d')

return {
	RangeVisual = rangeVisual,
}
end function __DIST.f()
local binder = {}

function binder.Apply(properties: { [string]: any }, object: any, excludes: { [number]: string }?): any
	for property, value in pairs(properties) do
		if excludes and table.find(excludes, property) then
			continue
		end

		pcall(function()
			object[property] = value
		end)
	end

	return object
end

function binder.Wrap(
	object: { [string]: any },
	bindings: { [string]: (any) -> () },
	excludes: { [number]: any }?,
	instance: Instance?
): any
	local proxy = {}

	setmetatable(proxy, {
		__index = function(_, key)
			if object[key] ~= nil then
				return object[key]
			elseif instance then
				local ok, value = pcall(function()
					return instance[key]
				end)

				if ok then
					return value
				end
			end

			return
		end,

		__newindex = function(_, key, value)
			local handler = bindings[key]

			if handler then
				handler(value)

				if not (excludes and table.find(excludes, key)) then
					object[key] = value
				end
			elseif instance then
				local ok, _ = pcall(function()
					instance[key] = value
				end)

				if not ok then
					object[key] = value
				end
			else
				object[key] = value
			end
		end,
	})

	return proxy
end

return binder
end function __DIST.g()--// Anti AFK Universal: ngăn bị kick vì idle (auto click qua VirtualUser).
--// Có thể dùng ở bất kỳ route nào (Universal, Game 2, ...) mà không phụ thuộc game.

--// Imports

local binder = __DIST.load('f')

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
	GetInterval: () -> number
}
end end-- Tab Main: Thông tin tổng quan, hiển thị trận đấu và các tiện ích hệ thống (Anti AFK, FPS, Camera).


local constants = __DIST.load('a')
local tracker = __DIST.load('c')
local visuals = __DIST.load('e')
local antiAfk = __DIST.load('g')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Status & Display" })

	leftSection:Label({
		Text = "Location: " .. constants.GetLocationName(),
	})

	local waveLabel = leftSection:Label({
		Text = "Wave: 0 / 0",
	})

	local healthLabel = leftSection:Label({
		Text = "Base Health: 100%",
	})

	tracker.OnWaveChanged(function(wave)
		pcall(function()
			waveLabel:UpdateText("Wave: " .. tostring(wave))
		end)
	end)

	leftSection:Toggle({
		Name = "Show Tower Attack Range",
		Default = false,
		Callback = function(state)
			visuals.RangeVisual.SetEnabled(state)
		end,
	}, "Toggle_ShowTowerRange")

	leftSection:Slider({
		Name = "Field of View",
		Default = 70,
		Minimum = 70,
		Maximum = 120,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = function(value)
			local camera = workspace.CurrentCamera
			if camera then
				camera.FieldOfView = value
			end
		end,
	}, "Slider_FieldOfView")

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Utilities & Performance" })

	rightSection:Toggle({
		Name = "Anti AFK",
		Default = antiAfk.IsEnabled(),
		Callback = function(state)
			if state then
				antiAfk.Start()
			else
				antiAfk.Stop()
			end
		end,
	}, "Toggle_AntiAFK")

	rightSection:Slider({
		Name = "Anti AFK Interval (s)",
		Default = antiAfk.GetInterval(),
		Minimum = 5,
		Maximum = 300,
		DisplayMethod = "Round",
		Precision = 0,
		Callback = function(val)
			antiAfk.SetInterval(val)
		end,
	}, "Slider_AntiAFKInterval")

	rightSection:Toggle({
		Name = "Disable 3D Rendering (GPU Saver)",
		Default = false,
		Callback = function(state)
			local RunService = game:GetService("RunService")
			pcall(function()
				RunService:Set3dRenderingEnabled(not state)
			end)
		end,
	}, "Toggle_Disable3DRendering")

	rightSection:Button({
		Name = "Unlock FPS (Cap 240)",
		Callback = function()
			pcall(function()
				if setfpscap then
					setfpscap(240)
				end
			end)
		end,
	})
end
