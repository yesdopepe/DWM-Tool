@echo off
title Revision's DWM tool
setlocal EnabledelayedExpansion
::-------------------------------------------------------------------------------------------
:: Revision DWM Tool Menu
:: Website: https://www.revi.cc/
:: Maintainer: Dreammjow - https://github.com/dreammjow
:: License: GNU General Public License v3.0
:: Version: 2.0
::-------------------------------------------------------------------------------------------
for /f "tokens=2 delims==" %%i in ('wmic os get BuildNumber /value ^| find "="') do set "build=%%i"
if %build% gtr "19044" goto :Error
for /f "tokens=4*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do set os=%%i
goto :Warning

:Warning
echo.=============================================================
echo.		Revision DWM Tool Menu
echo.=============================================================
echo.
echo.	This tool is made for advanced users
echo.
echo.	We do not take any responsibility for any damage
echo.	caused through use of the tool
echo.
echo.	Press [1] to continue
echo.	Press [X] to quit
echo.
echo.=============================================================
choice /C:1X /N /M "Enter Your Choice: "
if errorlevel 2 goto :Quit
if errorlevel 1 goto :DisableEnable


:DisableEnable
cls
echo.=============================================================
echo.		Revision DWM Tool Menu
echo.=============================================================
echo.
echo.	[1]   Disable DWM
echo.
echo.	[2]   Enable DWM
echo.
echo.
echo.	[X]   Quit
echo.
echo.=============================================================
choice /C:12X /N /M "Enter Your Choice : "
if errorlevel 3 goto :Quit
if errorlevel 2 goto :EnableDWM
if errorlevel 1 goto :DisableDWM

:DisableDWM
if "%os%"=="10" ( goto :DisableDWM10 ) else ( goto :Error)
if "%os%"=="8.1" ( goto :DisableDWM81 ) else ( goto :Error)

:EnableDWM
if "%os%"=="10" ( goto :EnableDWM10 ) else ( goto :Error)
if "%os%"=="8.1" ( goto :EnableDWM81 ) else ( goto :Error)

