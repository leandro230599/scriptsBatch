@echo off
:loop
echo Script que ahorra el tener que abrir el administrador de tareas para finalizar el ProPresenter y volver a ejecutarlo
echo --------------------------------------------------------------------------------------------------------------------
tasklist /fi "ImageName eq ProPresenter.exe" /fo csv 2>NUL | find /I "ProPresenter.exe">NUL
if "%ERRORLEVEL%"=="0" ( GOTO CLOSEANDSTART) else ( GOTO START)
:AFTER
pause
cls
GOTO loop
exit

:CLOSEANDSTART
echo Programa ejecutandose, procediendo a cerrarlo...
taskkill /f /im ProPresenter.exe
echo Programa cerrado, procediendo a abrirlo
::Aqui se debe añadir la ruta del archivo exe del ProPresenter, no del acceso directo
start C:\"Program Files"\"Renewed Vision"\ProPresenter\ProPresenter.exe
GOTO AFTER

:START
echo Programa apagado, abriendolo...
::Aqui se debe añadir la ruta del archivo exe del ProPresenter, no del acceso directo
start C:\"Program Files"\"Renewed Vision"\ProPresenter\ProPresenter.exe
GOTO AFTER
