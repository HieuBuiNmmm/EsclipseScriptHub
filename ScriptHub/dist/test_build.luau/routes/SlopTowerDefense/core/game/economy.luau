-- Economy: Theo dõi tiền / cash trong trận và trong lobby.

local economy = {
	Cash = 0,
	Gold = 0,
}

local cashCallbacks = {}

function economy.OnCashChanged(fn: (number) -> ()): () -> ()
	table.insert(cashCallbacks, fn)
	return function()
		local idx = table.find(cashCallbacks, fn)
		if idx then table.remove(cashCallbacks, idx) end
	end
end

function economy.GetCash(): number
	return economy.Cash
end

function economy.SetCash(amount: number)
	if economy.Cash ~= amount then
		economy.Cash = amount
		for _, fn in ipairs(cashCallbacks) do
			pcall(fn, amount)
		end
	end
end

return economy
