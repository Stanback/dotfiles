# Dotfiles

Clean, modular zsh configuration using Oh My Zsh and Powerlevel10k.

## Philosophy

- **Squashed, not mirrored**: Oh My Zsh core is installed locally, not tracked in this repo
- **Modular custom config**: Only your custom zsh modules are tracked in `zsh/`
- **Secrets never committed**: API keys, tokens, and machine-specific configs are gitignored
- **Portable**: Bootstrap script sets up everything on a fresh machine
- **Centralized**: All shell, SSH, and Git configs in one repo

## Structure

```
dotfiles/
├── zsh/                            # All zsh configuration
│   ├── .zshrc                      # Main zsh config
│   ├── .zprofile                   # Login shell config
│   ├── README.md                   # Setup instructions
│   ├── aliases.zsh                 # Docker, k8s, git aliases (tracked)
│   ├── functions.zsh               # Kubernetes helper functions (tracked)
│   ├── env.tools.zsh               # Dev tool configs: fnm, pyenv, etc. (tracked)
│   ├── env.paths.zsh               # PATH modifications (tracked)
│   ├── env.cloud.zsh               # GCP, redis shortcuts (tracked)
│   ├── ssh.zsh                     # SSH connection aliases (tracked)
│   ├── macos.zsh                   # macOS-specific terminal integration (tracked)
│   ├── secrets.zsh.example         # Template for API keys
│   ├── local.zsh.example           # Template for machine-specific config
│   ├── secrets.zsh                 # Your API keys/tokens (gitignored)
│   └── local.zsh                   # Machine-specific overrides (gitignored)
├── ssh/                            # SSH configuration
│   ├── config                      # Main SSH config (tracked)
│   ├── config.local.example        # Template for machine-specific SSH
│   ├── config.local                # Machine-specific SSH hosts (gitignored)
│   └── README.md
├── git/                            # Git configuration
│   ├── .gitconfig                  # Main git config with aliases (tracked)
│   ├── .gitconfig.local.example    # Template for user info
│   ├── .gitconfig.local            # Your name/email/keys (gitignored)
│   └── README.md
├── p10k/
│   └── .p10k.zsh                   # Powerlevel10k theme config (Rose Pine colors)
├── config/                         # Everything that lives in ~/.config/
│   ├── ghostty/
│   │   └── config                  # Ghostty terminal config
│   └── nvim/lua/plugins/
│       └── rose-pine.lua           # Rose Pine theme for Neovim
├── scripts/
│   └── bootstrap                   # Installation script
└── Brewfile                        # Homebrew package dependencies
```

## Quick Start

### Fresh Machine Setup

```bash
# Clone the repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# Run bootstrap (installs OMZ, creates backups, links configs)
~/dotfiles/scripts/bootstrap

# Fill in your secrets and local configs
vi ~/dotfiles/zsh/secrets.zsh
vi ~/.gitconfig.local
vi ~/.ssh/config.local  # optional

# Start new shell
exec zsh
```

### Existing Machine Migration

If you already have zsh configs:

```bash
# Bootstrap will automatically back up existing files with timestamps
# e.g., ~/.zshrc.20231016-143022.bak
~/dotfiles/scripts/bootstrap
```

## What Gets Tracked vs Not

### In this repo:
- Your `.zshrc` (slim loader)
- Your `.zprofile`
- Your custom zsh modules (`zsh/.oh-my-zsh/custom/`)
- Your p10k theme config (with Rose Pine colors)
- Your Ghostty terminal config
- Your Neovim plugin configs (`config/.config/nvim/lua/plugins/`)
- Brewfile (Homebrew package list)
- Secrets template (example only)

### Not in this repo:
- Oh My Zsh core (installed at `~/.oh-my-zsh` by bootstrap)
- Powerlevel10k theme (cloned to `~/powerlevel10k` by bootstrap)
- LazyVim (installed at `~/.config/nvim` by bootstrap, `.git` removed)
- Actual secrets (`~/.config/shell/secrets.zsh`)
- Machine-specific config (`local.zsh`)

