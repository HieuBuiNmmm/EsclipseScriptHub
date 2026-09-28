-- Constants: Định danh và phân định môi trường (Lobby vs InGame) cho Slop Tower Defense.

local constants = {
	UNIVERSE_ID = 10529769390,
	LOBBY_PLACE_ID = 134459712190924,
}

export type LocationType = "Lobby" | "InGame"

-- Kiểm tra xem Player có đang ở Lobby không
function constants.IsLobby(): boolean
	return game.PlaceId == constants.LOBBY_PLACE_ID
end

-- Ngoại trừ PlaceId của Lobby (134459712190924) ra, tất cả các place còn lại đều là InGame
function constants.IsInGame(): boolean
	return game.PlaceId ~= constants.LOBBY_PLACE_ID
end

-- Trả về loại môi trường hiện tại ("Lobby" hoặc "InGame")
function constants.GetLocation(): LocationType
	return constants.IsLobby() and "Lobby" or "InGame"
end

-- Chuỗi hiển thị thân thiện trên UI
function constants.GetLocationName(): string
	return constants.IsLobby() and "Lobby" or "In-Game"
end

return constants
