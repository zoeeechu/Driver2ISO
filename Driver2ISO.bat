@echo off 
CHCP 65001
TITLE Driver2ISO
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
color 0F
mode con: cols=95 lines=30
echo.
echo.
echo  ██████╗ ██████╗ ██╗██╗   ██╗███████╗██████╗ ██████╗ ██╗███████╗ ██████╗      ████████╗      
echo  ██╔══██╗██╔══██╗██║██║   ██║██╔════╝██╔══██╗╚════██╗██║██╔════╝██╔═══██╗   ████████ ███║
echo  ██║  ██║██████╔╝██║██║   ██║█████╗  ██████╔╝ █████╔╝██║███████╗██║   ██║   █████  █████║
echo  ██║  ██║██╔══██╗██║╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔═══╝ ██║╚════██║██║   ██║   ███ ████████║
echo  ██████╔╝██║  ██║██║ ╚████╔╝ ███████╗██║  ██║███████╗██║███████║╚██████╔╝    ╚████████╔╝
echo.
call :colorEcho 0E " taking Drivers and flashing them too Windows ISO's"
echo.
call :colorEcho 0E " make sure all drivers are unpacked in the drivers folder"
echo.
call :colorEcho 0E " make sure all Windows ISO source files are in src"
echo.
call :colorEcho 0E " this script isnt perfect so proceed with caution "
echo.
echo.
call :colorEcho 0C " === MAKE SURE YOU RUN THIS SCRIPT WITH ADMIN PRIV ==="
echo.
echo.
pause


:NEXT
echo.
call :colorEcho 0E "======= Modifying Images ======="
echo.
echo.
dism /Mount-Wim /WimFile:c:\temp\src\sources\boot.wim /Index:1 /MountDir:c:\temp\mount
dism /Image:C:\temp\mount /Add-Package /PackagePath:c:\temp\hotfix
dism /Image:C:\temp\mount /Add-Driver /Driver:c:\temp\drivers /Recurse
dism /Unmount-Wim /MountDir:C:\temp\mount /Commit
dism /Mount-Wim /WimFile:c:\temp\src\sources\boot.wim /Index:2 /MountDir:c:\temp\mount
dism /Image:C:\temp\mount /Add-Package /PackagePath:c:\temp\hotfix
dism /Image:C:\temp\mount /Add-Driver /Driver:c:\temp\drivers /Recurse
echo.
echo.
call :colorEcho 0C "Open up the Windows Explorer and navigate to"
echo.
echo C ^> temp ^> mount ^> sources 
echo.
call :colorEcho 0C "There you sort the files by Date modified"
echo.
call :colorEcho 0C "Copy all modified files too"
echo.
echo C ^> temp ^> src ^> sources
echo.
echo.
:P2
SET /P AREYOUSURE=Ready to Continue? (Y)? 
IF /I "%AREYOUSURE%" == "Y" GOTO B
echo.
call :colorEcho 0C " INVALID ARGUMENT"
echo. 
GOTO P2

:B
dism /Unmount-Wim /MountDir:C:\temp\mount /commit
dism /Get-WimInfo /WimFile:c:\temp\src\sources\install.wim
dism /Mount-Wim /WimFile:c:\temp\src\sources\install.wim /Index:1 /MountDir:c:\temp\mount
dism /Image:C:\temp\mount /Add-Package /PackagePath:c:\temp\hotfix
dism /Image:C:\temp\mount /Add-Driver /Driver:c:\temp\drivers /Recurse
dism /Mount-Wim /WimFile:c:\temp\mount\windows\system32\recovery\winre.wim /Index:1 /MountDir:c:\temp\winremount
dism /Image:C:\temp\winremount /Add-Package /PackagePath:c:\temp\hotfix
dism /Image:C:\temp\winremount /Add-Driver /Driver:c:\temp\drivers /Recurse
dism /Unmount-Wim /MountDir:C:\temp\winremount /Commit
dism /Unmount-Wim /MountDir:C:\temp\mount /Commit
echo.
echo.
call :colorEcho 0E "======= Packing ISO ======="
echo.
echo.
oscdimg.exe -bC:\temp\src\efi\microsoft\boot\efisys.bin -u2 -udfver102 C:\temp\src\ C:\temp\Win7_image.iso
echo.
echo.
call :colorEcho 0E "Done!"
echo.
call :colorEcho DF "script made by zoe!"
echo.
echo.
echo.
pause

exit

:colorEcho
@echo off 
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i