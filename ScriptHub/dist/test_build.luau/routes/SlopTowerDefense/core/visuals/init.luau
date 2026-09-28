local __DIST __DIST={cache={}, load=function(m)if not __DIST.cache[m]then __DIST.cache[m]={c=__DIST[m]()}end return __DIST.cache[m].c end}do function __DIST.a()-- RangeVisual: Vẽ vòng tròn bán kính tầm bắn của tháp.

local rangeVisual = {
	Enabled = false,
}

function rangeVisual.SetEnabled(state: boolean)
	rangeVisual.Enabled = state
end

return rangeVisual
end end-- Visuals Facade


local rangeVisual = __DIST.load('a')

return {
	RangeVisual = rangeVisual,
}
