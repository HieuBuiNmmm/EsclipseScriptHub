local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- RangeVisual: Vẽ vòng tròn bán kính tầm bắn của tháp.

local rangeVisual = {
	Enabled = false,
}

function rangeVisual.SetEnabled(state: boolean)
	rangeVisual.Enabled = state
end

return rangeVisual
end function __DIST.b()-- Visuals Facade


local rangeVisual = __DIST.load('a')

return {
	RangeVisual = rangeVisual,
}
end end-- Tab Visuals: Hiển thị tầm bắn của tháp, ESP quái, và tùy chỉnh hiển thị.


local visuals = __DIST.load('b')

return function(window, tab)
	local leftSection = tab:Section({ Side = "Left" })
	leftSection:Header({ Name = "Range & Radii" })

	leftSection:Toggle({
		Name = "Show Tower Attack Range",
		Default = false,
		Callback = function(state)
			visuals.RangeVisual.SetEnabled(state)
		end,
	}, "Toggle_ShowTowerRange")

	local rightSection = tab:Section({ Side = "Right" })
	rightSection:Header({ Name = "Display & Camera" })

	rightSection:Slider({
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
end
