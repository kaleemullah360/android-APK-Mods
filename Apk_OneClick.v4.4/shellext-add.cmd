@echo off
color 0a

:: relaunch self elevated
ver|find /i "XP">nul||whoami /all|find "S-1-16-12288">nul
IF %ERRORLEVEL% NEQ 0 (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
)

java -version >nul 2>&1||echo Error: Java is not found&&echo Please install JRE first &&echo.&&echo Existing..&&pause&&exit

:: remove menu handlers installed by other apps
reg add "HKCR\.apk" /f /ve /t REG_SZ /d ""
reg delete "HKCU\Software\Classes\.apk" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.apk" /f >nul 2>&1

reg add "HKCR\.apk\DefaultIcon" /f /ve /t REG_SZ /d "%~dp0tools\apk.ico"
reg add "HKCR\.apk\shell\decompile" /f /ve /t REG_SZ /d "Browse Java Code of APK"
reg add "HKCR\.apk\shell\decompile\command" /f /ve /t REG_SZ /d "\"%~dp0tools\decompile.cmd\" \"%%1\""
reg add "HKCR\.apk\shell\disassemble" /f /ve /t REG_SZ /d "Disassemble APK and Decode Resources"
reg add "HKCR\.apk\shell\disassemble\command" /f /ve /t REG_SZ /d "\"%~dp0tools\disassemble.cmd\" \"%%1\""
reg add "HKCR\.apk\shell\install" /f /ve /t REG_SZ /d "Install APK to Phone"
reg add "HKCR\.apk\shell\install\command" /f /ve /t REG_SZ /d "\"%~dp0tools\install.cmd\" \"%%1\""
reg add "HKCR\.apk\shell\renameapk" /f /ve /t REG_SZ /d "Rename APK"
reg add "HKCR\.apk\shell\renameapk\command" /f /ve /t REG_SZ /d "\"%~dp0tools\renameapk-min.cmd\" \"%%1\""
reg add "HKCR\folder\shell\recompile" /f /ve /t REG_SZ /d "Recompile APK from Disassembly"
reg add "HKCR\folder\shell\recompile\command" /f /ve /t REG_SZ /d "\"%~dp0tools\buildapk.cmd\" \"%%1\""

:: remove entries left from old versions
reg delete "HKCR\jarfile\shell\decompile" /f >nul 2>&1

pause
