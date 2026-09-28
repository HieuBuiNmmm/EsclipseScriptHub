-- RangeVisual: Vẽ vòng tròn bán kính tầm bắn của tháp.

local rangeVisual = {
	Enabled = false,
}

function rangeVisual.SetEnabled(state: boolean)
	rangeVisual.Enabled = state
end

return rangeVisual
