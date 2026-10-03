# Script tạo Key nhanh cho EsclipseScriptHub
# Cách dùng: Chạy script này trong PowerShell để tạo Key 24h, 7 ngày hoặc Vĩnh viễn.

param (
    [int]$Hours = 24,
    [string]$Note = "Standard Key",
    [string]$CustomKey = ""
)

$apiUrl = "https://esclipse-keysystem.bhieu4225.workers.dev/api/create-key"
$adminSecret = "EsclipseSecret2026"

$payload = @{
    durationHours = $Hours
    note = $Note
}

if ($CustomKey -ne "") {
    $payload["customKey"] = $CustomKey
}

try {
    $bodyJson = $payload | ConvertTo-Json
    $response = Invoke-RestMethod -Uri $apiUrl -Method POST -Headers @{ "X-Admin-Secret" = $adminSecret } -Body $bodyJson -ContentType "application/json"
    
    Write-Host "`n==================================================" -ForegroundColor Green
    Write-Host "  ✅ TẠO KEY THÀNH CÔNG!" -ForegroundColor Green
    Write-Host "==================================================" -ForegroundColor Green
    Write-Host "  🔑 KEY          : " -NoNewline; Write-Host $response.key -ForegroundColor Yellow
    Write-Host "  ⏳ THỜI HẠN     : $($response.durationHours) Giờ" -ForegroundColor Cyan
    Write-Host "  📝 GHI CHÚ      : $($response.note)" -ForegroundColor Gray
    Write-Host "==================================================`n" -ForegroundColor Green
    
    # Tự động copy key vào clipboard để paste tiện lợi
    Set-Clipboard -Value $response.key
    Write-Host "📋 Đã tự động copy Key vào Clipboard!`n" -ForegroundColor Magenta
} catch {
    Write-Host "`n❌ LỖI KHI TẠO KEY: $($_.Exception.Message)" -ForegroundColor Red
}