:DisableDWM10
cls
:: Take Ownership
if exist %systemroot%\ImmersiveControlPanel takeown /F %systemroot%\ImmersiveControlPanel /R /A & icacls %systemroot%\ImmersiveControlPanel /grant Administrators:(F) /T
if exist %systemroot%\System32\UIRibbon.dll takeown /F %systemroot%\System32\UIRibbon.dll /A & icacls %systemroot%\System32\UIRibbon.dll /grant Administrators:(F)
if exist %systemroot%\System32\UIRibbonRes.dll takeown /F %systemroot%\System32\UIRibbonRes.dll /A & icacls %systemroot%\System32\UIRibbonRes.dll /grant Administrators:(F)
if exist %systemroot%\System32\dwm.exe takeown /F %systemroot%\System32\dwm.exe /A & icacls %systemroot%\System32\dwm.exe /grant Administrators:(F)
if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll takeown /F %systemroot%\System32\windows.immersiveshell.serviceprovider.dll /A & icacls %systemroot%\System32\windows.immersiveshell.serviceprovider.dll /grant Administrators:(F)
if exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy takeown /F %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy /R /A & icacls %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy /grant Administrators:(F) /T
taskkill /F /IM ApplicationFrameHost.exe
taskkill /F /IM RuntimeBroker.exe
taskkill /F /IM ShellExperienceHost.exe
taskkill /F /IM SystemSettings.exe
if not exist %systemroot%\ImmersiveControlPanel.old if exist %systemroot%\ImmersiveControlPanel ren %systemroot%\ImmersiveControlPanel ImmersiveControlPanel.old
if exist %systemroot%\ImmersiveControlPanel.old if exist %systemroot%\ImmersiveControlPanel rmdir /S /Q %systemroot%\ImmersiveControlPanel
if not exist %systemroot%\System32\UIRibbon.dll.old if exist %systemroot%\System32\UIRibbon.dll ren %systemroot%\System32\UIRibbon.dll UIRibbon.dll.old
if exist %systemroot%\System32\UIRibbon.dll.old if exist %systemroot%\System32\UIRibbon.dll del /q %systemroot%\System32\UIRibbon.dll
if not exist %systemroot%\System32\UIRibbonRes.dll.old if exist %systemroot%\System32\UIRibbonRes.dll ren %systemroot%\System32\UIRibbonRes.dll UIRibbonRes.dll.old
if exist %systemroot%\System32\UIRibbonRes.dll.old if exist %systemroot%\System32\UIRibbonRes.dll del /q %systemroot%\System32\UIRibbonRes.dll
if not exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll ren %systemroot%\System32\windows.immersiveshell.serviceprovider.dll windows.immersiveshell.serviceprovider.dll.old
if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll del /q %systemroot%\System32\windows.immersiveshell.serviceprovider.dll
if not exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old if exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy ren %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy ShellExperienceHost_cw5n1h2txyewy.old
if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy.old if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy rmdir /S /Q %systemroot%\ShellExperienceHost_cw5n1h2txyewy
:: Tweaks for classic UI
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" /v "ReplaceVan" /t REG_DWORD /d "2" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32TrayClockExperience" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f
:: Confuse Windows with a fake dwm.exe
if exist %systemroot%\System32\dwm.exe takeown /F %systemroot%\System32\dwm.exe /A & icacls %systemroot%\System32\dwm.exe /grant Administrators:(F)
if not exist %systemroot%\System32\dwm.exe.old if exist %systemroot%\System32\dwm.exe ren %systemroot%\System32\dwm.exe dwm.exe.old
if exist %systemroot%\System32\dwm.exe.old if exist %systemroot%\System32\dwm.exe del /q %systemroot%\System32\dwm.exe
echo N| copy/-Y "%systemroot%\System32\rundll32.exe" "%systemroot%\System32\dwm.exe"
cls
echo DWM has been disabled successfully. Once a black screen appears, spam the (Tab might be needed) Enter button on your keyboard for 2-5 times to access Windows %os%.
echo Recommended to install StartIsBack to avoid UWP System apps related issues.
pause
logoff
goto :EOF

