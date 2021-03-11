@echo off
title Revision's DWM tool

::-------------------------------------------------------------------------------------------
:: Revision DWM Tool Menu
:: Website: https://www.revi.cc/
:: Maintainer: Dreammjow - https://github.com/dreammjow
:: License: GNU General Public License v3.0
:: Version: 1.0
::-------------------------------------------------------------------------------------------
goto :Warning

:Warning
echo.=============================================================
echo.
echo.	I am not responsible for any damage resulting, use it
echo.	at your own risk.
echo.		
echo.	This tool is made for advanced users.
echo.
echo.	Press [1] to continue
echo.	Press [X] to quit
echo.
echo.=============================================================
choice /C:12345678X /N /M "Enter Your Choice : "
if errorlevel 9 goto :Quit
if errorlevel 1 goto :MainMenu

:MainMenu
cls
echo.=============================================================
echo.		Revision DWM Tool Menu
echo.=============================================================
echo.
echo.	[1]   Windows 10
echo.
echo.	[2]   Windows 8
echo.
echo.	[X]   Quit
echo.
echo.=============================================================
choice /C:12345678X /N /M "Enter Your Choice : "
if errorlevel 9 goto :Quit
if errorlevel 2 goto :MainMenuW8
if errorlevel 1 goto :MainMenuW10

:MainMenuW10
cls
echo.=============================================================
echo.		Revision DWM Tool Menu - Windows 10
echo.=============================================================
echo.
echo.	[1]   Disable DWM
echo.
echo.	[2]   Enable DWM
echo.
echo.	[3]   Main menu
echo.
echo.	[X]   Quit
echo.
echo.=============================================================
choice /C:12345678X /N /M "Enter Your Choice : "
if errorlevel 9 goto :Quit
if errorlevel 3 goto :MainMenu
if errorlevel 2 goto :EnableDWMw10
if errorlevel 1 goto :DisableDWMw10

:DisableDWMw10
cls
::Take ownership
IF EXIST %windir%\ImmersiveControlPanel takeown /F %windir%\ImmersiveControlPanel /R /A & icacls %windir%\ImmersiveControlPanel /grant Administrators:(F) /T
IF EXIST %windir%\System32\dwm.exe takeown /F %windir%\System32\dwm.exe /A & icacls %windir%\System32\dwm.exe /grant Administrators:(F)
IF EXIST %windir%\System32\UIRibbon.dll takeown /F %windir%\System32\UIRibbon.dll /A & icacls %windir%\System32\UIRibbon.dll /grant Administrators:(F)
IF EXIST %windir%\System32\UIRibbonRes.dll takeown /F %windir%\System32\UIRibbonRes.dll /A & icacls %windir%\System32\UIRibbonRes.dll /grant Administrators:(F)
IF EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll takeown /F %windir%\System32\windows.immersiveshell.serviceprovider.dll /A & icacls %windir%\System32\windows.immersiveshell.serviceprovider.dll /grant Administrators:(F)
IF EXIST %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy takeown /F %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy /R /A & icacls %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy /grant Administrators:(F) /T
:: Backup and remove
taskkill /F /IM ShellExperienceHost.exe
taskkill /F /IM RuntimeBroker.exe
taskkill /F /IM ApplicationFrameHost.exe
taskkill /F /IM SystemSettings.exe
IF NOT EXIST %windir%\ImmersiveControlPanel.old IF EXIST %windir%\ImmersiveControlPanel REN %windir%\ImmersiveControlPanel ImmersiveControlPanel.old
IF EXIST %windir%\ImmersiveControlPanel.old IF EXIST %windir%\ImmersiveControlPanel RMDIR /S /Q %windir%\ImmersiveControlPanel
IF NOT EXIST %windir%\System32\UIRibbon.dll.old IF EXIST %windir%\System32\UIRibbon.dll REN %windir%\System32\UIRibbon.dll UIRibbon.dll.old
IF EXIST %windir%\System32\UIRibbon.dll.old IF EXIST %windir%\System32\UIRibbon.dll DEL /q %windir%\System32\UIRibbon.dll
IF NOT EXIST %windir%\System32\UIRibbonRes.dll.old IF EXIST %windir%\System32\UIRibbonRes.dll REN %windir%\System32\UIRibbonRes.dll UIRibbonRes.dll.old
IF EXIST %windir%\System32\UIRibbonRes.dll.old IF EXIST %windir%\System32\UIRibbonRes.dll DEL /q %windir%\System32\UIRibbonRes.dll
IF NOT EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll.old IF EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll REN %windir%\System32\windows.immersiveshell.serviceprovider.dll windows.immersiveshell.serviceprovider.dll.old
IF EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll.old IF EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll DEL /q %windir%\System32\windows.immersiveshell.serviceprovider.dll
IF NOT EXIST %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old IF EXIST %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy REN %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy ShellExperienceHost_cw5n1h2txyewy.old
IF EXIST %windir%\ShellExperienceHost_cw5n1h2txyewy.old IF EXIST %windir%\ShellExperienceHost_cw5n1h2txyewy RMDIR /S /Q %windir%\ShellExperienceHost_cw5n1h2txyewy
::Tweaks for classic UI
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32TrayClockExperience" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" /v "ReplaceVan" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d "0" /f
:: Confuse Windows with fake dwm.exe
IF EXIST %windir%\System32\dwm.exe takeown /F %windir%\System32\dwm.exe /A & icacls %windir%\System32\dwm.exe /grant Administrators:(F)
IF NOT EXIST %windir%\System32\dwm.exe.old IF EXIST %windir%\System32\dwm.exe REN %windir%\System32\dwm.exe dwm.exe.old
IF EXIST %windir%\System32\dwm.exe.old IF EXIST %windir%\System32\dwm.exe DEL /q %windir%\System32\dwm.exe
echo N| copy/-Y "%windir%\System32\rundll32.exe" "%windir%\System32\dwm.exe"
cls
echo DWM has disabled successfully. After you see a black screen, spam Enter button on your keyboard for 2-5 times to access OS.
echo Recommended to install StartIsBack to avoid UWP Syestem apps related issues.
pause
cls
echo I know you didn't read what I had written above
cls
echo DWM has disabled successfully. After you see a black screen, spam Enter button on your keyboard for 2-5 times to access OS.
echo Recommended to install StartIsBack to avoid UWP Syestem apps related issues.
pause
logoff
goto :eof