## Configuration Details

### How ZSH_CUSTOM Works

The `.zshrc` sets `ZSH_CUSTOM="$HOME/dotfiles/zsh"`, which tells Oh My Zsh to automatically source all `.zsh` files in that directory. Your custom modules live directly in the repo without a nested `custom/` directory.

### Secrets Management

`~/dotfiles/zsh/secrets.zsh` (gitignored):
- Created from `secrets.zsh.example` during bootstrap
- Stores all API keys, tokens, and sensitive data
- Auto-sourced by Oh My Zsh (no manual sourcing needed)

### Local Machine Overrides

`~/dotfiles/zsh/local.zsh` (gitignored):
- Created from `local.zsh.example`
- Machine-specific config (work vs personal, experimental aliases, etc.)
- Auto-sourced by Oh My Zsh

### SSH Configuration

`~/.ssh/config` is symlinked to `~/dotfiles/ssh/config`:
- Main config is tracked in git
- Machine-specific hosts go in `~/.ssh/config.local` (gitignored)
- Uses `Include` directive to load local config

### Git Configuration

`~/.gitconfig` is symlinked to `~/dotfiles/git/.gitconfig`:
- Main config with aliases and defaults is tracked
- Your name/email/signing keys go in `~/.gitconfig.local` (gitignored)
- Uses `[include]` directive to load local config

## Updating

### Update All Tools at Once
```bash
UPDATE_TOOLS=yes ~/dotfiles/scripts/bootstrap
```

### Update Individual Tools

**Oh My Zsh:**
```bash
omz update
```

**Powerlevel10k:**
```bash
cd ~/powerlevel10k && git pull
```

**LazyVim plugins:**
```bash
nvim  # then run :Lazy sync
```

**Your Dotfiles:**
```bash
cd ~/dotfiles && git pull
```

## Bootstrap Script Features

- Installs Oh My Zsh if missing (with `KEEP_ZSHRC=yes`)
- Installs Powerlevel10k theme if missing
- Installs LazyVim (Neovim distribution) if nvim is present
- Creates timestamped backups of existing files
- Symlinks configs from repo to home directory
- Creates secrets file from template (600 permissions)
- Idempotent (safe to run multiple times)
- Optional: Update all tools with `UPDATE_TOOLS=yes`

## Customization

### Add New Custom Module

Create a new `.zsh` file in `zsh/.oh-my-zsh/custom/`:

```bash
echo 'alias myalias="echo hello"' > zsh/.oh-my-zsh/custom/mymodule.zsh
```

Oh My Zsh automatically sources all `.zsh` files in the custom directory.

### Change Theme Settings

**Powerlevel10k:**
```bash
p10k configure
```
This will update `~/.p10k.zsh` (which is symlinked to `p10k/.p10k.zsh` in this repo).

Note: The p10k config uses Rose Pine Main color palette. If you reconfigure, you may need to reapply the colors.

**Neovim (Rose Pine):**
The Rose Pine theme is configured in `config/.config/nvim/lua/plugins/rose-pine.lua`. You can change variants by editing:
```lua
opts = {
  variant = "auto", -- change to "main", "moon", or "dawn"
}
```

## Tips

- Use `local.zsh` for machine-specific tweaks (not tracked)
- Keep secrets out of git (use `secrets.zsh`)
- Run bootstrap after pulling repo updates to refresh symlinks
- Install a Nerd Font (e.g., MesloLGS NF) for p10k symbols

## Why This Approach?

**Less churn**: Oh My Zsh updates frequently; you don't want its core files cluttering your diffs.

**Cleaner repo**: Only track what you actually customize.

**Portable**: Bootstrap can set up a fresh machine in seconds.

**Secure**: Secrets never touch git.
