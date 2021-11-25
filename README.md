# Revision's DWM tool
A simple batch tool to disable/enable DWM on Windows 8.1 and 10. Feel free to contribute.

## Disclaimer
We/I do not take any responsibility for any damage caused through use of the tool

## Features
* Revert script for 8.1 and 10
* Fixes for Explorer bugs
* Classic UI

## Chromium & Electron apps black screen workaround
A potential workaround would be to run browsers or programs in *Compatibility* mode for *Windows 7* and/or add these parameters to programs shortcut:

`--disable-dwm-composition --disable-gpu-compositing`
or just
`--disable-gpu`

## What you should expect
* Lock screen will be black on Windows 10, so don't use any password. If you still want to use password, you must rely on your muscle memory. Sadly, we can't do anything.
* Download pop-up might be interferencing on newer Windows 10 versions (2004+)
* **Open With** may not work
* Opening the Wi-Fi icon works fine, but it doesn't close, however it should close after restarting **explorer.exe**
* Might increase/decrease performance, depends on a game engine and operating system
* Of course, UWP apps will stop working
* Graphics control panels will stop working on **DHC** drivers, so use **WHQL** drivers instead

## License
Revision's DWM Tool is licensed under GNU General Public License v3.0.
The tool also contains [NSudo](https://github.com/M2Team/NSudo/), which is licensed under The MIT License (MIT).