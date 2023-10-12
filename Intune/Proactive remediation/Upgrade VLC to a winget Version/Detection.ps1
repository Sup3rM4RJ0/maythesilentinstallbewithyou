$Winget = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64*\winget.exe"

# Execute the "winget show" command for videolan.vlc and capture the output
try {
    $result = &$winget upgrade --accept-source-agreements
    # Display the output (optional)
    Write-Output $result

    # Use regex pattern to extract the version information
    $version_line = $result | Select-String -Pattern '<\s*(\d+\.\d+\.\d+\.\d+)'

if ($version_line) {
    $version = $version_line.Matches.Groups[1].Value
    Write-Host "Version of VideoLAN.VLC: $version or less" -ForegroundColor Yellow

    # Now you can perform actions based on the version
     if ($version -lt "3.0.17.5") {
         Write-Warning "This version is outdated and not compatible with winget - so lets uninstall / reinstall."
         # So lets uninstall it directly
         # Define the path to the VLC Player executable
         $vlcPath = "C:\Program Files\VideoLAN\VLC\uninstall.exe"
         Start-Process -FilePath $vlcPath -ArgumentList "/S" -Wait
         
         Exit 1
     }
    
} else {
    Write-Host "VLC is not installed or the Version is higher than 3.0.17.4" -ForegroundColor Green
    Exit 0
}

}
catch {
    # Handle any errors that may occur
    Write-Warning "Error occurred: $_"
    $result = $_.Exception.Message
}
