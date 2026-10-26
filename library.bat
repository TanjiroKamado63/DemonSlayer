@echo off
setlocal EnableExtensions DisableDelayedExpansion
set "GITHUB_USER=TanjiroKamado63"
set "REPO=REPLACE_WITH_REPOSITORY_NAME"
set "BRANCH=main"
set "DOWNLOAD_DIR=%USERPROFILE%\Documents\R-Practical-Library"
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

:menu
cls
echo ========================================
echo           R PRACTICAL LIBRARY
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
set "filename="
if "%choice%"=="1" set "filename=01.FUNDAMENTAL OF R.txt"
if "%choice%"=="2" set "filename=Practical No. 02 - Graphs using R.txt"
if "%choice%"=="3" set "filename=Practical No. 03 - Diagrams using R.txt"
if "%choice%"=="4" set "filename=Practical No. 04 - Simple Linear Re.txt"
if "%choice%"=="5" set "filename=Practical No. 05 - Weighted Least.txt"
if "%choice%"=="6" set "filename=Practical No. 06 - Multiple Linear.txt"
if "%choice%"=="0" exit /b 0
if not defined filename (
  echo Invalid option. Try 0 to 6.
  pause
  goto menu
)
if "%REPO%"=="REPLACE_WITH_REPOSITORY_NAME" (
  echo.
  echo SETUP REQUIRED: Open library.bat in Notepad and replace
  echo REPLACE_WITH_REPOSITORY_NAME with your GitHub repository name.
  pause
  goto menu
)
set "url=https://raw.githubusercontent.com/%GITHUB_USER%/%REPO%/%BRANCH%/%filename%"
set "target=%DOWNLOAD_DIR%\%filename%"
echo.
echo Downloading: %filename%
REM Encode spaces in GitHub filenames.
setlocal EnableDelayedExpansion
set "encoded=!filename: =%%20!"
set "url=https://raw.githubusercontent.com/%GITHUB_USER%/%REPO%/%BRANCH%/!encoded!"
curl.exe --fail --location --show-error --output "!target!" "!url!"
if errorlevel 1 (
  echo.
  echo Download failed. Check repository name, branch, internet and filename.
  pause
  endlocal
  goto menu
)
notepad.exe "!target!"
endlocal
goto menu
