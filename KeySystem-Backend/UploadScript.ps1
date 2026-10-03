# Script upload payload tự động lên Cloudflare Worker cho EsclipseScriptHub
# Cách dùng: 
#   .\UploadScript.ps1                                   (Mặc định upload release.luau)
#   .\UploadScript.ps1 -FilePath "..\custom_path.luau"  (Upload file tùy chọn)

param (
    [string]$FilePath = "..\ScriptHub\generated\release.luau",
    [string]$AdminSecret = "EsclipseSecret2026",
    [string]$ApiUrl = "https://esclipse-keysystem.bhieu4225.workers.dev/api/admin/upload-script"
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$resolvedPath = [System.IO.Path]::GetFullPath((Join-Path $scriptDir $FilePath))

Write-Host "`n==================================================" -ForegroundColor Cyan
Write-Host "  🚀 ESCLIPSE HUB - SCRIPT PAYLOAD UPLOADER" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

if (-not (Test-Path $resolvedPath)) {
    # Thử tìm file debug nếu release chưa build
    $debugFallback = [System.IO.Path]::GetFullPath((Join-Path $scriptDir "..\ScriptHub\generated\debug.luau"))
    if (Test-Path $debugFallback) {
        Write-Host "⚠️  Không tìm thấy release.luau, chuyển sang dùng: debug.luau" -ForegroundColor Yellow
        $resolvedPath = $debugFallback
    } else {
        Write-Host "❌ LỖI: Không tìm thấy file script tại:" -ForegroundColor Red
        Write-Host "   $resolvedPath" -ForegroundColor DarkRed
        Write-Host "`n👉 Hãy chắc chắn bạn đã Build script trước khi upload!" -ForegroundColor Yellow
        Write-Host "==================================================`n" -ForegroundColor Cyan
        exit 1
    }
}

$fileInfo = Get-Item $resolvedPath
$fileSizeKb = [math]::Round($fileInfo.Length / 1KB, 2)

Write-Host "  📄 File nguồn    : $($fileInfo.Name)" -ForegroundColor White
Write-Host "  📦 Kích thước    : $fileSizeKb KB" -ForegroundColor Yellow
Write-Host "  🌐 Đích đến      : $ApiUrl" -ForegroundColor Gray
Write-Host "--------------------------------------------------" -ForegroundColor DarkGray
Write-Host "  ⏳ Đang đọc nội dung và tải lên Cloudflare KV..." -ForegroundColor Magenta

try {
    # Đọc file bằng UTF8
    $scriptContent = [System.IO.File]::ReadAllText($resolvedPath, [System.Text.Encoding]::UTF8)

    if ([string]::IsNullOrWhiteSpace($scriptContent)) {
        throw "Nội dung file script rỗng!"
    }

    $headers = @{
        "X-Admin-Secret" = $AdminSecret
        "Content-Type"   = "text/plain; charset=utf-8"
    }

    $response = Invoke-RestMethod -Uri $ApiUrl -Method POST -Headers $headers -Body $scriptContent

    Write-Host "`n==================================================" -ForegroundColor Green
    Write-Host "  ✅ UPLOAD THÀNH CÔNG LÊN CLOUDFLARE WORKER!" -ForegroundColor Green
    Write-Host "==================================================" -ForegroundColor Green
    Write-Host "  📊 Dung lượng KV : $($response.meta.sizeFormatted)" -ForegroundColor Cyan
    Write-Host "  🕒 Thời gian     : $($response.meta.updatedAtIso)" -ForegroundColor Gray
    Write-Host "  🛡️ Trạng thái    : Payload đã sẵn sàng cho Loader phân phối!" -ForegroundColor Yellow
    Write-Host "==================================================`n" -ForegroundColor Green
} catch {
    Write-Host "`n❌ LỖI KHI UPLOAD SCRIPT: $($_.Exception.Message)" -ForegroundColor Red
    if ($_.ErrorDetails) {
        Write-Host "Chi tiết: $($_.ErrorDetails.Message)" -ForegroundColor DarkRed
    }
    Write-Host "==================================================`n" -ForegroundColor Cyan
}
