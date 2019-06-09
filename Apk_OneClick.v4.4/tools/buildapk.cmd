@echo off
color 0a
cd /d "%~dp0"
java -version >nul 2>&1||echo Error: Java is not found&&echo Please install JRE first &&echo.&&echo Existing..&&pause&&exit

SET FOLDER=%1
SET APKOUT=%FOLDER:~1,-1%.apk
SET SIGNED=%APKOUT:~0,-4%-signed.apk
SET ALIGNED=%SIGNED:~0,-4%-aligned.apk

call :clearall

:: 	Build APK from Disassembly
cd /d .\apktool
java -Xmx1024m -jar apktool.jar b %FOLDER% -o "%APKOUT%"
if errorlevel 1 goto err

:: 	Optimize png images
cd /d "%~dp0others"
SET EXTR=%~dp1$extracted_%~nx1
SET TEMP=%~dp1$res_%~nx1
md "%EXTR%"
md "%TEMP%"
7za x -o"%EXTR%" "%APKOUT%" -y
xcopy /sy "%EXTR%\res\*.9.png" "%TEMP%"
roptipng "%EXTR%\**\*.png"
xcopy /sy "%TEMP%" "%EXTR%\res"
del /f "%APKOUT%"
7za a -tzip "%APKOUT%" "%EXTR%\*" -mx9
rd /s /q "%EXTR%"
rd /s /q "%TEMP%"

:: 	Sign APK
echo Signing "%~nx1.apk"
cd /d "%~dp0others"
::java -Xmx1024m -jar signapk.jar -w testkey.x509.pem testkey.pk8 "%APKOUT%" "%SIGNED%"
java -Xmx4096m -jar signapk.jar -w testkey.x509.pem testkey.pk8 "%APKOUT%" "%SIGNED%"

if errorlevel 1 goto err

:: 	Zipalign APK
echo Zipaligning "%~nx1.apk"
zipalign -f 4 "%SIGNED%" "%ALIGNED%"
if errorlevel 1 goto err

::  finalize
call :clearleft
ren "%ALIGNED%" "%~nx1.apk"
goto :EOF

:err
call :clearall
echo. &echo An error has occured. &echo. &echo Existing... &pause &exit

:clearall
if exist "%ALIGNED%" del /f "%ALIGNED%"

:clearleft
if exist "%APKOUT%" del /f "%APKOUT%"
if exist "%SIGNED%" del /f "%SIGNED%"
if exist "%USERPROFILE%\apktool\framework\1.apk" del /f "%USERPROFILE%\apktool\framework\1.apk"
