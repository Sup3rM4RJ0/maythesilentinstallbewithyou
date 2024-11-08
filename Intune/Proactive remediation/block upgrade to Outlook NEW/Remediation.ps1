# Define registry path and value
$registryPath = "HKCU:\Software\Policies\Microsoft\office\16.0\outlook\preferences"
$valueName = "NewOutlookMigrationUserSetting"
$valueData = 0

# Check if the registry path exists, if not, create it
if (!(Test-Path $registryPath)) {
    Write-Output "Registry path does not exist. Creating path: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
} else {
    Write-Output "Registry path already exists: $registryPath"
}

# Set the DWORD value to 0
Write-Output "Setting $valueName to $valueData in $registryPath"
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Output "Registry key and value have been set successfully."
