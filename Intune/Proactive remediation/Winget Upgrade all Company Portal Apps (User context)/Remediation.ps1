Start-Transcript -Path "C:\xxxxx\WingetUpgradeallmangedPortalApps_Usercontext.log" -Force -Append

#Just to register winget if the user was not logged on before: (not allowed in local system context!)
#Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe



$apps = @(
    "Mozilla.Firefox",
    "Microsoft.Edge",
    "Google.Chrome",
    "Apple.Safari",
    "PuTTY.PuTTY",
    "7Zip.7Zip",
    "9NTXR16HNW1T", # Power BI Desktop
    "XPDM1ZW6815MQM", # VLC media player
    "VideoLAN.VLC",
    "Foxit.FoxitReader",
    "TrackerSoftware.PDF-XChangeEditor",
    "Microsoft.VisioViewer",
    "Jabra.Direct",
    "Zoom.Zoom",
    "Notepad++.Notepad++",
    "Adobe.Acrobat.Reader.64-bit",
    "Adobe.Acrobat.Reader.32-bit",
    "DominikReichl.KeePass",
    "Microsoft.VCRedist.2015+.x64",
    "Dell.CommandUpdate",
    "9P7KNL5RWT25", #Sysinternals Suite
    "9PD11RQ8QC9K", #Dell Power Manager
    "Apple.iTunes",
    "WinSCP.WinSCP"
	
	
)

#Update first time the sources of the ms-store and winget
Winget source update

foreach ($app in $apps) {
    Write-Host "---------- Updating $app if neccecary ----------"
    Winget upgrade $app -h --force --accept-source-agreements --accept-package-agreements
    Write-Host "Exitcode for that package upgrade status:" "$LastExitCode"
	Write-Host "---------- Updating $app finished - jumping to next one ----------"
    Write-Host "`n"
    Write-Host "`n"
}
Write-Host "End of Updating all the Apps and writing now the right Exitcode: 0"
Exit 0
Stop-Transcript
