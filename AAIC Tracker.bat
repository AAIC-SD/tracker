@echo off
title AAIC Inspection Tracker
echo Starting AAIC Inspection Tracker...
echo.
echo Do NOT close this window while using the tracker.
echo.

cd /d "%~dp0"

:: Try Python 3 first, then Python
where python >nul 2>nul
if %errorlevel%==0 (
    start "" "http://localhost:8080/inspection-tracker.html"
    python -m http.server 8080
    goto :end
)

where python3 >nul 2>nul
if %errorlevel%==0 (
    start "" "http://localhost:8080/inspection-tracker.html"
    python3 -m http.server 8080
    goto :end
)

where py >nul 2>nul
if %errorlevel%==0 (
    start "" "http://localhost:8080/inspection-tracker.html"
    py -m http.server 8080
    goto :end
)

echo.
echo ERROR: Python is not installed on this computer.
echo.
echo Please install Python from https://www.python.org/downloads/
echo Make sure to check "Add Python to PATH" during installation.
echo.
pause

:end
