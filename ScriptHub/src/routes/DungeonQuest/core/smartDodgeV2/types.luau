-- Smart Dodge V2: Type Definitions
-- Định nghĩa cấu trúc dữ liệu cho Threat Detection & Visuals

export type ActiveHazard = {
	instance: Instance,
	name: string,
	cleanName: string,
	spawnTime: number,
	activeParts: { [BasePart]: boolean },
	neonCount: number,
	position: Vector3,
	distanceToPlayer: number,
	connections: { RBXScriptConnection },
	isTelegraph: boolean?,
	isCustomHazard: boolean?,
	neverUnify: boolean?,
	hasSyntheticTelegraph: boolean?,
	telegraphLength: number?,
	isHomingToPlayer: boolean?,
	isMultiWave: boolean?,
	width: number?,
}

return {}
