# dotfiles

Managed with [chezmoi](https://chezmoi.io). Each command below sets up a fresh
machine in one paste. You'll be asked once for your git email.

## macOS

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)" && brew install chezmoi && chezmoi init --apply hackworth
```

Installs Homebrew, then everything in `dot_Brewfile`, oh-my-zsh, spaceship and tpm.
Open a new terminal when it finishes.

## Linux (Debian/Ubuntu)

```sh
sudo apt-get update && sudo apt-get install -y curl git && sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply hackworth
```

Installs zsh, tmux, fzf, fd, ripgrep, zoxide, neovim and tree-sitter, and makes zsh
your login shell. Log out and back in when it finishes.

## Windows

In a regular (non-admin) PowerShell window:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force; irm get.scoop.sh | iex; scoop install git pwsh chezmoi; chezmoi init --apply hackworth
```

Installs Scoop packages, PowerShell modules and oh-my-posh, and sets
`XDG_CONFIG_HOME` so nvim shares `~/.config/nvim`. Open a new PowerShell 7 (`pwsh`)
window when it finishes. On Windows Server, which doesn't ship winget, expect a UAC
prompt to install it.

## After setup

- nvim and tmux install their plugins on first launch.
- The repo is cloned over HTTPS. Once 1Password's SSH agent is set up, switch to SSH
  so you can push:
  `chezmoi git -- remote set-url origin git@github.com:hackworth/dotfiles.git`

## Day to day

- Pull and apply changes: `chezmoi update`
- Save new Homebrew installs: `brew bundle dump --force --file=$(chezmoi source-path)/dot_Brewfile`
- Save nvim plugin updates: `chezmoi re-add ~/.config/nvim/lazy-lock.json`
