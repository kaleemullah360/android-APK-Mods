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

reg delete "HKCR\.apk\DefaultIcon" /f
reg delete "HKCR\.apk\shell\decompile" /f
reg delete "HKCR\.apk\shell\disassemble" /f
reg delete "HKCR\.apk\shell\install" /f
reg delete "HKCR\.apk\shell\renameapk" /f
reg delete "HKCR\folder\shell\recompile" /f

:: remove entries left from old versions
reg delete "HKCR\jarfile\shell\decompile" /f >nul 2>&1

pause
