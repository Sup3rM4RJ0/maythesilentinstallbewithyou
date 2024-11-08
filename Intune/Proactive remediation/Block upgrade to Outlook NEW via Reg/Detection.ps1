# Define registry path and value
$registryPath = "HKCU:\Software\Policies\Microsoft\office\16.0\outlook\preferences"
$valueName = "NewOutlookMigrationUserSetting"

# Check if the registry path exists
if (Test-Path $registryPath) {
    # Check if the DWORD value exists
    $value = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue
    if ($value -ne $null) {
        # Check if the value is set to 0
        if ($value.$valueName -eq 0) {
            Write-Output "Registry key and DWORD exist, and NewOutlookMigrationUserSetting is set to 0."
            exit 0
        }
        else {
            Write-Output "Registry key and DWORD exist, but NewOutlookMigrationUserSetting is not set to 0."
            exit 1
        }
    }
    else {
        # DWORD does not exist
        Write-Output "Registry key exists, but the DWORD NewOutlookMigrationUserSetting does not exist."
        exit 1
    }
}
else {
    # Registry path does not exist
    Write-Output "Registry path does not exist."
    exit 1
}
