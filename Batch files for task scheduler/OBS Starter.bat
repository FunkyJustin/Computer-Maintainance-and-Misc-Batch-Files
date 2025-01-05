@echo off
:top

echo Starting OBS...
start /d "C:\Program Files\obs-studio\bin\64bit" obs64.exe --startrecording


echo.

set /p choice=Do you want to terminate and restart OBS again? (Y/N): 

if /I "%choice%"=="Y" goto top
echo Exiting...
pause
exit
