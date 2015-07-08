@echo off
c:\lazarus\fpc\2.2.4\bin\i386-win32\windres.exe --include c:/lazarus/fpc/222A9D~1.4/bin/I386-W~1/ -O res -o G:\pruebas\dliquidaciones\liquidaciones.res G:/pruebas/dliquidaciones/liquidaciones.rc --preprocessor=c:\lazarus\fpc\2.2.4\bin\i386-win32\cpp.exe
if errorlevel 1 goto linkend
SET THEFILE=G:\pruebas\dliquidaciones\liquidaciones.exe
echo Linking %THEFILE%
c:\lazarus\fpc\2.2.4\bin\i386-win32\ld.exe -b pe-i386 -m i386pe  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o G:\pruebas\dliquidaciones\liquidaciones.exe G:\pruebas\dliquidaciones\link.res
if errorlevel 1 goto linkend
c:\lazarus\fpc\2.2.4\bin\i386-win32\postw32.exe --subsystem gui --input G:\pruebas\dliquidaciones\liquidaciones.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
