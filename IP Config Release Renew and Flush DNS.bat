@echo off

:: Check if the script is running with administrative privileges
:: If not, it will re-run itself with elevated privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:begin
echo Releasing IP Address...
ipconfig /release

echo.
echo Renewing IP Address...
ipconfig /renew

echo.
echo Flushing DNS
ipconfig /flushdns

echo.

echo Resetting the Winsock catalog and TCP/IP settings
netsh winsock reset

echo.


:ask
set /p choice=Do you want to run the program again? (yes/no) or (y/n):

if /i "%choice%"=="yes" goto begin
if /i "%choice%"=="y" goto begin
if /i "%choice%"=="no" goto end
if /i "%choice%"=="n" goto end

echo Invalid choice. Please type (yes/no) or (y/n).
goto ask

:end
echo Program ended.