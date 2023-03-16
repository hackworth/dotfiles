Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# Configuring Oh-my-posh Terminal
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/spaceship.omp.json" | Invoke-Expression

# Importing Terminal-Icons Module
Import-Module Terminal-Icons

# Importing Z Module
Import-Module Z

# Importing Fuzzy finder tool
Import-Module PSFzf

# Configuring Fuzzy Finder
Set-PSReadLineOption -PredictionSource History
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSreadLineChordReverseHistory 'Ctrl+r'
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Setting Alias's
Set-Alias vim nvim
Set-Alias g git
Set-Alias grep Find-String

$env:EDITOR = "nvim"
