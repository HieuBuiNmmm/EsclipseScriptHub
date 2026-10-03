@echo off
title Upload Script to Cloudflare Worker
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\UploadScript.ps1" %*
echo.
pause
