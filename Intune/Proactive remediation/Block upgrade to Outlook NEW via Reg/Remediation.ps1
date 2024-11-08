# Define registry path and value
$registryPath = "HKCU:\Software\Policies\Microsoft\office\16.0\outlook\preferences"
$valueName = "NewOutlookMigrationUserSetting"
$valueData = 0

# Create the registry path and set the DWORD value to 0
Write-Output "Creating registry path and setting $valueName to $valueData in $registryPath"
New-Item -Path $registryPath -Force | Out-Null
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Output "Registry key and value have been set successfully."
