-- Recorder: Ghi nhận các hành động (Place, Upgrade, Sell) theo timeline và wave.

local recorder = {
	IsRecording = false,
	Actions = {},
	StartTime = 0,
}

export type MacroAction = {
	ActionType: "Place" | "Upgrade" | "Sell" | "Ability",
	Wave: number,
	TimeOffset: number,
	TowerName: string?,
	Position: { number }?,
	Rotation: number?,
	TowerId: string?
}

function recorder.Start()
	recorder.IsRecording = true
	recorder.Actions = {}
	recorder.StartTime = os.clock()
end

function recorder.Stop(): { MacroAction }
	recorder.IsRecording = false
	return recorder.Actions
end

function recorder.RecordAction(action: MacroAction)
	if not recorder.IsRecording then return end
	table.insert(recorder.Actions, action)
end

return recorder
