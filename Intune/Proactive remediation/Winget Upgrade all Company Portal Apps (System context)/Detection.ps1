
$Winget = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64*\winget.exe"

# Execute the "winget upgrade" command and capture the output
try {
    $result = &$winget upgrade --accept-source-agreements
        #Display the output (optional)
        Write-Output $result

        # Use regex pattern to extract the number of available upgrades
        $pattern = '(\d+) upgrades available'
        $available_upgrades = $result | Select-String -Pattern $pattern

        if ($available_upgrades) {
            $num_upgrades = [int]$available_upgrades.Matches.Groups[1].Value
            Write-Host "Number of available winget updates: $num_upgrades" -ForegroundColor Red

            if ($num_upgrades -ge 3) {
                Write-Warning "Exiting with code 1, as there are 3 or more winget updates available."
                # 3 because of ignoring Teams and Office Updates (just as a number - not named)
                exit 1
            }
}

    Write-Host "No needed upgrades on top to teams and office available. Everything good"
    exit 0



}
catch {
    # Handle any errors that may occur
    Write-Warning "Error occurred: $_"
    $result = $_.Exception.Message
}


