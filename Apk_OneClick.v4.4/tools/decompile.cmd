@echo off
color 0a
cd /d "%~dp0"
java -version >nul 2>&1||echo Error: Java is not found&&echo Please install JRE first &&echo.&&echo Existing..&&pause&&exit

SET APK=%1
SET OUT=%temp%\%~n1-dex2jar.jar

:: 	Browse Java Code of APK (Decompile)
if exist "%OUT%" del /f "%OUT%"
CALL "%~dp0\dex2jar\d2j-dex2jar.bat" -f -o "%OUT%" %APK%
if errorlevel 1 echo. &echo An error has occured. &echo. &echo Existing... &pause &exit
start .\jd-gui\jd-gui "%OUT%"
pause
:: ping localhost -n 3 >nul