:DisableDWM81
cls
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" | find "1"
cls
if [%errorlevel%] neq [0] echo Autologon is not enabled. & pause & echo Uncheck "Users must enter a user name and password to use this computer", press Apply and OK & echo Re-open the tool, if it closes itself & start /wait "" "%systemroot%\System32\control.exe" userpasswords2 & echo Press any key, once AutoLogon has been enabled & pause >nul
:: Take ownership
if exist %systemroot%\ImmersiveControlPanel takeown /F %systemroot%\ImmersiveControlPanel /R /A & icacls %systemroot%\ImmersiveControlPanel /grant Administrators:(F) /T
if exist %systemroot%\System32\dwm.exe takeown /F %systemroot%\System32\dwm.exe /A & icacls %systemroot%\System32\dwm.exe /grant Administrators:(F)
if exist %systemroot%\System32\UIRibbon.dll takeown /F %systemroot%\System32\UIRibbon.dll /A & icacls %systemroot%\System32\UIRibbon.dll /grant Administrators:(F)
if exist %systemroot%\System32\UIRibbonRes.dll takeown /F %systemroot%\System32\UIRibbonRes.dll /A & icacls %systemroot%\System32\UIRibbonRes.dll /grant Administrators:(F)
if exist %systemroot%\System32\Windows.UI.Search.dll takeown /F %systemroot%\System32\Windows.UI.Search.dll /A & icacls %systemroot%\System32\Windows.UI.Search.dll /grant Administrators:(F)
if exist %systemroot%\SystemResources takeown /F %systemroot%\SystemResources /R /A & icacls %systemroot%\SystemResources /grant Administrators:(F) /T
:: Backup original files and remove the rest if exists
if not exist %systemroot%\ImmersiveControlPanel.old if exist %systemroot%\ImmersiveControlPanel ren %systemroot%\ImmersiveControlPanel ImmersiveControlPanel.old
if exist %systemroot%\ImmersiveControlPanel.old if exist %systemroot%\ImmersiveControlPanel rmdir /S /Q %systemroot%\ImmersiveControlPanel
if not exist %systemroot%\System32\UIRibbon.dll.old if exist %systemroot%\System32\UIRibbon.dll ren %systemroot%\System32\UIRibbon.dll UIRibbon.dll.old
if exist %systemroot%\System32\UIRibbon.dll.old if exist %systemroot%\System32\UIRibbon.dll del /q %systemroot%\System32\UIRibbon.dll
if not exist %systemroot%\System32\UIRibbonRes.dll.old if exist %systemroot%\System32\UIRibbonRes.dll ren %systemroot%\System32\UIRibbonRes.dll UIRibbonRes.dll.old
if exist %systemroot%\System32\UIRibbonRes.dll.old if exist %systemroot%\System32\UIRibbonRes.dll del /q %systemroot%\System32\UIRibbonRes.dll
if not exist %systemroot%\System32\Windows.UI.Search.dll.old if exist %systemroot%\System32\Windows.UI.Search.dll ren %systemroot%\System32\Windows.UI.Search.dll Windows.UI.Search.dll.old
if exist %systemroot%\System32\Windows.UI.Search.dll.old if exist %systemroot%\System32\Windows.UI.Search.dll del /q %systemroot%\System32\Windows.UI.Search.dll
if not exist %systemroot%\SystemResources.old if exist %systemroot%\SystemResources ren %systemroot%\SystemResources SystemResources.old
if exist %systemroot%\SystemResources.old if exist %systemroot%\SystemResources rmdir /S /Q %systemroot%\SystemResources
:: Tweaks
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f
:: Confuse Windows with a fake dwm.exe
if exist %systemroot%\System32\dwm.exe takeown /F %systemroot%\System32\dwm.exe /A & icacls %systemroot%\System32\dwm.exe /grant Administrators:(F)
if not exist %systemroot%\System32\dwm.exe.old if exist %systemroot%\System32\dwm.exe ren %systemroot%\System32\dwm.exe dwm.exe.old
if exist %systemroot%\System32\dwm.exe.old if exist %systemroot%\System32\dwm.exe del /q %systemroot%\System32\dwm.exe
echo N| copy/-Y "%systemroot%\System32\rundll32.exe" "%systemroot%\System32\dwm.exe"
taskkill /F /IM dwm.exe
taskkill /F /IM explorer.exe
start "" "%systemroot%\explorer.exe"
goto :EOF

:EnableDWM10
:: Revert to original
if not exist %systemroot%\ImmersiveControlPanel if exist %systemroot%\ImmersiveControlPanel.old ren %systemroot%\ImmersiveControlPanel.old ImmersiveControlPanel
if exist %systemroot%\ImmersiveControlPanel if exist %systemroot%\ImmersiveControlPanel.old rmdir /S /Q %systemroot%\ImmersiveControlPanel.old
if not exist %systemroot%\System32\UIRibbon.dll if exist %systemroot%\System32\UIRibbon.dll.old ren %systemroot%\System32\UIRibbon.dll.old UIRibbon.dll
if exist %systemroot%\System32\UIRibbon.dll if exist %systemroot%\System32\UIRibbon.dll.old del /q %systemroot%\System32\UIRibbon.dll.old
if not exist %systemroot%\System32\UIRibbonRes.dll if exist %systemroot%\System32\UIRibbonRes.dll.old ren %systemroot%\System32\UIRibbonRes.dll.old UIRibbonRes.dll
if exist %systemroot%\System32\UIRibbonRes.dll if exist %systemroot%\System32\UIRibbonRes.dll.old del /q %systemroot%\System32\UIRibbonRes.dll.old
if not exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old ren %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old windows.immersiveshell.serviceprovider.dll
if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll if exist %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old del /q %systemroot%\System32\windows.immersiveshell.serviceprovider.dll.old
if not exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy if exist %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old ren %systemroot%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old ShellExperienceHost_cw5n1h2txyewy
if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy if exist %systemroot%\ShellExperienceHost_cw5n1h2txyewy.old rmdir /S /Q %systemroot%\ShellExperienceHost_cw5n1h2txyewy.old
:: Revert classic UI tweaks
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32TrayClockExperience" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" /v "ReplaceVan" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "2" /f
:: Revert DWM.exe changes
del %systemroot%\System32\dwm.exe
if exist %systemroot%\System32\dwm.exe.old takeown /F %systemroot%\System32\dwm.exe.old /A & icacls %systemroot%\System32\dwm.exe.old /grant Administrators:(F)
if not exist %systemroot%\System32\dwm.exe if exist %systemroot%\System32\dwm.exe.old ren %systemroot%\System32\dwm.exe.old dwm.exe
cls
echo DWM has enabled successfully. Once a black screen appears, spam the (Tab might be needed) Enter button on your keyboard for 2-5 times to access Windows %os%.
pause
logoff
goto :EOF

