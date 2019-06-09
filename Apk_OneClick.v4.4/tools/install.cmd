@echo off
color 0a
cd /d "%~dp0"

SET APK=%1

:: 	Install APK to Phone
echo Starting to install "%~nx1" to phone
cd /d .\others
echo Waiting for device
adb wait-for-device
adb install -r %APK%
if errorlevel 1 echo. &echo An error has occured. &echo. &echo Existing... &pause &exit
rem adb kill-server
ping localhost -n 3 >nul 