-- Scanner: Quét và quản lý danh sách tháp đang có trên bản đồ.

local scanner = {
	Towers = {},
}

export type TowerInfo = {
	Instance: Instance,
	Id: string,
	Name: string,
	Level: number,
	Position: Vector3,
	Owner: Player?,
	TargetMode: string?
}

function scanner.GetMyTowers(): { [string]: TowerInfo }
	return scanner.Towers
end

function scanner.Clear()
	table.clear(scanner.Towers)
end

function scanner.Refresh()
	-- Quét thư mục chứa tower trong Workspace (cần điền đúng Folder name sau khi inspect game)
end

return scanner
