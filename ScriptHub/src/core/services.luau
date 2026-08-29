--// Functions
local function cast(service: string): any
	return game:GetService(service)
end

--// Initialize
return {
	Players = cast("Players") :: Players,
}
