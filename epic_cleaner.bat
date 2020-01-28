@echo off
SETLOCAL EnableExtensions
set EXE=EpicGamesLauncher.exe
echo "Epic Games Launcher Fixer"
echo "Continuing will kill Epic Games Launcher if running and remove your epic launcher webcache."
pause

FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
echo Epic Launcher not running, proceeding with fix
goto FIX

:FOUND
echo Epic Launcher Running, killing process to proceed with fix
taskkill /F /T /IM EpicGamesLauncher.exe
echo "waiting 5 seconds while EpicGamesLauncher is closed."
timeout 5

:FIX
rd /S /Q %UserProfile%\AppData\Local\EpicGamesLauncher\Saved\webcache
echo "Now give the epic games launcher a launch.  Press any key to close."
pause