:EnableDWM81
if not exist %systemroot%\ImmersiveControlPanel if exist %systemroot%\ImmersiveControlPanel.old ren %systemroot%\ImmersiveControlPanel.old ImmersiveControlPanel
if exist %systemroot%\ImmersiveControlPanel if exist %systemroot%\ImmersiveControlPanel.old rmdir /S /Q %systemroot%\ImmersiveControlPanel.old
if not exist %systemroot%\System32\UIRibbon.dll if exist %systemroot%\System32\UIRibbon.dll.old ren %systemroot%\System32\UIRibbon.dll.old UIRibbon.dll
if exist %systemroot%\System32\UIRibbon.dll if exist %systemroot%\System32\UIRibbon.dll.old del /q %systemroot%\System32\UIRibbon.dll.old
if not exist %systemroot%\System32\UIRibbonRes.dll if exist %systemroot%\System32\UIRibbonRes.dll.old ren %systemroot%\System32\UIRibbonRes.dll.old UIRibbonRes.dll
if exist %systemroot%\System32\UIRibbonRes.dll if exist %systemroot%\System32\UIRibbonRes.dll.old del /q %systemroot%\System32\UIRibbonRes.dll.old
if not exist %systemroot%\System32\Windows.UI.Search.dll if exist %systemroot%\System32\Windows.UI.Search.dll.old ren %systemroot%\System32\Windows.UI.Search.dll.old Windows.UI.Search.dll
if exist %systemroot%\System32\Windows.UI.Search.dll if exist %systemroot%\System32\Windows.UI.Search.dll.old del /q %systemroot%\System32\Windows.UI.Search.dll.old
if not exist %systemroot%\SystemResources if exist %systemroot%\SystemResources.old ren %systemroot%\SystemResources.old SystemResources
if exist %systemroot%\SystemResources if exist %systemroot%\SystemResources.old rmdir /S /Q %systemroot%\SystemResources.old
if not exist %systemroot%\SystemResources if exist %systemroot%\SystemResources.old ren %systemroot%\SystemResources.old SystemResources
if exist %systemroot%\SystemResources if exist %systemroot%\SystemResources.old rmdir /S /Q %systemroot%\SystemResources.old
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "1" /f	
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "2" /f
del %systemroot%\System32\dwm.exe
if exist %systemroot%\System32\dwm.exe.old takeown /F %systemroot%\System32\dwm.exe.old /A & icacls %systemroot%\System32\dwm.exe.old /grant Administrators:(F)
if not exist %systemroot%\System32\dwm.exe if exist %systemroot%\System32\dwm.exe.old ren %systemroot%\System32\dwm.exe.old dwm.exe
logoff
goto :EOF

:Error
echo Your system isn't supported by the tool.
pause
goto :EOF

:EOF