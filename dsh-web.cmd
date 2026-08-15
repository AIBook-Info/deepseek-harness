@echo off
rem DeepSeek Harness Web GUI launcher (independent instance)
rem Double-click to start a Web UI on http://127.0.0.1:8080
rem Runs the built CLI directly with plain Node (no tsx/esbuild).
rem Port 8080 avoids clashing with the default instance on 3080.

setlocal
cd /d "D:\Github\AIBook-Info\deepseek-harness"

where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js not found. Install Node ^22.19 or ^>=24.
  pause
  exit /b 1
)

if not exist "apps\cli\lib\bin.js" (
  echo [ERROR] Built CLI not found. Run once: pnpm install ^&^& pnpm run build
  pause
  exit /b 1
)

echo Starting DeepSeek Harness (Web GUI)...
echo URL: http://127.0.0.1:8080
echo Press Ctrl+C in this window to stop it.
echo.

node apps\cli\lib\bin.js --profile web --port 8080

echo.
echo dsh exited with code %errorlevel%.
pause
