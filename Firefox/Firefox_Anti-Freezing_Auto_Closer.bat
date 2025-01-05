@echo off
REM Set the monitoring interval in seconds (adjustable)
set interval=15

:check_firefox
REM Use tasklist to check if Firefox is not responding
tasklist /FI "IMAGENAME eq firefox.exe" /FI "STATUS eq Not Responding" | find /I "firefox.exe" >nul
if errorlevel 1 (
    echo Firefox is running normally or not running at all.
    timeout /t %interval% >nul
    goto check_firefox
) else (
    echo Firefox is not responding. Closing all Firefox windows...
    REM Use taskkill to close all instances of Firefox
    taskkill /F /IM firefox.exe >nul
    echo All Firefox processes have been terminated.
)

REM Ask if the user wants to reopen Firefox
set /p choice="Do you want to reopen Firefox? (Y/N): "
if /I "%choice%"=="Y" (
    echo Reopening Firefox...
    start firefox
) else (
    echo Firefox will remain closed.
)

REM Wait and check again
timeout /t %interval% >nul
goto check_firefox
