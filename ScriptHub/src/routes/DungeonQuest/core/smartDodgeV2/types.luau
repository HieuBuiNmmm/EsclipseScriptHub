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
	isBossHazard: boolean?,
	forward2D: Vector3?,
	beamOrigin: Vector3?,
	dangerRadius: number?,
	maxLookahead: number?,
	lastPos: Vector3?,
	hasLaunched: boolean?,
	launchTime: number?,
	isExpandingCone: boolean?,
	expansionRate: number?,
	maxRadius: number?,
	_waveDelayScheduled: boolean?,
	isCrissCross: boolean?,
	isMovingBeam: boolean?,
}

return {}
