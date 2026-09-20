@echo off
title Esclipse Live 2D Radar Server
cd /d "%~dp0"

echo ======================================================================
echo    ESCLIPSE LIVE 2D RADAR & BOSS SIMULATOR SERVER
echo ======================================================================
echo.

where node >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [*] Node.js detected! Launching server.js...
    start http://localhost:8765
    node server.js
    goto end
)

where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [*] Python detected! Launching server.py...
    start http://localhost:8765
    python server.py
    goto end
)

where py >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [*] Python launcher detected! Launching server.py...
    start http://localhost:8765
    py server.py
    goto end
)

echo [ERROR] Neither Node.js nor Python was found on your system!
echo Please install Node.js (https://nodejs.org) or Python (https://python.org) to run the server.
echo.
pause

:end