:EnableDWMw10
:: Revert to original
IF NOT EXIST %windir%\ImmersiveControlPanel IF EXIST %windir%\ImmersiveControlPanel.old REN %windir%\ImmersiveControlPanel.old ImmersiveControlPanel
IF EXIST %windir%\ImmersiveControlPanel IF EXIST %windir%\ImmersiveControlPanel.old RMDIR /S /Q %windir%\ImmersiveControlPanel.old
IF NOT EXIST %windir%\System32\UIRibbon.dll IF EXIST %windir%\System32\UIRibbon.dll.old REN %windir%\System32\UIRibbon.dll.old UIRibbon.dll
IF EXIST %windir%\System32\UIRibbon.dll IF EXIST %windir%\System32\UIRibbon.dll.old DEL /q %windir%\System32\UIRibbon.dll.old
IF NOT EXIST %windir%\System32\UIRibbonRes.dll IF EXIST %windir%\System32\UIRibbonRes.dll.old REN %windir%\System32\UIRibbonRes.dll.old UIRibbonRes.dll
IF EXIST %windir%\System32\UIRibbonRes.dll IF EXIST %windir%\System32\UIRibbonRes.dll.old DEL /q %windir%\System32\UIRibbonRes.dll.old
IF NOT EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll IF EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll.old REN %windir%\System32\windows.immersiveshell.serviceprovider.dll.old windows.immersiveshell.serviceprovider.dll
IF EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll IF EXIST %windir%\System32\windows.immersiveshell.serviceprovider.dll.old DEL /q %windir%\System32\windows.immersiveshell.serviceprovider.dll.old
IF NOT EXIST %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy IF EXIST %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old REN %windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy.old ShellExperienceHost_cw5n1h2txyewy
IF EXIST %windir%\ShellExperienceHost_cw5n1h2txyewy IF EXIST %windir%\ShellExperienceHost_cw5n1h2txyewy.old RMDIR /S /Q %windir%\ShellExperienceHost_cw5n1h2txyewy.old
:: Revert classic UI tweaks
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32TrayClockExperience" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f	
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Control Panel\Settings\Network" /v "ReplaceVan" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "2" /f
:: Revert DWM.exe changes
del %windir%\System32\dwm.exe
IF EXIST %windir%\System32\dwm.exe.old takeown /F %windir%\System32\dwm.exe.old /A & icacls %windir%\System32\dwm.exe.old /grant Administrators:(F)
IF NOT EXIST %windir%\System32\dwm.exe IF EXIST %windir%\System32\dwm.exe.old REN %windir%\System32\dwm.exe.old dwm.exe
cls
echo DWM Enabled successfully. After you see blackscreen spam Enter button on your keyboard for 2-5 times to access OS.
pause
logoff
goto :eof

:MainMenuW8
cls
echo.=============================================================
echo.		Revision DWM Tool Menu - Windows 8(.1)
echo.=============================================================
echo.
echo.	[1]   Disable DWM
echo.
echo.	[2]   Enable DWM (Currently not available)
echo.
echo.	[3]   Main menu
echo.
echo.	[X]   Quit
echo.
echo.=============================================================
choice /C:12345678X /N /M "Enter Your Choice : "
if errorlevel 9 goto :Quit
if errorlevel 3 goto :MainMenu
if errorlevel 2 goto :EnableDWMw8
if errorlevel 1 goto :DisableDWMw8

