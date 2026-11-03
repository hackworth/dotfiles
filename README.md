# dotfiles

## Bootstrap

`chezmoi init --apply --verbose git@github.com:hackworth/dotfiles.git`

On macOS/Linux, oh-my-zsh, the spaceship prompt and tpm are cloned automatically
via `.chezmoiexternal.toml.tmpl`. Run `prefix + I` in tmux to install tmux plugins.
On macOS, Homebrew packages in `dot_Brewfile` are installed on apply; refresh it with
`brew bundle dump --force --file=$(chezmoi source-path)/dot_Brewfile`.

On Windows, install Scoop first (`irm get.scoop.sh | iex`); packages and PowerShell
modules are installed by `run_onchange_install-packages.ps1.tmpl`, and
`XDG_CONFIG_HOME` is set to `~\.config` so nvim shares `dot_config/nvim` (open a
new terminal after the first apply).
https://scriptingchris.tech/posts/how-i-setup-my-powershell-development-environment/

## Update

`chezmoi update --verbose`
