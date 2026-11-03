# Configuring Oh-my-posh Terminal
oh-my-posh init pwsh --config "$HOME/Documents/PowerShell/spaceship.omp.json" | Invoke-Expression

# PSReadLine options
Set-PSReadLineOption -PredictionSource History -ErrorAction SilentlyContinue
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Setting Alias's
Set-Alias vim nvim
Set-Alias g git

$env:EDITOR = "nvim"
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Terminal-Icons and PSFzf are slow to import (~1s combined), so load them
# once the shell is idle at the first prompt instead of blocking startup.
$null = Register-EngineEvent -SourceIdentifier PowerShell.OnIdle -MaxTriggerCount 1 -Action {
    Import-Module Terminal-Icons -Global
    Import-Module PSFzf -Global
    Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'
}
