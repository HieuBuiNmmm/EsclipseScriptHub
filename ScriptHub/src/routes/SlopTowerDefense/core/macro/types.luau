-- Types: Định nghĩa kiểu dữ liệu chuẩn cho hệ thống Macro Slop Tower Defense.

export type ActionType = "Place" | "Upgrade" | "Sell" | "Target" | "Ability" | "Speed" | "VoteSkip"

export type MacroStep = {
	Index: number,
	Type: ActionType,
	TowerId: string, -- Định danh tháp (vd: "T1", "T2", "SPEED")
	TowerName: string, -- Tên loại tháp (vd: "Freddy Trashcan")
	Level: number?, -- Cấp độ sau khi thực hiện thao tác (Place = 0, Upgrade = 1, 2, 3...)
	Stage: number?, -- [Deprecated] Đã chuyển sang cơ chế Map Macro (mỗi map một kịch bản)
	MapName: string?, -- [Deprecated] Đã chuyển sang Metadata.Map
	Speed: number?, -- Tốc độ game (1, 2, 3, 4, 5) nếu Type == "Speed"
	RecordSpeed: number?, -- Tốc độ game lúc thực hiện ghi bước này (1, 2, 3, 4, 5)
	CFrame: { number }?, -- Tọa độ CFrame [X, Y, Z, R00, R01, ...] (12 components)
	Position: { number }?, -- [X, Y, Z] để dễ hiển thị và so khớp
	Arg3: boolean?, -- Tham số thứ 3 của SpawnTower (thường là false)
	Arg4: string?, -- Skin hoặc Variant (vd: "Freddy Trashcan Gold")
	Arg5: { any }?, -- Danh sách Modifier / Traits (vd: {"Gold"})
	Wave: number, -- Wave lúc thực hiện
	Time: number, -- Giây Match Timer lúc thực hiện (số thập phân 2 chữ số, vd: 14.35)
	Cost: number?, -- Chi phí thực tế của tháp/nâng cấp (gộp từ TowerCost)
	TowerCost: number?, -- [Deprecated] Đã gộp vào Cost, giữ lại để tương thích ngược với macro cũ
	LayoutOrder: number?, -- Thứ tự hiển thị trong UI UnitManager.Units
	TargetMode: string?, -- Chế độ ngắm bắn ("First", "Last", ...)
	RawData: { [string]: any }?, -- Dữ liệu thô dự phòng
}

export type MacroMetadata = {
	Name: string,
	CreatedAt: number,
	UpdatedAt: number,
	TotalSteps: number,
	TotalDuration: number, -- Tổng thời lượng ván đấu (số thập phân, vd: 345.67)
	InitialSpeed: number?, -- Tốc độ lúc bắt đầu ghi macro (vd: 1, 2, ...)
	Universe: string?,
	Map: string?,
	Difficulty: string?,
}

export type MacroData = {
	Metadata: MacroMetadata,
	Steps: { MacroStep },
}

return {}
