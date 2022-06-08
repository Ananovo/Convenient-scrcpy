@echo off
for /f "tokens=9" %%i in ('adb shell ip route') do set ip=%%i
adb tcpip 5555
adb connect %ip%:5555