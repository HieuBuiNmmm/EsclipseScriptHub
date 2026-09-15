
local function cast(a:string):any
return game:GetService(a)
end


return{
Players=cast"Players"::Players,
}