-- Tìm xem "Blackout" hoặc các Mutator khác nằm ở đâu trong ReplicatedStorage / PlayerScripts
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

print("===== [ TÌM KIẾM NGUỒN CỦA BLACKOUT & MUTATORS ] =====")
for _, desc in ipairs(ReplicatedStorage:GetDescendants()) do
    if desc:IsA("ModuleScript") then
        local ok, src = pcall(function()
            if decompile then
                return decompile(desc)
            end
            local mod = require(desc)
            if typeof(mod) == "table" then
                for k, v in pairs(mod) do
                    if tostring(k):find("Blackout") or (typeof(v) == "table" and (v.Title == "Blackout" or v.Id == "Blackout")) then
                        return "found in table"
                    end
                end
            end
            return nil
        end)
        if ok and src then
            print("[Tìm thấy trong]:", desc:GetFullName())
        end
    end
end
print("=====================================================")
