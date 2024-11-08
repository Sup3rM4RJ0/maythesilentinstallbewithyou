# Define registry path and value
$registryPath = "HKCU:\Software\Policies\Microsoft\office\16.0\outlook\preferences"
$valueName = "NewOutlookMigrationUserSetting"

# Check if the registry path exists
if (Test-Path $registryPath) {
    # Check if the DWORD value exists and is set to 0
    $value = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue
    if ($value -ne $null -and $value.$valueName -eq 0) {
        # Registry key and value are set correctly, exit with code 0
        Write-Output "Registry key exists and NewOutlookMigrationUserSetting is set to 0."
        exit 0
    }
    else {
        # Value is not set to 0, exit with code 1
        Write-Output "Registry key exists but NewOutlookMigrationUserSetting is not set to 0."
        exit 1
    }
}
else {
    # Registry path does not exist, exit with code 1
    Write-Output "Registry path does not exist."
    exit 1
}
