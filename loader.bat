@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:
:start
cls
@echo off
title Pandora Loader 1.0a
goto Menu

:Menu
echo Hello %username%!
echo Select what you want
echo Please, do not select higher numbers than displayed, the loader might act weird!
echo [1] Pandora 2022
echo [2] Pandora 2023
echo [3] exit
set /p car=
if %car% == 1 goto 2022
if %car% == 2 goto 2023
if %car% == 3 goto close

:2022
cls
taskkill /f /im steam.exe
cls
echo Injecting Pandora 2022
echo /
echo [WARNING] Steam will be closed, start it and log in, then press enter.
pause
cls
%CD%\Resources\steammodule\kirin.exe
cls
echo [WARNING] Since there are multiple games in one app id, you need to start CS:GO manually, sorry!
echo /
echo [WARNING] Press enter after starting the game.
echo /
echo [WARNING] There should be a windows in steam with "SUCCESS" text, press ok on that window.
pause
cls
%CD%\Resources\pandora2022\kirin.exe
exit

:2023
cls
taskkill /f /im steam.exe
cls
echo Injecting Pandora 2023
echo /
echo [WARNING] Steam will be closed, start it and log in, then press enter.
pause
cls
%CD%\Resources\steammodule\kirin.exe
cls
echo [WARNING] Since there are multiple games in one app id, you need to start CS:GO manually, sorry!
echo /
echo [WARNING] Press enter after starting the game.
echo /
echo [WARNING] There should be a windows in steam with "SUCCESS" text, press ok on that window.
pause
cls
%CD%\Resources\pandora2023\kirin.exe
exit


:close
cls
echo See you next time!
ping -n 3 localhost >nul
exit