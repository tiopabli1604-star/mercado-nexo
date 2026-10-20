@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Instala Node.js 24 o superior para abrir Mercado Nexo.
  pause
  exit /b 1
)
if not exist node_modules call npm ci
if not exist dist\index.html call npm run build
powershell -NoProfile -WindowStyle Hidden -Command "try { Invoke-RestMethod 'http://127.0.0.1:3001/api/health' -TimeoutSec 2 | Out-Null; exit 0 } catch { exit 1 }"
if not errorlevel 1 (
  start "" "http://127.0.0.1:3001"
  exit /b 0
)
start "" "http://127.0.0.1:3001"
call npm start
pause
