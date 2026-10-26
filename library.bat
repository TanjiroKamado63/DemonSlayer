@echo off
setlocal EnableExtensions DisableDelayedExpansion
set "GITHUB_USER=TanjiroKamado63"
set "REPO=DemonSlayer"
set "BRANCH=main"
set "DOWNLOAD_DIR=%USERPROFILE%\Documents\R-Practical-Library"
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

:menu
cls
echo ========================================
echo          R PRACTICAL LIBRARY
echo ========================================
echo.
echo   1. FUNDAMENTAL OF R
echo   2. Graphs using R
echo   3. Diagrams using R
echo   4. Simple Linear Regression
echo   5. Weighted Least Squares
echo   6. Multiple Linear Regression
echo.
echo   0. Exit
echo ========================================
set "choice="
set /p "choice=Enter Practical Number: "
set "FILE_NAME="
if "%choice%"=="1" set "FILE_NAME=01.FUNDAMENTAL OF R.txt"
if "%choice%"=="2" set "FILE_NAME=Practical No. 02 - Graphs using R.txt"
if "%choice%"=="3" set "FILE_NAME=Practical No. 03 - Diagrams using R.txt"
if "%choice%"=="4" set "FILE_NAME=Practical No. 04 - Simple Linear Re.txt"
if "%choice%"=="5" set "FILE_NAME=Practical No. 05 - Weighted Least.txt"
if "%choice%"=="6" set "FILE_NAME=Practical No. 06 - Multiple Linear.txt"
if "%choice%"=="0" exit /b 0
if not defined FILE_NAME (
  echo Invalid option. Choose 0 to 6.
  pause
  goto menu
)

echo.
echo Downloading: %FILE_NAME%
REM Encode the filename safely and download only that text file.
powershell.exe -NoProfile -Command "$ErrorActionPreference='Stop'; $url='https://raw.githubusercontent.com/'+$env:GITHUB_USER+'/'+$env:REPO+'/'+$env:BRANCH+'/'+[uri]::EscapeDataString($env:FILE_NAME); $dest=Join-Path $env:DOWNLOAD_DIR $env:FILE_NAME; try { Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing; exit 0 } catch { Write-Host ('Download failed: '+$_.Exception.Message); exit 1 }"
if errorlevel 1 (
  echo Check your internet connection and the exact filename in GitHub.
  pause
  goto menu
)
notepad.exe "%DOWNLOAD_DIR%\%FILE_NAME%"
goto menu
