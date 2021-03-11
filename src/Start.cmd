@echo off

if "%PROCESSOR_ARCHITECTURE%" equ "x86" set "Arch=x86"
if "%PROCESSOR_ARCHITECTURE%" equ "AMD64" set "Arch=x64"

@start /b "Revision - TrustedInstaller" "%~dp0bin\%Arch%\NSudo.exe" -U:T -P:E "%~dp0bin\ReviOS_DWM_Tool.cmd"