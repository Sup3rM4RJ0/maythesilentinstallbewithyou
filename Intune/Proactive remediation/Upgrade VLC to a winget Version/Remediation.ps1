Start-Transcript -Path "C:\ProgramData\CorpIT\Logs\AppList\VLC_WingetReinstallforWingetfeatures.log" -Force -Append

#Just to register winget if the user was not logged on before: (not allowed in local system context!)
#Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

# resolve and navigate to winget.exe
#$Winget = Get-ChildItem -Path (Join-Path -Path (Join-Path -Path "$env:ProgramFiles" -ChildPath "WindowsApps") -ChildPath "Microsoft.DesktopAppInstaller*_x64*\winget.exe")
$Winget = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64*\winget.exe"

$apps = @(
    "VideoLAN.VLC"
)

#Update first time the sources of the ms-store and winget
&$Winget source update

foreach ($app in $apps) {
    Write-Host "---------- Updating $app if neccecary ----------"
    &$Winget install $app -h --force --accept-source-agreements --accept-package-agreements
    Write-Host "Exitcode for that package upgrade status:" "$LastExitCode"
	Write-Host "---------- Updating $app finished - jumping to next one ----------"
    Write-Host "`n"
    Write-Host "`n"
}
Write-Host "End of Updating the App and writing now the right Exitcode: 0"
#Exit 0
Stop-Transcript
