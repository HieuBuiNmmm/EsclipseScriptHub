local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- Lifecycle: Quản lý đăng ký và giải phóng tài nguyên (Connections, Tasks, Objects) khi script unload hoặc reload.

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
end end-- Tracker: Giám sát trạng thái trận đấu (Wave, Máu Base, Trạng thái trận đấu)


local lifecycle = __DIST.load('a')

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
