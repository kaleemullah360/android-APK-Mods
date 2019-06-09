@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
set apkname=
set apkver=
IF NOT "%~1"=="" (IF "%~2"=="" ("%~dp0\apktool\aapt" dump badging "%~1">nul
if ERRORLEVEL 1 (echo ERROR: Badly formatted apk (is it an apk?^)
pause
goto :eof)
for /f "tokens=1,2,5,6 usebackq delims=^'" %%i in (`""%~dp0\apktool\aapt^" dump badging "%~1"`) do (if "%%i"=="application: label=" (set apkname=%%j)
if "%%k"==" versionName=" (set apkver=%%l))
if "!apkname!"=="" (echo ERROR: Could not find name.
goto :eof)
if "!apkver!"=="" (echo ERROR: Could not find version.
goto :eof)
echo on
ren "%~dpnx1" "!apkname! v!apkver!.apk"
@echo off
echo Success: !apkname! v!apkver!.apk) else (goto domulti)) else (echo.
echo.  %~n0%
echo.  ==============
echo.
echo.  Rename apk files with the form ApkName_1.0.apk (e.g. showing
echo.  first the filename, then an underscore, than its version number^).
echo.
echo.  SYNTAX: %~n0 myfile.apk
echo.          %~n0 myfile.apk myfile2.apk [etc])
goto :eof
:domulti
call "%~dpnx0" "%~dpnx1"
shift /1
if not "%~1"=="" goto domulti
goto :eof
:setapkname
set apkname=