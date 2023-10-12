#
function CheckIfExists($Seek){
    $Exists = $false
    $Exists = Test-Path $Seek
    return $Exists
}


$Temp1 = Get-AppxPackage | where name -like "*DesktopAppInstaller*"

if ($Temp1) {
  Write-Host "The application is installed."
    Exit 0
} else {
    Write-Warning "The application is not installed."
    Exit 1
}