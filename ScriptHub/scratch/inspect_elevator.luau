-- Kiểm tra cấu trúc của thang máy trong workspace.Elevators
local elevators = workspace:FindFirstChild("Elevators")
if not elevators then
    return warn("Không tìm thấy workspace.Elevators!")
end

local el = elevators:FindFirstChild("Elevator5") or elevators:FindFirstChild("Elevator1") or elevators:GetChildren()[1]
if not el then
    return warn("Không tìm thấy Elevator nào trong Elevators!")
end

print("===== [ THÔNG TIN ELEVATOR: " .. el.Name .. " ] =====")
print("Class:", el.ClassName)
if el:IsA("Model") then
    print("PrimaryPart:", el.PrimaryPart and el.PrimaryPart.Name)
    local cf, size = el:GetBoundingBox()
    print("BoundingBox CFrame:", cf)
    print("BoundingBox Size:", size)
end

print("Các Part con bên trong:")
local baseCf = (el:IsA("Model") and el:GetBoundingBox()) or (el:IsA("BasePart") and el.CFrame) or CFrame.new()
for _, child in ipairs(el:GetDescendants()) do
    if child:IsA("BasePart") then
        local rel = baseCf:PointToObjectSpace(child.Position)
        print(string.format("  • %-15s | RelPos: (X:%.1f, Y:%.1f, Z:%.1f) | Size: %s | CanCollide: %s", 
            child.Name, rel.X, rel.Y, rel.Z, tostring(child.Size), tostring(child.CanCollide)
        ))
    end
end
print("===================================================")
