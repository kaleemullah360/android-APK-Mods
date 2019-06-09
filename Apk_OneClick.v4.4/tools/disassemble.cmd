@echo off
color 0a
cd /d "%~dp0"
java -version >nul 2>&1||echo Error: Java is not found&&echo Please install JRE first &&echo.&&echo Existing..&&pause&&exit

SET APK=%1
SET OUT=%~dpn1-disasm

:: 	Disassemble APK and Decode Resources
cd /d .\apktool
if exist "%OUT%\." rd /s /q "%OUT%"
if exist "%USERPROFILE%\apktool\framework\1.apk" del /f "%USERPROFILE%\apktool\framework\1.apk"
java -Xmx1024m -jar apktool.jar d --keep-broken-res %APK% -o "%OUT%"
if errorlevel 1 echo. &echo An error has occured. &echo. &echo Existing... &pause &exit
