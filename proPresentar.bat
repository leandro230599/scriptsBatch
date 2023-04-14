@echo off
tasklist /fi "ImageName eq msedge.exe" /fo csv 2>NUL | find /I "msedge.exe">NUL
if "%ERRORLEVEL%"=="0" ( GOTO CLOSEANDSTART) else ( GOTO START)
:AFTER
pause
exit

:CLOSEANDSTART
echo Programa ejecutandose, procediendo a cerrarlo...
taskkill /f /im msedge.exe
start msedge.exe
GOTO AFTER

:START
echo Programa apagado, abriendolo...
start msedge.exe
GOTO AFTER
