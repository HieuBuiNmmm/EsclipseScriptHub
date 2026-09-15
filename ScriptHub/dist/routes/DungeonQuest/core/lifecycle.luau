
local a={
cleaned=false,
callbacks={},
}

function a.Register(b)
if type(b)~="function"then return function()end end
if a.cleaned then
pcall(b)
return function()end
end

table.insert(a.callbacks,b)
return function()
for c,d in ipairs(a.callbacks)do
if d==b then
table.remove(a.callbacks,c)
break
end
end
end
end

function a.Cleanup()
if a.cleaned then return end
a.cleaned=true
for b=#a.callbacks,1,-1 do
pcall(a.callbacks[b])
end
table.clear(a.callbacks)
end

function a.IsActive()
return not a.cleaned
end

return a