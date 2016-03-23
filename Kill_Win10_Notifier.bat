
if exist "%systemdrive%\Windows\System32\GWX\GWX.exe" (
echo Task Killing GWX processess > %temp%\kill_win10_notifier.log
taskkill /im gwx.exe /f
taskkill /im gwxconfigmanager.exe /f
taskkill /im gwxdetector.exe /f
taskkill /im gwxux.exe /f
taskkill /im gwxuxworker.exe /f

echo Taking ownership of files >> %temp%\kill_win10_notifier.log
takeown /d /f "%systemdrive%\Windows\System32\GWX" /r

echo Granting full control of files >> %temp%\kill_win10_notifier.log
icacls.exe "%systemdrive%\Windows\System32\GWX" /grant SYSTEM:F
icacls.exe "%systemdrive%\Windows\System32\GWX" /grant SYSTEM:R

echo Removing folder attributes >> %temp%\kill_win10_notifier.log
attrib -h -s "%systemdrive%\Windows\System32\GWX"

echo Moving folder >> %temp%\kill_win10_notifier.log
move /y "%systemdrive%\Windows\System32\GWX" "GWX.org"
)