:DisableDWMw8
:: Check if autologon is enabled
echo Uncheck "Users must enter a user name and password to use this computer". After, press Apply and OK(x2).
echo Re-open the tool, if it closes itself.
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon | find "1"
IF [%errorlevel%] NEQ [0] ECHO Autologon is not enabled. & PAUSE & START /WAIT "" "%windir%\System32\control.exe" userpasswords2 & ECHO Press any key, once AutoLogon has been enabled & PAUSE >NUL & GOTO :checkautoadminlogon
:: Take ownership
IF EXIST %windir%\ImmersiveControlPanel takeown /F %windir%\ImmersiveControlPanel /R /A & icacls %windir%\ImmersiveControlPanel /grant Administrators:(F) /T
IF EXIST %windir%\System32\dwm.exe takeown /F %windir%\System32\dwm.exe /A & icacls %windir%\System32\dwm.exe /grant Administrators:(F)
IF EXIST %windir%\System32\UIRibbon.dll takeown /F %windir%\System32\UIRibbon.dll /A & icacls %windir%\System32\UIRibbon.dll /grant Administrators:(F)
IF EXIST %windir%\System32\UIRibbonRes.dll takeown /F %windir%\System32\UIRibbonRes.dll /A & icacls %windir%\System32\UIRibbonRes.dll /grant Administrators:(F)
IF EXIST %windir%\System32\Windows.UI.Search.dll takeown /F %windir%\System32\Windows.UI.Search.dll /A & icacls %windir%\System32\Windows.UI.Search.dll /grant Administrators:(F)
IF EXIST %windir%\SystemResources takeown /F %windir%\SystemResources /R /A & icacls %windir%\SystemResources /grant Administrators:(F) /T
:: Backup and remove
IF NOT EXIST %windir%\ImmersiveControlPanel.old IF EXIST %windir%\ImmersiveControlPanel REN %windir%\ImmersiveControlPanel ImmersiveControlPanel.old
IF EXIST %windir%\ImmersiveControlPanel.old IF EXIST %windir%\ImmersiveControlPanel RMDIR /S /Q %windir%\ImmersiveControlPanel
IF NOT EXIST %windir%\System32\UIRibbon.dll.old IF EXIST %windir%\System32\UIRibbon.dll REN %windir%\System32\UIRibbon.dll UIRibbon.dll.old
IF EXIST %windir%\System32\UIRibbon.dll.old IF EXIST %windir%\System32\UIRibbon.dll DEL /q %windir%\System32\UIRibbon.dll
IF NOT EXIST %windir%\System32\UIRibbonRes.dll.old IF EXIST %windir%\System32\UIRibbonRes.dll REN %windir%\System32\UIRibbonRes.dll UIRibbonRes.dll.old
IF EXIST %windir%\System32\UIRibbonRes.dll.old IF EXIST %windir%\System32\UIRibbonRes.dll DEL /q %windir%\System32\UIRibbonRes.dll
IF NOT EXIST %windir%\System32\Windows.UI.Search.dll.old IF EXIST %windir%\System32\Windows.UI.Search.dll REN %windir%\System32\Windows.UI.Search.dll Windows.UI.Search.dll.old
IF EXIST %windir%\System32\Windows.UI.Search.dll.old IF EXIST %windir%\System32\Windows.UI.Search.dll DEL /q %windir%\System32\Windows.UI.Search.dll
IF NOT EXIST %windir%\SystemResources.old IF EXIST %windir%\SystemResources REN %windir%\SystemResources SystemResources.old
IF EXIST %windir%\SystemResources.old IF EXIST %windir%\SystemResources RMDIR /S /Q %windir%\SystemResources
:: Tweaks
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "ConsoleMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\TestHooks" /v "XamlCredUIAvailable" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /t REG_DWORD /d "0" /f	
:: Confuse Windows with fake dwm.exe
IF EXIST %windir%\System32\dwm.exe takeown /F %windir%\System32\dwm.exe /A & icacls %windir%\System32\dwm.exe /grant Administrators:(F)
IF NOT EXIST %windir%\System32\dwm.exe.old IF EXIST %windir%\System32\dwm.exe REN %windir%\System32\dwm.exe dwm.exe.old
IF EXIST %windir%\System32\dwm.exe.old IF EXIST %windir%\System32\dwm.exe DEL /q %windir%\System32\dwm.exe
echo N| copy/-Y "%windir%\System32\rundll32.exe" "%windir%\System32\dwm.exe"
pause
exit